//
//  MoviesListView.swift
//  Movies
//
//  Created by Islam Elgaafary on 21/07/2023.
//

import SwiftUI

struct MoviesListView<ViewModel>: View where ViewModel: MoviesListViewModelProtocol{
    // MARK: - Properties
    @StateObject var viewModel: ViewModel
    
    // MARK: - Bosy
    var body: some View {
        NavigationView {
            List(viewModel.movies, id: \.id) { movie in
                NavigationLink(destination: MovieDetailsView(movie: movie)){
                    MovieItemView(movie: movie)
                        .onAppear {
                            if movie.id == viewModel.movies.last?.id {
                                viewModel.fetchTrendingMovies()
                            }
                        }
                }
            }
            .onAppear {
                viewModel.fetchTrendingMovies()
            }
        }
    }
}
    
    struct MoviesListView_Previews: PreviewProvider {
        static var previews: some View {
            let viewModel = MoviesListViewModel(provider: MoviesAPI())
            MoviesListView<MoviesListViewModel>(viewModel: viewModel)
        }
    }
