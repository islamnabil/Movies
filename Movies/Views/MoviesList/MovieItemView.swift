//
//  MovieItemView.swift
//  Movies
//
//  Created by Islam Elgaafary on 21/07/2023.
//

import SwiftUI

struct MovieItemView: View {
    // MARK: - Properties
    var imageName: String
    var name: String
    var date: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 100)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                    .lineLimit(nil)
                Text(date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        MovieItemView(imageName: "photo.on.rectangle.angled", name: "Title", date: "Date")
    }
}
