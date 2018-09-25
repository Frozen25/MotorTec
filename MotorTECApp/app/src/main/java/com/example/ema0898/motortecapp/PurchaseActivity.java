package com.example.ema0898.motortecapp;

import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.Toast;

import com.example.ema0898.motortecapp.tools.Constants;

public class PurchaseActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_purchase);

        // Si el cliente ya se había registrado, hace la compra sino, lo envia a la activity de registro
        if(getClientName().equalsIgnoreCase("Empty")) {
            Toast.makeText(getApplicationContext(), "Necesita registrarse", Toast.LENGTH_SHORT).show();
            Intent intent1 = new Intent(PurchaseActivity.this, Register1Activity.class);
            startActivity(intent1);
        }

        Toast.makeText(getApplicationContext(), getClientName(), Toast.LENGTH_SHORT).show();

        Intent intent = getIntent();
        Bundle bundle = intent.getExtras();
    }

    // Obtiene el nombre del cliente
    private String getClientName() {
        SharedPreferences preferences = getSharedPreferences(Constants.sharedPreferencesClientNameFile, MODE_PRIVATE);
        String usuario = preferences.getString(Constants.sharedPreferencesClientName, "Empty");

        return usuario;
    }
}
