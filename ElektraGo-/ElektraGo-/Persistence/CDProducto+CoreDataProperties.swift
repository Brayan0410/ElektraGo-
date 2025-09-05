//
//  CDProducto+CoreDataProperties.swift
//  ElektraGo-
//
//  Created by Brayan Gutierrez Juarez on 04/09/25.
//
//

import Foundation
import CoreData


extension CDProducto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDProducto> {
        return NSFetchRequest<CDProducto>(entityName: "CDProducto")
    }

    @NSManaged public var id: String?
    @NSManaged public var nombre: String?
    @NSManaged public var precioFinal: Double
    @NSManaged public var codigoCategoria: String?
    @NSManaged public var urlImagen: String?

}

extension CDProducto : Identifiable {

}
