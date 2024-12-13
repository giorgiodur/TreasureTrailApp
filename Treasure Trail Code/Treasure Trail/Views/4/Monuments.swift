//
//  Monuments.swift
//  Treasure Trail
//

import SwiftUI

struct Monuments: View {
    @State private var monumentStatuses: [Bool] = [false, false, false, false, false] // Stato dei monumenti

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Mappa in alto
                MyMap()
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 0))
                    .padding(.top, 10)
                
                // Titolo del tour
                VStack(alignment: .leading, spacing: 10) {
                    Text("Spaccanapoli Tour")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.all)
                }
                
                // Lista dei monumenti
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(0..<monumentStatuses.count, id: \.self) { index in
                            if monumentStatuses[index] {
                                // Card completata
                                MonumentCompleteCard(
                                    number: index + 1,
                                    imageName: "monument\(index + 1)",
                                    title: monumentTitle(for: index),
                                    distance: "0 m"
                                )
                            } else {
                                // Card normale
                                NavigationLink(destination: DetailsMonument(
                                    monumentName: monumentTitle(for: index),
                                    tourName: "Spaccanapoli Tour",
                                    description: monumentDescription(for: index),
                                    mapImageName: "map_placeholder",
                                    onCompletion: {
                                        monumentStatuses[index] = true
                                    }
                                )) {
                                    MonumentCard(
                                        number: index + 1,
                                        imageName: "monument\(index + 1)",
                                        title: monumentTitle(for: index),
                                        distance: "\(300 * (index + 1)) m",
                                        latitude: 40.0 + Double(index) * 0.001, // Coordinate di esempio
                                        longitude: 14.0 + Double(index) * 0.001
                                    )
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .background(Color("BackgroundColor"))
            }
            .background(Color("BackgroundColor").ignoresSafeArea())
        }
    }

    // Titoli dei monumenti
    private func monumentTitle(for index: Int) -> String {
        switch index {
        case 0: return "Pignasecca"
        case 1: return "Piazza del Gesù Nuovo"
        case 2: return "Basilica di Santa Chiara"
        case 3: return "Via San Gregorio Armeno"
        case 4: return "Pizzeria Di Matteo"
        default: return "Monumento \(index + 1)"
        }
    }

    // Descrizioni dei monumenti
    private func monumentDescription(for index: Int) -> String {
        switch index {
        case 0: return "La Pignasecca è uno dei mercati più antichi e vivaci di Napoli. Conosciuta per la sua atmosfera autentica, offre un’esperienza unica tra bancarelle di prodotti freschi, street food e piccoli negozi tradizionali. È un luogo simbolo della quotidianità napoletana."
        case 1: return "Piazza del Gesù Nuovo è uno dei punti più affascinanti del centro storico di Napoli. La piazza ospita l’imponente Chiesa del Gesù Nuovo, famosa per la sua facciata bugnata e per gli interni ricchi di opere d’arte, e il Monastero di Santa Chiara, con il celebre chiostro maiolicato."
        case 2: return "La Basilica di Santa Chiara è una delle chiese più famose di Napoli. Costruita in stile gotico, è celebre per il chiostro maiolicato decorato con maioliche colorate e per la sua storia ricca di cultura e tradizione."
        case 3: return "Questa strada è il cuore della tradizione artigianale napoletana, conosciuta in tutto il mondo per le botteghe che realizzano presepi artigianali. Passeggiando per Via San Gregorio Armeno, si respira l’atmosfera natalizia tutto l’anno."
        case 4: return "Situata nel cuore di Napoli, la Pizzeria Di Matteo è una vera istituzione per gli amanti della pizza napoletana. Conosciuta per la sua tradizione e qualità, offre un’esperienza culinaria autentica e indimenticabile."
        default: return "Descrizione del monumento \(index + 1)."
        }
    }
}

#Preview {
    Monuments()
}
