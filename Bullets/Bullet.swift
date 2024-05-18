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
    
    init(text: String, createdAt: Date = .now) {
        self.text = text
        self.createdAt = createdAt
    }
    
    static let sampleData = [
        Bullet(text: "Integer fringilla odio id metus."),
        Bullet(text: "Sed vel mi."),
        Bullet(text: "Aliquam erat volutpat. Fusce ut finibus velit, quis interdum odio. Cras et felis neque. Nulla at placerat risus. Aenean et urna leo. Ut enim arcu, egestas nec consectetur sit amet, porttitor a dolor. Integer sit amet vulputate lectus, ac tincidunt mi. Aliquam ac risus purus. Proin id faucibus lorem. Morbi arcu eros, vulputate ut malesuada quis, molestie eu turpis. Pellentesque consequat tortor quis ante dictum accumsan. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec efficitur pharetra velit at imperdiet."),
        Bullet(text: "Aenean posuere ultricies.", createdAt: Date.init(timeIntervalSince1970: 0)),
        Bullet(text: "Donec tempor sit amet lectus.", createdAt: Date.init(timeIntervalSince1970: 0)),
        Bullet(text: "Lorem ipsum dolor sit amet.", createdAt: Date.init(timeIntervalSince1970: 1000000)),
    ]
}
