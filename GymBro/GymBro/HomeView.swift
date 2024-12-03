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
    
    var body: some View {
        VStack {
            Text("GymBro")
                .font(.system(size: 50))
            
            Text("🏋️‍♂️")
                .font(.system(size: 50))
            
            // Toggle for switching IDs
            Toggle("Week", isOn: $isToggled)
                .padding()
                .onChange(of: isToggled) {
                    if isToggled {
                        updateActivities()
                    } else {
                        resetActivities()
                    }
                }
        }
        
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                ForEach(manager.activities.sorted(by: { $0.value.id < $1.value.id }), id: \.key) { item in
                    ActivityCard(activity: item.value)
                }
            }
        }
        
        Spacer()
    }
    
    // Function to update IDs
    func updateActivities() {
        manager.activities = manager.activities.mapValues { activity in
            if activity.id < 10 {
                return Activity(
                    id: activity.id + 10,
                    title: activity.title,
                    subtitle: activity.subtitle,
                    image: activity.image,
                    amount: activity.amount
                )
            }
            return activity
        }
    }
    
    // Function to reset IDs
    func resetActivities() {
        manager.activities = manager.activities.mapValues { activity in
            if activity.id > 10 {
                return Activity(
                    id: activity.id - 10,
                    title: activity.title,
                    subtitle: activity.subtitle,
                    image: activity.image,
                    amount: activity.amount
                )
            }
            return activity
        }
    }
}

