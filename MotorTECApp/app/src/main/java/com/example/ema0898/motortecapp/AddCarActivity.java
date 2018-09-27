package com.example.ema0898.motortecapp;

import android.content.Intent;
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

import com.example.ema0898.motortecapp.connections.Get;
import com.example.ema0898.motortecapp.connections.Post;
import com.example.ema0898.motortecapp.tools.Constants;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class AddCarActivity extends AppCompatActivity {

    private EditText etMatricula, etModelo, etColor,  etKilometraje, etLink, etPrice;
    private Spinner spCs, spMarca;
    private Button btnAddCar;

    private ArrayList<String> csList;
    private ArrayList<String> marcaList;

    private Get get;
    private Post post;

    private String csName;
    private String marcaName;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_car);

        get = new Get();
        post = new Post();

        etMatricula = findViewById(R.id.etAddMatricula);
        etModelo = findViewById(R.id.etAddModelo);
        etColor = findViewById(R.id.etAddColor);
        etKilometraje = findViewById(R.id.etAddKilometraje);
        etLink = findViewById(R.id.etAddLink);
        etPrice = findViewById(R.id.etAddPrice);
        spCs = findViewById(R.id.spAddCs);
        spMarca = findViewById(R.id.spAddMarca);
        btnAddCar = findViewById(R.id.btnAddCar);

        new FillSpinnerCs().execute(Constants.getConcessionaire);
        new FillSpinnerMarca().execute(Constants.getMarca);

        spCs.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String item = parent.getItemAtPosition(position).toString();
                marcaName = item;
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        spMarca.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String item = parent.getItemAtPosition(position).toString();
                csName = item;
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        btnAddCar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String currentDateandTime = sdf.format(new Date());

                if (checkInputs()) {
                    new HTTPAsyncTask().execute(Constants.addCar, etMatricula.getText().toString(), etModelo.getText().toString(),
                            etColor.getText().toString(), etKilometraje.getText().toString(), csName, marcaName,
                            etLink.getText().toString(), etPrice.getText().toString(), currentDateandTime);
                }

            }
        });
    }

    private boolean checkInputs() {
        boolean matriculaOK = false;
        boolean modeloOK = false;
        boolean colorOK = false;
        boolean kilometrajeOK = false;
        boolean linkOK = false;
        boolean priceOK = false;

        if (etMatricula.getText().toString().isEmpty()) {
            etMatricula.setError("Debe ingresar una matricula");
        } else {
            matriculaOK = true;
        }

        if (etModelo.getText().toString().isEmpty()) {
            etModelo.setError("Debe ingresar un modelo");
        } else {
            modeloOK = true;
        }

        if (etColor.getText().toString().isEmpty()) {
            etColor.setError("Debe ingresar un error");
        } else {
            colorOK = true;
        }

        if (etKilometraje.getText().toString().isEmpty()) {
            etKilometraje.setError("Debe ingresar un kilometraje");
        } else {
            kilometrajeOK = true;
        }

        if (etLink.getText().toString().isEmpty()) {
            etLink.setError("Debe ingresar un link");
        } else {
            linkOK = true;
        }

        if (etPrice.getText().toString().isEmpty()) {
            etPrice.setError("Debe ingresar un precio");
        } else {
            priceOK = true;
        }

        if (!android.text.TextUtils.isDigitsOnly(etKilometraje.getText().toString())) {
            etKilometraje.setError("Debe ingresar un kilometraje válido");
            kilometrajeOK = false;
        } else {
            kilometrajeOK = true;
        }

        if (!android.text.TextUtils.isDigitsOnly(etPrice.getText().toString())) {
            etPrice.setError("Debe ingresar un precio válido");
            priceOK = false;
        } else {
            priceOK = true;
        }

        return matriculaOK && modeloOK && colorOK && kilometrajeOK && linkOK && priceOK;
    }

    public class FillSpinnerCs extends AsyncTask<String, String, ArrayList<String>> {

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
            ArrayAdapter<String> arrayAdapter = new ArrayAdapter<>(AddCarActivity.this, android.R.layout.simple_spinner_item, result);
            spCs.setAdapter(arrayAdapter);
        }
    }

    public class FillSpinnerMarca extends AsyncTask<String, String, ArrayList<String>> {

        @Override
        protected ArrayList<String> doInBackground(String... params) {
            String finalJSON = get.httpGet(params[0]);
            try {

                marcaList = new ArrayList<>();

                JSONArray jsonArray = new JSONArray(finalJSON);

                for (int i = 0; i < jsonArray.length(); ++i) {
                    JSONObject jsonObject = jsonArray.getJSONObject(i);
                    marcaList.add(jsonObject.getString(Constants.provinceNameKey));
                }

                return marcaList;

            } catch (JSONException e) {
                e.printStackTrace();
            }

            return null;
        }

        @Override
        protected void onPostExecute(ArrayList<String> result) {
            super.onPostExecute(result);
            ArrayAdapter<String> arrayAdapter = new ArrayAdapter<>(AddCarActivity.this, android.R.layout.simple_spinner_item, result);
            spMarca.setAdapter(arrayAdapter);
        }
    }

    private class HTTPAsyncTask extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... params) {
            String[] attributes = { "matricula", "modelo", "color", "kilometraje", "csname", "marcaname", "link", "price", "date"};
            String[] values = {params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9]};

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
                Toast.makeText(AddCarActivity.this, R.string.addCarActivityOk, Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(AddCarActivity.this, MainActivity.class);
                startActivity(intent);
            } else {
                Toast.makeText(AddCarActivity.this, R.string.addCarActivityConnectionError, Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(AddCarActivity.this, MainActivity.class);
                startActivity(intent);
            }
        }
    }
}
