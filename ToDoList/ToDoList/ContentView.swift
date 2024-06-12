//
//  ContentView.swift
//  ToDoList
//
//  Created by Shine Wai Lu on 12/6/24.
//

import SwiftUI



struct ContentView: View {
    
    var body: some View {
        VStack{
            ZStack{
                VStack(spacing: 0){
                    Rectangle()
                        .foregroundStyle(.cyan)
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 270)
                    
                    Rectangle()
                        .foregroundColor(.white.opacity(0.95))
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 600)
                    
                }
                VStack{
                    Spacer()
                        .frame(height: 50)
                    Text(Date(),style: .date)
                        .font(.system(size: 22))
                        .foregroundStyle(.white)
                        .padding()
                    
                    Text("My ToDo List")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .bold()
                    
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 300)
                        .opacity(0.8)
                    
                    
                    
                    
                    
                    
                    
                    Spacer()
                    
                    
                }
                
            }
        }
        
        
    }
    
}

#Preview {
    ContentView()
}
