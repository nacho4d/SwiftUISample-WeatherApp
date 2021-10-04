//
//  StandardButton.swift
//  WeatherApp
//
//  Created by Guillermo Ignacio Enriquez Gutierrez on 2021/10/04.
//

import SwiftUI

struct StandardButton: View {
    var title: String
    var body: some View {
        Text(title)
            //.frame(width: 200, height: 48)
            .font(.body)
    }
}
