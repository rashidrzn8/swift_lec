import SwiftUI

struct ContentView: View {
    @State private var weight: String = ""
    @State private var length: String = ""
    @State private var depth: String = ""
    @State private var width: String = ""
    @State private var resultText: String = ""
    @State private var errorText: String = ""
    @State private var advancedSettings: Bool = false
    
    var isDisabled: Bool {
        weight.isEmpty || length.isEmpty || depth.isEmpty || width.isEmpty
    }
    
    var body: some View {
        VStack {
            Text("Parcel Cost Calculator")
                .font(.system(size: 28, weight: .bold))
                .padding(.top)
            
            Toggle("Use Advanced Pricing", isOn: $advancedSettings)
                .padding(.horizontal)
                .toggleStyle(SwitchToggleStyle(tint: .green))
            
            Group {
                InputField(label: "Weight (kg)", value: $weight)
                InputField(label: "Length (cm)", value: $length)
                InputField(label: "Depth (cm)", value: $depth)
                InputField(label: "Width (cm)", value: $width)
            }
            
            Button("Calculate Cost") {
                calculateParcelCost()
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .tint(isDisabled ? .gray : .blue)
            .disabled(isDisabled)
            .padding(.top)
            
            VStack(spacing: 8) {
                if !resultText.isEmpty {
                    Text(resultText)
                        .foregroundStyle(.green)
                        .font(.system(size: 16))
                }
                if !errorText.isEmpty {
                    Text(errorText)
                        .foregroundStyle(.red)
                        .font(.system(size: 16))
                }
            }
            .padding(.top, 10)
            
            Spacer()
        }
        .padding()
    }
    
    func calculateParcelCost() {
        guard
            let weightVal = Double(weight),
            let lengthVal = Double(length),
            let depthVal = Double(depth),
            let widthVal = Double(width)
        else {
            errorText = "⚠️ Please enter valid numbers for all fields"
            resultText = ""
            return
        }
        
        if advancedSettings {
            // Advanced Validation
            guard weightVal <= 30 else {
                errorText = "⚠️ Weight should not exceed 30 kg"
                resultText = ""
                return
            }
            guard lengthVal <= 150, depthVal <= 150, widthVal <= 150 else {
                errorText = "⚠️ Dimensions should not exceed 150 cm"
                resultText = ""
                return
            }
            
            let cost = calculateCostAdvanced(weight: weightVal, length: lengthVal, depth: depthVal, width: widthVal)
            resultText = cost < 5 ? "⚠️ Minimum cost should be Rs 5.00" : "💰 The cost is: Rs \(String(format: "%.2f", cost))"
            errorText = ""
        } else {
            // Standard Calculation
            let cost = calculateCost(weight: weightVal, length: lengthVal, depth: depthVal, width: widthVal)
            resultText = cost < 4 ? "⚠️ Minimum cost should be Rs 4.00" : "💰 The cost is: Rs \(String(format: "%.2f", cost))"
            errorText = ""
        }
    }
    
    func calculateCost(weight: Double, length: Double, depth: Double, width: Double) -> Double {
        let volume = length * depth * width
        var totalCost = 3.0
        totalCost += weight * 0.5
        totalCost += (volume / 1000 * 0.1)
        return totalCost
    }
    
    func calculateCostAdvanced(weight: Double, length: Double, depth: Double, width: Double) -> Double {
        let volume = length * depth * width
        var totalCost = 2.5
        totalCost += weight * 1.5
        totalCost += (volume / 1000 * 0.75)
        
        if weight > 20 {
            totalCost *= 1.5
        } else if weight > 10 {
            totalCost *= 1.25
        }
        return totalCost
    }
}

struct InputField: View {
    let label: String
    @Binding var value: String
    
    var body: some View {
        HStack {
            Text("\(label):")
                .font(.system(size: 18, weight: .semibold))
            TextField("Enter \(label.lowercased())", text: $value)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
                .onChange(of: value) { _, _ in }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
}
