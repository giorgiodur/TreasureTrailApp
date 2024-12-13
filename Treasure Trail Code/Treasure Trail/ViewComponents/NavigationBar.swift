//
//  NavigationBar.swift
//  Treasure Trail
//
//  Created by Giorgio Durante on 09/12/24.
//

import SwiftUI

struct NavigationBar: View {
    let title: String
    let onBack: () -> Void
    let onRightAction: () -> Void

    var body: some View {
        HStack {
            // Pulsante "Back"
            Button(action: {
                onBack()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                    Text("Back")
                        .foregroundColor(.blue)
                        .font(.system(size: 18))
                }
            }
            
            Spacer()
            
            // Titolo
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            
            Spacer()
            
            // Pulsante icona destra
            Button(action: {
                onRightAction()
            }) {
                Image(systemName: "globe")
                    .foregroundColor(.blue)
                    .font(.system(size: 20))
            }
        }
        .padding()
        .background(Color("HeaderBackground")) // Colore personalizzato (creare in Assets)
        
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationBar(
                title: "Explore",
                onBack: {
                    print("Back button pressed")
                },
                onRightAction: {
                    print("Right button pressed")
                }
            )
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
}


#Preview {
    NavigationBar(
        title: "Explore",
        onBack: {
            print("Back button pressed")
        },
        onRightAction: {
            print("Right button pressed")
        }
    )
}
