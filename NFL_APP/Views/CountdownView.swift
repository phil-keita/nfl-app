//
//  CountdownView.swift
//  NFL_APP
//
//  Created by Philippe Keita on 19/12/2022.
//

import SwiftUI

struct CountdownView: View {
    
    @ObservedObject var game: Game
    
    var body: some View {
        VStack{
            HStack{
                Text("\(game.home_team.name)")
                Text("VS")
                    .foregroundColor(.red)
                Text("\(game.away_team.name)")
            }
            Text("Stadium: \(game.location.name)") 
            Text(game.date, style:  .timer).font(.largeTitle)
            
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(game: GamesViewModel().games[0])
    }
}
