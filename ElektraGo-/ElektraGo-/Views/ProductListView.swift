//
//  ProductListView.swift
//  ElektraGo-
//
//  Created by Brayan Gutierrez Juarez on 04/09/25.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel: ProductListViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.red, .clear]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            List(viewModel.productos, id: \.id) { product in
                ProductCard(product: product)
                    .onTapGesture {
                        viewModel.selectProduct(product)
                        presentationMode.wrappedValue.dismiss()
                    }
                    .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Selecciona un producto")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.black)
            }
        }
    }
}

