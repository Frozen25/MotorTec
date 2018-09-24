package com.example.ema0898.motortecapp;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import com.example.ema0898.motortecapp.adapter.CustomAdapter;
import com.example.ema0898.motortecapp.connections.Get;
import com.example.ema0898.motortecapp.connections.Post;
import com.example.ema0898.motortecapp.fragments.NewCar;
import com.example.ema0898.motortecapp.models.CarModel;
import com.example.ema0898.motortecapp.models.DistrictModel;
import com.example.ema0898.motortecapp.tools.Constants;
import com.google.gson.Gson;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;

public class Register2Activity extends AppCompatActivity  {

    private String clientName;
    private String clientLastName;
    private int clientID;
    private int clientPhone;

    private Spinner spCountry;
    private Spinner spProvince;
    private Spinner spCanton;
    private Spinner spDistrict;
    private Button btnFinalSubmit;
    private EditText etDistrictDescription;

    private ArrayList<String> countryList;
    private ArrayList<String> provinceList;
    private ArrayList<String> cantonList;
    private ArrayList<String> districtList;

    private ArrayList<DistrictModel> districtModels;

    private Get get;
    private Post post;

    private int districtPost;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register2);

        Intent intent = getIntent();
        Bundle bundle = intent.getExtras();

        get = new Get();
        post = new Post();

        clientName = bundle.getString(Constants.registerBundleName);
        clientLastName = bundle.getString(Constants.registerBundleLastName);
        clientID = bundle.getInt(Constants.registerBundleID);
        clientPhone = bundle.getInt(Constants.registerBundlePhone);

        spCountry = findViewById(R.id.spCountry);
        spProvince = findViewById(R.id.spProvince);
        spCanton = findViewById(R.id.spCanton);
        spDistrict = findViewById(R.id.spDistrict);
        btnFinalSubmit = findViewById(R.id.btnFinalSubmit);
        etDistrictDescription = findViewById(R.id.etDistrictDescription);

        districtPost = 0;

        new FillCountryTask().execute(Constants.countryRoute);

        spCountry.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String item = parent.getItemAtPosition(position).toString();

                if (districtList != null)
                    districtList.clear();

                new FillProvinceTask().execute(Constants.provinceRoute + item);
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        spProvince.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String item = parent.getItemAtPosition(position).toString();

                new FillCantonTask().execute(Constants.cantonRoute + item);
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        spCanton.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String item = parent.getItemAtPosition(position).toString();

                new FillDistrictTask().execute(Constants.districtRoute + item);
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        spDistrict.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String item = parent.getItemAtPosition(position).toString();
                districtPost = districtModels.get(position).getIdDistrito();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

    }

    public void onClick(View v) {
        if (districtPost == 0 || etDistrictDescription.getText().toString().isEmpty()) {
            Toast.makeText(getApplicationContext(), R.string.Register2ActivityError,Toast.LENGTH_SHORT).show();
        } else {
            new HTTPAsyncTask().execute(Constants.addClient, clientName,
                    clientLastName, String.valueOf(clientID), String.valueOf(clientPhone),
                    String.valueOf(districtPost), etDistrictDescription.getText().toString());
        }
    }

    private void saveClientName() {
        SharedPreferences preferences = getSharedPreferences(Constants.sharedPreferencesClientNameFile, MODE_PRIVATE);
        SharedPreferences.Editor editor = preferences.edit();

        editor.putString(Constants.sharedPreferencesClientName, clientName);
        editor.commit();
    }

    public class FillCountryTask extends AsyncTask<String, String, ArrayList<String>> {

        @Override
        protected ArrayList<String> doInBackground(String... params) {
            String finalJSON = get.httpGet(params[0]);
            try {

                countryList = new ArrayList<>();

                JSONArray jsonArray = new JSONArray(finalJSON);

                for (int i = 0; i < jsonArray.length(); ++i) {
                    JSONObject jsonObject = jsonArray.getJSONObject(i);
                    countryList.add(jsonObject.getString(Constants.countryNameKey));
                }

                return countryList;

            } catch (JSONException e) {
                e.printStackTrace();
            }

            return null;
        }

        @Override
        protected void onPostExecute(ArrayList<String> result) {
            super.onPostExecute(result);
            ArrayAdapter<String> arrayAdapter = new ArrayAdapter<>(Register2Activity.this, android.R.layout.simple_spinner_item, result);
            spCountry.setAdapter(arrayAdapter);
        }
    }

    public class FillProvinceTask extends AsyncTask<String, String, ArrayList<String>> {

        @Override
        protected ArrayList<String> doInBackground(String... params) {
            String finalJSON = get.httpGet(params[0]);
            try {

                provinceList = new ArrayList<>();

                JSONArray jsonArray = new JSONArray(finalJSON);
                JSONArray subArray = jsonArray.getJSONArray(0);

                for (int i = 0; i < subArray.length(); ++i) {
                    JSONObject jsonObject = subArray.getJSONObject(i);
                    provinceList.add(jsonObject.getString(Constants.provinceNameKey));
                }

                return provinceList;

            } catch (JSONException e) {
                e.printStackTrace();
            }

            return null;
        }

        @Override
        protected void onPostExecute(ArrayList<String> result) {
            super.onPostExecute(result);
            ArrayAdapter<String> arrayAdapter = new ArrayAdapter<>(Register2Activity.this, android.R.layout.simple_spinner_item, result);
            spProvince.setAdapter(arrayAdapter);
        }
    }

    public class FillCantonTask extends AsyncTask<String, String, ArrayList<String>> {

        @Override
        protected ArrayList<String> doInBackground(String... params) {
            String finalJSON = get.httpGet(params[0]);
            try {

                cantonList = new ArrayList<>();

                JSONArray jsonArray = new JSONArray(finalJSON);
                JSONArray subArray = jsonArray.getJSONArray(0);

                for (int i = 0; i < subArray.length(); ++i) {
                    JSONObject jsonObject = subArray.getJSONObject(i);
                    cantonList.add(jsonObject.getString(Constants.cantonNameKey));
                }

                return cantonList;

            } catch (JSONException e) {
                e.printStackTrace();
            }

            return null;
        }

        @Override
        protected void onPostExecute(ArrayList<String> result) {
            super.onPostExecute(result);
            ArrayAdapter<String> arrayAdapter = new ArrayAdapter<>(Register2Activity.this, android.R.layout.simple_spinner_item, result);
            spCanton.setAdapter(arrayAdapter);
        }
    }

    public class FillDistrictTask extends AsyncTask<String, String, ArrayList<String>> {

        @Override
        protected ArrayList<String> doInBackground(String... params) {
            String finalJSON = get.httpGet(params[0]);
            try {
                districtList = new ArrayList<>();
                districtModels = new ArrayList<>();

                JSONArray jsonArray = new JSONArray(finalJSON);
                JSONArray subArray = jsonArray.getJSONArray(0);

                Gson gson = new Gson();

                for (int i = 0; i < subArray.length(); ++i) {
                    JSONObject jsonObject = subArray.getJSONObject(i);
                    DistrictModel model = gson.fromJson(jsonObject.toString(), DistrictModel.class);

                    districtModels.add(model);
                    districtList.add(model.getNombre());
                }

                return districtList;

            } catch (JSONException e) {
                e.printStackTrace();
            }

            return null;
        }

        @Override
        protected void onPostExecute(ArrayList<String> result) {
            super.onPostExecute(result);
            ArrayAdapter<String> arrayAdapter = new ArrayAdapter<>(Register2Activity.this, android.R.layout.simple_spinner_item, result);
            spDistrict.setAdapter(arrayAdapter);
        }
    }

    private class HTTPAsyncTask extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... params) {
            String[] attributes = {"name", "lastname", "id", "phone", "district", "description"};
            String[] values = {params[1], params[2], params[3], params[4], params[5], params[6]};
            try {
                try {
                    return post.httpPost(params[0], attributes, values);
                } catch (JSONException e) {
                    e.printStackTrace();
                    return "Error!";
                }
            } catch (IOException e) {
                return "Unable to retrieve web page. URL may be invalid.";
            }
        }

        @Override
        protected void onPostExecute(String result) {
            super.onPostExecute(result);
            if (result.equalsIgnoreCase("OK")) {
                saveClientName();
                Toast.makeText(Register2Activity.this, R.string.Register2ActivitySuccess, Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(Register2Activity.this, PurchaseActivity.class);
                startActivity(intent);
            }

            else {
                Toast.makeText(Register2Activity.this, R.string.Register2ActivityError, Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(Register2Activity.this, MainActivity.class);
                startActivity(intent);
            }
        }
    }
}
