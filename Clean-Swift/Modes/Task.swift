//
//  Task.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 21/05/2019.
//  Copyright © 2019 Vildanov. All rights reserved.
//

import Foundation

class Task: Equatable {

    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }

    var id: String
    var title: String
    var explanation: String

    init(title: String = "", explanation: String = "") {
        self.id = UUID().uuidString
        self.title = title
        self.explanation = explanation
    }
}
