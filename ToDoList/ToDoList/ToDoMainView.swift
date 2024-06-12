//
//  ContentView.swift
//  ToDoList
//
//  Created by Shine Wai Lu on 12/6/24.
//

import SwiftUI



struct ToDoMainView: View {
    
    var body: some View {
        VStack{
            ZStack{
                VStack(spacing: 0){
                    Rectangle()
                        .foregroundStyle(.indigo)
                        .edgesIgnoringSafeArea(.all)
                    
                    Rectangle()
                        .foregroundColor(.cyan)
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
                    ZStack{
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .padding(.horizontal)
                            .frame(height: 400)
                            .foregroundStyle(.white)
                            .opacity(0.7)
                        
                        
                        TaskListView()
                            .frame(height: 400)
                            .ignoresSafeArea(.all)
                    }
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Text("Add new ToDo")
                            .bold()
                            .padding()
                            .background(Color(.indigo))
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                    }
                    Spacer()
                    
                }
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                    
                
                
            }
        }
        
        
    }
    
}

#Preview {
    ToDoMainView()
}
