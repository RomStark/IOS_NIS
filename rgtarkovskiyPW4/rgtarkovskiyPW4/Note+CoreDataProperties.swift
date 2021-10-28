//
//  Note+CoreDataProperties.swift
//  rgtarkovskiyPW4
//
//  Created by Al Stark on 24.10.2021.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var title: String?
    @NSManaged public var descriptionText: String?
    @NSManaged public var creationData: Date

}

extension Note : Identifiable {

}
