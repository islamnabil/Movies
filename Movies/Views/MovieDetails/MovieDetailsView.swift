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
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: movie.posterPath(size: .w500))) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(movie.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(movie.releaseDate)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(movie.overview)
                    .font(.body)
                    .lineLimit(nil)
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(edges: .top)
        .scrollIndicators(ScrollIndicatorVisibility.hidden)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton {
            presentationMode.wrappedValue.dismiss()
        })
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: MovieVM(movie: MovieModel(title: "Title", releaseDate: "20-2-2022", overview: "OverviewLines OverviewLines OverviewLines OverviewLines OverviewLines")))
    }
}
