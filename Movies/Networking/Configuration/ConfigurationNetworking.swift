//
//  ConfigurationNetworking.swift
//  Movies
//
//  Created by Islam Elgaafary on 22/07/2023.
//

import Foundation
import Alamofire

public enum ConfigurationNetworking {
    case configuration
}

private enum ConfigurationNetworkingEndpoints: String {
    case configuration = "configuration"
    
    var description: String {
        return self.rawValue
    }
}

extension ConfigurationNetworking: TargetType {
    public var baseURL: String {
        Server.baseURL
    }

    public var path: String {
        switch self {
        case .configuration:
            return ConfigurationNetworkingEndpoints.configuration.description

        }
    }

    public var method: HTTPMethod {
        switch self {
        case .configuration:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case .configuration:
            let params = [
                "api_key": Server.apiKEY
            ] as [String : Any]
            return  .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }

    public var headers: [String : String]? {
        return  nil
    }

}
