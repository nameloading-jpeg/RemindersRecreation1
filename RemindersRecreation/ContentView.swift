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
        NavigationStack {
            VStack {
                HStack {
                    Text(page.title)
                        .font(.system(size: 40))
                    Spacer()
                }
                .bold()
                .foregroundStyle(page.color)
                
                List {
                    ForEach($page.items) { $reminder in
                        ReminderView(isEditing: $isEditing, color: $page.color, reminder: $reminder)
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
                        page.items.append(Reminder(title: "", description: "", date: Date(), isCompleted: false))
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(page.color)
                    }
                }
                .padding()
            }
            .toolbar() {
                ToolbarItem {
                    Button {
                        isEditing = true
                    } label: {
                        Image(systemName: "info.circle")
                    }
                    .foregroundStyle(page.color)
                }
            }
            .padding()
            .sheet(isPresented: $isEditing) {
                EditSheet(title: $page.title, selectedColor: $page.color)
            }
        }
    }
}

struct ReminderView: View {
    @Binding var isEditing: Bool
    @Binding var color: Color
    @Binding var reminder: Reminder
    var body: some View {
        HStack {
            Button {
                reminder.isCompleted.toggle()
            } label: {
                Image(systemName: reminder.isCompleted ? "circle.fill" : "circle")
            }
            .buttonStyle(.borderless)
            TextField("reminder", text: $reminder.title)
                .foregroundStyle(reminder.isCompleted ? .gray : .primary)
            NavigationLink("\(reminder.date, style: .relative)", destination: ReminderDetailView(isEditing: $isEditing, color: $color, title: $reminder.title, description: $reminder.description, date: $reminder.date))
        }
    }

}

#Preview {
    ContentView()
}
