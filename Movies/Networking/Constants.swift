//
//  Constants.swift
//  Movies
//
//  Created by Islam Elgaafary on 21/07/2023.
//

import Foundation


struct Server {
    static let productionURL = "https://api.themoviedb.org/3/"
    static let stagingURL = "https://api.themoviedb.org/3/"
    static let apiKEY = "c9856d0cb57c3f14bf75bdc6c063b8f3"
    static var mediaBaseURL = "https://image.tmdb.org/t/p/"
    
    static var baseURL: String {
        return productionURL
    }
}


struct Message {
    static let noDataReturned = "No Data Returned."
    static let HTTPToken = "HTTP Token: Access denied."
    static let genericError = "Something went wrong"
    static let emptyFields = "Please fill in all fields"
    static let emptyName = "Please enter your name"
    static let invalidEmail = "Please enter a valid email"
    static let invalidPassword = "Password must be atleast 8 characters, contain a letter, number, and symbol"
    static let invalidName = "Please enter a valid name"
    static let invalidPhone = "Please enter a valid phone"
    static let passwordMatch = "Passwords must match"
    static let invalidCredentials = "Email or password is incorrect"
    static let takenEmail = "Email already taken"
    static let userCanceledSocialLogin = "User cancelled login"
    static let socialInfoNotComplete = "Please allow access to name and email"
}
