//
//  DetailedTaskPresenter.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 21/05/2019.
//  Copyright (c) 2019 Vildanov. All rights reserved.
//

import UIKit

protocol DetailedTaskPresentationLogic {
    func presentTask(response: DetailedTask.ShowTask.Response)
}

class DetailedTaskPresenter: DetailedTaskPresentationLogic {
    weak var viewController: DetailedTaskDisplayLogic?
    
    // MARK: Do something
    
    func presentTask(response: DetailedTask.ShowTask.Response) {
        let title = response.task.title
        let explanation = response.task.explanation
        let viewModel = DetailedTask.ShowTask.ViewModel(title: title, explanation: explanation)
        viewController?.displayTask(viewModel: viewModel)
    }
}
