//
//  ProductCardView.swift
//  ElektraGo-
//
//  Created by Brayan Gutierrez Juarez on 04/09/25.
//

import SwiftUI

struct ProductCard<T: ProductProtocol>: View {
    let product: T

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RemoteImage(url: product is Producto ? (product as! Producto).urlImagenes.first ?? "" : "", height: 150)

            Text(product.nombre)
                .font(.headline)

            Text("Precio: $\(Int(product.precioFinal))")
                .font(.subheadline)
                .foregroundColor(.green)

            Text("Categoría: \(product.codigoCategoria.rawValue)")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: 350)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}
