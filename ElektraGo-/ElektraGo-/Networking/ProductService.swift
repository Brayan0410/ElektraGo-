//
//  ProductService.swift
//  ElektraGo-
//
//  Created by Brayan Gutierrez Juarez on 04/09/25.
//

import Foundation

protocol ProductServiceProtocol {
    func fetchProducts(completion: @escaping (Result<[Producto], Error>) -> Void)
}

final class ProductService: ProductServiceProtocol {
    private let network: NetworkClientProtocol
    private let url = URL(string: "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/apps/moviles/caso-practico/plp")!

    init(network: NetworkClientProtocol = NetworkClient()) {
        self.network = network
    }

    func fetchProducts(completion: @escaping (Result<[Producto], Error>) -> Void) {
        network.fetchData(from: url) { result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(ElektraGo.self, from: data)
                    completion(.success(response.resultado.productos))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
