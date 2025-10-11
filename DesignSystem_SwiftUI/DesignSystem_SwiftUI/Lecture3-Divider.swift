//
//  Lecture3-Divider.swift
//  DesignSystem_SwiftUI
//
//  Created by 윤병일 on 10/11/25.
//

import SwiftUI

struct Lecture3_Divider: View {
  var body: some View {
    MyDivider(isVertical: false, type: .thick)
      .padding(.horizontal, 24)
    
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    
    MyDivider(isVertical: false, type: .thin)
      .padding(.horizontal, 24)
    
    HStack {
      MyDivider(isVertical: true, type: .thick)
        .padding(.horizontal, 24)
      
      Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      
      MyDivider(isVertical: true, type: .thin)
        .padding(.horizontal, 24)
    }
    .fixedSize()
  }
}

#Preview {
  Lecture3_Divider()
}

struct MyDivider: View {
  
  var isVertical: Bool
  var type: DividerType
  
  enum DividerType {
    case thick, thin
  }
  
  var body: some View {
    
    if isVertical {
      switch type {
      case .thick:
        Rectangle().fill(MyColor.secondary)
          .frame(width: 10)
      case .thin:
        Rectangle().fill(MyColor.secondary)
          .frame(width: 1)
      }
      
    } else {
      switch type {
      case .thick:
        Rectangle().fill(MyColor.secondary)
          .frame(height: 10)
      case .thin:
        Rectangle().fill(MyColor.secondary)
          .frame(height: 1)
      }
    }
  }
}
