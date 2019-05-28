//
//  TasksWorker.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 21/05/2019.
//  Copyright (c) 2019 Vildanov. All rights reserved.
//

import UIKit

class TasksWorker {
    func fetchTasks() -> [Task] {
        let tasks = TasksManager.shared.allTasks()
        return tasks.map { $0 }
    }

    func delete(task taskToDelete: Task) {
        TasksManager.shared.delete(task: taskToDelete)
    }
}
