//
//  ContentView.swift
//  Recipe Project
//
//  Created by 廖哲澄 on 2021/11/14.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(model.recipes) { r in
                    NavigationLink (destination: {
                        // TODO
                    }, label: {
                        VStack(alignment: .leading) {
                            Text(r.name).font(.title2)
                            Text(r.cuisin)
                        }
                    })
                }.navigationTitle(Text("Food List"))
                    .navigationBarItems(trailing: Button (
                        action: {
                            model.addRecipe()
                        }
                    ) {
                        Image(systemName: "plus.rectangle.on.rectangle")
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
