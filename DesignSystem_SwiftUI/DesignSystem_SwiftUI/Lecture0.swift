//
//  Lecture0.swift
//  DesignSystem_SwiftUI
//
//  Created by 윤병일 on 10/9/25.
//

// SwiftUI 대부분의 뷰들은 wrapping(감싸듯 딱 맞는 크기로) 되고 center 정렬 되는 성질을 가지고 있다.
// SwiftUI 에서는 Stack 뷰들은 default 로 8 의 spacing 이 있다.
// Color 는 부모뷰를 가득 채우는 속성이 있다.

import SwiftUI

struct Lecture0: View {
  var body: some View {
    HStack {
      Text("Hello, World!")
        .background(.yellow)
      Text("Hello, World! 2")
        .background(.blue)
    }
    .background(.red)
    .frame(width: 350, height: 100)
    .background(.green)
    
  }
}

#Preview {
  Lecture0()
}
