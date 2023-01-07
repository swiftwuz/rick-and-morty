//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Nana Kojo Ewusie on 06/01/2023.
//

import Foundation

struct RMEpisode: Codable {
    let id: String
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
