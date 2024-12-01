//
//  ContentView.swift
//  GymBro
//
//  Created by Zoraver Malhotra on 29/02/24.
//

import SwiftUI

struct ContentView: View {
    var username: String
    @State private var selectedOption = "Home"
    
    var body: some View {
        VStack {

            Spacer() // Pushes everything above to the top and everything below to the bottom 
            
            // Content changes based on selected option
            Group {
                switch selectedOption {
                case "Home":
                    HomeView()
                case "Fitness":
                    FitnessView()
                case "Social":
                    SocialView()
                case "Diet":
                    DietView()
                case "Profile":
                    ProfileView(username: username)
                default:
                    Text("Select an option")
                }
            }
            .padding()
            
            Picker("Options", selection: $selectedOption) {
                Text("Home").tag("Home")
                Text("Fitness").tag("Fitness")
                Text("Diet").tag("Diet")
                Text("Social").tag("Social")
                Text("Profile").tag("Profile")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            

        }
    }
}

struct SocialView: View {
    var body: some View {
        Text("Social interactions go here.")
            .font(.title)
            .padding()
        Spacer()
    }
}

struct DietView: View {
    var body: some View {
        Text("Diet plans and trackers!")
            .font(.title)
            .padding()
        Spacer()
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
