package com.example.ema0898.motortecapp.fragments;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.app.AlertDialog;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;

import com.example.ema0898.motortecapp.MainActivity;
import com.example.ema0898.motortecapp.SellActivity;
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

    private String[] items;
    private String selection;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_new_car, container, false);

        FillCsList fillCsList = new FillCsList();
        fillCsList.execute(Constants.getConcessionaire);

        get = new Get();;

        // Inicia la biblioteca de las imagenes
        DisplayImageOptions defaultOptions = new DisplayImageOptions.Builder().cacheInMemory(true).cacheOnDisk(true).build();
        ImageLoaderConfiguration config = new ImageLoaderConfiguration.Builder(NewCar.this.getContext()).defaultDisplayImageOptions(defaultOptions).build();
        ImageLoader.getInstance().init(config);

        listView = view.findViewById(R.id.lvMain);

        new JSONTask().execute(Constants.newCarsRoute + "/" + MainActivity.csName);

        // Agrega el click para la lista
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Bundle b = new Bundle();
                b.putInt(Constants.newCarBundleString, cars.get(position).getIdCarro());

                Intent intent = new Intent(getActivity(), SellActivity.class);
                intent.putExtras(b);
                startActivity(intent);
            }
        });

        setHasOptionsMenu(true);

        return view;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.change_concessionaire :
                openDialog();
                break;
        }

        return super.onOptionsItemSelected(item);
    }

    private void openDialog() {

        final AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setTitle(R.string.fragmentDialog);
        builder.setSingleChoiceItems(items, -1, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                switch (which) {
                    case 0:
                        selection = items[0];
                        break;
                    case 1:
                        selection = items[1];
                        break;
                }
            }
        });
        builder.setPositiveButton(R.string.fragmentDialogOk, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                new JSONTask().execute(Constants.newCarsRoute + "/" + selection);
            }
        });

        builder.create();
        builder.show();
    }

    // Recibe el get del servidor, parsea el JSON y lo agrega a la lista de carros
    // Una vez terminada, agrega los valores de la lista de carros al listview
    // y los muestra
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

    public class FillCsList extends AsyncTask<String, String, ArrayList<String>> {

        @Override
        protected ArrayList<String> doInBackground(String... params) {
            String finalJSON = get.httpGet(params[0]);
            try {

                ArrayList<String> cs = new ArrayList<>();
                JSONArray jsonArray = new JSONArray(finalJSON);

                for (int i = 0; i < jsonArray.length(); ++i) {

                    JSONObject jsonObject = jsonArray.getJSONObject(i);
                    cs.add(jsonObject.getString(Constants.concessionaireNameKey));
                }

                return cs;
            } catch (JSONException e) {
                e.printStackTrace();
            }

            return null;
        }

        @Override
        protected void onPostExecute(ArrayList<String> result) {
            super.onPostExecute(result);

            items = new String[result.size()];

            for (int i = 0; i < items.length; ++i) {
                items[i] = result.get(i);
            }
        }
    }
}
