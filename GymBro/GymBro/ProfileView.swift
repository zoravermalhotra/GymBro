//
//  ProfileView.swift
//  GymBro
//
//  Created by Joshua Gudgin on 28/11/2024.
//

import SwiftUI

struct ProfileView: View {
    var username: String // Accept username as a parameter

    var body: some View {
        VStack {
            Text("Your Profile")
                .font(.largeTitle)
                .padding()

            Text("You are logged in as \(username).")
                .font(.title2)
                .padding()

            Spacer()
        }
    }
}

