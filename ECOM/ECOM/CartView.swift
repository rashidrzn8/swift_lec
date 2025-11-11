import SwiftUI

struct CartView: View {
    @Bindable var cartVM: CartViewModel
    
    var body: some View {
        VStack {
            if cartVM.cartItems.isEmpty {
                ContentUnavailableView("Cart is empty", systemImage: "cart.badge.minus", description: Text("Add items to start shopping!"))
            } else {
                List {
                    ForEach(cartVM.cartItems) { item in
                        HStack {
                            Text(item.product.name)
                            Spacer()
                            Stepper(value: Binding(
                                get: { item.quantity },
                                set: { newValue in
                                    let diff = newValue - item.quantity
                                    if diff > 0 {
                                        for _ in 0..<diff { cartVM.addToCart(product: item.product) }
                                    } else {
                                        for _ in 0..<abs(diff) { cartVM.removeFromCart(product: item.product) }
                                    }
                                }
                            ), in: 1...10) {
                                Text("\(item.quantity)")
                            }
                            Text("$\(item.product.price * Double(item.quantity), specifier: "%.2f")")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                HStack {
                    Text("Total:")
                        .font(.headline)
                    Spacer()
                    Text("$\(cartVM.total, specifier: "%.2f")")
                        .bold()
                }
                .padding()
                
                Button("Checkout") {
                    cartVM.clearCart()
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
        .navigationTitle("Your Cart")
    }
}
