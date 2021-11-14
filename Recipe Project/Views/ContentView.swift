//
//  ContentView.swift
//  Recipe Project
//
//  Created by 廖哲澄 on 2021/11/14.
//

import SwiftUI

struct ContentView: View {
    
    var model = RecipeModel()
    
    var body: some View {
        NavigationView {
            List(model.recipes) { r in
                NavigationLink (destination: {
                }, label: {
                    VStack(alignment: .leading) {
                        Text(r.name).font(.title2)
                        Text(r.cuisin)
                    }
                })
            }.navigationBarTitle(Text("Food Result"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
