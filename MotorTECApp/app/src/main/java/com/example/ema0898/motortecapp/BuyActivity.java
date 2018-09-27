package com.example.ema0898.motortecapp;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.example.ema0898.motortecapp.adapter.ViewPagerAdapter;
import com.example.ema0898.motortecapp.connections.Get;
import com.example.ema0898.motortecapp.connections.Post;
import com.example.ema0898.motortecapp.models.CarModel;
import com.example.ema0898.motortecapp.tools.Constants;
import com.google.gson.Gson;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class BuyActivity extends AppCompatActivity {

    private CarModel car;

    private Get get;
    private Post post;

    private TextView tvMatricula,  tvModelo, tvColor, tvKilometraje, tvMarca;
    private Button btnSell;
    private Spinner spBuy;
    private EditText etPrice;

    private ArrayList<String> csList;
    private String csName;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_buy);

        Intent intent = getIntent();
        Bundle bundle = intent.getExtras();

        get = new Get();
        post = new Post();

        tvMatricula = findViewById(R.id.tvBuyMatricula);
        tvModelo = findViewById(R.id.tvBuyModelo);
        tvColor = findViewById(R.id.tvBuyColor);
        tvKilometraje = findViewById(R.id.tvBuyKilometraje);
        tvMarca = findViewById(R.id.tvBuyMarca);
        btnSell = findViewById(R.id.btnSendBuy);
        spBuy = findViewById(R.id.spBuy);
        etPrice = findViewById(R.id.etBuyPrice);

        new FillCarInfo().execute(Constants.getCar + "/" + bundle.getInt(Constants.buyId));
        new FillCs().execute(Constants.getConcessionaire);

        spBuy.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String item = parent.getItemAtPosition(position).toString();
                csName = item;
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        btnSell.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (etPrice.getText().toString().isEmpty()) {
                    etPrice.setError("Debes ingresar un precio");
                } else if (!android.text.TextUtils.isDigitsOnly(etPrice.getText().toString())) {
                    etPrice.setError("Debes ingresar un cantidad válida");
                } else {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String currentDateandTime = sdf.format(new Date());

                    new HTTPAsyncTask().execute(Constants.addBuy, csName,
                            String.valueOf(car.getIdCarro()), etPrice.getText().toString(), currentDateandTime);
                }
            }
        });
    }

    private void setTextView () {
        //
        if (car.getMatricula() == null)
            tvMatricula.append(" Sin registrar");
        else
            tvMatricula.append(car.getMatricula());
        //
        tvModelo.append(" " + car.getModelo());
        tvColor.append(" " + car.getColor());
        tvKilometraje.append(" " + car.getKilometraje());
        tvMarca.append(" " + car.getMarca());
    }

    public class FillCarInfo extends AsyncTask<String, String, ArrayList<String>> {

        @Override
        protected ArrayList<String> doInBackground(String... params) {
            String finalJSON = get.httpGet(params[0]);
            try {

                JSONArray jsonArray = new JSONArray(finalJSON);
                JSONArray subArray = jsonArray.getJSONArray(0);

                Gson gson = new Gson();

                car = gson.fromJson(subArray.getJSONObject(0).toString(), CarModel.class);


            } catch (JSONException e) {
                e.printStackTrace();
            }

            return null;
        }

        @Override
        protected void onPostExecute(ArrayList<String> result) {
            super.onPostExecute(result);
            setTextView();
        }
    }

    public class FillCs extends AsyncTask<String, String, ArrayList<String>> {

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
            ArrayAdapter<String> arrayAdapter = new ArrayAdapter<>(BuyActivity.this, android.R.layout.simple_spinner_item, result);
            spBuy.setAdapter(arrayAdapter);
        }
    }

    private class HTTPAsyncTask extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... params) {
            String[] attributes = { "csname", "idCar", "price", "date" };
            String[] values = { params[1], params[2], params[3], params[4] };
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

            if (result.equals("OK")) {
                Toast.makeText(BuyActivity.this, R.string.BuyActivityOK, Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(BuyActivity.this, MainActivity.class);
                startActivity(intent);
            } else {
                Toast.makeText(BuyActivity.this, R.string.BuyActivityConnectionError, Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(BuyActivity.this, MainActivity.class);
                startActivity(intent);
            }
        }
    }
}
