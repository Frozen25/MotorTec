package com.example.ema0898.motortecapp.connections;

import android.util.Log;


import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

public class Post {


    public String httpPost(String myUrl, String[] attributes, String[] values) throws IOException, JSONException {

        URL url = new URL(myUrl);

        // 1. create HttpURLConnection
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");

        // 2. build JSON object
        JSONObject jsonObject = buidJsonObject(attributes, values);

        // 3. add JSON content to POST request body
        setPostRequestContent(conn, jsonObject);

        // 4. make POST request to the given URL
        conn.connect();

        // 5. return response message
        return conn.getResponseMessage() + "";

    }

    private JSONObject buidJsonObject(String[] attributes, String[] values) throws JSONException {

        JSONObject jsonObject = new JSONObject();

        for (int i = 0; i < attributes.length; ++i) {
            jsonObject.accumulate(attributes[i], values[i]);
        }

        /*jsonObject.accumulate("name", "TOBeMaN");
        jsonObject.accumulate("address",  "SuizaA");
        jsonObject.accumulate("phone",  "2423432");*/

        return jsonObject;
    }

    private void setPostRequestContent(HttpURLConnection conn, JSONObject jsonObject) throws IOException {

        OutputStream os = conn.getOutputStream();
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(os, "UTF-8"));
        writer.write(jsonObject.toString());
        writer.flush();
        writer.close();
        os.close();
    }
}
