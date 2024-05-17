//
//  Bullet.swift
//  Bullets
//
//  Created by Steven Chang on 5/17/24.
//

import Foundation
import SwiftData

@Model
final class Bullet {
    var text: String
    var createdAt: Date
    
    init(text: String, createdAt: Date) {
        self.text = text
        self.createdAt = createdAt
    }
}
