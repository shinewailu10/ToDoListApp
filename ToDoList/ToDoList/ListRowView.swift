//
//  ListRowView.swift
//  ToDoList
//
//  Created by Shine Wai Lu on 13/6/24.
//

import SwiftUI

struct ListRowView: View {
    
    let rowComponents: ToDoComponents
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(rowComponents.category)
                    .bold()
                Text("-")
                Text(rowComponents.title)
            }
            .padding(.bottom, 1)
            HStack {
                Text(rowComponents.time, style: .time)
                    .foregroundStyle(.secondary)
            }
            .font(.caption)
        }    }
}

#Preview {
    ListRowView(rowComponents: ToDoComponents(title: "Coding", time: Date(), category: "💻", isDone: false, note: ""))
}
