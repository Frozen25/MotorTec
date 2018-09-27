package com.example.ema0898.motortecapp;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;

import com.example.ema0898.motortecapp.adapter.CustomAdapter;
import com.example.ema0898.motortecapp.connections.Get;
import com.example.ema0898.motortecapp.fragments.NewCar;
import com.example.ema0898.motortecapp.models.CarModel;
import com.example.ema0898.motortecapp.tools.Constants;
import com.google.gson.Gson;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

public class UserCarActivity extends AppCompatActivity {

    private Get get;
    private ArrayList<CarModel> cars;
    private ListView listView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_car);

        Intent intent = getIntent();
        final Bundle bundle = intent.getExtras();

        get = new Get();

        new JSONTask().execute(Constants.getCarByUser + getClientName() + "/" + bundle.getString(Constants.userCarCs));

        listView = findViewById(R.id.lvUserCar);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Bundle bundle1 = new Bundle();
                bundle1.putInt(Constants.buyId, cars.get(position).getIdCarro());
                Intent intent1 = new Intent(UserCarActivity.this, BuyActivity.class);
                intent1.putExtras(bundle1);
                startActivity(intent1);
            }
        });
    }

    private String getClientName() {
        SharedPreferences preferences = getSharedPreferences(Constants.sharedPreferencesClientNameFile, MODE_PRIVATE);
        String usuario = preferences.getString(Constants.sharedPreferencesClientName, "Empty");

        return usuario;
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

            CustomAdapter customAdapter = new CustomAdapter(UserCarActivity.this, R.layout.listmodel, result);
            listView.setAdapter(customAdapter);
        }
    }
}
