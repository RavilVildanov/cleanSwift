//
//  DetailedTaskRouter.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 21/05/2019.
//  Copyright (c) 2019 Vildanov. All rights reserved.
//

import UIKit

@objc protocol DetailedTaskRoutingLogic {
    func routeToAddTask(segue: UIStoryboardSegue?)
}

protocol DetailedTaskDataPassing {
    var dataStore: DetailedTaskDataStore? { get }
}

class DetailedTaskRouter: NSObject, DetailedTaskRoutingLogic, DetailedTaskDataPassing {
    weak var viewController: DetailedTaskViewController?
    var dataStore: DetailedTaskDataStore?

    // MARK: Routing

    func routeToAddTask(segue: UIStoryboardSegue?) {
      if let segue = segue {
        let destinationVC = segue.destination as! AddTaskViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToAddTask(source: dataStore!, destination: &destinationDS)
      } else {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "AddTaskViewController") as! AddTaskViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToAddTask(source: dataStore!, destination: &destinationDS)
        navigateToAddTask(source: viewController!, destination: destinationVC)
      }
    }

    // MARK: Navigation

    func navigateToAddTask(source: DetailedTaskViewController, destination: AddTaskViewController) {
      source.show(destination, sender: nil)
    }

    // MARK: Passing data

    func passDataToAddTask(source: DetailedTaskDataStore, destination: inout AddTaskDataStore) {
      destination.task = dataStore?.task
    }
}
