//
//  RecipeModel.swift
//  Recipe Project
//
//  Created by 廖哲澄 on 2021/11/14.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    // Init of class
    init() {
        // Create some dummy data
        recipes.append(Recipe(name: "Noodles", cuisin: "China"))
        recipes.append(Recipe(name: "Humburger", cuisin: "American"))
        recipes.append(Recipe(name: "Sushi", cuisin: "Japan"))
    }
    
    func addRecipe() {
        recipes.append(Recipe(name: "Fish", cuisin: "China"))
    }
    
    func deleteRecipe() {
        recipes.remove(at: 0)
    }
}
