//
//  HomeRouter.swift
//  SDD
//
//  Created by Rahmat Susanto on 01/10/23.
//

import Foundation

protocol HomeRouterProtocol {
    
    static func createChart() -> HomeViewController
    
}

class HomeRouter: HomeRouterProtocol {
    
    static func createChart() -> HomeViewController {
        let view = HomeViewController()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
