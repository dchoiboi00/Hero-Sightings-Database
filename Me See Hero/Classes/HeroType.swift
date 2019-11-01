//
//  HeroType.swift
//  Me See Hero
//
//  Created by Daniel Choi on 10/31/19.
//  Copyright © 2019 Daniel Choi. All rights reserved.
//

import Foundation
import UIKit

enum HeroType: Int {
    case superman, batman, ironman, thor, captUS
    static let allValues = [superman, batman, ironman, thor, captUS]
    
    func title() -> String {
        switch self {
        case .batman:
            return "Batman"
        case .captUS:
            return "Captain America"
        case .ironman:
            return "Iron Man"
        case .superman:
            return "Superman"
        case .thor:
            return "Thor"
        }
    }
    
    func image() -> UIImage? {
        switch self {
        case .batman:
            return UIImage(named: "batman")
        case .captUS:
            return UIImage(named: "captUS")
        case .ironman:
            return UIImage(named: "ironman")
        case .superman:
            return UIImage(named: "superman")
        case .thor:
            return UIImage(named: "thor")
        }
    }
}

enum Zodiac: Int {
    case aquarius, pisces, aries, taurus, gemini, cancer, leo, virgo, libra, scorpio, sagittarius, capricorn
    static let allValues = [aquarius, pisces, aries, taurus, gemini, cancer, leo, virgo, libra, scorpio, sagittarius, capricorn]
    
    func title() -> String {
        switch self {
        case .aquarius:
            return "Aquarius"
        case .pisces:
            return "Pisces"
        case .aries:
            return "Aries"
        case .taurus:
            return "Taurus"
        case .gemini:
            return "Gemini"
        case .cancer:
            return "Cancer"
        case .leo:
            return "Leo"
        case .virgo:
            return "Virgo"
        case .libra:
            return "Libra"
        case .scorpio:
            return "Scorpio"
        case .sagittarius:
            return "Sagittarius"
        case .capricorn:
            return "Capricorn"
        }
    }
    
}
