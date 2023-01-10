//
//  MapView.swift
//  NFL_APP
//
//  Created by Philippe Keita on 04/01/2023.
//

import SwiftUI
import MapKit

struct MapDisplay: UIViewRepresentable{
    //Region
    var region: MKCoordinateRegion
    //Stadium name
    var stadium_name: String
    
    var point_of_interest: [MKPointAnnotation]{
        var locs =  [MKPointAnnotation]()
        let loc = MKPointAnnotation()
        loc.coordinate  = CLLocationCoordinate2D(latitude: region.center.latitude, longitude: region.center.longitude)
        loc.title = stadium_name
        locs.append(loc)
        return locs
    }
    
    //create
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        return map
    }
    //update
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(point_of_interest)
        uiView.setRegion(region, animated: true)
    }
    // tear down
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }
}

struct MapView: View {
    
    @ObservedObject var location: Stadium
    
    var body: some View {
        //Region
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        MapDisplay(region: region, stadium_name: location.name)
            .edgesIgnoringSafeArea(.top)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(location: GamesViewModel().games[1].location)
    }
}
