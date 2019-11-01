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
            return NSLocalizedString("str_batman", comment: "")
        case .captUS:
            return NSLocalizedString("str_captUS", comment: "")
        case .ironman:
            return NSLocalizedString("str_ironman", comment: "")
        case .superman:
            return NSLocalizedString("str_superman", comment: "")
        case .thor:
            return NSLocalizedString("str_thor", comment: "")
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
            return NSLocalizedString("str_aquarius", comment: "")
        case .pisces:
            return NSLocalizedString("str_pisces", comment: "")
        case .aries:
            return NSLocalizedString("str_aries", comment: "")
        case .taurus:
            return NSLocalizedString("str_taurus", comment: "")
        case .gemini:
            return NSLocalizedString("str_gemini", comment: "")
        case .cancer:
            return NSLocalizedString("str_cancer", comment: "")
        case .leo:
            return NSLocalizedString("str_leo", comment: "")
        case .virgo:
            return NSLocalizedString("str_virgo", comment: "")
        case .libra:
            return NSLocalizedString("str_libra", comment: "")
        case .scorpio:
            return NSLocalizedString("str_scorpio", comment: "")
        case .sagittarius:
            return NSLocalizedString("str_sagittarius", comment: "")
        case .capricorn:
            return NSLocalizedString("str_capricorn", comment: "")
        }
    }
    
}
