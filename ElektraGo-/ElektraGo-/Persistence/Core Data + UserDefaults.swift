//
//  Core Data + UserDefaults.swift
//  ElektraGo-
//
//  Created by Brayan Gutierrez Juarez on 05/09/25.
//

import Foundation
import CoreData

final class ProductRepository: ProductRepositoryProtocol {
    private let context: NSManagedObjectContext
    private let userDefaults = UserDefaults.standard
    private let selectedProductKey = "selectedProductId"

    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.context = context
    }

    func fetchProducts(forceRefresh: Bool, completion: @escaping (Result<[Producto], Error>) -> Void) {
        if !forceRefresh {
            let request: NSFetchRequest<CDProducto> = CDProducto.fetchRequest()
            if let cdProducts = try? context.fetch(request), !cdProducts.isEmpty {
                let productos = cdProducts.map { $0.toProducto() }
                completion(.success(productos))
                return
            }
        }
        let service = ProductService()
        service.fetchProducts { [weak self] result in
            switch result {
            case .success(let productos):
                self?.saveProducts(productos)
                completion(.success(productos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func saveProducts(_ productos: [Producto]) {
        productos.forEach { producto in
            let cdProduct = CDProducto(context: context)
            cdProduct.fromProducto(producto, context: context)
        }
        try? context.save()
    }

    func saveSelectedProduct(_ product: Producto) {
        userDefaults.set(product.id, forKey: selectedProductKey)
    }

    func getSelectedProduct() -> Producto? {
        guard let id = userDefaults.string(forKey: selectedProductKey) else { return nil }
        let request: NSFetchRequest<CDProducto> = CDProducto.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        if let cdProduct = try? context.fetch(request).first {
            return cdProduct.toProducto()
        }
        return nil
    }
}

