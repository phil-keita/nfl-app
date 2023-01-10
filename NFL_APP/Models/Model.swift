//
//  Team.swift
//  NFL_APP
//
//  Created by Philippe Keita on 19/12/2022.
//

import Foundation

class Team: Decodable, Identifiable, ObservableObject {
    var id: Int
    var name: String
    var stadium: Stadium
    var website: String
    var logo: String
}

class Stadium: Decodable, Identifiable, ObservableObject {
    var id: Int
    var name: String
    var latitude: Double
    var longitude: Double
}

class Game: Decodable, Identifiable, ObservableObject {
    var id: Int
    var week: Int
    var date: Date
    var interval: TimeInterval?
    var location: Stadium
    var home_team: Team
    var away_team: Team
    enum CodingKeys: String, CodingKey{
    case id
    case week
    case date
    case interval
    case location
    case home_team = "home-team"
    case away_team = "away-team"
    }
}
