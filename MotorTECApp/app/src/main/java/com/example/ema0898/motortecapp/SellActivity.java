package com.example.ema0898.motortecapp;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.ema0898.motortecapp.adapter.ViewPagerAdapter;
import com.example.ema0898.motortecapp.connections.Get;
import com.example.ema0898.motortecapp.connections.Post;
import com.example.ema0898.motortecapp.models.CarModel;
import com.example.ema0898.motortecapp.tools.Constants;
import com.google.gson.Gson;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class SellActivity extends AppCompatActivity {

    private ViewPager viewPager;
    private TextView tvMatricula,  tvModelo, tvColor, tvKilometraje, tvMarca;
    private Button btnBuy, btnSendBuy;
    private EditText etPrice;

    private ArrayList<String> carImages;
    private CarModel car;

    private Get get;
    private Post post;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sell);

        // Si el cliente ya se había registrado, hace la compra sino, lo envia a la activity de registro
        if(getClientName().equalsIgnoreCase("Empty")) {
            Toast.makeText(getApplicationContext(), R.string.PurchaseActivityLogInMsg, Toast.LENGTH_SHORT).show();
            Intent intent1 = new Intent(SellActivity.this, Register1Activity.class);
            startActivity(intent1);
        }

        Intent intent = getIntent();
        Bundle bundle = intent.getExtras();

        get = new Get();
        post = new Post();

        viewPager = findViewById(R.id.prViewPager);
        tvMatricula = findViewById(R.id.tvPrMatricula);
        tvModelo = findViewById(R.id.tvPrModelo);
        tvColor = findViewById(R.id.tvPrColor);
        tvKilometraje = findViewById(R.id.tvPrKilometraje);
        tvMarca = findViewById(R.id.tvPrMarca);
        btnBuy = findViewById(R.id.btnPrBuy);
        btnSendBuy = findViewById(R.id.btnSendPurchase);
        etPrice = findViewById(R.id.editText);

        DisplayImageOptions defaultOptions = new DisplayImageOptions.Builder().cacheInMemory(true).cacheOnDisk(true).build();
        ImageLoaderConfiguration config = new ImageLoaderConfiguration.Builder(getApplicationContext()).defaultDisplayImageOptions(defaultOptions).build();
        ImageLoader.getInstance().init(config);

        new FillImageList().execute(Constants.getCar + "/" + String.valueOf(bundle.getInt(Constants.newCarBundleString)));

        btnBuy.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                btnSendBuy.setVisibility(View.VISIBLE);
                etPrice.setVisibility(View.VISIBLE);
            }
        });

        btnSendBuy.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (etPrice.getText().toString().isEmpty()) {
                    Toast.makeText(getApplicationContext(), R.string.SellActivityErrorPrice, Toast.LENGTH_SHORT).show();
                } else {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String currentDateandTime = sdf.format(new Date());

                    new HTTPAsyncTask().execute(Constants.addSell, etPrice.getText().toString(), currentDateandTime,
                    String.valueOf(car.getIdCarro()), String.valueOf(car.getConcesionario()), getClientName());
                }
            }
        });

    }

    // Obtiene el nombre del cliente
    private String getClientName() {
        SharedPreferences preferences = getSharedPreferences(Constants.sharedPreferencesClientNameFile, MODE_PRIVATE);
        String usuario = preferences.getString(Constants.sharedPreferencesClientName, "Empty");

        return usuario;
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

    public class FillImageList extends AsyncTask<String, String, ArrayList<String>> {

        @Override
        protected ArrayList<String> doInBackground(String... params) {
            String finalJSON = get.httpGet(params[0]);
            try {

                carImages = new ArrayList<>();

                JSONArray jsonArray = new JSONArray(finalJSON);
                JSONArray subArray = jsonArray.getJSONArray(0);

                Gson gson = new Gson();

                car = gson.fromJson(subArray.getJSONObject(0).toString(), CarModel.class);

                for (int i = 0; i < subArray.length(); ++i) {
                    JSONObject jsonObject = subArray.getJSONObject(i);
                    carImages.add(jsonObject.getString("Image"));
                }

                return carImages;

            } catch (JSONException e) {
                e.printStackTrace();
            }

            return null;
        }

        @Override
        protected void onPostExecute(ArrayList<String> result) {
            super.onPostExecute(result);
            setTextView();
            ViewPagerAdapter viewPagerAdapter = new ViewPagerAdapter(SellActivity.this, result);
            viewPager.setAdapter(viewPagerAdapter);
        }
    }

    // Envia los datos al servidor
    private class HTTPAsyncTask extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... params) {
            String[] attributes = { "price", "date", "idCar", "idCs", "clientName" };
            String[] values = {params[1], params[2], params[3], params[4], params[5]};
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
                Toast.makeText(SellActivity.this, R.string.SellActivityOK, Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(SellActivity.this, MainActivity.class);
                startActivity(intent);
            } else {
                Toast.makeText(SellActivity.this, R.string.SellActivityConnectionError, Toast.LENGTH_SHORT).show();
                Toast.makeText(SellActivity.this, R.string.SellActivityOK, Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(SellActivity.this, MainActivity.class);
                startActivity(intent);
            }
        }
    }
}
