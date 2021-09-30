//
//  WorkingWithDataBase.swift
//  ProductApp
//
//  Created by Иван Миронов on 10.02.2021.
//

import UIKit
import CoreData

class ProductServiceImp: ProductService {
    static let shared = ProductServiceImp()
    private let context: NSManagedObjectContext
    var productsFromCoreData: [ProductData] = []
    var productStore: [Product] = []
    
    
    private init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    
        do {
            try productsFromCoreData = getProducstFromCoreData()
            productStore = convertToProduct(productsFromCoreData)
        } catch {
            
        }
    }
    
    func getProducstFromCoreData() throws -> [ProductData] {
        var products: [ProductData] = []
        do {
            if let objs = try context.fetch(ProductData.fetchRequest()) as? [ProductData] {
                products = objs
            }
        } catch {
            throw CoreDataError.getProductForCoreData
        }
        return products
    }
    
    func convertToProduct(_ products: [ProductData]) -> [Product] {
        var temp: [Product] = []
        
        for product in products {
            let amount = Int(product.amount)
            let name = product.name ?? ""
            let product = Product(name: name, amount: amount)
            temp += [product]
        }
        return temp
    }
    
    func deleteAllProducts() throws {
        productsFromCoreData.forEach{ (product) in
            context.delete(product)
        }
        do {
            try context.save()
        } catch {
            throw CoreDataError.clearCoreData
        }
        productStore.removeAll()
    }
    
    func deleteProductAt(_ index: Int) throws {
        let deletedProduct = productsFromCoreData.remove(at: index)
        context.delete(deletedProduct)
        productStore.remove(at: index)
        
        do {
            try context.save()
        } catch {
            throw CoreDataError.deleteProduct
        }
    }
    
    func save(_ product: Product) throws {
        let productCD = ProductData(context: context)
        productCD.amount = Int32(product.amount)
        productCD.name = product.name
        productsFromCoreData.append(productCD)
        productStore.append(product)
        
        do {
            try context.save()
        } catch {
            throw CoreDataError.save
        }
    }
    
    func edit(_ product: Product, at index: Int) throws {
        let productForEditing = productsFromCoreData[index]
        productForEditing.amount = Int32(product.amount)
        productForEditing.name = product.name
        productStore[index] = product
        
        do {
            try context.save()
        } catch {
            throw CoreDataError.edit
        }
    }
}
