//
//  JsonChart.swift
//  SDD
//
//  Created by Rahmat Susanto on 02/10/23.
//

import Foundation

struct JsonChart: Codable {
    let type: String
    let data: DataChart
}


enum DataChart: Codable {
    case dataLine(DataLineChart)
    case dataPie([DataPieChart])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let x = try? container.decode([DataPieChart].self) {
            self = .dataPie(x)
            return
        }
        if let x = try? container.decode(DataLineChart.self) {
            self = .dataLine(x)
            return
        }
        throw DecodingError.typeMismatch(DataChart.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Data Chart"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .dataLine(let x):
            try container.encode(x)
        case .dataPie(let x):
            try container.encode(x)
        }
    }
}


struct DataPieChart: Codable {
    let label, percentage: String
    let data: [PieChart]
}


struct PieChart: Codable {
    let trxDate: TrxDate
    let nominal: Int

    enum CodingKeys: String, CodingKey {
        case trxDate = "trx_date"
        case nominal
    }
}


enum TrxDate: String, Codable {
    case the19012023 = "19/01/2023"
    case the20012023 = "20/01/2023"
    case the21012023 = "21/01/2023"
}


struct DataLineChart: Codable {
    let month: [Int]
}
