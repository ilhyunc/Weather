# WeatherDemo App

## Description
The WeatherDemo app provides real-time weather updates based on the user's current location. It displays the weather condition, temperature, and additional weather details using an intuitive and visually appealing user interface.

## Features
- Get current weather information based on location.
- Detailed weather information including temperature, wind speed, and humidity.
- Dynamic background and icons based on weather conditions.

## Demo Video

https://github.com/user-attachments/assets/6ec75c2a-1e57-4652-b336-81a39f121389


## Project Structure
The project consists of the following main files:
### WeatherDemoApp.swift
Contains the entry point for the SwiftUI app. It initializes the main content view.
### ContentView.swift
Handles the state and displays the weather information or loading/welcome screens based on the user's location status.
### WelcomeView.swift
Displays a welcome message and prompts the user to share their location.
### LoadingView.swift
Displays a loading spinner while waiting for the location or weather data.
### WeatherView.swift
Displays the weather information and dynamically updates the UI based on the weather conditions.
### WeatherRow.swift
Displays individual weather details in a row format.
### LocationManager.swift
Handles location-related functionality, requesting and retrieving the user's current location.
### WeatherManager.swift
Handles fetching the weather data from a weather API.
### Preview Content
Provides sample data for previews.

## How to Run the Project
- Clone the repository to your local machine.
- Open the project in Xcode.
- Replace YOUR_API_KEY in WeatherManager.swift with your actual API key from OpenWeather.
- Build and run the project on the simulator or a physical device.

