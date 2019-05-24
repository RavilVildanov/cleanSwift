//
//  AddTaskViewController.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 22/05/2019.
//  Copyright (c) 2019 Vildanov. All rights reserved.
//

import UIKit

protocol AddTaskDisplayLogic: class {
    func displayTask(viewModel: AddTask.ShowTask.ViewModel)
    func displayMissingFields(viewModel: AddTask.ShowMissingFields.ViewModel)
    func displayTaskSaved(viewModel: AddTask.Save.ViewModel)
}

class AddTaskViewController: UIViewController, AddTaskDisplayLogic {
    var interactor: AddTaskBusinessLogic?
    var router: (NSObjectProtocol & AddTaskRoutingLogic & AddTaskDataPassing)?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var explanationTextField: UITextField!

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = AddTaskInteractor()
        let presenter = AddTaskPresenter()
        let router = AddTaskRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: Routing

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    // MARK: View lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fethcTaskData()
    }

    // MARK: - Interactor Requests

    func fethcTaskData() {
        let request = AddTask.ShowTask.Request()
        self.interactor?.showTask(request: request)
    }

    // MARK: - AddTaskDisplayLogic

    func displayTask(viewModel: AddTask.ShowTask.ViewModel) {
        self.titleTextField.text = viewModel.title
        self.explanationTextField.text = viewModel.explanation
    }

    func displayMissingFields(viewModel: AddTask.ShowMissingFields.ViewModel) {
        let ac = UIAlertController(title: "Ошибка", message: viewModel.text, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        ac.addAction(ok)
        present(ac, animated: true)
    }

    func displayTaskSaved(viewModel: AddTask.Save.ViewModel) {
        router?.routeToTasks()
    }

    // MARK: - Actions

    @IBAction private func onSaveTapped(sender: UIBarButtonItem) {
        let title = titleTextField.text
        let explanation = explanationTextField.text
        let request = AddTask.Save.Request(title: title, explanation: explanation)
        self.interactor?.saveTask(request: request)
    }
}
