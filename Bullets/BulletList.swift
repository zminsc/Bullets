//
//  BulletList.swift
//  Bullets
//
//  Created by Steven Chang on 5/17/24.
//

import SwiftUI
import SwiftData

struct BulletList: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Bullet.createdAt) private var bullets: [Bullet]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(groupedBullets.keys.sorted(by: >), id: \.self) { date in
                    Section(header: Text(date, format: .dateTime.month().day().year())) {
                        ForEach(groupedBullets[date]?.sorted { firstBullet, secondBullet in
                            firstBullet.createdAt < secondBullet.createdAt
                        } ?? []) { bullet in
                            Text(bullet.text)
                        }
                    }
                }
            }
            .navigationTitle("Bullets")
        }
    }
    
    private var groupedBullets: [Date: [Bullet]] {
        Dictionary(grouping: bullets) { bullet in
            Calendar.current.startOfDay(for: bullet.createdAt)
        }
    }
}

#Preview {
    BulletList()
}
