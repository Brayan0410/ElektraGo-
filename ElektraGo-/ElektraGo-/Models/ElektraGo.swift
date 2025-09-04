//
//  ElektraGo.swift
//  ElektraGo-
//
//  Created by Brayan Gutierrez Juarez on 04/09/25.
//

import Foundation

// MARK: - ElektraGo
struct ElektraGo: Codable {
    let mensaje, advertencia: String
    let resultado: Resultado
}

// MARK: - Resultado
struct Resultado: Codable {
    let paginacion: Paginacion
    let categoria: String
    let productos: [Producto]
}

// MARK: - Paginacion
struct Paginacion: Codable {
    let pagina, totalPaginas, totalRegistros, totalRegistrosPorPagina: Int
}

// MARK: - Producto
struct Producto: Codable {
    let id: String
    let idLinea: Int
    let codigoCategoria: CodigoCategoria
    let idModalidad, relevancia: Int
    let lineaCredito: String
    let pagoSemanalPrincipal, plazoPrincipal: Int
    let disponibleCredito: Bool
    let abonosSemanales: [AbonosSemanale]
    let sku, nombre: String
    let urlImagenes: [String]
    let precioRegular: Int
    let precioFinal, porcentajeDescuento: Double
    let descuento: Bool
    let precioCredito, montoDescuento: Double
}

// MARK: - AbonosSemanale
struct AbonosSemanale: Codable {
    let plazo, montoAbono, montoDescuentoAbono, montoUltimoAbono: Int
    let montoFinalCredito, idPromocion, montoDescuentoElektra, montoDescuentoBanco: Int
    let precio, montoAbonoDigital: Int
}

enum CodigoCategoria: String, Codable {
    case c = "C"
    case ma = "MA"
    case tl = "TL"
}

