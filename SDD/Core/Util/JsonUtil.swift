//
//  JsonUtil.swift
//  SDD
//
//  Created by Rahmat Susanto on 02/10/23.
//

import Foundation

func parse(jsonData: Data) -> DataChart? {
    do {
        let decodedData = try JSONDecoder().decode(DataChart.self, from: jsonData)
        return decodedData
    } catch {
        print("error: \(error.localizedDescription)")
    }
    return nil
}
