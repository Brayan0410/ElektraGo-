//
//  CDProducto+Mapping.swift
//  ElektraGo-
//
//  Created by Brayan Gutierrez Juarez on 05/09/25.
//

import CoreData

extension CDProducto {
   
    func toProducto() -> Producto {
        return Producto(
            id: id ?? "",
            idLinea: 0,
            codigoCategoria: CodigoCategoria(rawValue: codigoCategoria ?? "") ?? .c,
            idModalidad: 0,
            relevancia: 0,
            lineaCredito: "",
            pagoSemanalPrincipal: 0,
            plazoPrincipal: 0,
            disponibleCredito: false,
            abonosSemanales: [],
            sku: "",
            nombre: nombre ?? "",
            urlImagenes: [urlImagen ?? ""],
            precioRegular: Int(precioFinal),
            precioFinal: precioFinal,
            porcentajeDescuento: 0,
            descuento: false,
            precioCredito: 0,
            montoDescuento: 0
        )
    }
    func fromProducto(_ producto: Producto, context: NSManagedObjectContext) {
        id = producto.id
        nombre = producto.nombre
        precioFinal = producto.precioFinal
        codigoCategoria = producto.codigoCategoria.rawValue
        urlImagen = producto.urlImagenes.first ?? ""
    }
}

