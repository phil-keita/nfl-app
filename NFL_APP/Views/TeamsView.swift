//
//  TeamsView.swift
//  NFL_APP
//
//  Created by Philippe Keita on 19/12/2022.
//

import SwiftUI

struct TeamsView: View {
    
    @EnvironmentObject var TM: TeamsViewModel
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack{
                    ForEach(TM.teams){team in
                        NavigationLink{
                            
                        } label: {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.white)
                                    .cornerRadius(40)
                                    .frame(height: 100)
                                HStack{
                                    Image(team.name)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 75)
                                    Text(team.name)
                                        .foregroundColor(.black)
                                        .padding()
                                        .font(.title)
                                }.shadow(radius: 1)
                            }.padding()
                                .shadow(radius: 10)
                        }
                    }
                }
            }
        }
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
            .environmentObject(TeamsViewModel())
    }
}
