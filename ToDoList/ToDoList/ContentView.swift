//
//  ContentView.swift
//  ToDoList
//
//  Created by Shine Wai Lu on 12/6/24.
//

import SwiftUI



struct ContentView: View {
    
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                ZStack{
                    Rectangle()
                        .foregroundStyle(.cyan)
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 200)
                    VStack{
                        Text(Date(),style: .date)
                            .font(.system(size: 22))
                            .padding()
                        
                        Text("My ToDo List")
                            .font(.largeTitle)
                            .padding()
                        
                    }

                }
                
                Rectangle()
                    .foregroundColor(.white.opacity(0.95))
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: 600)
            }

        }
    }
    
}

#Preview {
    ContentView()
}
