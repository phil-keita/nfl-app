//
//  ScheduleView.swift
//  NFL_APP
//
//  Created by Philippe Keita on 19/12/2022.
//

import SwiftUI

struct ScheduleView: View {
    
    @ObservedObject var VM: GamesViewModel
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack{
                    ForEach(VM.games){game in
                        NavigationLink{
                            MapView(location: game.location)
                        } label: {
                            //SECTION
                            VStack{
                                //HOLDS TEAMS
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .cornerRadius(15)
                                        .frame(height: 230)
                                    VStack{
                                        HStack{
                                            //HOME TEAM
                                            VStack{
                                                Text("\(game.home_team.name)")
                                                    .padding()
                                                    .frame(width: 150)
                                                Image("\(game.home_team.name)")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 100)
                                                
                                            }
                                            VStack{
                                                Text("VS")
                                                    .bold()
                                                    .font(.largeTitle)
                                                
                                            }
                                            //AWAY TEAM
                                            VStack{
                                                Text(game.away_team.name)
                                                    .padding()
                                                    .frame(width: 150)
                                                Image("\(game.away_team.name)")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 100)
                                                
                                            }
                                        }
                                        HStack{
                                            Text(game.date, style: .date)
                                                .font(.footnote)
                                            Text("-")
                                            Text(game.date, style: .time)
                                                .font(.footnote)
                                        }
                                    }
                                }
                            }
                            .padding()
                            .shadow(radius: 10)
                            .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView(VM: GamesViewModel())
        
    }
}
