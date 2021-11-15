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
    @State var isAlert = false

    // 完成付款
    let primaryButton = Alert.Button.default(Text("Yes")) {
        print("Yes, I gonna buy these.")
    }

    let secondaryButton = Alert.Button.destructive(Text("No")) {
        print("No, I wanna think more.")
    }
    
    var alert: Alert {
        Alert(title: Text("Notice"),
              message: Text("Make sure to spend " + String(money) + "¥"),
              primaryButton: primaryButton,
              secondaryButton: secondaryButton)
    }
    
    // 模糊窗口
    var modalView: some View {
        NavigationView {
            VStack {
                List(model.recipes) { r in
                    HStack{
                        HStack {
                            Text(r.name)
                            Spacer()
                            Text(String(r.price)+"¥")
                        }
                        Spacer()
                        Button(action: {
                            if money > 0 {
                                money = money - r.price
                            }
                        }) {
                            Image(systemName: "minus.circle").imageScale(.large).padding()
                        }
                        
                    }
                }.navigationTitle(Text("Shop List"))
                Text(String(money)+"¥").fontWeight(.bold).font(.title2).padding()
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
                            Text(String(r.price)+"¥")
                        }
                        Spacer()
                        Button(action: {
                            money = money + r.price
                        }) {
                            Image(systemName: "plus.circle").imageScale(.large).padding()
                        }
                        
                    }
                }.navigationTitle(Text("Food List"))
                    
                HStack {
                    Text(String(money)+"¥").fontWeight(.bold).font(.title2).padding()
                    
                    Spacer()
                    
                    // Finish Button
                    Button(action :{
                        // TODO Finish shopping and pay money
                        self.isAlert = true
                    }, label: {
                        Text("Done")
                    }).foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(8)
                        .alert(isPresented: $isAlert, content: {
                            alert
                        })
                    Spacer()
                    
                    Button(action: {
                        self.isPresented = true
                        
                    }) {
                        Image(systemName: "cart").imageScale(.large).padding()
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
