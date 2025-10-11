//
//  Lecture4-ProgressBar.swift
//  DesignSystem_SwiftUI
//
//  Created by 윤병일 on 10/12/25.
//

// GeometryReader : 부모뷰의 크기를 자식뷰에게 전달해주는 컨테이너 뷰

import SwiftUI

struct Lecture4_ProgressBar: View {
  var body: some View {
    ProgressBar(progress: 0.1)
      .frame(width: 100)
    ProgressBar(progress: 0.5)
      .frame(width: 100)
    ProgressBar(progress: 0.7)
      .frame(width: 100)
    ProgressBar(progress: 1.0)
      .frame(width: 100)
  }
}

#Preview {
  Lecture4_ProgressBar()
}

struct ProgressBar: View {
  
  var progress: CGFloat
  
  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        RoundedRectangle(cornerRadius: 3)
          .frame(width: geometry.size.width)
          .foregroundStyle(MyColor.secondary)
        
        RoundedRectangle(cornerRadius: 3)
          .frame(width: progress * geometry.size.width)
          .foregroundStyle(MyColor.accent)
      }
    }
    .frame(height: 6)
  }
  
}
