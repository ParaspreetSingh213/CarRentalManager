import Foundation

struct Rental: Identifiable {
    let id = UUID()
    let customerName: String
    let carName: String
    let rentalDays: Int
    let hasInsurance: Bool
    let totalCost: Double
}

