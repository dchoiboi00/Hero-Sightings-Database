//
//  Hero+CoreDataProperties.swift
//  Me See Hero
//
//  Created by Daniel Choi on 10/31/19.
//  Copyright © 2019 Daniel Choi. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

extension Hero {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Hero> {
        return NSFetchRequest<Hero>(entityName: "Hero")
    }

    @NSManaged public var image: Int16
    @NSManaged public var location: String?
    @NSManaged public var name: String?
    @NSManaged public var residence: String?
    @NSManaged public var snapshot: UIImage?
    @NSManaged public var uuid: UUID?
    @NSManaged public var zodiac: String?

}
