//
//  HomeView.swift
//  GymBro
//
//  Created by Joshua Gudgin on 01/12/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            Text("GymBro")
                .font(.system(size: 50))
            
            Text("🏋️‍♂️")
                .font(.system(size: 50))
        }
        
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)){
                ActivityCard()
                
                ActivityCard()
            }
        }
        
        Spacer()
    }
}


struct ActivityCard: View {
    var body: some View {
        ZStack{
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            VStack(spacing: 10){
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 5){
                        Text("Steps today")
                            .font(.system(size: 16))
                        
                        Text("Goal: 10,000")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "figure.walk")
                }
                
                Text("1234")
            }
            
            .padding()
        }
        
    }
}
    
    #Preview {
        HomeView()
    }
