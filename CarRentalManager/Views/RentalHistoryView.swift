
import SwiftUI

struct RentalHistoryView: View {
    let rentals: [Rental]

    var body: some View {
        NavigationStack {
            Group {
                if rentals.isEmpty {
                    ContentUnavailableView(
                        "No Rentals Yet",
                        systemImage: "car",
                        description: Text("Saved rentals will appear here.")
                    )
                } else {
                    List(rentals) { rental in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(rental.customerName)
                                .font(.headline)

                            Text("Car: \(rental.carName)")
                            Text("Duration: \(rental.rentalDays) days")

                            Text("Total: $\(rental.totalCost, specifier: "%.2f")")
                                .fontWeight(.semibold)
                                .foregroundStyle(.blue)
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
            .navigationTitle("Rental History")
        }
    }
}

