//
//  Lecture1-Text.swift
//  DesignSystem_SwiftUI
//
//  Created by 윤병일 on 10/9/25.
//

import SwiftUI

struct Lecture1: View {
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      .textStyle(.Title1)
    
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      .textStyle(.Body1)
    
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      .textStyle(.Caption1)
    
    TitleText(text: "Title")
    HeadingText(text: "Heading")
    BodyText(text: "Body")
    CaptionText(text: "caption")
    
  }
}

#Preview {
  Lecture1()
}

// 방법 1
struct TextStyle: ViewModifier {
  var style: Style
  
  func body(content: Content) -> some View {
    content
      .font(Font(style.font))
  }
  
  enum Style {
    case Title1
    case Heading1
    case Body1
    case Caption1
    
    var font: UIFont {
      switch self {
      case .Title1:
        return .boldSystemFont(ofSize: 15)
      case .Heading1:
        return .boldSystemFont(ofSize: 13)
      case .Body1:
        return .systemFont(ofSize: 13)
      case .Caption1:
        return .systemFont(ofSize: 8)
      }
    }
  }
}

extension View {
  
  func textStyle(_ style: TextStyle.Style) -> some View {
    modifier(TextStyle(style: style))
  }
}


// 방법 2
struct TitleText: View {
  
  var text: String
  
  var body: some View {
    Text(text)
      .font(.system(size: 15, weight: .bold))
  }
}

struct HeadingText: View {
  
  var text: String
  
  var body: some View {
    Text(text)
      .font(.system(size: 13, weight: .bold))
  }
}

struct BodyText: View {
  
  var text: String
  
  var body: some View {
    Text(text)
      .font(.system(size: 13, weight: .regular))
  }
}

struct CaptionText: View {
  
  var text: String
  
  var body: some View {
    Text(text)
      .font(.system(size: 8, weight: .bold))
  }
}
