//
//  ContentView.swift
//  RemindersRecreation
//
//  Created by Mia Sundman on 2/26/26.
//
import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    @State private var page: RemindersPage = RemindersPage(title: "To-Do", items: [], color: .red)
    
    var body: some View {
        VStack {
            HStack {
                Text(page.title)
                    .font(.system(size: 40))
                Spacer()
                Button {
                    isEditing = true
                } label: {
                    Image(systemName: "info.circle")
                }
            }
            .bold()
            .foregroundStyle(page.color)
            
            List {
                ForEach($page.items) { $reminder in
                    ReminderView(reminder: $reminder)
                        .foregroundStyle(page.color)
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            
            HStack {
                Spacer()
                Button {
                    page.items.append(Reminder(title: "", isCompleted: false))
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(page.color)
                }
            }
            .padding()
        }
        .padding()
        .sheet(isPresented: $isEditing) {
            EditSheet(title: $page.title, selectedColor: $page.color)
        }
    }
}

struct ReminderView: View {
    @Binding var reminder: Reminder
    var body: some View {
        HStack {
            Button {
                reminder.isCompleted.toggle()
            } label: {
                Image(systemName: reminder.isCompleted ? "circle.fill" : "circle")
            }
            TextField("reminder", text: $reminder.title)
                .foregroundStyle(reminder.isCompleted ? .gray : .primary)
        }
    }

}

#Preview {
    ContentView()
}
