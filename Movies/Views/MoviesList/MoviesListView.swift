//
//  MoviesListView.swift
//  Movies
//
//  Created by Islam Elgaafary on 21/07/2023.
//

import SwiftUI

struct MoviesListView<ViewModel>: View where ViewModel: MoviesListViewModelProtocol{
    
    @StateObject var viewModel: ViewModel
    
    
    var body: some View {
        List(viewModel.movies, id: \.id) { movie in
            MovieItemView(movie: movie)
                .onAppear {
                    if movie.id == viewModel.movies.last?.id {
                        viewModel.fetchTrendingMovies()
                    }
                }
        }
        .onAppear {
            viewModel.fetchTrendingMovies()
        }
    }
}
    
    struct MoviesListView_Previews: PreviewProvider {
        static var previews: some View {
            let viewModel = MoviesListViewModel(provider: MoviesAPI())
            MoviesListView<MoviesListViewModel>(viewModel: viewModel)
        }
    }
