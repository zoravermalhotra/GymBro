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
                .font(.system(size: 50))
                .padding()
            
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
                    ProfileView()
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
        .edgesIgnoringSafeArea(.bottom) // Extends the VStack to the bottom edge of the screen
    }
}

// Individual views for each tab
struct HomeView: View {
    var body: some View {
        Text("Home")
            .font(.title)
            .padding()
        Spacer()
    }
}

struct FitnessView: View {
    var body: some View {
        Text("Welcome to Fitness!")
            .font(.title)
            .padding()
        Spacer()
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

struct ProfileView: View {
    var body: some View {
        Text("Your Profile.")
            .font(.title)
            .padding()
        Spacer()
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
