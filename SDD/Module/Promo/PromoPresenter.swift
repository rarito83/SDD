//
//  PromoPresenter.swift
//  SDD
//
//  Created by Rahmat Susanto on 02/10/23.
//

import Foundation
import UIKit

protocol PromoPresenterProtocol {
    var view: PromoViewProtocol? { get set }
    var interactor: PromoInteractorProtocol? { get set}
    var router: PromoRouterProtocol? { get set }
    
    func fetchPromo()
    func interactorGetPromoListData(result: Result<PromoResponse, Error>)
    func tapPromoDetail(promo: PromoResponse, view: UIViewController)
}

class PromoPresenter: PromoPresenterProtocol {
    
    var view: PromoViewProtocol?
    
    var interactor: PromoInteractorProtocol? {
        didSet {
            interactor?.fetchDataPromos()
            print("DEBUG: Fetch Promo Presenter")
        }
    }
    
    var router: PromoRouterProtocol?
    
    func fetchPromo() {
        interactor?.fetchDataPromos()
        print("DEBUG: Fetch Promo Presenter")
    }
    
    func interactorGetPromoListData(result: Result<PromoResponse, Error>) {
        switch result {
        case.success(let promoResponse):
            view?.updateWithData(data: promoResponse)
        case.failure(let error):
            view?.updateWithError(error: error.localizedDescription)
        }
    }
    
    func tapPromoDetail(promo: PromoResponse, view: UIViewController) {
//        let promoDetailVC = PromoDetailRouter.createPromoDetailModule(promo: promo)
//        promoDetailVC.id = Promo.id ?? 0
//        view.navigationController?.pushViewController(promoDetailVC, animated: true)
    }
}
