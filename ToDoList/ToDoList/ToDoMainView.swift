//
//  ContentView.swift
//  ToDoList
//
//  Created by Shine Wai Lu on 12/6/24.
//

import SwiftUI
import SwiftData



struct ToDoMainView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query() private var toDoComponents: [ToDoComponents]
    
    
    
    @State var showCreateView = false
    
    
    let lightGray = Color(red: 0.9, green: 0.9, blue: 0.9)
    
    var body: some View {
        //NavigationStack{
        ZStack{
            VStack(spacing: 0){
                Rectangle()
                    .foregroundStyle(.my)
                    .frame(height: 300)
                    .edgesIgnoringSafeArea(.all)
                
                Spacer()
                
            }.background(.my1)
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
                    
                   
                        List{
                            
                            Section{
//                                    ForEach(0..<1){a in
//                                        let component = ToDoComponents(title: "Boxing", date: Date(), time: Date(timeIntervalSinceReferenceDate: 1000000), isDone: false, category: "🥊", note: "")
//                                        
//                                        
//                                        modelContext.insert(component)
//                                        
//                                    }.onDelete(perform: deleteRow)
//                                }
                                
                                ForEach(toDoComponents){taskList in
                                    if taskList.isDone == false{
                                        
                                        ListRowView(rowComponents: taskList)
                                            .listRowSeparatorTint(.black,edges: .all)
                                            .frame(height: 50)
                                    }
                                }.onDelete(perform: deleteRow)
                                
                                
                            }
                        }
                        .scrollContentBackground(.hidden)
                        .frame(width:350, height: 280)
                        .colorScheme(.light)
                        .ignoresSafeArea(.all)
                    }
                    
                
                HStack(spacing:100){
                    
                    Text("Completed")
                        .font(.title3)
                        .foregroundStyle(.black)
                        .bold()
                        .padding(.horizontal)
                    Spacer()
                    
                }.padding(0)
                    List{
                        Section{
                            
                            
                            ForEach(toDoComponents){taskList in
                                if taskList.isDone == true{
                                    ListRowView(rowComponents: taskList)
                                        .listRowSeparatorTint(.black,edges: .all)
                                        .frame(height: 50)
                                }
                            }.onDelete(perform: deleteRow)
                            
                        } header: {
                            //                        Text("Completed")
                            //                            .font(.headline)
                            //                            .foregroundStyle(.black)
                            //                            .bold()
                        }
                        
                    }
                    .scrollContentBackground(.hidden)
                    .frame(maxWidth:350, maxHeight: 150)
                    .ignoresSafeArea(.all)
                    .padding(0)
                    
                    Spacer()
                    
                
                
                
                
                
                Button(action: {
                    showCreateView = true
                    
                }) {
                    Text("Add new ToDo")
                        .bold()
                        .padding()
                        .background(Color(.my))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                }.sheet(isPresented: $showCreateView) {
                    CreateToDoListView()
                        .colorScheme(.light)
                }
                Spacer()
                
            }
            .edgesIgnoringSafeArea(.all)
            
        }
        
    }
    private func deleteRow(offsets: IndexSet){
        withAnimation{
            for index in offsets{
                modelContext.delete(toDoComponents[index])
            }
        }
    }
    
}



#Preview {
    
    ToDoMainView()
        .modelContainer(for: ToDoComponents.self, inMemory: true)
    
    
}
