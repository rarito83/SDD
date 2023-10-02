//
//  HomePresenter.swift
//  SDD
//
//  Created by Rahmat Susanto on 01/10/23.
//

import Foundation

protocol HomePresenterProtocol {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set}
    var router: HomeRouterProtocol? { get set }
    
    func fetchCharts(name: String)

}

class HomePresenter: HomePresenterProtocol {
    
    var view: HomeViewProtocol?
    
    var interactor: HomeInteractorProtocol?
    
    var router: HomeRouterProtocol?

    var dataResponsePieCharts: DataPieChart?
    var dataResponseLineCharts: DataLineChart?

    func fetchCharts(name: String) {
        interactor?.readLocalJSONFile(name: name)
        print("DEBUG: presenter fetch json")
    }
    
}
