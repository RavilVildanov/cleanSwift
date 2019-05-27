//
//  DBManager.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 22/05/2019.
//  Copyright © 2019 Vildanov. All rights reserved.
//

import Foundation
import RealmSwift

final class TasksManager {
    static let shared = TasksManager()
    private init() { }

    private let realm = try! Realm()

    func allTasks() -> [Task] {
        let rlmTasks = realm.objects(RLMTask.self)
        let tasks = rlmTasks.map { Task.mapFromRealmObject($0) }
        return Array(tasks)
    }

    func addOrUpdate(task: Task) {
        try! realm.write {
            if let object = realm.object(ofType: RLMTask.self, forPrimaryKey: task.id) {
                object.title = task.title
                object.explanation = task.explanation
            } else {
                realm.add(task.mapToRealmObject())
            }
        }
    }
}
