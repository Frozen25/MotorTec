package com.example.ema0898.motortecapp;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.ema0898.motortecapp.adapter.ViewPagerAdapter;
import com.example.ema0898.motortecapp.connections.Get;
import com.example.ema0898.motortecapp.fragments.NewCar;
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

public class PurchaseActivity extends AppCompatActivity {

    private ViewPager viewPager;
    private TextView tvMatricula,  tvModelo, tvColor, tvKilometraje, tvMarca;
    private Button btnBuy, btnSendBuy;
    private EditText etPrice;
    private Get get;
    private ArrayList<String> carImages;
    private CarModel car;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_purchase);

        // Si el cliente ya se había registrado, hace la compra sino, lo envia a la activity de registro
        if(getClientName().equalsIgnoreCase("Empty")) {
            Toast.makeText(getApplicationContext(), R.string.PurchaseActivityLogInMsg, Toast.LENGTH_SHORT).show();
            Intent intent1 = new Intent(PurchaseActivity.this, Register1Activity.class);
            startActivity(intent1);
        }

        Intent intent = getIntent();
        Bundle bundle = intent.getExtras();

        get = new Get();

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
            ViewPagerAdapter viewPagerAdapter = new ViewPagerAdapter(PurchaseActivity.this, result);
            viewPager.setAdapter(viewPagerAdapter);
        }
    }

    // HACER EL PROCEDURE PARA ACTUALIZAR EL CLIENTE DEL CARRO
}
