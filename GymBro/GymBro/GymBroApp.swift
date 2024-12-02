//
//  GymBroApp.swift
//  GymBro
//
//  Created by Zoraver Malhotra on 29/02/24.
//

import SwiftUI

@main
struct GymBroApp: App {
    @StateObject var manager = HealthManager()
    
    var body: some Scene {
        WindowGroup {
            Login()
                .environmentObject(manager)
        }
    }
}
