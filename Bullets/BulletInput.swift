//
//  BulletInput.swift
//  Bullets
//
//  Created by Steven Chang on 5/17/24.
//

import SwiftUI
import SwiftData

struct BulletInput: View {
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            Button("Add Bullet") {
                modelContext.insert(Bullet(text: "New Bullet", createdAt: .now))
            }
            .navigationTitle("New Bullet")
        }
    }
}

#Preview {
    BulletInput()
        .modelContainer(for: Bullet.self)
}
