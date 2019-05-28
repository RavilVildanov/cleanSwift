//
//  TasksModels.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 21/05/2019.
//  Copyright (c) 2019 Vildanov. All rights reserved.
//

import UIKit

enum Tasks {
    
    // MARK: Use cases

    enum ShowTasks {
        struct Request {
        }

        struct Response {
            var tasks: [Task]
        }

        struct ViewModel {
            struct DisplayedTask {
                let title: String
                let explanation: String
            }
            
            var displayedTasks: [DisplayedTask]
        }
    }

    enum DeleteTask {

        struct Request {
            let index: Int
        }

        struct Response {

        }

        struct ViewModel {

        }
    }
}
