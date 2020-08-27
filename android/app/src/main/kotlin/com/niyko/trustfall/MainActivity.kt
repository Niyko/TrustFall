package com.niyko.trustfall

import android.os.Build
import android.os.Bundle
import com.niyko.trustfall.backgroundTask.ProcessMainClass
import com.niyko.trustfall.backgroundTask.restarter.RestartServiceBroadcastReceiver
import io.flutter.embedding.android.FlutterActivity


class MainActivity: FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onResume() {
        super.onResume()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            RestartServiceBroadcastReceiver.scheduleJob(applicationContext)
        } else {
            val bck = ProcessMainClass()
            bck.launchService(applicationContext)
        }
    }

}
