//
//  ContentView.swift
//  Recipe Project
//
//  Created by 廖哲澄 on 2021/11/14.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = RecipeModel()
    @State var money = 0
    @State var isPresented = false
    
    // 模糊窗口
    var modalView: some View {
        NavigationView {
            VStack {
                List(model.recipes) { r in
                    HStack{
                        HStack {
                            Text(r.name)
                            Spacer()
                            Text("¥"+String(r.price))
                        }
                        Spacer()
                        Button(action: {
                            if money > 0 {
                                money = money - r.price
                            }
                        }) {
                            Image(systemName: "minus.circle").padding()
                        }
                        
                    }
                }.navigationTitle(Text("Shop List"))
                Text("¥"+String(money)).fontWeight(.bold).font(.title2).padding()
            }
        }
    }
    
    // 主窗口
    var body: some View {
        NavigationView {
            VStack {
                List(model.recipes) { r in
                    HStack{
                        VStack(alignment: .leading) {
                            Text(r.name).font(.title2)
                            Text("¥"+String(r.price))
                        }
                        Spacer()
                        Button(action: {
                            money = money + r.price
                        }) {
                            Image(systemName: "plus.circle").padding()
                        }
                        
                    }
                }.navigationTitle(Text("Food List"))
                HStack {
                    Text("¥"+String(money)).fontWeight(.bold).font(.title2).padding()
                    Spacer()
                    Button(action :{
                        
                    }) {
                        Text("OK")
                            .foregroundColor(.white)                         .fontWeight(.bold)
                            .font(.title2)
                            .frame(width: 80.0, height: 60.0)
                            .background(.blue)
                            .padding()
                         
                    }
                    Spacer()
                    Button(action: {
                        self.isPresented = true
                    }) {
                        Image(systemName: "cart").padding()
                    }.sheet(isPresented: $isPresented, content: {
                        self.modalView //将创建的自定义视图作为模态窗口的内容
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           
    }
}
