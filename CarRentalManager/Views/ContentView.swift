
import SwiftUI

struct ContentView: View {
    let cars = [
        Car(name: "Economy", dailyRate: 45),
        Car(name: "SUV", dailyRate: 75),
        Car(name: "Luxury", dailyRate: 120)
    ]

    var body: some View {
        NavigationStack {
            List(cars) { car in
                HStack {
                    Text(car.name)
                    Spacer()
                    Text("$\(car.dailyRate, specifier: "%.2f") / day")
                }
            }
            .navigationTitle("Car Rental Manager")
        }
    }
}

#Preview {
    ContentView()
}

