//
//  MoviesApp.swift
//  Movies
//
//  Created by Islam Elgaafary on 21/07/2023.
//

import SwiftUI

@main
struct MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            MoviesListView<MoviesListViewModel>(viewModel: MoviesListViewModel(configurationProvider: ConfigurationAPI(), moviesProvider: MoviesAPI()))
        }
    }
}
