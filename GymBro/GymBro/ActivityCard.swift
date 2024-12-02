//
//  ActivityCard.swift
//  GymBro
//
//  Created by Joshua Gudgin on 03/12/2024.
//

import SwiftUI

struct Activity{
    let id: Int
    let title: String
    let subtitle: String
    let image: String
    let amount: String
}

struct ActivityCard: View {
    @State var activity: Activity
    
    var body: some View {
        ZStack{
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            VStack(spacing: 10){
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 5){
                        Text(activity.title)
                            .font(.system(size: 16))
                        
                        Text(activity.subtitle)
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "figure.walk")
                }
                
                Text(activity.amount)
            }
            
            .padding()
        }
        
    }
}
