//
//  PromoRouter.swift
//  SDD
//
//  Created by Rahmat Susanto on 02/10/23.
//

import Foundation

protocol PromoRouterProtocol {
    static func fetchDataPromo() -> PromoViewController
}

class PromoRouter: PromoRouterProtocol {
    
    static func fetchDataPromo() -> PromoViewController {
        let view = PromoViewController()
        let presenter = PromoPresenter()
        let interactor = PromoInteractor()
        let router = PromoRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
