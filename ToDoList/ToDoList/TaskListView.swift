//
//  TaskListView.swift
//  ToDoList
//
//  Created by Shine Wai Lu on 12/6/24.
//

import SwiftUI
import SwiftData


struct TaskListView: View {
    
    @Environment(\.modelContext) private var modelContext

    @Query() private var toDoComponents: [ToDoComponents]
    
    
    var body: some View {
        ScrollView{
            List(toDoComponents){ taskList in
                ListRowView(rowComponents: taskList)
            }
            .scrollContentBackground(.hidden)
        }
        
        
    }
}

#Preview {
    TaskListView().modelContainer(for: ToDoComponents.self, inMemory: true )
}
