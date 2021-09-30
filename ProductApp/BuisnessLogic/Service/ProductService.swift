//
//  ProductService.swift
//  ProductApp
//
//  Created by Иван Миронов on 16.02.2021.
//

import Foundation


protocol ProductService {
    func getProducstFromCoreData() throws -> [ProductData]
    func convertToProduct(_ products: [ProductData]) -> [Product]
    func deleteAllProducts() throws
    func deleteProductAt(_ index: Int) throws
    func save(_ product: Product) throws
    func edit(_ product: Product, at index: Int) throws
}
