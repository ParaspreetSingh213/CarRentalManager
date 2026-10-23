
import SwiftUI

struct ContentView: View {
    @State private var rentals: [Rental] = []

    let cars = [
        Car(name: "Economy", dailyRate: 45),
        Car(name: "SUV", dailyRate: 75),
        Car(name: "Luxury", dailyRate: 120)
    ]

    var body: some View {
        TabView {
            RentalCalculatorView(
                cars: cars,
                rentals: $rentals
            )
            .tabItem {
                Label("Calculator", systemImage: "car.fill")
            }

            RentalHistoryView(rentals: rentals)
                .tabItem {
                    Label("History", systemImage: "clock.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}

