//
//  AddTaskInteractor.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 22/05/2019.
//  Copyright (c) 2019 Vildanov. All rights reserved.
//

import UIKit

protocol AddTaskBusinessLogic {
    func showTask(request: AddTask.ShowTask.Request)
    func saveTask(request: AddTask.Save.Request)
}

protocol AddTaskDataStore {
    var task: Task? { get set }
}

class AddTaskInteractor: AddTaskBusinessLogic, AddTaskDataStore {

    // MARK: - Instance Properties

    var presenter: AddTaskPresentationLogic?
    var worker = AddTaskWorker()

    // MARK: - AddTaskDataStore

    var task: Task?

    // MARK: AddTaskBusinessLogic

    func showTask(request: AddTask.ShowTask.Request) {
        if self.task == nil {
            self.task = Task()
        }

        let response = AddTask.ShowTask.Response(task: self.task!)
        self.presenter?.presentTask(response: response)
    }

    func saveTask(request: AddTask.Save.Request) {

        guard let title = request.title, !title.isEmpty,
              let explanation = request.explanation, !explanation.isEmpty else {
            let text = "Заполните все поля"
            let response = AddTask.ShowMissingFields.Response(text: text)
            presenter?.presentMissingFileds(response: response)
            return
        }

        guard let task = self.task else { return }

        task.title = title
        task.explanation = explanation

        worker.addOrUpdate(task: task)

        let response = AddTask.Save.Response()
        presenter?.presentTaskSaved(response: response)
    }
}
