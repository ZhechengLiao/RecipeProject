//
//  ContentView.swift
//  Recipe Project
//
//  Created by 廖哲澄 on 2021/11/14.
//

import SwiftUI

struct ContentView: View {
    
    var array = ["E1", "E2", "E3", "E4"]
    
    var body: some View {
        NavigationView {
            List(array, id: \.self) { arrayElement in
                NavigationLink(destination: {
                    Text(arrayElement)
                }, label: {
                    Text(arrayElement)
                })
            }.navigationBarTitle(Text("My List"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
