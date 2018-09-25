package com.example.ema0898.motortecapp;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.example.ema0898.motortecapp.tools.Constants;

/**
 * Realiza la primera parte del registro del cliente
 */
public class Register1Activity extends AppCompatActivity {

    private EditText etName;
    private EditText etLastName;
    private EditText etID;
    private EditText etPhone;
    private Button btnSubmit;

    boolean nameOK;
    boolean lastNameOK;
    boolean idOK;
    boolean phoneOK;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        nameOK = false;
        lastNameOK = false;
        idOK = false;
        phoneOK = false;

        etName = findViewById(R.id.edName);
        etLastName = findViewById(R.id.edLastName);
        etID = findViewById(R.id.edID);
        etPhone = findViewById(R.id.edPhone);
        btnSubmit = findViewById(R.id.btnSubmit);

        // Revisa que todos los campos estén llenos y que la cédula y el telefono sean enteros
        btnSubmit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if (etName.getText().toString().isEmpty()) {
                    etName.setError("Debe ingresar su nombre");
                } else {
                    nameOK = true;
                }

                if (etLastName.getText().toString().isEmpty()) {
                    etLastName.setError("Debe ingresar sus apellidos");
                } else {
                    lastNameOK = true;
                }

                if (etID.getText().toString().isEmpty()) {
                    etID.setError("Debe ingresar su cédula");
                } else {
                    idOK = true;
                }

                if (!android.text.TextUtils.isDigitsOnly(etID.getText().toString()))  {
                    etID.setError("La cédula debe contener únicamente números");
                    idOK = false;
                } else {
                    idOK = true;
                }

                if (etPhone.getText().toString().isEmpty()) {
                    etPhone.setError("Debe ingresar su teléfono");
                } else {
                    phoneOK = true;
                }

                if (!android.text.TextUtils.isDigitsOnly(etPhone.getText().toString())) {
                    etPhone.setError("El telefono debe contener únicamente números");
                    phoneOK = false;
                } else {
                    phoneOK = true;
                }

                // Si se cumplen las condiciones, envia la informacion de los edittext a la siguiente activity
                // de registro
                if (nameOK && lastNameOK && idOK && phoneOK) {
                    Bundle bundle = new Bundle();

                    bundle.putString(Constants.registerBundleName, etName.getText().toString());
                    bundle.putString(Constants.registerBundleLastName, etLastName.getText().toString());
                    bundle.putInt(Constants.registerBundleID, Integer.parseInt(etID.getText().toString()));
                    bundle.putInt(Constants.registerBundlePhone, Integer.parseInt(etPhone.getText().toString()));

                    Intent intent = new Intent(Register1Activity.this, Register2Activity.class);
                    intent.putExtras(bundle);
                    startActivity(intent);
                }
            }
        });

    }

    @Override
    public void onBackPressed() {
        Intent intent = new Intent(Register1Activity.this, MainActivity.class);
        startActivity(intent);
    }
}
