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
    @State private var bulletText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $bulletText)
                        .frame(maxHeight: .infinity)
                    
                    if bulletText.isEmpty {
                        Text("Enter your bullet here...")
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                            .padding(.horizontal, 4)
                    }
                }
                
                Button(action: addBullet) {
                    Text("Add Bullet")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.tint)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 20)
            }
            .padding()
            .navigationTitle("New Bullet")
        }
    }
    
    func addBullet() {
        let newBullet = Bullet(text: bulletText)
        modelContext.insert(newBullet)
        bulletText = ""
    }
}

#Preview {
    BulletInput()
        .modelContainer(for: Bullet.self)
}
