//
//  HomePage.swift
//  Treasure Trail
//
//  Created by Giorgio Durante on 09/12/24.
//

import SwiftUI

struct HomePage: View {
    @State private var searchText: String = ""
    @State private var navigateToTours: Bool = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Titolo principale
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()

                    HStack {
                        
                        Text("TREASURE TRAIL")
                                                    .font(.system(size: 34, weight: .heavy, design: .rounded)) // Modified this line
                                                    .foregroundColor(.primary) // Added this line

                        Spacer()
                    }
                    Text("Discover an unlock cities")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                // Barra di ricerca
                HStack {
                    TextField("Where?", text: $searchText, onCommit: {
                        if searchText.lowercased() == "napoli" {
                            navigateToTours = true // Attiva la navigazione
                        }
                    })
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Spacer()
                            Image(systemName: "mic.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 10)
                        }
                    )
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Immagine illustrativa
                Image("sfondo2") // Sostituisci con il nome corretto in Assets
                    .resizable()
                    .scaledToFit()
                    .frame(height: 600)
                    .padding(.all)
                
                Spacer()
            }
            .background(Color("BackgroundColor").ignoresSafeArea()) // Colore di sfondo personalizzato
            .navigationDestination(isPresented: $navigateToTours) {
                Tours()
            }
        }
    }
}

#Preview {
    HomePage()
}
