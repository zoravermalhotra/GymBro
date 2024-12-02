//
//  HomeView.swift
//  GymBro
//
//  Created by Joshua Gudgin on 01/12/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var manager: HealthManager
    var body: some View {
        VStack{
            Text("GymBro")
                .font(.system(size: 50))
            
            Text("🏋️‍♂️")
                .font(.system(size: 50))
        }
        
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)){
                ForEach(manager.activities.sorted(by: { $0.value.id < $1.value.id }), id: \.key) { item in
                    ActivityCard(activity: item.value)
                    
                }
            }
        }
        
        Spacer()
    }
}
    
    #Preview {
        HomeView()
    }
