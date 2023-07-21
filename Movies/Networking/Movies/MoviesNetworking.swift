//
//  MoviesNetworking.swift
//  Movies
//
//  Created by Islam Elgaafary on 21/07/2023.
//

import Foundation
import Alamofire

public enum MoviesNetworking {
    case list
}

private enum MoviesNetworkingEndpoints: String {
    case list = "discover/movie"
    
    var description: String {
        return self.rawValue
    }
}

extension MoviesNetworking: TargetType {
    public var baseURL: String {
        Server.baseURL
    }

    public var path: String {
        switch self {
        case .list:
            return MoviesNetworkingEndpoints.list.description

        }
    }

    public var method: HTTPMethod {
        switch self {
        case .list:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case .list:
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
