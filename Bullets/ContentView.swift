//
//  ContentView.swift
//  Bullets
//
//  Created by Steven Chang on 5/17/24.
//

import SwiftUI

struct ContentView: View {
    @State private var bullets = [Bullet]()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(bullets, id:\.text) { bullet in
                    HStack {
                        Text(bullet.text)
                        Spacer()
                        Text(bullet.createdAt, format: .dateTime.month().day().year())
                    }
                }
            }
            .navigationTitle("Bullets")
            .toolbar {
                ToolbarItem {
                    Button("Add Bullet", systemImage: "plus") {
                        bullets.append(Bullet(text: "New Bullet", createdAt: .now))
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
