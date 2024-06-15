//
//  CheckboxView.swift
//  ToDoList
//
//  Created by Shine Wai Lu on 15/6/24.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {

    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 0) {
            
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: 3)
                .frame(width: 25, height: 25)
                .cornerRadius(5.0)
                .overlay() {
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                        .background(.indigo)
                        .foregroundStyle(.white)
                }
                .onTapGesture {
                    
                    configuration.isOn.toggle()
                    
                }
            
            configuration.label
            
        }
    }
}

struct CheckboxView: View {
    
    
    
    @Environment(\.modelContext) private var modelContext
    @State private var checking = ToDoComponents()

    
    var body: some View {
        HStack{
            Spacer()
            ZStack{
                
                Toggle("", isOn: $checking.isDone)
                    .tint(.indigo)
                    .toggleStyle(CheckboxToggleStyle())
                    
                
                
            }
            //Text("\(checking.isDone)")
        }.padding()
    }
}

#Preview {
    CheckboxView()
        .modelContainer(for: ToDoComponents.self, inMemory: true)
}
