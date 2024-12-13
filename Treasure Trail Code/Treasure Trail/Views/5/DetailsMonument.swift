//
//  DetailsMonument.swift
//  Treasure Trail
//

import SwiftUI

// Wrapper per il messaggio che conforma a Identifiable
struct RecognitionMessage: Identifiable {
    let id = UUID()
    let message: String
}

struct DetailsMonument: View {
    var monumentName: String
    var tourName: String
    var description: String
    var mapImageName: String
    var onCompletion: () -> Void

    @State private var descriptionUnlocked = false
    @State private var showCameraView = false
    @State private var recognitionMessage: RecognitionMessage?

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Mappa
                ZStack {
                    MyMap()
                        .frame(height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 0))
                        .padding(.top, 10)
                }

                // Dettagli del monumento
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(monumentName)
                                .font(.title)
                                .fontWeight(.bold)
                            Text(tourName)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Button(action: {
                            showCameraView = true
                        }) {
                            HStack {
                                Image(systemName: "camera.fill")
                                    .foregroundColor(.blue)
                                Text("Scatta")
                                    .foregroundColor(.blue)
                                    .fontWeight(.semibold)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(10)
                        }
                    }

                    // Descrizione
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Descrizione")
                            .font(.headline)
                        if descriptionUnlocked {
                            Text(description)
                                .font(.body)
                                .foregroundColor(.gray)
                        } else {
                            Text("Descrizione bloccata. Inquadra il monumento con la fotocamera per sbloccarla.")
                                .font(.body)
                                .foregroundColor(.red)
                        }
                    }
                }
                .padding()
                .background(Color("BackgroundColor"))

                Spacer()
            }
            .sheet(isPresented: $showCameraView) {
                CameraView(
                    onDetection: { recognizedMonument in
                        if recognizedMonument == monumentName {
                            descriptionUnlocked = true
                            recognitionMessage = RecognitionMessage(message: "Monumento riconosciuto: \(recognizedMonument)")
                            onCompletion() // Segnala il completamento
                        } else {
                            recognitionMessage = RecognitionMessage(message: "Il monumento riconosciuto non corrisponde a \(monumentName).")
                        }
                        showCameraView = false
                    },
                    onError: { error in
                        recognitionMessage = RecognitionMessage(message: "Errore nel riconoscimento: \(error.localizedDescription)")
                        showCameraView = false
                    }
                )
            }
            .alert(item: $recognitionMessage) { message in
                Alert(title: Text("Riconoscimento"), message: Text(message.message), dismissButton: .default(Text("OK")))
            }
            .background(Color("BackgroundColor"))
        }
    }
}

#Preview {
    DetailsMonument(
        monumentName: "Basilica di Santa Chiara",
        tourName: "Spaccanapoli Tour",
        description: "La Basilica di Santa Chiara è una delle chiese più famose di Napoli, conosciuta per il suo chiostro maiolicato e la sua storia ricca di cultura e arte.",
        mapImageName: "map_placeholder",
        onCompletion: {}
    )
}
