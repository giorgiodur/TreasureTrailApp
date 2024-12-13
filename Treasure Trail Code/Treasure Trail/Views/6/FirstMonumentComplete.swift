//
//  FirstMonumentComplete.swift
//  Treasure Trail
//

import SwiftUI

struct FirstMonumentComplete: View {
    @State private var completedMonuments: Set<Int> = []

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
                        // Monumento 1 completato
                        if completedMonuments.contains(1) {
                            MonumentCompleteCard(
                                number: 1,
                                imageName: "pignasecca",
                                title: "Pignasecca",
                                distance: "0 m"
                            )
                        } else {
                            NavigationLink(
                                destination: DetailsMonument(
                                    monumentName: "Pignasecca",
                                    tourName: "Spaccanapoli Tour",
                                    description: "La Pignasecca è uno dei mercati più antichi di Napoli, famoso per la sua vivace atmosfera e l'autenticità.",
                                    mapImageName: "pignasecca_map",
                                    onCompletion: {
                                        completedMonuments.insert(1)
                                    }
                                )
                            ) {
                                MonumentCard(
                                    number: 1,
                                    imageName: "pignasecca",
                                    title: "Pignasecca",
                                    distance: "300 m",
                                    latitude: 40.8469,
                                    longitude: 14.2461
                                )
                            }
                        }

                        // Monumento 2 completato
                        if completedMonuments.contains(2) {
                            MonumentCompleteCard(
                                number: 2,
                                imageName: "piazza_gesu_nuovo",
                                title: "Piazza del Gesù Nuovo",
                                distance: "700 m"
                            )
                        } else {
                            NavigationLink(
                                destination: DetailsMonument(
                                    monumentName: "Piazza del Gesù Nuovo",
                                    tourName: "Spaccanapoli Tour",
                                    description: "Piazza del Gesù Nuovo ospita l'omonima chiesa e rappresenta uno dei punti storici più affascinanti di Napoli.",
                                    mapImageName: "piazza_gesu_nuovo_map",
                                    onCompletion: {
                                        completedMonuments.insert(2)
                                    }
                                )
                            ) {
                                MonumentCard(
                                    number: 2,
                                    imageName: "piazza_gesu_nuovo",
                                    title: "Piazza del Gesù Nuovo",
                                    distance: "700 m",
                                    latitude: 40.8479,
                                    longitude: 14.2522
                                )
                            }
                        }

                        // Altri monumenti possono essere aggiunti qui seguendo lo stesso schema
                    }
                    .padding(.horizontal)
                }
                .background(Color("BackgroundColor"))
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        print("Back button pressed")
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.blue)
                    }
                }

                ToolbarItem(placement: .principal) {
                    Text("Explore")
                        .font(.headline)
                        .foregroundColor(.black)
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Globe button pressed")
                    }) {
                        Image(systemName: "globe")
                            .foregroundColor(.blue)
                    }
                }
            }
            .background(Color("BackgroundColor").ignoresSafeArea()) // Sfondo personalizzato
        }
    }
}

#Preview {
    FirstMonumentComplete()
}
