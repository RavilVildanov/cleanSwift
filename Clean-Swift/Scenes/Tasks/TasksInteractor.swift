//
//  TasksInteractor.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 21/05/2019.
//  Copyright (c) 2019 Vildanov. All rights reserved.
//

import UIKit

protocol TasksBusinessLogic {
    func fetchTasks(request: Tasks.ShowTasks.Request)
}

protocol TasksDataStore {
    var tasks: [Task] { get set }
}

class TasksInteractor: TasksBusinessLogic, TasksDataStore {
    var presenter: TasksPresentationLogic?
    var worker: TasksWorker?
    var tasks = [Task]()

    // MARK: Do something

    func fetchTasks(request: Tasks.ShowTasks.Request) {
        worker = TasksWorker()
        guard let tasks = worker?.fetchTasks() else { return }
        self.tasks = tasks

        let response = Tasks.ShowTasks.Response(tasks: tasks)
        presenter?.presentTasks(response: response)
    }
}
