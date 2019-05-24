//
//  DetailedTaskViewController.swift
//  Clean-Swift
//
//  Created by Равиль Вильданов on 21/05/2019.
//  Copyright (c) 2019 Vildanov. All rights reserved.
//

import UIKit

protocol DetailedTaskDisplayLogic: class {
    func displayTask(viewModel: DetailedTask.ShowTask.ViewModel)
}

class DetailedTaskViewController: UIViewController, DetailedTaskDisplayLogic {
    var interactor: DetailedTaskBusinessLogic?
    var router: (NSObjectProtocol & DetailedTaskRoutingLogic & DetailedTaskDataPassing)?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!

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
        let interactor = DetailedTaskInteractor()
        let presenter = DetailedTaskPresenter()
        let router = DetailedTaskRouter()
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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchData()
    }

    // MARK: Do something
    
    func fetchData() {
        let request = DetailedTask.ShowTask.Request()
        interactor?.fetchData(request: request)
    }

    func displayTask(viewModel: DetailedTask.ShowTask.ViewModel) {
        self.titleLabel.text = viewModel.title
        self.explanationLabel.text = viewModel.explanation
    }
}
