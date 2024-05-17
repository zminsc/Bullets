//
//  BulletsApp.swift
//  Bullets
//
//  Created by Steven Chang on 5/17/24.
//

import SwiftUI

@main
struct BulletsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Bullet.self)
        }
    }
}
