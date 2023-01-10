//
//  WebView.swift
//  NFL_APP
//
//  Created by Philippe Keita on 04/01/2023.
//

import SwiftUI
import WebKit

struct WebDisplay : UIViewRepresentable{
    
    let request : URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
}

struct WebView: View {
    
    @ObservedObject var team: Team
    
    var body: some View {
        if let  url = URL(string: team.website){
            WebDisplay(request: URLRequest(url: url))
                .edgesIgnoringSafeArea(.top)
        }else{
            Text("Website not available")
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(team: TeamsViewModel().teams[0])
    }
}
