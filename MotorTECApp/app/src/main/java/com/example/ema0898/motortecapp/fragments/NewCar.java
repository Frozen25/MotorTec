package com.example.ema0898.motortecapp.fragments;

import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;

import com.example.ema0898.motortecapp.R;
import com.example.ema0898.motortecapp.adapter.CustomAdapter;
import com.example.ema0898.motortecapp.connections.Get;
import com.example.ema0898.motortecapp.models.CarModel;
import com.example.ema0898.motortecapp.tools.Constants;
import com.google.gson.Gson;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;


public class NewCar extends Fragment {

    private Get get;
    private ArrayList<CarModel> cars;
    private ListView listView;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_new_car, container, false);

        get = new Get();;

        DisplayImageOptions defaultOptions = new DisplayImageOptions.Builder().cacheInMemory(true).cacheOnDisk(true).build();
        ImageLoaderConfiguration config = new ImageLoaderConfiguration.Builder(NewCar.this.getContext()).defaultDisplayImageOptions(defaultOptions).build();
        ImageLoader.getInstance().init(config);

        listView = view.findViewById(R.id.lvMain);

        new JSONTask().execute(Constants.newCarsRoute);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Toast.makeText(NewCar.this.getContext(), cars.get(position).getIdCoche() + "", Toast.LENGTH_SHORT).show();
            }
        });

        return view;
    }

    public class JSONTask extends AsyncTask<String, String, ArrayList<CarModel>> {

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
        }

        @Override
        protected ArrayList<CarModel> doInBackground(String... params) {
            String finalJSON = get.httpGet(params[0]);
            try {

                cars = new ArrayList<>();
                JSONArray jsonArray = new JSONArray(finalJSON);
                JSONArray subArray = jsonArray.getJSONArray(0);

                Gson gson = new Gson();

                for (int i = 0; i < subArray.length(); ++i) {

                    JSONObject jsonObject = subArray.getJSONObject(i);
                    CarModel model = gson.fromJson(jsonObject.toString(), CarModel.class);

                    cars.add(model);
                }

                return cars;
            } catch (JSONException e) {
                e.printStackTrace();
            }

            return null;
        }

        @Override
        protected void onPostExecute(ArrayList<CarModel> result) {
            super.onPostExecute(result);

            CustomAdapter customAdapter = new CustomAdapter(NewCar.this.getContext(), R.layout.listmodel, result);
            listView.setAdapter(customAdapter);
        }
    }
}
