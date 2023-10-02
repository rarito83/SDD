//
//  HomeInteractor.swift
//  SDD
//
//  Created by Rahmat Susanto on 01/10/23.
//

import Foundation

protocol HomeInteractorProtocol {
    
    var presenter: HomePresenterProtocol? { get set }
    
    func readLocalJSONFile(name: String) -> [DataChart]?
}

class HomeInteractor: HomeInteractorProtocol {
    
    var presenter: HomePresenterProtocol?
    
    func readLocalJSONFile(name: String) -> [DataChart]? {
        var dataCharts = [DataChart]()

        guard let fileURL = Bundle.main.url(forResource: "DataCharts", withExtension: "json") else {
          fatalError("could not locate json file")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            
            let charts = try JSONDecoder().decode(JsonChart.self, from: data)

            dataCharts.append(charts.data)
        } catch {
            print(error.localizedDescription)
        }

        return dataCharts
    }

}
