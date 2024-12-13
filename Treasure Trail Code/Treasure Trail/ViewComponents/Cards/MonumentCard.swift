import SwiftUI

struct MonumentCard: View {
    let number: Int
    let imageName: String
    let title: String
    let distance: String
    let latitude: Double
    let longitude: Double

    var body: some View {
        HStack {
            // Numero del monumento
            Text("\(number)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .frame(width: 40, height: 40)
                .background(
                    Circle()
                        .fill(Color.white)
                        .overlay(
                            Circle()
                                .stroke(Color.blue, lineWidth: 2) // Bordo blu
                        )
                )
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
            
            // Icona direzionale
            Button(action: {
                openMaps(latitude: latitude, longitude: longitude)
            }) {
                Image(systemName: "arrow.turn.up.right")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .frame(width: 40, height: 40)
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
        }
        .frame(height: 100)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.orange)
                .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.blue, lineWidth: 2) // Bordo blu
        )
        .padding(.horizontal)
    }

    // Funzione per aprire Mappe di Apple
    private func openMaps(latitude: Double, longitude: Double) {
        let urlString = "http://maps.apple.com/?daddr=\(latitude),\(longitude)"
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

struct MonumentCard_Previews: PreviewProvider {
    static var previews: some View {
        MonumentCard(
            number: 1,
            imageName: "monument_image", // Usa il nome dell'immagine presente in Assets
            title: "Monumento 1",
            distance: "300 m",
            latitude: 40.847450,
            longitude: 14.246770
        )
        .background(Color("BackgroundColor")) // Colore di sfondo personalizzato
    }
}
