//
//  TV.swift
//  Kino Project
//
//  Created by mac on 27.06.2022.
//

import Foundation

struct ThreadingResponce: Codable {
    let results: [TV]
}

struct TV: Codable {
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
