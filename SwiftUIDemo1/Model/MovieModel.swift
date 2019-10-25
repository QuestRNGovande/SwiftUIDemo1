//
//  MovieModel.swift
//  SwiftUIDemo1
//
//  Created by Ratnadeep Govande on 8/22/19.
//  Copyright © 2019 Ratnadeep Govande. All rights reserved.
//

import Foundation

public struct MovieResponse: Codable{
    public var page: Int?
    public var results: [Movie]?
    
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
    }
    
    public init(from decoder:Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        page = try value.decode(Int.self, forKey: .page)
        results = try value.decode([Movie].self, forKey: .results)
    }
    
}

public struct Movie: Codable, Identifiable {
    public var id: String
    var title: String?
    var overview: String?
    var posterPath: String?
    var imageData:Data?
    var backdropImageData:Data?
    var backdroppath: String?
    var releaseDate: String?
    
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case posterPath = "poster_path"
        case backdroppath = "backdrop_path"
        case releaseDate = "release_date"
    }
    
    public init(from decoder:Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        title = try value.decode(String.self, forKey: .title)
        overview = try value.decode(String.self, forKey: .overview)
        posterPath = try value.decode(String.self, forKey: .posterPath)
        id = try value.decode(String.self, forKey: .title)
        backdroppath = try value.decode(String.self, forKey: .backdroppath)
        backdropImageData = try? Data.init(contentsOf: URL(string: "https://image.tmdb.org/t/p/w500/\(backdroppath!)")!, options: .dataReadingMapped)
        imageData = try? Data.init(contentsOf: URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath!)")!, options: .dataReadingMapped)
        //            imageData = try Data.init(contentsOf: URL(string: "https://image.tmdb.org/t/p/original/\(posterPath!)")!, options: .dataReadingMapped)
        
        releaseDate = try value.decode(String.self, forKey: .releaseDate)
        
    }
    
    
}


