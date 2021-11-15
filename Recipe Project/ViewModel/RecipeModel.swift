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
        let pathString = Bundle.main.path(forResource: "data", ofType: "json")
        if pathString != nil {
            let url = URL(fileURLWithPath: pathString!)
            
            do {
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                
                do {
                    let recipeData = try decoder.decode([Recipe].self, from: data)
                    
                    for r in recipeData {
                        r.id = UUID()
                    }
                    
                    self.recipes = recipeData
                }
                catch {
                    print(error)
                }
            }
            catch {
                print(error)
            }
        }
    }
    
}
