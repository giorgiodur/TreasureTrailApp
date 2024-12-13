//
//  MyMap.swift
//  Treasure Trail
//
//  Created by Giorgio Durante on 10/12/24.
//

import MapKit
import SwiftUI

extension CLLocationCoordinate2D {
    static let pignasecca = CLLocationCoordinate2D(latitude: 40.847450, longitude: 14.246770)
    static let piazzadelgesunuovo = CLLocationCoordinate2D(latitude: 40.847933, longitude: 14.252016)
    static let basilicadisantachiara = CLLocationCoordinate2D(latitude: 40.847320, longitude: 14.252590)
    static let viasangregorioarmeno = CLLocationCoordinate2D(latitude: 40.852230, longitude: 14.257170)
    static let pizzeriadimatteo = CLLocationCoordinate2D(latitude: 40.852850, longitude: 14.257620)
}

struct MyMap: View {
    var body: some View {
        Map {
            // Marker personalizzati con colore blu
            Marker("Pignasecca", systemImage: "1.circle.fill", coordinate: .pignasecca)
                .tint(.blue)
            Marker("Piazza del Gesù Nuovo", systemImage: "2.circle.fill", coordinate: .piazzadelgesunuovo)
                .tint(.blue)
            Marker("Basilica di Santa Chiara", systemImage: "3.circle.fill", coordinate: .basilicadisantachiara)
                .tint(.blue)
            Marker("Via San Gregorio Armeno", systemImage: "4.circle.fill", coordinate: .viasangregorioarmeno)
                .tint(.blue)
            Marker("Pizzeria Di Matteo", systemImage: "5.circle.fill", coordinate: .pizzeriadimatteo)
                .tint(.blue)
        }
        .mapStyle(.imagery(elevation: .realistic))
    }
}

#Preview {
    MyMap()
}
