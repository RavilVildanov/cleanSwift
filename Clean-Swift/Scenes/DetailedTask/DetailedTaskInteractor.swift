//
//  DetailedTaskInteractor.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 21/05/2019.
//  Copyright (c) 2019 Vildanov. All rights reserved.
//

import UIKit

protocol DetailedTaskBusinessLogic {
    func fetchData(request: DetailedTask.ShowTask.Request)
}

protocol DetailedTaskDataStore {
    var task: Task? { get set }
}

class DetailedTaskInteractor: DetailedTaskBusinessLogic, DetailedTaskDataStore {

    // MARK: - Instance Properties

    var presenter: DetailedTaskPresentationLogic?

    // MARK: - DetailedTaskDataStore

    var task: Task?

    // MARK: Do something

    func fetchData(request: DetailedTask.ShowTask.Request) {
        guard let task = self.task else { return }
        let response = DetailedTask.ShowTask.Response(task: task)
        presenter?.presentTask(response: response)
    }
}
