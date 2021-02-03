//
//  ContactView.swift
//  themaquereau
//
//  Created by david haioum on 03/02/2021.
//
import MapKit
import SwiftUI

struct Location : Identifiable {
    let id = UUID()
    let title: String
    let coordinate: CLLocationCoordinate2D
}

extension Location {
    static func getLocation() -> [Location] {
        return [
            Location(title: "ISEN TOULON", coordinate: CLLocationCoordinate2D(latitude: 43.1207309, longitude: 5.9391841))
        ]
    }
}

struct ContactView: View {
    @State private var locations: [Location] = Location.getLocation()
    @State private var location = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.1207309, longitude: 5.9391841), span: MKCoordinateSpan(latitudeDelta: 0.010, longitudeDelta: 0.010))
    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $location, annotationItems: locations) { (location) -> MapPin in
                    MapPin(coordinate: location.coordinate)
                }
                .ignoresSafeArea()
                Button(action: {
                    guard let number = URL(string: "tel://" + "06 36 46 27 34") else { return }
                    UIApplication.shared.open(number)
                }, label: {
                    Text("06 48 57 36 25")
                })
                .frame(width: UIScreen.main.bounds.width - 50, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.white)
                .cornerRadius(18)
                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                .padding(.top, 500)
            }
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
