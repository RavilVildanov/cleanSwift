//
//  Task.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 27/05/2019.
//  Copyright © 2019 Vildanov. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmConvertable {
    associatedtype RealmType: Object

    func mapToRealmObject() -> RealmType
    static func mapFromRealmObject(_ object: RealmType) -> Self
}

final class Task {
    var id: String
    var title: String
    var explanation: String

    init(title: String = "", explanation: String = "", id: String = UUID().uuidString) {
        self.id = id
        self.title = title
        self.explanation = explanation
    }
}

extension Task: RealmConvertable {

    func mapToRealmObject() -> RLMTask {
        let rlmTask = RLMTask()

        rlmTask.id = self.id
        rlmTask.title = self.title
        rlmTask.explanation = self.explanation

        return rlmTask
    }

    static func mapFromRealmObject(_ object: RLMTask) -> Task {
        let task = Task(title: object.title, explanation: object.explanation, id: object.id)
        return task
    }
}
