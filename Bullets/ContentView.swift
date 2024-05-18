//
//  ContentView.swift
//  Bullets
//
//  Created by Steven Chang on 5/17/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        TabView {
            BulletInput()
                .tabItem {
                    Label("New Bullet", systemImage: "plus.circle.dashed")
                }
            
            BulletList()
                .tabItem {
                    Label("Bullets", systemImage: "square.and.pencil.circle.fill")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
