![Trust_Fall logo](https://i.imgur.com/GB00eBr.png)
An Android app to detect fall and accidents, if detected the app sends a distress signal to all emergency contacts with location details. The goal of TrustFall uses the sensors avilable on any android phones such as accelerometer, orientation sensor (on higher API Android devices, the gyroscope and the magnetometer are combined and used to simulate orientation sensor), microphone, proximity sensor and camera with a precise algorithm to accurately detect strong impacts on the mobile phone to track fall and accidents.
TrustFall user's Android app (this repo) is mainly build on Flutter, Fall detection and background services is build on Java. Some parts are built on Koltin too. The web API which stores users data and manages the distress beacon sending functions are built on core PHP and for user data storage MySQL is used. TrustFall uses combined sensor values from normal day-to-day usage and simulated falls/accidents to train the algorithm. In future stable builds, Trustfall may use this technique with TensorFlow to make an AI to detect falls with the help of cloud processing. This app has a use case among riders who go on rides in isolated rural areas.

 ### :triangular_ruler: Download
 Download the APK file from an external source. Go to Settings, choose Security and enable Unknown Souces to install APK files from external source.<br><br>
<a href="https://bit.ly/get-trustfall"><img src="https://i.imgur.com/k2G6cSo.png" height="45"></a>

 ### :page_with_curl: License
TrustFall is licensed under the [MIT License](https://github.com/Niyko/TrustFall/blob/master/LICENSE).
