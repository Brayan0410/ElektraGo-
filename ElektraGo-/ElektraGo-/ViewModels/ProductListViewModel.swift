//
//  ProductListViewModel.swift
//  ElektraGo-
//
//  Created by Brayan Gutierrez Juarez on 04/09/25.
//

import Foundation

final class ProductListViewModel: ObservableObject {
    @Published var productos: [Producto] = []
    @Published var selectedProduct: Producto?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let repository: ProductRepositoryProtocol

    init(repository: ProductRepositoryProtocol = ProductRepository()) {
        self.repository = repository
        self.selectedProduct = repository.getSelectedProduct()
    }

    func loadProducts(forceRefresh: Bool = false) {
        isLoading = true
        repository.fetchProducts(forceRefresh: forceRefresh) { [weak self] result in
            DispatchQueue.main.async {
                guard let self else { return }
                self.isLoading = false
                switch result {
                case .success(let productos):
                    self.productos = productos
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func selectProduct(_ product: Producto) {
        selectedProduct = product
        repository.saveSelectedProduct(product)
    }
}
