//
//  DetailsTour.swift
//  Treasure Trail
//
//  Created by Giorgio Durante on 09/12/24.
//

import SwiftUI

struct DetailsTour: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Carousel delle immagini
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(1...3, id: \.self) { index in
                                    Image("tour_image_\(index)") // Aggiungi immagini in Assets con questi nomi
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 300, height: 200)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay(
                                            HStack {
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .foregroundColor(.white)
                                                    .padding(10)
                                            }
                                            .background(Color.black.opacity(0.3))
                                            .clipShape(Circle())
                                            .padding(10),
                                            alignment: .trailing
                                        )
                                }
                            }
                        }
                        
                        // Titolo e informazioni principali
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("Spaccanapoli")
                                    .font(.largeTitle)
                                    .bold()
                                Spacer()
                                // Pulsante "Start" che apre la vista "Monuments"
                                NavigationLink(destination: Monuments()) {
                                    Text("Start")
                                        .font(.headline)
                                        .padding(10)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                            }
                            Text("Napoli")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            HStack(spacing: 20) {
                                HStack {
                                    Image(systemName: "clock")
                                    Text("Duration: 2h")
                                }
                                HStack {
                                    Image(systemName: "figure.walk")
                                    Text("Distance: 3 km")
                                }
                                HStack {
                                    Image(systemName: "globe")
                                    Text("Languages: Italian, English")
                                }
                            }
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        
                        // Descrizione del tour
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Tour Description")
                                .font(.title2)
                                .bold()
                            Text("""
                            Dive into the heart of Naples with a journey along Spaccanapoli, the city's historic spine. This vibrant street cuts through the old town, revealing layers of culture, art, and history. Explore centuries-old churches, bustling piazzas, artisan shops, and hidden gems. Feel the pulse of Naples as you stroll past street performers, taste local delicacies, and soak in the lively atmosphere that makes this city unforgettable. Perfect for history lovers, foodies, and curious travelers!
                            """)
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        
                        // Highlights del tour
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Tour Highlights")
                                .font(.title2)
                                .bold()
                            
                            VStack(alignment: .leading, spacing: 15) {
                                ForEach(1...5, id: \.self) { index in
                                    HStack(alignment: .center, spacing: 10) { // Allineamento centrale
                                        Text("\(index)")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.blue)
                                            .frame(width: 40, height: 40)
                                            .background(
                                                Circle()
                                                    .fill(Color.white)
                                                    .overlay(
                                                        Circle()
                                                            .stroke(Color.blue, lineWidth: 4) // Bordo blu
                                                    )
                                            )
                                        Text(highlightTitle(for: index))
                                            .font(.body)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        // Mappa
                        VStack {
                            MyMap()
                                .frame(height: 250)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .padding(.top, 10)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
                .background(Color("BackgroundColor")) // Colore di sfondo personalizzato
                .edgesIgnoringSafeArea(.bottom)
            }
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    Text("Explore")
                        .font(.headline)
                        .foregroundColor(.black)
                }

               
            }
            .background(Color("BackgroundColor").ignoresSafeArea())
        }
    }
    
    // Funzione per restituire i titoli dei punti salienti
    func highlightTitle(for index: Int) -> String {
        switch index {
        case 1: return "Pignasecca"
        case 2: return "Piazza del Gesù Nuovo"
        case 3: return "Basilica di Santa Chiara"
        case 4: return "Via San Gregorio Armeno"
        case 5: return "Pizzeria Di Matteo"
        default: return ""
        }
    }
}

#Preview {
    DetailsTour()
}
