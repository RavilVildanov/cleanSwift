//
//  AddTaskWorker.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 22/05/2019.
//  Copyright (c) 2019 Vildanov. All rights reserved.
//

import UIKit

class AddTaskWorker {
    func addOrUpdate(task: Task) {
        TasksManager.shared.addOrUpdate(task: task)
    }
}
