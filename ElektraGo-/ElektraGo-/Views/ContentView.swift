//
//  ContentView.swift
//  ElektraGo-
//
//  Created by Brayan Gutierrez Juarez on 04/09/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProductListViewModel()
    @State private var showProductList = false
    
    var body: some View {
        NavigationView {
            ZStack {
              
                Image("Elektra")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 550)
                    .rotationEffect(.degrees(30))
                    .offset(x: 100, y: 250)
                
                LinearGradient(
                    gradient: Gradient(colors: [.red, .clear]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Elektra")
                        .font(.system(size: 100, weight: .bold))
                        .foregroundColor(Color(red: 0.6, green: 0, blue: 0))
                        .padding(.bottom ,20)
                    
                    if let product = viewModel.selectedProduct {
                        ProductCard(product: product)
                    } else {
                        Text("Compra fácil y rápido en la app de Elektra")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .bold))
                    }
                    
                    Button("Ver productos") {
                        viewModel.loadProducts()
                        showProductList = true
                    }
                    .font(.title2)
                    .bold()
                    .padding(.vertical, 16)
                    .padding(.horizontal, 40)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    
                    NavigationLink(destination: ProductListView(viewModel: viewModel),
                                   isActive: $showProductList) {
                        EmptyView()
                    }
                }
                .padding(.bottom, 280)
                .padding()
            }
        }
    }
}
#Preview {
    ContentView()
}
