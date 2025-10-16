//
//  Lecture10-Loading.swift
//  DesignSystem_SwiftUI
//
//  Created by 윤병일 on 10/16/25.
//

import SwiftUI

struct Lecture10_Loading: View {
  
  @State var isShowing: Bool = true
  
  var body: some View {
    VStack {
      Text("HaHa")
        .onTapGesture {
          isShowing.toggle()
        }
      
      Color.red
        .frame(width: 200, height: 200)
        .isLoading(isShowing: isShowing)
    }
//    .isLoading(isShowing: isShowing)
  }
}

#Preview {
  Lecture10_Loading()
}

struct Loading: ViewModifier {
  
  var isShowing: Bool
  
  func body(content: Content) -> some View {
    content
      .overlay {
        if isShowing {
          ZStack {
            Color.white.opacity(0.5)
            ProgressView()
              .progressViewStyle(.circular)
              .tint(.red)
          }
          .transition(.opacity.animation(.easeInOut(duration: 0.5)))
        }
      }
  }
  
}

extension View {
  func isLoading(isShowing: Bool) -> some View {
    self.modifier(Loading(isShowing: isShowing))
  }
}
