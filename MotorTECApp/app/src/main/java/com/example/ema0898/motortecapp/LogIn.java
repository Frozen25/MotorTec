package com.example.ema0898.motortecapp;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.ema0898.motortecapp.adapter.CustomAdapter;
import com.example.ema0898.motortecapp.connections.Get;
import com.example.ema0898.motortecapp.models.CarModel;
import com.example.ema0898.motortecapp.tools.Constants;
import com.google.gson.Gson;
import com.nostra13.universalimageloader.utils.L;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

public class LogIn extends AppCompatActivity {

    private Get get;

    private EditText etId;
    private Button btnSend;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_log_in);

        get = new Get();

        etId = findViewById(R.id.etLogInId);
        btnSend = findViewById(R.id.btnLogInFind);

        btnSend.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (etId.getText().toString().isEmpty()) {
                    Toast.makeText(getApplicationContext(), R.string.SellActivityErrorPrice, Toast.LENGTH_SHORT).show();
                } else if (!android.text.TextUtils.isDigitsOnly(etId.getText().toString()))  {
                    Toast.makeText(getApplicationContext(), R.string.SellActivityPriceNumberError, Toast.LENGTH_SHORT).show();
                } else {
                    new FindClient().execute(Constants.getClientById + etId.getText().toString());
                }
            }
        });
    }

    private void saveClientName(String name) {
        SharedPreferences preferences = getSharedPreferences(Constants.sharedPreferencesClientNameFile, MODE_PRIVATE);
        SharedPreferences.Editor editor = preferences.edit();

        editor.putString(Constants.sharedPreferencesClientName, name);
        editor.commit();
    }

    public class FindClient extends AsyncTask<String, String, String> {

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
        }

        @Override
        protected String doInBackground(String... params) {
            String finalJSON = get.httpGet(params[0]);
            try {

                JSONArray jsonArray = new JSONArray(finalJSON);
                JSONArray subArray = jsonArray.getJSONArray(0);

                if (subArray.getJSONObject(0).isNull(Constants.clientNameKey)) {
                    return "Error";
                }

                JSONObject jsonObject = subArray.getJSONObject(0);

                return jsonObject.getString(Constants.clientNameKey);
            } catch (JSONException e) {
                e.printStackTrace();
            }

            return null;
        }

        @Override
        protected void onPostExecute(String result) {
            super.onPostExecute(result);

            if (result != null) {
                Toast.makeText(LogIn.this, R.string.LogInActivityOk, Toast.LENGTH_SHORT).show();
                saveClientName(result);
                Intent intent = new Intent(LogIn.this, MainActivity.class);
                startActivity(intent);
            } else {
                Toast.makeText(LogIn.this, R.string.LogInActivityConnectionError, Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(LogIn.this, MainActivity.class);
                startActivity(intent);
            }
        }
    }
}
