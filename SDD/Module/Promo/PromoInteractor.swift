//
//  PromoInteractor.swift
//  SDD
//
//  Created by Rahmat Susanto on 02/10/23.
//

import Foundation

protocol PromoInteractorProtocol {
    
    var presenter: PromoPresenterProtocol? { get set }
    func fetchDataPromos()
}

class PromoInteractor: PromoInteractorProtocol {
    
    var presenter: PromoPresenterProtocol?
    var response: PromoResponse?
    
    func fetchDataPromos() {
        print("DEBUG: Fetch Promo Interactor")
        if let url = URL(string: "\(Constants.baseURL)") {
            var request = URLRequest(url: url)
            request.allHTTPHeaderFields = [
                "Content-Type": "application/json",
                "Authorization":"Bearer \(Constants.token)"
            ]
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard error == nil else { return }
                guard let data = data else { return }
                do {
                    let result = try JSONDecoder().decode(PromoResponse.self, from: data)
                    self.presenter?.interactorGetPromoListData(result: .success(result))
                } catch {
                    self.presenter?.interactorGetPromoListData(result: .failure(error))
                }
            }.resume()
        }
    }
}
