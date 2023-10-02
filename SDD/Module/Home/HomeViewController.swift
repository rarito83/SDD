//
//  HomeViewController.swift
//  SDD
//
//  Created by Rahmat Susanto on 01/10/23.
//

import UIKit
import Charts

protocol HomeViewProtocol {
    var presenter: HomePresenterProtocol? { get set }

}

class HomeViewController: UIViewController, HomeViewProtocol {
    
    var presenter: HomePresenterProtocol?
    var dataResponseCharts: DataChart?
    
    var dataPieCharts = ["55", "31", "7.7", "6.3"]
    var labelPieCharts = ["Tarik Tunai", "QRIS Payment", "Topup Gopay", "Lainnya"]
    var dataLineCharts = [3, 7, 8, 10, 5, 10, 1, 3, 5, 10, 7, 7]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let jsonData = presenter?.fetchCharts(name: "DataCharts")
        print("DEBUG: Fetch data \(String(describing: jsonData))")
        
//        if let data = jsonData {
//            print("DEBUG: Result Fetching \(data)")
//            if let sampleRecordObj = presenter.parse(jsonData: data) {
//                dataResponseCharts = sampleRecordObj
//            }
//        }
        
        setupPieChart()
        setupLineChart()
    }
    
    private func setupPieChart() {
        let pieChart = PieChartView(
            frame: CGRect(x: 50,
                    y: 50,
                    width: 300,
                    height: 300
             )
        )

        var entries: [ChartDataEntry] = []
        
        for i in 0..<dataPieCharts.count {
            let dataEntry = PieChartDataEntry(value: dataPieCharts.map{ Double($0) ?? 0.0 }[i], label: labelPieCharts[i], data: dataPieCharts[i] as AnyObject)
            entries.append(dataEntry)
        }

        let set = PieChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.material()
        
        let chartData = PieChartData(dataSet: set)
        pieChart.data = chartData
        view.addSubview(pieChart)
    }
    
    private func setupLineChart() {
        let lineChart = LineChartView(
            frame: CGRect(x: 50,
                    y: 380,
                    width: 300,
                    height: 300
             )
        )

        var entries: [ChartDataEntry] = []
        
        for i in 0..<dataLineCharts.count {
            let dataEntry = ChartDataEntry(x: Double(dataLineCharts[i]), y: Double(dataLineCharts[i]))
            entries.append(dataEntry)
        }
        
        let set = LineChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.material()
        
        let chartData = LineChartData(dataSet: set)
        lineChart.data = chartData
        view.addSubview(lineChart)
    }
}
