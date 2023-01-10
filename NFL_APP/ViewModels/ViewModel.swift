//
//  TeamsModel.swift
//  NFL_APP
//
//  Created by Philippe Keita on 19/12/2022.
//

import Foundation

class GamesViewModel: ObservableObject {
    @Published var games: [Game] = [Game]()
    
    init(){
        readJSON()
    }
    
    func readJSON(){
        let pathstring = Bundle.main.path(forResource: "nfl2023-games", ofType: "json")
        if let path = pathstring {
            let url = URL(fileURLWithPath: path)
            do {
                let data = try Data(contentsOf: url)
                //making json decoder
                let jsonDecoder = JSONDecoder()
                //decoding
                let jsonData = try jsonDecoder.decode([Game].self, from: data)
                //saving data in games published var
                games = jsonData
                for i in 0..<games.count{
                    games[i].interval = games[i].date.timeIntervalSinceNow
                }
                games = games.sorted{
                    $0.interval! > $1.interval!
                }
            }catch{
                print("Error readingJSON")
            }
        }
        else{
            print("Couldn't find the json file")
        }
    }
}

class TeamsViewModel: ObservableObject {
    @Published var teams: [Team] = [Team]()
    
    init(){
        let pathstring = Bundle.main.path(forResource: "nfl2023-teams", ofType: "json")
        if let path = pathstring {
            let url = URL(fileURLWithPath: path)
            do {
                let data = try Data(contentsOf: url)
                //making json decoder
                let jsonDecoder = JSONDecoder()
                //decoding
                let jsonData = try jsonDecoder.decode([Team].self, from: data)
                //saving data in games published var
                teams = jsonData
            }catch{
                print("Error readingJSON")
            }
        }
        else{
            print("Couldn't find the json file")
        }
    }
}
