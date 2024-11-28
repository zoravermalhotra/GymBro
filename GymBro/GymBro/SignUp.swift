//
//  SignUp.swift
//  GymBro
//
//  Created by Joshua Gudgin on 28/11/2024.
//

import SwiftUI

struct SignUp: View {
    @State private var username = ""
    @State private var password = ""
    @State private var verifyPassword = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    
    
    var body: some View {
        VStack {
            Text("Sign Up for GymBro")
                .font(.title)
                .padding()

            Spacer()
            
            TextField("Username", text: $username)
                .padding()
                .frame(width: 300, height: 50)
                .overlay { RoundedRectangle(cornerRadius: 10).stroke(Color.primary) }
                .border(Color.red, width: CGFloat(wrongUsername)).cornerRadius(10)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .padding()
                .frame(width: 300, height: 50)
                .overlay { RoundedRectangle(cornerRadius: 10).stroke(Color.primary) }
                .border(Color.red, width: CGFloat(wrongPassword)).cornerRadius(10)
                .autocapitalization(.none)
            
            SecureField("Verify Password", text: $verifyPassword)
                .padding()
                .frame(width: 300, height: 50)
                .overlay { RoundedRectangle(cornerRadius: 10).stroke(Color.primary) }
                .border(Color.red, width: CGFloat(wrongPassword)).cornerRadius(10)
                .autocapitalization(.none)
            
                Spacer()
        }
    }
}
