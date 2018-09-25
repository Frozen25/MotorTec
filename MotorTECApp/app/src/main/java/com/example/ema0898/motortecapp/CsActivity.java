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
import android.widget.Spinner;
import android.widget.Toast;

import com.example.ema0898.motortecapp.connections.Get;
import com.example.ema0898.motortecapp.models.DistrictModel;
import com.example.ema0898.motortecapp.tools.Constants;
import com.google.gson.Gson;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

public class CsActivity extends AppCompatActivity {

    private Get get;
    private ArrayList<String> csList;
    private Spinner spCs;
    private Button btnCS;

    private String result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cs);

        get = new Get();

        spCs = findViewById(R.id.spCs);
        btnCS = findViewById(R.id.btnCs);

        new FillCsTask().execute(Constants.getConcessionaire);

        spCs.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String item = parent.getItemAtPosition(position).toString();
                result = item;
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        btnCS.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (result.isEmpty()) {
                    Toast.makeText(getApplicationContext(), R.string.CsActivityError, Toast.LENGTH_SHORT).show();
                } else {
                    saveCsName();
                    Intent intent = new Intent(CsActivity.this, MainActivity.class);
                    startActivity(intent);
                }
            }
        });
    }

    private void saveCsName() {
        SharedPreferences preferences = getSharedPreferences(Constants.sharedPreferencedCsName, MODE_PRIVATE);
        SharedPreferences.Editor editor = preferences.edit();

        editor.putString(Constants.sharedPreferencedCsName, result);
        editor.commit();
    }


    public class FillCsTask extends AsyncTask<String, String, ArrayList<String>> {

        @Override
        protected ArrayList<String> doInBackground(String... params) {
            String finalJSON = get.httpGet(params[0]);
            try {
                csList = new ArrayList<>();

                JSONArray jsonArray = new JSONArray(finalJSON);

                for (int i = 0; i < jsonArray.length(); ++i) {
                    JSONObject jsonObject = jsonArray.getJSONObject(i);
                    csList.add(jsonObject.getString(Constants.concessionaireNameKey));
                }

                return csList;

            } catch (JSONException e) {
                e.printStackTrace();
            }

            return null;
        }

        @Override
        protected void onPostExecute(ArrayList<String> result) {
            super.onPostExecute(result);
            ArrayAdapter<String> arrayAdapter = new ArrayAdapter<>(CsActivity.this, android.R.layout.simple_spinner_item, result);
            spCs.setAdapter(arrayAdapter);
        }
    }
}
