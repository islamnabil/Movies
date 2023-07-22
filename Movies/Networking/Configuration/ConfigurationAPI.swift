//
//  ConfigurationAPI.swift
//  Movies
//
//  Created by Islam Elgaafary on 22/07/2023.
//

import Foundation
import Alamofire
import Combine

protocol ConfigurationAPIProtocol {
    func configuration() -> AnyPublisher<BaseConfigurationResponse<ConfigurationModel>, ErrorResponse>
}

public class ConfigurationAPI:  BaseAPI<ConfigurationNetworking>, ConfigurationAPIProtocol {
    func configuration() -> AnyPublisher<BaseConfigurationResponse<ConfigurationModel>, ErrorResponse> {
        fetchData(target: .configuration)
    }
}
