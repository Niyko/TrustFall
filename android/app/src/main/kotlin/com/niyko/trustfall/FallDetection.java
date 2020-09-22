package com.niyko.trustfall;

/* import dependencies,
   plugins and core
*/

public class FallDetection {

    //Starts the fall detection service
    public void start(Context context){

        //Init accelerometer sensor and service manager
        SensorManager sensorManager = (SensorManager) context.getSystemService(SENSOR_SERVICE);
        Sensor accelSensor = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        SensorEventListener accelSensorListener = new SensorEventListener() {
            @Override
            public void onSensorChanged(SensorEvent sensorEvent) {

                //Acceleration on Y axis
                float accelerationY = sensorEvent.values[1];
                if(accelerationY>=30){

                    //Instance for sending haptic feedback
                    Vibrator v = (Vibrator) context.getSystemService(Context.VIBRATOR_SERVICE);
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                        v.vibrate(VibrationEffect.createOneShot(
                                500,
                                VibrationEffect.DEFAULT_AMPLITUDE
                        ));
                    } else {
                        v.vibrate(500);
                    }

                    //Init shared preference for communicating with front-end activity
                    SharedPreferences pref = context.getApplicationContext()
                            .getSharedPreferences("FlutterSharedPreferences", MODE_PRIVATE);
                    SharedPreferences.Editor editor = pref.edit();
                    editor.putBoolean("flutter.is-fall-detected", true);
                    editor.apply();

                    //Intent to open the front-end activity
                    Intent intent = new Intent("android.intent.category.LAUNCHER");
                    intent.setClassName("com.niyko.trustfall", "com.niyko.trustfall.MainActivity");
                    intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    context.startActivity(intent);
                }
            }

            @Override
            public void onAccuracyChanged(Sensor sensor, int i) {
            }
        };
        sensorManager.registerListener(accelSensorListener, accelSensor, SensorManager.SENSOR_DELAY_NORMAL);
    }

}
