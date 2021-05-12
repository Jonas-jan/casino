//
//  ContentView.swift
//  Casino
//
//  Created by Jonas Janavicius on 2021-05-12.
//

import SwiftUI

struct ContentView: View {
    
    @State var credit:Int = 1000
    @State var slot1 = 1
    @State var slot2 = 2
    @State var slot3 = 3
    @State var progress = 0.1
    @State var count = 0
    
    var body: some View {
        VStack {
            
        Text("SwiftUI Slots")
            .padding()
            
            
            HStack {
                Text("Credits:")
                Text(String(credit))
                
            }
            
            ProgressView(value: progress)
            Text("Credit Goal 1900")
            
            Spacer()
            HStack {
                Spacer()
                Image("Fruit\(slot1)")
                    .resizable()
                    .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer()
                Image("Fruit\(slot2)")
                    .resizable()
                    .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
               Spacer()
                Image("Fruit\(slot3)")
                    .resizable()
                    .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            Spacer()
            Button(action: {
                if progress < 1 {
                slot1 = Int.random(in: 1...3)
                slot2 = Int.random(in: 1...3)
                slot3 = Int.random(in: 1...3)
                
                if slot1 == slot2 && slot2 == slot3 {
                    credit = credit+50
                    progress = progress+0.05
                    count+=1
                }
                else if slot1 == slot2 && slot2 != slot3 {
                    credit = credit+20
                    progress = progress+0.02
                    count+=1
                }
                else {
                    credit = credit-10
                    progress = progress-0.01
                    count+=1
                }
                }
                else {
                    slot1 = 4
                    slot2 = 4
                    slot3 = 4
                    
                    progress = 0.1
                    count = 0
                   
                }
            }, label: {
                Image("Fruit3")
            })
            VStack {
            Text("Total tries:")
            Text("\(count)")
            }
            Spacer()
    }
    }
    
    struct PopUpView: View {
        var body: some View {
            VStack {
                Text("Hi. Casino won. Your credit varnished.").padding()
                
                NavigationLink(
                    destination: ContentView(),
                    label: {
                        Text("Close")
                    })
            }
            
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            PopUpView()
        }
    }
}
}
