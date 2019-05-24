//
//  AddTaskRouter.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 22/05/2019.
//  Copyright (c) 2019 Vildanov. All rights reserved.
//

import UIKit

@objc protocol AddTaskRoutingLogic {
    func routeToTasks()
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol AddTaskDataPassing {
    var dataStore: AddTaskDataStore? { get }
}

class AddTaskRouter: NSObject, AddTaskRoutingLogic, AddTaskDataPassing {
    weak var viewController: AddTaskViewController?
    var dataStore: AddTaskDataStore?

    // MARK: Routing

    func routeToTasks() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }

    //func routeToSomewhere(segue: UIStoryboardSegue?) {
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}

    // MARK: Navigation

    //func navigateToSomewhere(source: AddTaskViewController, destination: SomewhereViewController) {
    //  source.show(destination, sender: nil)
    //}

    // MARK: Passing data

    //func passDataToSomewhere(source: AddTaskDataStore, destination: inout SomewhereDataStore) {
    //  destination.name = source.name
    //}
}
