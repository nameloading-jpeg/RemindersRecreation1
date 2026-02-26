//
//  ContentView.swift
//  RemindersRecreation
//
//  Created by Mia Sundman on 2/26/26.
//
import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    // TODO: Add an @State property to hold a RemindersPage struct
    @State private var page: RemindersPage = RemindersPage(title: "To-Do", items: [], color: .white)
    
    var body: some View {
        VStack {
            HStack {
                Text(page.title)
                    .font(.system(size: 50))
                Spacer()
                Image(systemName: "info.circle")
                    .font(.title)
            }
            .bold()
            List {
                ForEach($page.items) { $reminder in
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            
            // TODO: Add footer view

        }
        .padding()
        .sheet(isPresented: $isEditing) {
            // TODO: Add remaining binding
//            EditSheet(selectedColor: /* page color */)
        }
    }
}

#Preview {
    ContentView()
}
