import Foundation

struct RentalCalculator {
    static func calculateTotal(
        dailyRate: Double,
        rentalDays: Int,
        hasInsurance: Bool
    ) -> Double {
        let rentalCharge = dailyRate * Double(rentalDays)
        let insuranceCharge = hasInsurance ? 15.0 * Double(rentalDays) : 0.0
        let subtotal = rentalCharge + insuranceCharge
        let hst = subtotal * 0.13

        return subtotal + hst
    }
}

