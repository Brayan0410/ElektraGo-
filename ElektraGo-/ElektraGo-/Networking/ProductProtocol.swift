//
//  ProductProtocol.swift
//  ElektraGo-
//
//  Created by Brayan Gutierrez Juarez on 04/09/25.
//

import Foundation

protocol ProductProtocol {
    var id: String { get }
    var nombre: String { get }
    var precioFinal: Double { get }
    var codigoCategoria: CodigoCategoria { get }
}

extension Producto: ProductProtocol {}

