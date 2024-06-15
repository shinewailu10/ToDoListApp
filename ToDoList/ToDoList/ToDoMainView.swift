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
    let v = [1]
    
    
    let lightGray = Color(red: 0.9, green: 0.9, blue: 0.9)
    
    var body: some View {
        //NavigationStack{
        ZStack{
            VStack(spacing: 0){
                Rectangle()
                    .foregroundStyle(.indigo)
                    .frame(height: 300)
                    .edgesIgnoringSafeArea(.all)
                
                Spacer()
                
            }.background(.cyan)
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
                    //                        RoundedRectangle(cornerRadius: 25.0)
                    //                            .padding(.horizontal)
                    //                            .frame( width: 350, height: 300)
                    //                            .opacity(0.7)
                    
                    
                    List{
                        Section{
                            ForEach(v,id: \.self){a in
                                ListRowView(rowComponents: ToDoComponents(title: "read", date: Date(), time: Date(timeIntervalSinceReferenceDate: 1000), isDone: true, category: "📖", note: ""))
                            }.onDelete(perform: deleteRow)
                            
                            ForEach(v,id: \.self){a in
                                ListRowView(rowComponents: ToDoComponents(title: "Boxing", date: Date(), time: Date(timeIntervalSinceReferenceDate: 1000000), isDone: false, category: "🥊", note: ""))
                                
                            }.onDelete(perform: deleteRow)
                            
                            ForEach(toDoComponents){taskList in
                                ListRowView(rowComponents: taskList)
                                    .listRowSeparatorTint(.black,edges: .all)
                            }.onDelete(perform: deleteRow)
                            
                            
                        }
                    }
                    .scrollContentBackground(.hidden)
                        .frame(width:350, height: 300)
                        .ignoresSafeArea(.all)
                        
                    
                }
                List{
                        Section{
                            
                           
                            
                        } header: {
                        Text("Completed")
                                .font(.headline)
                                .foregroundStyle(.black)
                                .bold()
                        }
                        
                    }
                    .scrollContentBackground(.hidden)
                    .frame(maxWidth:350, maxHeight: 200)
                    .ignoresSafeArea(.all)
                    
                    Spacer()
                    
                    
                    
                    
                    
                
                Button(action: {
                    showCreateView = true
                    
                }) {
                    Text("Add new ToDo")
                        .bold()
                        .padding()
                        .background(Color(.indigo))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                }.sheet(isPresented: $showCreateView) {
                    CreateToDoListView()
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
