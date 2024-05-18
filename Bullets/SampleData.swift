//
//  SampleData.swift
//  Bullets
//
//  Created by Steven Chang on 5/17/24.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var modelContext: ModelContext {
        modelContainer.mainContext
    }
    
    private init() {
        let schema = Schema([
            Bullet.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            insertSampleData()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    func insertSampleData() {
        for bullet in Bullet.sampleData {
            modelContext.insert(bullet)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Sample data context failed to save.")
        }
    }
}
