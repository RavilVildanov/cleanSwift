//
//  TasksPresenter.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 21/05/2019.
//  Copyright (c) 2019 Vildanov. All rights reserved.
//

import UIKit

protocol TasksPresentationLogic {
    func presentTasks(response: Tasks.ShowTasks.Response)
}

class TasksPresenter: TasksPresentationLogic {
    weak var viewController: TasksDisplayLogic?
    
    // MARK: Do something
    
    func presentTasks(response: Tasks.ShowTasks.Response) {
        let mapped = response.tasks.map { task in
            Tasks.ShowTasks.ViewModel.DisplayedTask(title: task.title.uppercased(), explanation: task.explanation.uppercased())
        }

        let viewModel = Tasks.ShowTasks.ViewModel(displayedTasks: mapped)
        viewController?.displayTasks(viewModel: viewModel)
    }
}
