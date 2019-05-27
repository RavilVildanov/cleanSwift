//
//  RLMTask.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 21/05/2019.
//  Copyright © 2019 Vildanov. All rights reserved.
//

import Foundation
import RealmSwift

class RLMTask: Object {

    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title = ""
    @objc dynamic var explanation = ""

    override static func primaryKey() -> String? {
        return "id"
    }
}
