//
//  HomeView.swift
//  GymBro
//
//  Created by Joshua Gudgin on 01/12/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var manager: HealthManager
    @State private var isToggled: Bool = false
    
    var filteredActivities: [Activity] {
        manager.activities
            .filter { isToggled ? $0.value.id >= 10 && $0.value.id < 20 : $0.value.id < 10 }
            .map { $0.value }
    }
    
    var body: some View {
        NavigationView { // Embed in a NavigationView
            VStack {
                Text("GymBro")
                    .font(.system(size: 50))
                
                Text("🏋️‍♂️")
                    .font(.system(size: 50))
                
                // Toggle for switching between week and day
                Toggle("Week", isOn: $isToggled)
                    .padding()
                
                VStack {
                    LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                        ForEach(filteredActivities, id: \.id) { activity in
                            NavigationLink(destination: CustomizeCards()) {
                                ActivityCard(activity: activity)
                            }
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct CustomizeCards: View {
    var body: some View {
        Text("Hi")
    }
}
