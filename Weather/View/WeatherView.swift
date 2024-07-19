    //
    //  WeatherView.swift
    //  WeatherDemo
    //
    //  Created by Joe on 2024-07-08.
    //

import SwiftUI

struct WeatherView: View {
    // Replace YOUR_API_KEY in WeatherManager with your own API key for the app to work
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: getWeatherIcon(weather.weather[0].main))
                                .font(.system(size: 40))
                            
                            Text("\(weather.weather[0].main)")
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: getWeatherImageURL(weather: weather))) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(getWeatherBackgroundColor(weather: weather))
        .preferredColorScheme(.dark)
    }
    
    func getWeatherIcon(_ main: String) -> String {
        switch main {
        case "Clear":
            return "sun.max"
        case "Clouds":
            return "cloud"
        case "Rain":
            return "cloud.rain"
        case "Snow":
            return "cloud.snow"
        default:
            return "sun.max"
        }
    }
    
    func getWeatherImageURL(weather: ResponseBody) -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        var imageUrl = "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png"
        
        switch weather.weather[0].main {
        case "Clear":
            imageUrl = (hour < 18) ? "https://media.istockphoto.com/id/1535894601/vector/hot-climate-in-the-city-with-strong-sunlight-in-flat-design.jpg?s=612x612&w=0&k=20&c=rrG-UJ4VSEZlQ9LdN8Tu1dokqpM_7KBw3li-w6wrgKU=" : "https://i.pinimg.com/474x/98/2e/19/982e1923da2cc6f4a229959bdc317b73.jpg"
        case "Clouds":
            imageUrl = (hour < 18) ? "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png" : "https://thumbs.dreamstime.com/b/ai-generated-illustration-weather-big-city-flood-midjourney-weather-big-city-flood-279223522.jpg"
        case "Rain":
            imageUrl = (hour < 18) ? "https://static.vecteezy.com/system/resources/thumbnails/007/561/051/small_2x/weather-raining-on-city-building-background-free-vector.jpg" : "https://static.vecteezy.com/system/resources/previews/007/854/282/non_2x/heavy-rain-in-the-modern-cityscape-background-free-vector.jpg"
        case "Snow":
            imageUrl = (hour < 18) ? "https://static.vecteezy.com/system/resources/previews/000/267/022/non_2x/vector-winter-village-illustration.jpg" : "https://static.vecteezy.com/system/resources/thumbnails/011/422/578/small_2x/winter-street-background-with-snow-in-night-chrismas-house-in-snow-illustarion-vector.jpg"
        default:
            return imageUrl
        }
        
        return imageUrl
    }
    
    func getWeatherBackgroundColor(weather: ResponseBody) -> Color {
        let hour = Calendar.current.component(.hour, from: Date())
        var backgroundColor = Color(hue: 0.656, saturation: 0.787, brightness: 0.354) // Default color
        
        switch weather.weather[0].main {
        case "Clear":
            backgroundColor = (hour < 18) ? Color(hue: 0.6, saturation: 0.8, brightness: 0.9) : Color(hue: 0.7, saturation: 0.7, brightness: 0.5)
        case "Clouds":
            backgroundColor = (hour < 18) ? Color(hue: 0.6, saturation: 0.6, brightness: 0.7) : Color(hue: 0.7, saturation: 0.5, brightness: 0.4)
        case "Rain":
            backgroundColor = Color(hue: 0.6, saturation: 0.6, brightness: 0.5)
        case "Snow":
            backgroundColor = Color(hue: 0.5, saturation: 0.5, brightness: 0.8)
        default:
            backgroundColor = Color(hue: 0.656, saturation: 0.787, brightness: 0.354)
        }
        
        return backgroundColor
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
