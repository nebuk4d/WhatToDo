//
//  Category.swift
//  WhatToDo
//
//  Created by Alexander Reitz on 26.06.19.
//  Copyright © 2019 Alexander Reitz. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
