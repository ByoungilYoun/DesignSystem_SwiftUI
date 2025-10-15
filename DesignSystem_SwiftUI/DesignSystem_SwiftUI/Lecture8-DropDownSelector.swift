//
//  Lecture8-DropDownSelector.swift
//  DesignSystem_SwiftUI
//
//  Created by 윤병일 on 10/16/25.
//

import SwiftUI

struct Lecture8_DropDownSelector: View {
  var body: some View {
    
    VStack {
      Text("Hello, World!")
      
      DropDownSelector(placeholder: "옵션을 선택 해주세요.", options: ["Option1","Option2","Option3"])
        .padding(16)
      
      Text("Hello, World!")
    }
    
  }
}

#Preview {
  Lecture8_DropDownSelector()
}

struct DropDownSelector: View {
  
  @State var selectedOption: String?
  @State var isSelecting: Bool = false
  let placeholder: String
  let options: [String]
  
  var body: some View {
    Button(action: {
      isSelecting.toggle()
    }, label: {
      HStack {
        Text(selectedOption == nil ? placeholder : selectedOption!)
          .foregroundStyle(MyColor.primary)
        Spacer()
        Image(systemName: isSelecting ? "chevron.up" : "chevron.down")
          .foregroundStyle(MyColor.primary)
      }
      .padding()
      .frame(height: 50)
      .background(MyColor.secondary.opacity(0.2))
      .clipShape(RoundedRectangle(cornerRadius: 8))
    })
    .overlay(alignment: .top) {
      if isSelecting {
        VStack(spacing: 0) {
          ForEach(options, id: \.self) { option in
            Button(action: {
              selectedOption = option
              isSelecting = false
            }, label: {
              Text(option)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.white)
                .foregroundStyle(MyColor.primary)
            })
            
            if option != options.last {
              MyDivider(isVertical: false, type: .thin)
            }
          }
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(radius: 5)
        .offset(y: 50)
      }
    }
    .zIndex(.infinity)
  }
}
