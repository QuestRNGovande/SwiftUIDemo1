//
//  CustomView.swift
//  SwiftUIDemo1
//
//  Created by Ratnadeep Govande on 8/23/19.
//  Copyright © 2019 Ratnadeep Govande. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct HorizontalView: View {
    let movie: Movie
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data: movie.imageData!)!)
                .resizable().frame(width:110, height: 180)
                .border(Color.gray.opacity(0.5), width: 0.5)
                .cornerRadius(8)
            Text(movie.title!).font(.custom("TimesNewRomanPS-BoldMT", size: 12.0)).lineLimit(2)
        }.frame(width: 120)
        
    }
}

struct VerticalMovieView:  View {
    let movie: Movie
    var body: some View {
        VStack(alignment:.leading){
            
            Image(uiImage: UIImage(data: movie.backdropImageData!)!)
                .resizable()
                .aspectRatio(3/2, contentMode: .fit)
            HStack{
                Badge().frame(width: 40, height: 40)
                
                VStack(alignment: .leading){
                    Text(movie.title!)
                        .font(.custom("TimesNewRomanPS-BoldMT", size: 18.0))
                         .lineLimit(2)
                                           
                    Text(movie.releaseDate!)
                        .font(.custom("TimesNewRomanPS", size: 16.0))
                        .foregroundColor(Color.gray.opacity(0.8))
                }
                
            }
            .padding(.bottom, 5)
            .padding(.leading, 5)
        }.background(Color.white)
    }
}


struct UpcommingMovieView: View {
    
    let moviesviewModel: MoviesViewModel
    var body: some View {
        VStack(alignment:.leading){
            Text("Upcomming Movies")
                .font(.custom("TimesNewRomanPS-BoldMT", size: 20.0))
                .padding(.leading, 10)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:10) {
                    ForEach(self.moviesviewModel.moviesData!) { movie in
                        HorizontalView(movie: movie)
                    }
                }
                .padding(.leading, 5)
            }
        }
    }
}


struct PlayNowMovieView: View {
    let moviesviewModel: MoviesViewModel
    var body: some View {
        VStack(alignment:.leading){
            Text("Play Now")
                .font(.custom("TimesNewRomanPS-BoldMT", size: 20.0))
                .padding(.leading, 10)
            
            List {
                ForEach(self.moviesviewModel.moviesData!) { movie in
                    NavigationLink(destination: MovieDetailsView( movieDetails: movie)
                    ) {
                        VerticalMovieView(movie: movie)
                            .shadow(color: Color.gray.opacity(0.5), radius: 10.0, x: 2, y: 2)
                            .background(Color.white.opacity(0.2))
                    }
                }
            }
        }
    }
}
