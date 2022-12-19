//
//  ContentView.swift
//  TaskList
//
//  Created by Josh Rutheiser on 12/18/22.
//

import SwiftUI

struct Task: Identifiable {
    let id: UUID
    var name: String
}

struct ContentView: View {
    
    @State private var tasks = [
        Task(id: UUID(), name: "Task 1"),
        Task(id: UUID(), name: "Task 2"),
        Task(id: UUID(), name: "Task 3")
    ]
    
    var body: some View {
        List {
            ForEach($tasks, id: \.id) { task in
                HStack {
                    Circle()
                        .strokeBorder(.black)
                        .frame(width: 20, height: 20)
                    TextEditor(text: task.name)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
} 
