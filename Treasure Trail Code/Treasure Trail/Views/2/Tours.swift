//
//  Tours.swift
//  Treasure Trail
//
//  Created by Giorgio Durante on 10/12/24.
//

import SwiftUI

struct Tours: View {
    var body: some View {
            VStack {
                // Barra di ricerca
                HStack {
                    TextField("Where?", text: .constant(""))
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
                .padding(.top, 20)
                
                // Elenco di TourCard
                ScrollView {
                    VStack(spacing: 15) {
                        // Card per ogni tour
                        NavigationLink(destination: DetailsTour()) {
                            TourCard(
                                title: "Spaccanapoli",
                                distance: "5 km",
                                duration: "2 h",
                                imageName: "tour_image_1"
                            )
                        }
                        
                        NavigationLink(destination: DetailsTour()) {
                            TourCard(
                                title: "Historic Naples",
                                distance: "3 km",
                                duration: "1.5 h",
                                imageName: "tour_image_2"
                            )
                        }
                        
                        NavigationLink(destination: DetailsTour()) {
                            TourCard(
                                title: "Food & Culture",
                                distance: "4 km",
                                duration: "2.5 h",
                                imageName: "monument5"
                            )
                        }
                        
                        NavigationLink(destination: DetailsTour()) {
                            TourCard(
                                title: "Artistic Naples",
                                distance: "6 km",
                                duration: "3 h",
                                imageName: "tour_image_4"
                            )
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                }
                
                Spacer()
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

#Preview {
    Tours()
}
