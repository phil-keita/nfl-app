//
//  ContentView.swift
//  NFL_APP
//
//  Created by Philippe Keita on 19/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var VM: GamesViewModel
    
    var body: some View {
        TabView{
            ScheduleView(VM: VM)
                .tabItem{
                    Label("Schedule", systemImage: "calendar")
                    
                }
            TeamsView()
                .tabItem{
                    Label("Teams", systemImage: "person")
                }
            CountdownView(game: VM.games[0])
                .tabItem{
                    Label("Coutndown", systemImage: "hourglass")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GamesViewModel())
    }
}
