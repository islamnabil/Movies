//
//  MovieItemView.swift
//  Movies
//
//  Created by Islam Elgaafary on 21/07/2023.
//

import SwiftUI

struct MovieItemView: View {
    // MARK: - Properties
    var movie: MovieVMProtocol
    
    // MARK: - Body
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: movie.posterPath(size: .w92))) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 100)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(nil)
                Text(movie.releaseDate)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        MovieItemView(movie: MovieVM(movie: MovieModel(title: "Title", releaseDate: "20-2-2022", posterPath: "photo.on.rectangle.angled")))
    }
}
