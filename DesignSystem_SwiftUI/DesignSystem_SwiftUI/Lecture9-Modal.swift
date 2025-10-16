//
//  Lecture9-Modal.swift
//  DesignSystem_SwiftUI
//
//  Created by 윤병일 on 10/16/25.
//

import SwiftUI

struct Lecture9_Modal: View {
  
  @State var isPresented: Bool = false
  
  var body: some View {
    ZStack {
      MyButton(
        size: .large,
        style: .solid,
        text: "모달",
        didTap: { isPresented = true },
        isEnabled: true
      )
      .padding()
      
      if isPresented {
        Modal(
          title: "제목",
          description: "asdfasdfasdfasdfasfasdfasfasdf5",
          leftButtonTitle: "취소",
          rightButtonTitle: "확인",
          leftButtonAction: { isPresented = false },
          rightButtonAction: { isPresented = false },
          backgroundTapAction: { isPresented = false },
          contents: EmptyView()
        )
      }
    }
  }
}

#Preview {
  Lecture9_Modal()
}

struct Modal<Contents: View>: View {
  
  let title: String
  let description: String
  let leftButtonTitle: String
  let rightButtonTitle: String
  
  var leftButtonAction: () -> Void
  var rightButtonAction: () -> Void
  var backgroundTapAction: () -> Void
  
  var contents: Contents?
  
  init(title: String,
       description: String,
       leftButtonTitle: String = "취소",
       rightButtonTitle: String = "확인",
       leftButtonAction: @escaping () -> Void = { },
       rightButtonAction: @escaping () -> Void = { },
       backgroundTapAction: @escaping () -> Void = { },
       contents: Contents
  ) {
    self.title = title
    self.description = description
    self.leftButtonTitle = leftButtonTitle
    self.rightButtonTitle = rightButtonTitle
    self.leftButtonAction = leftButtonAction
    self.rightButtonAction = rightButtonAction
    self.backgroundTapAction = backgroundTapAction
    self.contents = contents
  }
  
  var body: some View {
    ZStack {
      MyColor.dim
        .onTapGesture {
          backgroundTapAction()
        }
      
      VStack(spacing: 20) {
        Text(title)
          .textStyle(.Title1)
          .lineLimit(1)
        
        Text(description)
          .textStyle(.Body1)
          .multilineTextAlignment(.center)
        
        // 넣고 싶은 content view 가 있을때 자동으로 넣어질 수 있도록
        if let contents {
          contents
        }
        
        HStack(spacing: 16) {
          MyButton(
            size: .medium,
            style: .outline,
            text: leftButtonTitle,
            didTap: { leftButtonAction() },
            isEnabled: true
          )
          
          MyButton(
            size: .medium,
            style: .solid,
            text: rightButtonTitle,
            didTap: { rightButtonAction() },
            isEnabled: true
          )
        }
      }
      .padding(24)
      .background(.white)
      .clipShape(RoundedRectangle(cornerRadius: 16))
      .shadow(radius: 10)
      .padding(.horizontal, 40)
    }
    .ignoresSafeArea()
  }
}
