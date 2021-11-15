//
//  Recipe.swift
//  Recipe Project
//
//  Created by 廖哲澄 on 2021/11/14.
//

import Foundation

class Recipe: Decodable, Identifiable {
    
    var id: UUID?
    var name: String
    var price: Int

}
