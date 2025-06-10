//
//  HeaderView.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/8/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
            VStack( spacing: 4) {
                Text("To Do List")
                    .font(.largeTitle).fontWeight(.bold)
                Text("Be accountable")
                    .font(.title3).fontWeight(.medium)
            }
            .padding()
    }
}


#Preview {
    HeaderView()
}
