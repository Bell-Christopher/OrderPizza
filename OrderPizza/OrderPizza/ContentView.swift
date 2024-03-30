//
//  ContentView.swift
//  OrderPizza
//
//  Created by Christopher Bell on 30/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    // Pizza names
    @State private var pizzaIndex = 0
    var pizzaNames = ["Pizza Neapolitan",
                      "Pizza Pepperoni",
                      "Pizza Mare e Monti",
                      "Pizza Supreme"]
    
    // Pizza Size
    @State private var sizeIndex = 0
    var pizzaSize = ["Small",
                     "Medium",
                     "Large"]
    
    // Pizza Number
    @State private var pizzaNumber = 1
    
    // Collection Date
    @State private var collectionDate = Date()
    
    // Submit Button
    @State private var showAlert = false
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                Image("pizza")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                // Pizza Name
                Picker(selection: $pizzaIndex, label: Text("Pizza")) {
                    ForEach(0..<pizzaNames.count, id: \.self) {
                        Text(self.pizzaNames[$0])
                    }
                }
                
                // Pizza Size
                Picker(selection: $sizeIndex, label: Text("Size")) {
                    ForEach(0..<pizzaSize.count, id: \.self) {
                        Text(self.pizzaSize[$0])
                    }
                }
                
                // Pizza Number
                HStack {
                    Stepper("Quantity", value: $pizzaNumber, in: 1...10)
                    Text("\(pizzaNumber)")
                }
                
                // Collection Date
                DatePicker("Collection Date", selection: $collectionDate)
            }
            // Order Button
            Button("Place Order") {
                showAlert = true
            }
            .tint(.orange)
            .alert("Your order has been placed!", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
            .navigationTitle("Pizza Order Form")
        }
    }
}

#Preview {
    ContentView()
}
