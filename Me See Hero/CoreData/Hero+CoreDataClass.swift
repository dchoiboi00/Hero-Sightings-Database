//
//  Hero+CoreDataClass.swift
//  Me See Hero
//
//  Created by Daniel Choi on 10/31/19.
//  Copyright © 2019 Daniel Choi. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Hero)
public class Hero: NSManagedObject {
    
    override public func awakeFromInsert() {
        if self.uuid == nil {
            self.uuid = UUID()
        }
    }

}
