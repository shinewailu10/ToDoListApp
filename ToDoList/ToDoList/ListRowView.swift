//
//  ListRowView.swift
//  ToDoList
//
//  Created by Shine Wai Lu on 13/6/24.
//

import SwiftUI


//struct CheckboxToggleStyle: ToggleStyle {
//
//    func makeBody(configuration: Configuration) -> some View {
//        HStack(spacing: 0) {
//            
//            RoundedRectangle(cornerRadius: 5.0)
//                .stroke(lineWidth: 3)
//                .frame(width: 25, height: 25)
//                .cornerRadius(5.0)
//                .overlay() {
//                    Image(systemName: configuration.isOn ? "checkmark" : "")
//                        .background(.indigo)
//                        .foregroundStyle(.white)
//                }
//                .onTapGesture {
//                    
//                    configuration.isOn.toggle()
//                    
//                }
//            
//            configuration.label
//            
//        }
//    }
//}

struct ListRowView: View {
    @Environment(\.modelContext) private var modelContext
    
    let rowComponents: ToDoComponents
    
    
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            HStack(spacing: 10){
                
                ZStack{
                    Circle()
                        .frame(width: 50)
                        .foregroundStyle(.indigo.opacity(0.7))
                    Text(rowComponents.category)
                }
                
                VStack(alignment: .leading, spacing: 0){
                    Text(rowComponents.title)
                        .bold()
                        .font(.title3)
                    
                    Text(rowComponents.time, style: .time)
                        .frame(alignment: .leading)
                        .foregroundStyle(.secondary)
                        .font(.callout)
                }
                Spacer()
                Button {
                    withAnimation{
                        rowComponents.isDone.toggle()
                    }
                } label: {
                    Image(systemName: "checkmark")
                        .symbolVariant(.square.fill)
                        .border(Color.black)
                        .foregroundStyle(rowComponents.isDone ? .indigo : . white)
                        .font(.title3)
                }
            
            }
            
        }.scrollContentBackground(.hidden)
    }
}

#Preview {
    List{
        ListRowView(rowComponents: ToDoComponents(title: "Coding", date: Date(), time: Date(),isDone: false, category: "💻", note: ""))
        
    }
}
