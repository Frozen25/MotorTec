package com.example.ema0898.motortecapp.adapter;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.example.ema0898.motortecapp.R;
import com.example.ema0898.motortecapp.models.CarModel;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;

import java.util.List;

import static android.content.Context.LAYOUT_INFLATER_SERVICE;

/**
 * Clase encargada de servir para llenar la lista de carros
 */
public class CustomAdapter extends ArrayAdapter {
    private List<CarModel> carModels;
    private int resource;
    private LayoutInflater inflater;

    public CustomAdapter(@NonNull Context context, int resource, @NonNull List<CarModel> objects) {
        super(context, resource, objects);

        carModels = objects;
        this.resource = resource;
        inflater = (LayoutInflater) context.getSystemService(LAYOUT_INFLATER_SERVICE);
    }

    /**
     * Inicia todas la variables que tendra la lista de los carros
     * @param position
     * @param convertView
     * @param parent
     * @return
     */
    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {

        ViewHolder holder = null;

        // Al principio es nulo, después de incertar el primer elemento ya tiene la referencia
        // al resource
        if (convertView == null) {
            holder = new ViewHolder();

            convertView = inflater.inflate(resource, null);

            holder.ivPhoto = convertView.findViewById(R.id.imageView);
            holder.tvMarca = convertView.findViewById(R.id.tvMarca);
            holder.tvModelo = convertView.findViewById(R.id.tvModelo);
            holder.tvKilometraje = convertView.findViewById(R.id.tvKilometraje);

            convertView.setTag(holder);
        } else {
            holder = (ViewHolder) convertView.getTag();
        }

        final ProgressBar progressBar = convertView.findViewById(R.id.progressBar);

        ImageLoader.getInstance().displayImage(carModels.get(position).getImage(), holder.ivPhoto, new ImageLoadingListener() {
            @Override
            public void onLoadingStarted(String imageUri, View view) {
                progressBar.setVisibility(View.VISIBLE);
            }

            @Override
            public void onLoadingFailed(String imageUri, View view, FailReason failReason) {
                progressBar.setVisibility(View.GONE);
            }

            @Override
            public void onLoadingComplete(String imageUri, View view, Bitmap loadedImage) {
                progressBar.setVisibility(View.GONE);
            }

            @Override
            public void onLoadingCancelled(String imageUri, View view) {
                progressBar.setVisibility(View.GONE);
            }
        });
        holder.tvMarca.setText("Marca: " + carModels.get(position).getMarca());
        holder.tvModelo.setText("Modelo: " + carModels.get(position).getModelo());
        holder.tvKilometraje.setText("Kilometraje: " + carModels.get(position).getKilometraje());

        return convertView;
    }

    // Hacer más eficiente cargar toda la información en el adapter
    public class ViewHolder {
        private ImageView ivPhoto;
        private TextView tvMarca;
        private TextView tvModelo;
        private  TextView tvKilometraje;
    }
}
