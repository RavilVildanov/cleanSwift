//
//  AddTaskPresenter.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 22/05/2019.
//  Copyright (c) 2019 Vildanov. All rights reserved.
//

import UIKit

protocol AddTaskPresentationLogic {
    func presentTask(response: AddTask.ShowTask.Response)
    func presentMissingFileds(response: AddTask.ShowMissingFields.Response)
    func presentTaskSaved(response: AddTask.Save.Response)
}

class AddTaskPresenter: AddTaskPresentationLogic {
    weak var viewController: AddTaskDisplayLogic?
    
    // MARK: AddTaskPresentationLogic
    
    func presentTask(response: AddTask.ShowTask.Response) {
        let title = response.task.title
        let explanation = response.task.explanation
        let viewModel = AddTask.ShowTask.ViewModel(title: title, explanation: explanation)
        viewController?.displayTask(viewModel: viewModel)
    }

    func presentMissingFileds(response: AddTask.ShowMissingFields.Response) {
        let viewModel = AddTask.ShowMissingFields.ViewModel(text: response.text)
        viewController?.displayMissingFields(viewModel: viewModel)
    }

    func presentTaskSaved(response: AddTask.Save.Response) {
        let viewModel = AddTask.Save.ViewModel()
        viewController?.displayTaskSaved(viewModel: viewModel)
    }
}
