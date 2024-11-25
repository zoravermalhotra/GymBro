//
//  ContentView.swift
//  GymBro
//
//  Created by Zoraver Malhotra on 29/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedOption = "Fitness"
    
    var body: some View {
        VStack {
            Text("GymBro \n      🏋️‍♂️")
                .font(.system(size: 80))
                .padding()
            
            Spacer() // Pushes everything above to the top and everything below to the bottom
            
            Picker("Options", selection: $selectedOption) {
                Text("Fitness").tag("Fitness")
                Text("Social").tag("Social")
                Text("Diet").tag("Diet")
                Text("Profile").tag("Profile")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
        .edgesIgnoringSafeArea(.bottom) // Extends the VStack to the bottom edge of the screen
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
