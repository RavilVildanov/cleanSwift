//
//  AddTaskModels.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 22/05/2019.
//  Copyright (c) 2019 Vildanov. All rights reserved.
//

import UIKit

enum AddTask {

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

    enum Save {

        struct Request {
            let title: String?
            let explanation: String?
        }

        struct Response {
        }

        struct ViewModel {
        }
    }

    enum ShowMissingFields {
        
        struct Response {
            let text: String
        }

        struct ViewModel {
            let text: String
        }
    }
}
