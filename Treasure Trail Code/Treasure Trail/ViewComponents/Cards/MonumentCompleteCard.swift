//
//  MonumentCompleteCard.swift
//  Treasure Trail
//
//  Created by Giorgio Durante on 10/12/24.
//

import SwiftUI

struct MonumentCompleteCard: View {
    let number: Int
    let imageName: String
    let title: String
    let distance: String

    var body: some View {
        HStack {
            // Numero del monumento
            Text("\(number)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 40, height: 40) // Dimensioni aggiornate
                .background(Circle().fill(Color.blue))
                .padding(.leading, 10)
            
            // Immagine del monumento
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.leading, 10)
            
            // Dettagli del monumento
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                HStack {
                    Image(systemName: "figure.walk")
                        .foregroundColor(.white)
                    Text(distance)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.leading, -5)
                }
            }
            .padding(.leading, 10)
            
            Spacer()
            
            // Icona di completamento
            Image(systemName: "checkmark")
                .foregroundColor(.blue)
                .frame(width: 40, height: 40) // Dimensioni aggiornate
                .background(
                    Circle()
                        .fill(Color.white)
                        .overlay(
                            Circle()
                                .stroke(Color.blue, lineWidth: 2) // Bordo blu
                        )
                )
                .padding(.trailing, 10)
        }
        .frame(height: 100)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.blue.opacity(0.2))
                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.blue, lineWidth: 2)
        )
        .padding(.horizontal)
    }
}

struct MonumentCompleteCard_Previews: PreviewProvider {
    static var previews: some View {
        MonumentCompleteCard(
            number: 1,
            imageName: "monument_image",
            title: "Monumento 1",
            distance: "0 m"
        )
        .background(Color("BackgroundColor")) // Colore di sfondo personalizzato
    }
}
