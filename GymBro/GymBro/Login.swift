//
//  Login.swift
//  GymBro
//
//  Created by Zoraver Malhotra on 25/11/2024.
//

import SwiftUI

struct Login: View {
    @State var selectedTab = "Login"
    @State private var username: String = ""
    @State private var password: String = ""
    //@State private var button: Button<Label: View>


    
    var body: some View {
        VStack {
            
            Text("Login")
                .font(.title)
                .padding()
            
            
            Spacer()
            
            TextField("Username", text: $username)
                .font(.system(size: 20))
                .padding()
                .overlay {RoundedRectangle(cornerRadius: 20).stroke(Color.primary)}
                .padding(.horizontal)
                .autocapitalization(.none)
            
            
            TextField("Password", text: $password)
                .font(.system(size: 20))
                .padding()
                .overlay {RoundedRectangle(cornerRadius: 20).stroke(Color.primary)}
                .padding(.horizontal)
                .autocapitalization(.none)
            
            Spacer()

                
        }
    }
}

#Preview {
    Login()
}
