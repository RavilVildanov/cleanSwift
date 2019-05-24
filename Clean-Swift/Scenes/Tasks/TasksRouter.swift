//
//  TasksRouter.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 21/05/2019.
//  Copyright (c) 2019 Vildanov. All rights reserved.
//

import UIKit

@objc protocol TasksRoutingLogic {
    func routeToDetailedTask(segue: UIStoryboardSegue?)
}

protocol TasksDataPassing {
    var dataStore: TasksDataStore? { get }
}

class TasksRouter: NSObject, TasksRoutingLogic, TasksDataPassing {
    weak var viewController: TasksViewController?
    var dataStore: TasksDataStore?

    // MARK: Routing

    func routeToDetailedTask(segue: UIStoryboardSegue?) {
      if let segue = segue {
        let destinationVC = segue.destination as! DetailedTaskViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToDetailedTask(source: dataStore!, destination: &destinationDS)
      } else {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "DetailedTaskViewController") as! DetailedTaskViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToDetailedTask(source: dataStore!, destination: &destinationDS)
        navigateToDetailedTask(source: viewController!, destination: destinationVC)
      }
    }

    // MARK: Navigation

    func navigateToDetailedTask(source: TasksViewController, destination: DetailedTaskViewController) {
      source.show(destination, sender: nil)
    }

    // MARK: Passing data

    func passDataToDetailedTask(source: TasksDataStore, destination: inout DetailedTaskDataStore) {
        guard let index = viewController?.tableView.indexPathForSelectedRow?.row else { return }
        destination.task = source.tasks[index]
    }
}
