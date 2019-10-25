//
//  MovieDetailsView.swift
//  SwiftUIDemo1
//
//  Created by Ratnadeep Govande on 8/23/19.
//  Copyright © 2019 Ratnadeep Govande. All rights reserved.
//

import SwiftUI

struct MovieDetailsView: View {
    
    var movieDetails: Movie?
    var body: some View {
        
        VStack {
            Text(String(movieDetails?.title ?? "Movie Details..."))

             Badge()
        }
       
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView()
    }
}
