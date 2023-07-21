//
//  BaseResponse.swift
//  Movies
//
//  Created by Islam Elgaafary on 21/07/2023.
//

import Foundation
@dynamicMemberLookup
public class BaseResponse<T: Decodable>: Decodable {
    var status: String?
    var statusCode: Int?
    var msg: String?
    var data: T?
    subscript<M>(dynamicMember keyPath: KeyPath<T, M>) -> M? {
        return data?[keyPath: keyPath]
    }
}

public class BaseArrayResponse<T: Decodable>: Decodable {
    var status: String?
    var statusCode: Int?
    var message: String?
    public var data: [T]?
}

public class PaginatedBaseArrayResponse<T: Decodable>: Decodable {
    var page: Int?
    var results: [T]?
    var totalResults: Int?
    var totalPages: Int?
    
    private enum CodingKeys : String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
