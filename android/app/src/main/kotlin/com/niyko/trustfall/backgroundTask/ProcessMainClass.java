package com.niyko.trustfall.backgroundTask;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.util.Log;

public class ProcessMainClass {
    public static final String TAG = ProcessMainClass.class.getSimpleName();
    private static Intent serviceIntent = null;

    public ProcessMainClass() {
    }

    private void setServiceIntent(Context context) {
        if (serviceIntent == null) {
            serviceIntent = new Intent(context, Service.class);
        }
    }

    public void launchService(Context context) {
        if (context == null) {
            return;
        }
        setServiceIntent(context);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            context.startForegroundService(serviceIntent);
        } else {
            context.startService(serviceIntent);
        }
        Log.d(TAG, "ProcessMainClass: start service go!!!!");
    }
}

