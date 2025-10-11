//
//  Lecture2.swift
//  DesignSystem_SwiftUI
//
//  Created by 윤병일 on 10/9/25.
//

import SwiftUI

struct Lecture2: View {
  var body: some View {
    Chip(text: "칩칩칩칩", isSelected: false)
    Chip(text: "칩칩칩칩", isSelected: true)
  }
}

#Preview {
  Lecture2()
}

struct Chip: View {
  
  var text: String
  var isSelected: Bool
  
  var body: some View {
    HStack(spacing: 4) {
      
      if isSelected {
        Image(uiImage: .checkmark)
          .resizable()
          .renderingMode(.template)
          .foregroundStyle(.blue)
          .frame(width: 16, height: 16)
      }
      
      Text(text)
        .textStyle(.Body1)
        .foregroundStyle(.white)
    }
    .padding(10)
    .background(.accent)
    .clipShape(RoundedRectangle(cornerRadius: 16))
  }
}
