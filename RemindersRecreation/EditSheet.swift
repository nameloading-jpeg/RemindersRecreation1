//
//  EditSheet.swift
//  RemindersRecreation
//
//  Created by Mia Sundman on 2/26/26.
//
import SwiftUI

struct EditSheet: View {
    // TODO: Add title binding
    @Binding var selectedColor: Color
    
    var body: some View {
        VStack(spacing: 20) {
                // TODO: Add list.bullet.circle.fill icon and TextField
            
            ColorChooser(selectedColor: $selectedColor)
            
            Spacer()
        }
        .foregroundStyle(selectedColor)
        .padding()
    }
}

#Preview {
    @Previewable @State var selectedColor: Color = .red
    
    EditSheet(selectedColor: $selectedColor)
        .preferredColorScheme(.dark)
}
