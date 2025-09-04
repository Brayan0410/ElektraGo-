//
//  NetworkClient.swift
//  ElektraGo-
//
//  Created by Brayan Gutierrez Juarez on 04/09/25.
//

import Foundation

protocol NetworkClientProtocol {
    func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}

final class NetworkClient: NetworkClientProtocol {
    func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
