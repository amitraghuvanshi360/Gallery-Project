//
//  CountryModel.swift
//  gallery-project
//
//  Created by Ankush Sharma on 18/04/23.
//

import Foundation


struct Country: Codable {
    let status: String
    let statusCode: Int
    let version, access: String
    let data: [String: countryData]

    enum CodingKeys: String, CodingKey {
        case status
        case statusCode = "status-code"
        case version, access, data
    }
}

// MARK: - Datum
struct countryData: Codable {
    let country: String
    let region: Region
}

enum Region: String, Codable {
    case africa = "Africa"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case centralAmerica = "Central America"
}
