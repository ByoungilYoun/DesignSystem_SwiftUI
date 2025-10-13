//
//  Lecture5-Button.swift
//  DesignSystem_SwiftUI
//
//  Created by 윤병일 on 10/13/25.
//

import SwiftUI

struct Lecture5_Button: View {
  var body: some View {
    
    MyButton(size: .large, style: .solid, text: "버튼 1", didTap: {
      print("탭!")
    }, isEnabled: true)
    
    MyButton(size: .large, style: .solid, text: "버튼 2", didTap: {
      print("탭!")
    }, isEnabled: false)
    
    MyButton(size: .large, style: .outline, text: "버튼 3", didTap: {
      print("탭!")
    }, isEnabled: true)
    
    MyButton(size: .large, style: .outline, text: "버튼 4", didTap: {
      print("탭!")
    }, isEnabled: false)
    
    MyButton(size: .medium, style: .outline, text: "버튼 4", didTap: {
      print("탭!")
    }, isEnabled: false)
    .frame(width: 100)
    
    MyButton(size: .small, style: .outline, text: "버튼 4", didTap: {
      print("탭!")
    }, isEnabled: false)
    .frame(width: 50)
  }
}

#Preview {
  Lecture5_Button()
}

struct MyButton: View {
  
  var size: Size
  var style: BtnStyle
  
  var text: String
  var didTap: () -> Void
  var isEnabled: Bool
  
  var body: some View {
    Button {
      didTap()
    } label: {
      HStack(alignment: .center) {
        Text(text)
          .textStyle(size.textStyle)
          .foregroundStyle(style.foregroundColor(isEnabled: isEnabled))
          .frame(maxWidth: .infinity, alignment: .center)
      }
      .frame(height: size.height)
      .background(style.backgroundColor(isEnabled: isEnabled))
      .clipShape(RoundedRectangle(cornerRadius: size.cornerRadius))
      .overlay {
        style.border(btnSize: size, isEnabled: isEnabled)
      }
    }
    .disabled(!isEnabled)

  }
  
  enum Size {
    case large, medium, small
    
    var textStyle: TextStyle.Style {
      switch self {
      case .large: return .Title1
      case .medium: return .Heading1
      case .small: return .Body1
      }
    }
    
    var cornerRadius: CGFloat {
      switch self {
      case .large: return 8
      case .medium: return 6
      case .small: return 3
      }
    }
    
    var height: CGFloat {
      switch self {
      case .large: return 56
      case .medium: return 40
      case .small: return 24
      }
    }

  }
  
  enum BtnStyle {
    case solid, outline
    
    func backgroundColor(isEnabled: Bool) -> Color {
      switch self {
      case .solid:
        if isEnabled {
          return MyColor.primary
        } else {
          return MyColor.secondary
        }
      case .outline:
        return .white
      }
    }
    
    func border(btnSize: Size, isEnabled: Bool) -> AnyView {
      guard self == .outline else {
        return AnyView(EmptyView())
      }
      
      if isEnabled {
        return AnyView(RoundedRectangle(cornerRadius: btnSize.cornerRadius).stroke(MyColor.primary ,lineWidth: 1))
      } else {
        return AnyView(RoundedRectangle(cornerRadius: btnSize.cornerRadius).stroke(MyColor.secondary ,lineWidth: 1))
      }
    }
    
    func foregroundColor(isEnabled: Bool) -> Color {
      switch self {
      case .solid: return .white
      case .outline:
        if isEnabled {
          return .primary
        } else {
          return .secondary
        }
      }
    }
  }
}
