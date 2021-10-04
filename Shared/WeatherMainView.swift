//
//  WeatherMainView.swift
//  Shared
//
//  Created by Guillermo Ignacio Enriquez Gutierrez on 2021/10/03.
//

import SwiftUI

struct WeatherMainView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: Color.blue, bottomColor: Color.init(hue: 0.5, saturation: 1, brightness: 1))
            VStack {
                TodayTitleView(cityName: "Tokyo, Setagaya")
                TodayView(imageName: "cloud.sun.fill", temperature: 35)
                Spacer()
                HStack(spacing: 24) {
                    DayView(dayOfWeek: "Sat", imageName: "cloud.sun.fill", temperature: 30)
                    DayView(dayOfWeek: "月", imageName: "cloud.sun.fill", temperature: 30)
                    DayView(dayOfWeek: "火", imageName: "cloud.sun.bolt.fill", temperature: 30)
                    DayView(dayOfWeek: "水", imageName: "sun.max.fill", temperature: 30)
                    DayView(dayOfWeek: "木", imageName: "wind.snow", temperature: 30)
                    DayView(dayOfWeek: "金", imageName: "cloud.moon.rain.fill", temperature: 30)
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

struct WeatherMainView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherMainView()
    }
}

extension WeatherMainView {
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
}

extension WeatherMainView {
    struct TodayTitleView: View {
        var cityName: String
        var body: some View {
            Text(cityName)
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .padding()
        }
    }
}

extension WeatherMainView {
    struct TodayView: View {
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
}

extension WeatherMainView {
    struct DayView: View {
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
}

