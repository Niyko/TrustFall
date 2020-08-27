package com.niyko.trustfall.backgroundTask.restarter;


import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.os.Handler;
import android.util.Log;

import androidx.annotation.RequiresApi;

import com.niyko.trustfall.backgroundTask.Globals;
import com.niyko.trustfall.backgroundTask.ProcessMainClass;

import static android.content.Context.JOB_SCHEDULER_SERVICE;

public class RestartServiceBroadcastReceiver extends BroadcastReceiver {
    public static final String TAG = RestartServiceBroadcastReceiver.class.getSimpleName();
    private static JobScheduler jobScheduler;
    private RestartServiceBroadcastReceiver restartSensorServiceReceiver;

    public static long getVersionCode(Context context) {
        PackageInfo pInfo;
        try {
            pInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            long versionCode = System.currentTimeMillis();  //PackageInfoCompat.getLongVersionCode(pInfo);
            return versionCode;

        } catch (Exception e) {
            Log.e(TAG, e.getMessage());
        }
        return 0;
    }

    @Override
    public void onReceive(final Context context, Intent intent) {
        Log.d(TAG, "about to start timer " + context.toString());
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP){
            scheduleJob(context);
        } else {
            registerRestarterReceiver(context);
            ProcessMainClass bck = new ProcessMainClass();
            bck.launchService(context);
        }
    }

    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    public static void scheduleJob(Context context) {
        if (jobScheduler == null) {
            jobScheduler = (JobScheduler) context
                    .getSystemService(JOB_SCHEDULER_SERVICE);
        }
        ComponentName componentName = new ComponentName(context,
                JobService.class);
        JobInfo jobInfo = new JobInfo.Builder(1, componentName)
                .setOverrideDeadline(0)
                .setPersisted(true).build();
        jobScheduler.schedule(jobInfo);
    }


    public static void reStartTracker(Context context) {
        // restart the never ending service
        Log.i(TAG, "Restarting tracker");
        Intent broadcastIntent = new Intent(Globals.RESTART_INTENT);
        context.sendBroadcast(broadcastIntent);
    }


    private void registerRestarterReceiver(final Context context) {
        if (restartSensorServiceReceiver == null)
            restartSensorServiceReceiver = new RestartServiceBroadcastReceiver();
        else try{
            context.unregisterReceiver(restartSensorServiceReceiver);
        } catch (Exception e){
            // not registered
        }
        // give the time to run
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                IntentFilter filter = new IntentFilter();
                filter.addAction(Globals.RESTART_INTENT);
                try {
                    context.registerReceiver(restartSensorServiceReceiver, filter);
                } catch (Exception e) {
                    try {
                        context.getApplicationContext().registerReceiver(restartSensorServiceReceiver, filter);
                    } catch (Exception ex) {

                    }
                }
            }
        }, 1000);

    }

}
