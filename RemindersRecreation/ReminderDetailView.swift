//
//  ReminderDetailView.swift
//  RemindersRecreation
//
//  Created by Mia Sundman on 3/23/26.
//
import SwiftUI

struct ReminderDetailView: View {
    @Binding var isEditing: Bool
    @Binding var color: Color
    @Binding var title: String
    @Binding var description: String
    @Binding var date: Date
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            VStack {
                Text(title)
                    .padding(20)
                HStack {
                    Text("Title & Description")
                        .bold()
                        .foregroundStyle(color)
                    Spacer()
                }
                .padding(.horizontal)
                VStack(spacing: 0) {
                    HStack {
                        Text("Title")
                        TextField("Enter title", text: $title)
                    }
                    .padding()
                    Divider()
                        .padding(.horizontal)
                    HStack {
                        Text("Description")
                        TextField("Enter description", text: $description)
                    }
                    .padding()
                }
                .background(Color(.white))
                .clipShape(RoundedRectangle(cornerRadius: 28))
                Text(" ")
                HStack {
                    Text("Title & Description")
                        .bold()
                        .foregroundStyle(color)
                    Spacer()
                }
                .padding(.horizontal)
                HStack {
                    DatePicker(
                        "Start Date",
                        selection: $date,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                }
                .padding()
                .background(Color(.white))
                .clipShape(RoundedRectangle(cornerRadius: 28))
                Spacer()
            }
            .toolbar() {
                ToolbarItem {
                    Button {
                        isEditing = true
                    } label: {
                        Image(systemName: "info.circle")
                    }
                    .foregroundStyle(color)
                }
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .padding()
            .sheet(isPresented: $isEditing) {
                EditSheet(title: $title, selectedColor: $color)
            }
        }
    }
}

#Preview {
    ContentView()
}
