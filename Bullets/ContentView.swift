//
//  ContentView.swift
//  Bullets
//
//  Created by Steven Chang on 5/17/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Bullet.createdAt) private var bullets: [Bullet]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(bullets) { bullet in
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
                        modelContext.insert(Bullet(text: "New Bullet", createdAt: .now))
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Bullet.self, inMemory: true)
}
