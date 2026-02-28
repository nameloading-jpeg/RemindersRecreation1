//
//  EditSheet.swift
//  RemindersRecreation
//
//  Created by Mia Sundman on 2/26/26.
//
import SwiftUI

struct EditSheet: View {
    @Binding var title: String
    @Binding var selectedColor: Color
    
    var body: some View {
        VStack(spacing: 20) {
            Text("List Info")
                .font(.title2)
                .padding(.top, 20)
            VStack {
                Image(systemName: "list.bullet.circle.fill")
                    .font(.system(size: 100))
                TextField("name", text: $title)
                    .bold()
                    .padding()
                    .background(Color(.systemGray5), in: RoundedRectangle(cornerRadius: 8))
            }
            .padding()
            .background(Color(.systemGray6), in: RoundedRectangle(cornerRadius: 8))
            
            ColorChooser(selectedColor: $selectedColor)
            
            Spacer()
        }
        .foregroundStyle(selectedColor)
        .padding(20)
    }
}

#Preview {
    ContentView()
}
