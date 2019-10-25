//
//  MoviesViewModel.swift
//  SwiftUIDemo1
//
//  Created by Ratnadeep Govande on 8/23/19.
//  Copyright © 2019 Ratnadeep Govande. All rights reserved.
//

import Foundation
import Combine

public class MoviesViewModel: ObservableObject {
   @Published var moviesData:[Movie]? = [Movie]()
   @Published var username = "Movies"
    @Published var dataLoad: Bool = true
    init() {
        loadMovieData()
    }
    
    func loadMovieData() {
            guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=f647cc124278a32913cf76d1c67422b4") else {
                return
            }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                do {
                    guard let validData = data else{return}
                    
                    let moviedata = try JSONDecoder().decode(MovieResponse.self, from: validData)
                    DispatchQueue.main.async {
                        self.username = "Movies"
                        self.moviesData = moviedata.results
                        self.dataLoad = false
                    }
                }catch {
                    print("Error \(error)")
                }
            }.resume()
        }
}

enum HttpMethod<Body> {
    case get
    case post(Body)
}

class Webservice {
    
 
    func load<A>(resource: Resource<A>, completion:@escaping (A?) -> () ){
        URLSession.shared.dataTask(with: resource.url) { (data, _, _) in
//            let request = URLRequest(resource: resource)
            
                
        }.resume()
    }
}
struct Episode{
    
}
struct Media {
    
}


struct Resource<A> {
    let url: URL
    let method: HttpMethod<Data>
    let parse: (Data) -> A?

}
