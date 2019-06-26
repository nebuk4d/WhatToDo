//
//  Item.swift
//  WhatToDo
//
//  Created by Alexander Reitz on 26.06.19.
//  Copyright © 2019 Alexander Reitz. All rights reserved.
//

import Foundation
import RealmSwift

class Item : Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
