//
//  CreateToDoListView.swift
//  ToDoList
//
//  Created by Shine Wai Lu on 13/6/24.
//

import SwiftUI

struct CreateToDoListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var title:String = ""
    @State var date: Date = Date()
    @State var time: Date = Date()
    @State var category: String = "🏃"
    @State var note: String = "Today..."
    
    
    
    let lightGray = Color(red: 0.9, green: 0.9, blue: 0.9)
    private let charLimit = 1
    private let charLimit1 = 99
    
    
    var body: some View {
        NavigationStack{
            VStack(spacing:0){
                ZStack{
                    Rectangle()
                        .foregroundStyle(.my)
                        .frame(height: 80)
                        .edgesIgnoringSafeArea(.all)
                        .padding(0)
                    HStack{
                        ZStack{
                            Circle()
                                .frame(width: 50)
                                .foregroundStyle(.white.opacity(0.9))
                                .edgesIgnoringSafeArea(.all)
                                .padding(.horizontal)
                            
                            Button {
                                withAnimation{
                                    dismiss()
                                }
                            } label: {
//                                Image(systemName: "multiply.circle")
                                Image(systemName: "multiply")
                                    .foregroundStyle(.black)
                                    .font(.largeTitle)
                            }
                        }
                        Spacer()
                    }
                }
                Form{
                    VStack(alignment: .leading){
                        
                        Text("Title")
                            .bold()
                        TextField("Title", text: $title)
                            .textFieldStyle(.roundedBorder)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                            .padding(.bottom)
                        
                        HStack{
                            Text("Category")
                                .bold()
                            Spacer()
                            TextField("", text: $category)
                                .onChange(of: category, { oldValue, newValue in
                                    if category.count > charLimit {
                                        category = String(category.prefix(charLimit))}
                                    
                                }
                                )
                                .multilineTextAlignment(.center)
                                .frame(width: 30,height: 40, alignment: .trailing)
                                .padding(.horizontal)
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)

                        }.padding(.vertical)
                        HStack(spacing: 210){
                            Text("Date")
                                .bold()
                            Text("Time")
                                .bold()
                            
                            
                        }.padding(.vertical)
                        
                        HStack(spacing: 100){
                            
                            DatePicker("",selection: $date, displayedComponents: .date)
                                .labelsHidden()
                                .padding(.trailing)
                            
                            
                            
                            DatePicker("",selection: $time, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                                .padding(.leading)
                            
                        }
                        Text("Note")
                            .bold()
                        TextEditor(text: $note)
                            .onChange(of: note, { oldValue, newValue in
                                if note.count > charLimit1 {
                                    note = String(note.prefix(charLimit1))}
                            }
                            )
                        
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1.0)
                            .cornerRadius(3.0)
                            .frame(height: UIScreen.main.bounds.size.height/5, alignment: .center)
                    }
                    .padding(.horizontal)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .scrollContentBackground(.hidden)
                    
                }.padding()
                    .frame(maxHeight: 630)
                    .scrollContentBackground(.hidden)
                
                Button(action: {
                    let component = ToDoComponents(title: title, date: date, time: time, isDone: false, category: category, note: note)
                    
                    
                    modelContext.insert(component)
                    dismiss()
                    
                }) {
                    Text("save")
                        .bold()
                        .frame(width: 300)
                        .padding()
                        .background(Color(.my))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                }
                
                Spacer()
                
            }
            
            
            
            
            
        }
    }
}

#Preview {
    CreateToDoListView()
}
