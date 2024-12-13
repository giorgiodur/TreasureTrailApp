//
//  TourCard.swift
//  Treasure Trail
//
//  Created by Giorgio Durante on 10/12/24.
//

import SwiftUI

struct TourCard: View {
    let title: String
    let distance: String
    let duration: String
    let imageName: String

    var body: some View {
        HStack {
            // Immagine del tour
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.leading, 10)
            
            // Dettagli del tour
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                HStack {
                    // Icona camminata e distanza
                    Image(systemName: "figure.walk")
                        .foregroundColor(.white)
                    Text(distance)
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                    Spacer().frame(width: 10) // Spaziatura tra i dettagli
                    
                    // Icona orologio e durata
                    Image(systemName: "clock")
                        .foregroundColor(.white)
                    Text(duration)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            .padding(.leading, 10)
            
            Spacer()
            
            // Icona freccia
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
                .padding(.trailing, 10)
        }
        .frame(height: 100)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.orange)
                .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.white.opacity(0.3), lineWidth: 1) // Bordo sottile
        )
        .padding(.horizontal)
    }
}

struct TourCard_Previews: PreviewProvider {
    static var previews: some View {
        TourCard(
            title: "Street Art Tour",
            distance: "1,8 km",
            duration: "1,5 h",
            imageName: "street_art_image" // Usa il nome corretto dell'immagine in Assets
        )
        .background(Color("BackgroundColor")) // Colore di sfondo personalizzato
    }
}
