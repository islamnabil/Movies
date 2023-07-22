//
//  ConfigurationVM.swift
//  Movies
//
//  Created by Islam Elgaafary on 22/07/2023.
//

import Foundation

public protocol ConfigurationVMProtocol {
    var secureBaseUrl: String { get }
    var posterSizes: [String] { get }
}

class ConfigurationVM: ConfigurationVMProtocol {
    //MARK: - Properties
    private var configuration: ConfigurationModel?
    
    //MARK: - Init
    init(configuration: ConfigurationModel?) {
        self.configuration = configuration
    }
    
    //MARK: - Computed Properties
    var secureBaseUrl: String {
        configuration?.secureBaseUrl ?? ""
    }
    var posterSizes: [String] {
        configuration?.posterSizes ?? []
    }
}
