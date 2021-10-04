//
//  ContentView.swift
//  Shared
//
//  Created by Guillermo Ignacio Enriquez Gutierrez on 2021/10/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: Color.blue, bottomColor: Color.init(hue: 0.5, saturation: 1, brightness: 1))
            VStack {
                CityView(cityName: "Tokyo, Setagaya")
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 35)
                Spacer()
                HStack(spacing: 24) {
                    WeatherDayView(dayOfWeek: "Sat", imageName: "cloud.sun.fill", temperature: 30)
                    WeatherDayView(dayOfWeek: "月", imageName: "cloud.sun.fill", temperature: 30)
                    WeatherDayView(dayOfWeek: "火", imageName: "cloud.sun.bolt.fill", temperature: 30)
                    WeatherDayView(dayOfWeek: "水", imageName: "sun.max.fill", temperature: 30)
                    WeatherDayView(dayOfWeek: "木", imageName: "wind.snow", temperature: 30)
                    WeatherDayView(dayOfWeek: "金", imageName: "cloud.moon.rain.fill", temperature: 30)
                }
                Spacer()
                Button {
                    print("tapped!")
                } label: {
                    StandardButton(title: "Change day time")
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [topColor, bottomColor]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
            .ignoresSafeArea(SafeAreaRegions.all, edges: [Edge.Set.top, .bottom])
            //.edgesIgnoringSafeArea(Edge.Set.all)
    }
}

struct CityView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.largeTitle)
            .foregroundColor(Color.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            Text("\(temperature)°")
                .font(.title2)
                .foregroundColor(.white)
        }
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.title2)
                .foregroundColor(.white)
                //.border(Color.green)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                //.border(Color.green)
            Text("\(temperature)°")
                .font(.title2)
                .foregroundColor(.white)
                //.border(Color.green)
        }
    }
}

struct StandardButton: View {
    var title: String
    var body: some View {
        Text(title)
            //.frame(width: 200, height: 48)
            .font(.body)
    }
}
