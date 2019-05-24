//
//  DBManager.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 22/05/2019.
//  Copyright © 2019 Vildanov. All rights reserved.
//

import Foundation

final class TasksManager {
    static let shared = TasksManager()
    private init() { }

    private var tasks = [Task(title: "Title 1", explanation: "Explain 1"),
                         Task(title: "Title 2", explanation: "Explain 2"),
                         Task(title: "Title 3", explanation: "Explain 3")]

    func allTasks() -> [Task] {
        return tasks
    }

    func addOrUpdate(task: Task) {
        if let index = tasks.firstIndex(of: task) {
            self.tasks[index] = task
        } else {
            self.tasks.append(task)
        }
    }
}
