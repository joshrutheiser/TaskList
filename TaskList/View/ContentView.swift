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
                    CompleteButton()
                    TextEditor(text: task.name)
                }
            }
        }
    }
}

struct CompleteButton: View {
    @State private var isChecked = false
    @State private var scale: CGFloat = 1.0

    var body: some View {
        Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
            .resizable()
            .frame(width: 20, height: 20)
            .scaleEffect(scale)
            .onTapGesture {
                // duration values for each animation stage
                let a = 0.5, b = a * 1/3, c = a * 2/3
                
                // stage 1: increase scale
                withAnimation(.linear(duration: b)) {
                    scale = 1.15
                }
                
                // stage 2: fill checkmark
                withAnimation(.linear(duration: 0).delay(b)) {
                    isChecked = true
                }
                
                // haptic feedback
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                
                // stage 3: decrease scale
                withAnimation(.linear(duration: c).delay(b)) {
                    scale = 1
                }
                
                // delay completing task and resetting until after animation
                DispatchQueue.main.asyncAfter(deadline: .now() + a) {
                    isChecked = false
                    // call complete function here
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
