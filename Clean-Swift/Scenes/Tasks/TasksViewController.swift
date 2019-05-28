//
//  TasksViewController.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 21/05/2019.
//  Copyright (c) 2019 Vildanov. All rights reserved.
//

import UIKit

protocol TasksDisplayLogic: class {
    func displayTasks(viewModel: Tasks.ShowTasks.ViewModel)
}

class TasksViewController: UIViewController, TasksDisplayLogic {
    var interactor: TasksBusinessLogic?
    var router: (NSObjectProtocol & TasksRoutingLogic & TasksDataPassing)?

    var displayedTasks = [Tasks.ShowTasks.ViewModel.DisplayedTask]()

    @IBOutlet weak var tableView: UITableView!

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
        let interactor = TasksInteractor()
        let presenter = TasksPresenter()
        let router = TasksRouter()
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
        fetchTasks()
    }

    // MARK: Private Methods
    
    private func fetchTasks() {
        let request = Tasks.ShowTasks.Request()
        interactor?.fetchTasks(request: request)
    }

    // MARK: - TasksDisplayLogic

    func displayTasks(viewModel: Tasks.ShowTasks.ViewModel) {
        self.displayedTasks = viewModel.displayedTasks
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension TasksViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let request = Tasks.DeleteTask.Request(index: indexPath.row)
            self.interactor?.deleteTask(request: request)
        }
    }
}

// MARK: - UITableViewDataSource

extension TasksViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayedTasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TaskCell")!
        let task = self.displayedTasks[indexPath.row]
        cell.textLabel?.text = task.title
        cell.detailTextLabel?.text = task.explanation
        return cell
    }
}
