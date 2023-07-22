//
//  ConfigurationModel.swift
//  Movies
//
//  Created by Islam Elgaafary on 22/07/2023.
//

import Foundation


class ConfigurationModel: Codable {
    let secureBaseUrl: String?
    let posterSizes: [String]?
    
    private enum CodingKeys : String, CodingKey {
        case secureBaseUrl = "secure_base_url"
        case posterSizes = "poster_sizes"
    }
    
}
