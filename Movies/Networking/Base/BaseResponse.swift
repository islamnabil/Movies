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
    var status: String?
    var statusCode: String?
    var message: String?
    var data: PagintedBaseArrayResponse<T>?
    
    enum CodingKeys: String, CodingKey {
        case status, message, data
        case statusCode = "status_code"
    }
}

public class PagintedBaseArrayResponse<T: Decodable>: Decodable {
    var docs: [T]?
    var totalDocs: Int?
    var limit: Int?
    var totalPages: Int?
    var page: Int?
    var pagingCounter: Int?
    var hasPrevPage: Bool?
    var hasNextPage: Bool?
    var nextPage: Int?
}

public class Pagination: Decodable {
    var currentPage: Int?
    var perItems: Int?
    var totalPages: Int?
    var totalCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case perItems = "page_items"
        case totalPages = "total_pages"
        case totalCount = "total_count"
    }
}
