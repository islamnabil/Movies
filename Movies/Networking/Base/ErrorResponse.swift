//
//  ErrorResponse.swift
//  Movies
//
//  Created by Islam Elgaafary on 21/07/2023.
//

import Foundation

public class ErrorResponse: Decodable, Error {
    public var msg: String?
    var status: String?
    var errors: [ErrorDataModel]?
}

class ErrorDataModel: Codable {
    var field: String?
}
