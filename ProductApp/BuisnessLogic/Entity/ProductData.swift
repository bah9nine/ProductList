//
//  ProductData+CoreDataClass.swift
//  ProductApp
//
//  Created by Иван Миронов on 31.01.2021.
//
//

import Foundation
import CoreData

@objc(ProductData)
public class ProductData: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductData> {
        return NSFetchRequest<ProductData>(entityName: "ProductData")
    }

    @NSManaged public var name: String?
    @NSManaged public var amount: Int32
}

extension ProductData : Identifiable {

}
