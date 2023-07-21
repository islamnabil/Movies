//
//  BaseReachability.swift
//  Movies
//
//  Created by Islam Elgaafary on 21/07/2023.
//

import Foundation
import Alamofire

public class BaseReachability {
    
    public static let shared = BaseReachability()
    
    let reachabilityManager = NetworkReachabilityManager(host: Server.baseURL)
    
    public func startNetworkMonitoring() {
        reachabilityManager?.startListening { status in
            switch status {
            case .notReachable:
                self.showOfflineAlert()
            case .reachable(.cellular):
                self.dismissOfflineAlert()
            case .reachable(.ethernetOrWiFi):
                self.dismissOfflineAlert()
            case .unknown:
                print("Unknown network state")
            }
        }
    }
    
    func stopListening() {
        reachabilityManager?.stopListening()
    }
    
    private func showOfflineAlert() {
        // TODO: -
    }
    
    private func dismissOfflineAlert() {
        // TODO: -
    }
    
}
