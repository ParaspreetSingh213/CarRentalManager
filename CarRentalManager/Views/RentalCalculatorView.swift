
import SwiftUI

struct RentalCalculatorView: View {
    let cars: [Car]
    @Binding var rentals: [Rental]

    @State private var customerName = ""
    @State private var selectedCar = 0
    @State private var rentalDays = 1
    @State private var hasInsurance = false
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Customer Information") {
                    TextField("Customer Name", text: $customerName)
                }

                Section("Select Car") {
                    Picker("Car Type", selection: $selectedCar) {
                        ForEach(cars.indices, id: \.self) { index in
                            Text("\(cars[index].name) - $\(cars[index].dailyRate, specifier: "%.2f")/day")
                                .tag(index)
                        }
                    }
                }

                Section("Rental Details") {
                    Stepper("Rental Days: \(rentalDays)",
                            value: $rentalDays, in: 1...30)

                    Toggle("Include Insurance ($15/day)",
                           isOn: $hasInsurance)
                }

                Section {
                    Button("Calculate and Save") {
                        calculateAndSave()
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .navigationTitle("Rental Calculator")
            .alert("Rental Information", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(alertMessage)
            }
        }
    }

    func calculateAndSave() {
        let trimmedName = customerName.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmedName.isEmpty else {
            alertMessage = "Please enter a valid customer name."
            showAlert = true
            return
        }

        let car = cars[selectedCar]

        let total = RentalCalculator.calculateTotal(
            dailyRate: car.dailyRate,
            rentalDays: rentalDays,
            hasInsurance: hasInsurance
        )

        let rental = Rental(
            customerName: trimmedName,
            carName: car.name,
            rentalDays: rentalDays,
            hasInsurance: hasInsurance,
            totalCost: total
        )

        rentals.append(rental)

        alertMessage = String(
            format: "Rental saved successfully!\nTotal Cost: $%.2f",
            total
        )
        showAlert = true

        customerName = ""
        selectedCar = 0
        rentalDays = 1
        hasInsurance = false
    }
}

