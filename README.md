# MercerSafe

The purpose of this section is to define the operation and maintenance requirements of MercerSafe. MercerSafe is a campus safety app, aimed specifically at Mercer University’s Macon campus.

The prototype was constructed in Dart, using the Flutter framework. It uses Dart sdkcurrent version 2.19.6, Flutter sdk 3.7.9, targetSdkVersion 33, and compileSdkVersion 33.


There are three .dart files in the project’s MercerSafe lib that do not create features.


The file “colors_mercer_official.dart” contains a list of assets for official Mercer colors for UI. These are the only colors that should be used throught the app, and is not an exhaustive list. The complete list of official Mercer colors can be found in Appendix E.

The file “create_bottom_nav.dart” creates the bottom navigation menu throughout the app. Any class that returns a bottomNavigationBar in its scaffold should call on this class to create a bottom navigation menu. This is so that the menu is consistent throughout the app.

The file “main.dart” runs the app when it is started by the user. It contains the theme data, initial route, list of routes, and preferred orientation for the app. These variables dictate the color theme, landing page, reachable pages, and allowed screen orientation for the app, respectively. These values should only be defined within main and no here else, or else the app’s layout will not be consistent.


Each feature of the app is in its own .dart file.

The final design includes 6 main features:
-The Emergency Call Button
-The Campus Map
-The Safe-Journey Button
-General Safety Information
-The Registry
-Incident Reporting

The Emergency Call Button feature is written in the “emergency_call_button.dart” file. To use the feature, the user will hit a button labeled “call”. The app then connects to the phone’s existing call-making app, preloaded with MERPO’s number at 478-301-2911. In order to do this, the makingCall function inside the same class file as this widget is called when a button on the page is pressed. The imported package url_launcher is then used to make the call. This feature requires maintenance so that, if MERPO’S number changes, the String policeNumber is updated.

The Campus Map feature is written in the “campus_map.dart” file. The feature displays where the Emergency Blue Light Stations are displayed over a map of campus. It is powered by Google Maps, so the user can pinch the map to zoom in and out. This feature incorporates the Google Maps API which allows the developer to display and manipulate data on a google map in order to display it on a web page or app. Our team did not need to pay to use the Google Maps API, but future teams may need to. The API allows for $200 worth of fee-free usage every month, after which it costs $0.014 per request for the remainder of that month. For more detail on the maintenance cost of the API, see section 4.2 Costs.

The Safe-Journey Button feature is written in the “safe_journey_button.dart” file. To use the feature the user taps the safe-journey button. Afterwards the user holds down on the button until they reach their destination. Once the user lifts their finger off the button, the timer above the button will begin to count down. Two buttons appear beneath the safe-journey button: one to call MERPO and another to return to the homescreen. Hitting either button will stop the counter from counting down. If the user holds down on the safe-journey button again, the timer will reset and stop counting down. If the timer reaches 0, it will open the phone’s call app, preloaded with MERPO’s number at 478-301-2911.

The General Safety Information feature is written in the “general_safety_info_screen.dart” file. The feature is a catalogue of links to Mercer’s page on Fire Safety, Active Shooter Precautions, Tornado Safety, the Traffic Jam Program, and General Campus Safety Tips. This feature requires maintenance to make sure each link still works each semester.

The Incident Report feature is a feature that sends an email to MERPO.

The Registry feature is a database of incidents previously entered into the Incident Report feature. It uses Firebase.

There are two .png files in the project’s asset folder.

The file “app_icon.png” is the project’s launcher icon. It is an orange siren on a blue background, with the text “Mercer Safe” above it. Every color in this image uses Mercer's official colors for UI (Appendix F). This image is an original work of our team and ergo, need not worry about license.

The file “map_marker_blue.png” is the marker for the Blue Light Stations on the Campus Map feature. The image is a creative commons asset and credited in the Refrences section.

