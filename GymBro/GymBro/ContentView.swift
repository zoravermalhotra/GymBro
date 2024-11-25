//
//  ContentView.swift
//  GymBro
//
//  Created by Zoraver Malhotra on 29/02/24.
//

import SwiftUI

struct ContentView: View {
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
    }
}

// Individual views for each tab
struct HomeView: View {
    var body: some View {
        Text("GymBro \n      🏋️‍♂️")
            .font(.system(size: 50))
            .padding()
        
        Text("Home")
            .font(.title)
            .padding()
        Spacer()
    }
}

struct FitnessView: View {
    var body: some View {
        Text("Fitness")
            .font(.title)
        
        NavigationStack{
            Grid{
                GridRow{
                    Button {
                        print("program")
                    } label: {
                        AsyncImage(url: URL(string: "https://www.setforset.com/cdn/shop/articles/what_to_do_before_starting_a_workout_plan_2000x.jpg?v=1708974352")) { image in
                            image.image?.resizable()}
                            .frame(width: 180, height: 180)
                            .clipShape(.rect(cornerRadius: 25))
                    }
                    .contentShape(Rectangle())
                    Button {
                        print("program")
                    } label: {
                        AsyncImage(url: URL(string: "https://tropeaka.com/cdn/shop/articles/main_image_d517c79f-4ec7-4946-bb5e-db7e80623e85_3500x.jpg?v=1571697737")) { image in
                            image.image?.resizable()}
                            .frame(width: 180, height: 180)
                            .clipShape(.rect(cornerRadius: 25))
                    }                }
                GridRow {
                    Button{
                        print("training")
                    } label: {
                        Text("Workout Program")
                            .font(.system(size: 20))
                            .foregroundStyle(.primary)
                    }
                    Button{
                        print("exercises")
                    } label: {
                        Text("Exercises")
                            .font(.system(size:20))
                            .foregroundStyle(.primary)
                    }
                }
            }
            .font(.title)
        }
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
