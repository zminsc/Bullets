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
            Group {
                if !bullets.isEmpty {
                    List {
                        ForEach(sortedGroupedBullets, id: \.key) { date, bulletsForDate in
                            Section(header: Text(date, format: .dateTime.month().day().year())) {
                                ForEach(bulletsForDate) { bullet in
                                    Button {
                                        bullet.isChecked = !bullet.isChecked
                                    } label: {
                                        HStack {
                                            Image(systemName: bullet.isChecked ? "circle.dashed.inset.filled" : "circle.dashed")
                                            Text(bullet.text)
                                                .strikethrough(bullet.isChecked)
                                                .foregroundStyle(bullet.isChecked ? .gray : .black)
                                        }
                                    }
                                    .foregroundStyle(.black)
                                }
                                .onDelete(perform: { offsets in
                                    deleteBullets(offsets: offsets, bulletsForDate: bulletsForDate)
                                })
                            }
                        }
                    }
                } else {
                    ContentUnavailableView  {
                        Label("No Bullets", systemImage: "square.and.pencil.circle.fill")
                    }
                }
            }
            .navigationTitle("Bullets")
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
            }
        }
    }
    
    private var groupedBullets: [Date: [Bullet]] {
        Dictionary(grouping: bullets) { bullet in
            Calendar.current.startOfDay(for: bullet.createdAt)
        }
        .mapValues { bulletsForDate in
            bulletsForDate.sorted {
                $0.createdAt < $1.createdAt
            }
        }
    }
    
    private var sortedGroupedBullets: [(key: Date, value: [Bullet])] {
        groupedBullets.sorted(by: {
            $0.key > $1.key
        })
    }
    
    private func deleteBullets(offsets: IndexSet, bulletsForDate: [Bullet]) {
        withAnimation {
            for index in offsets {
                modelContext.delete(bulletsForDate[index])
            }
        }
    }
}

#Preview {
    BulletList()
        .modelContainer(SampleData.shared.modelContainer)
}

#Preview("No Bullets") {
    BulletList()
        .modelContainer(for: Bullet.self, inMemory: true)
}
