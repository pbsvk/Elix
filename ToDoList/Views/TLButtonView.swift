//
//  TLButton.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/13/25.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let action: () -> Void
    let backgroundColor: Color
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(backgroundColor)
                .cornerRadius(12)
        }    }
}

#Preview {
    TLButton(title: "String", action:{}, backgroundColor: .green)
}
