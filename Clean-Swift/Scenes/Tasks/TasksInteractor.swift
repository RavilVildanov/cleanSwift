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
    func deleteTask(request: Tasks.DeleteTask.Request)
}

protocol TasksDataStore {
    var tasks: [Task] { get set }
}

class TasksInteractor: TasksBusinessLogic, TasksDataStore {
    var presenter: TasksPresentationLogic?
    var worker = TasksWorker()
    var tasks = [Task]()

    // MARK: TasksBusinessLogic

    func fetchTasks(request: Tasks.ShowTasks.Request) {
        self.tasks = worker.fetchTasks()

        let response = Tasks.ShowTasks.Response(tasks: self.tasks)
        presenter?.presentTasks(response: response)
    }

    func deleteTask(request: Tasks.DeleteTask.Request) {
        let taskToDelete = self.tasks[request.index]
        worker.delete(task: taskToDelete)
        
        self.tasks = worker.fetchTasks()
        let response = Tasks.ShowTasks.Response(tasks: self.tasks)
        presenter?.presentTasks(response: response)
    }
}
