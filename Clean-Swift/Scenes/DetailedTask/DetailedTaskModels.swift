//
//  DetailedTaskModels.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 21/05/2019.
//  Copyright (c) 2019 Vildanov. All rights reserved.
//

import UIKit

enum DetailedTask {
    
    // MARK: Use cases

    enum ShowTask {
        struct Request {
        }

        struct Response {
            let task: Task
        }

        struct ViewModel {
            let title: String
            let explanation: String
        }
    }
}
