<h1>AeroSnap</h1>

<p>
    AeroSnap is a SwiftUI application that provides weather information based on the user's current location. The app starts by requesting location access from the user and then uses CoreLocation to retrieve the district and province information. It fetches the weather data from the OpenWeatherMap API and displays it in a clearly designed user interface.
</p>

<h2>Features</h2>
<ul>
    <li><strong>Location Access</strong>: The app requests permission to access the user's location on the welcome page.</li>
    <li><strong>Location-Based Weather</strong>: CoreLocation is used to determine the user's current district and province.</li>
    <li><strong>Weather Data</strong>: The app fetches real-time weather information based on the user's location from the OpenWeatherMap API.</li>
    <li><strong>UI</strong>: The weather data is presented to the user in a clean and visually appealing interface.</li>
</ul>

<h2>What Did I Learn</h2>
<ul>
    <li><strong>Understanding Property Wrappers in SwiftUI</strong></li>
    <li><strong>Implementing State-Driven Navigation</strong></li>
    <li><strong>Establishing API Connections</strong></li>
    <li><strong>Requesting and Processing Location Data</strong></li>
    <li><strong>Enhancing UI Development Skills with SwiftUI</strong></li>
</ul>

<p>Below are some screenshots from the project that showcase key features and UI components:</p>
<img width="392" alt="Screenshot 2024-08-26 at 22 53 37" style="width:41%; max-width:600px;" src="https://github.com/user-attachments/assets/5152e725-51ac-4c55-afd7-09b03774293e">
<img width="421" alt="Screenshot 2024-08-26 at 15 06 05" style="width:45%; max-width:600px;" src="https://github.com/user-attachments/assets/28b9938b-50a3-408d-bea1-6345f653bf62">


<h2>Installation</h2>
<p>To run the AeroSnap on your device:</p>
<ol>
    <li><strong>Clone the repository:</strong></li>
  <li><strong>Open project on Xcode</strong></li>
  <li><strong>Change API KEY with yours. (API KEY located in AeroSnap/Managers/WeatherManager)</strong></li>
</code></pre>
        </ul>
    </li>
</ol>

<h2>Usage</h2>
<ol>
    <li><strong>Welcome Page</strong>: On launch, the app will present a welcome page asking for location permission.</li>
    <li><strong>Location Services</strong>: Once the user grants permission, the app will retrieve the district and province information.</li>
    <li><strong>Weather Display</strong>: The app fetches the weather data based on the location and displays it in a visually appealing format.</li>
</ol>

<h2>Dependencies</h2>
<ul>
    <li><strong>CoreLocation</strong>: Used for retrieving the user's location.</li>
    <li><strong>SwiftUI</strong>: Used for designing the app's user interface.</li>
    <li><strong>OpenWeatherMap API</strong>: Provides weather data based on the user's location.</li>
</ul>

<h2>Contributing</h2>
<p>Contributions are welcome! If you have suggestions for improvements or new features, feel free to open an issue or submit a pull request.</p>

