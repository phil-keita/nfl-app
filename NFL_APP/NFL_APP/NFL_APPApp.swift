//
//  NFL_APPApp.swift
//  NFL_APP
//
//  Created by Philippe Keita on 19/12/2022.
//

import SwiftUI

@main
struct NFL_APPApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(GamesViewModel())
        }
    }
}
