//
//  MovieDetailsView.swift
//  Movies
//
//  Created by Islam Elgaafary on 22/07/2023.
//

import SwiftUI

struct MovieDetailsView: View {
    // MARK: - Properties
    var movie: MovieVMProtocol
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: movie.posterPath)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                Text(movie.releaseDate)
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            
            ScrollView {
                Text(movie.overview)
                    .font(.body)
                    .lineLimit(nil)
                    .padding(.horizontal)
            }
            .padding(.top, 16)
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: MovieVM(movie: MovieModel(title: "Title", releaseDate: "20-2-2022", overview: "OverviewLines OverviewLines OverviewLines OverviewLines OverviewLines")))
    }
}
