//
//  Movie.swift
//  Kino Project
//
//  Created by mac on 27.06.2022.
//

import Foundation

struct MovieResponce: Codable{
    let result: [Movie]
    
}

struct Movie: Codable {
    let id: Int
    let media: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overiew: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}
