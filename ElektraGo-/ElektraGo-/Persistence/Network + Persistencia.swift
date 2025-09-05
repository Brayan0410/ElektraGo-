//
//  Network + Persistencia.swift
//  ElektraGo-
//
//  Created by Brayan Gutierrez Juarez on 05/09/25.
//

import Foundation

protocol ProductRepositoryProtocol {
    func fetchProducts(forceRefresh: Bool, completion: @escaping (Result<[Producto], Error>) -> Void)
    func saveSelectedProduct(_ product: Producto)
    func getSelectedProduct() -> Producto?
}
