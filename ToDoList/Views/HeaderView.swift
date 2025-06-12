//
//  HeaderView.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/8/25.
//

import SwiftUI

struct HeaderView: View {
    let title: String = "Elix"
    let subtitle: String = "Be accountable"
    let routename: String
    var body: some View {
            VStack( spacing: 4) {
                Text(title)
                    .font(.largeTitle).fontWeight(.bold)
                Text(subtitle)
                    .font(.title3).fontWeight(.medium)
                Text(routename)
                    .foregroundColor(.gray)
            }
            .padding()
    }
}


#Preview {
    HeaderView(routename: "Routename")
}
