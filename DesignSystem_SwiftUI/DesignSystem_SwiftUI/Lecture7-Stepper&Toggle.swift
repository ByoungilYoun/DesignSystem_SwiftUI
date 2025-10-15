//
//  Lecture7-Stepper&Toggle.swift
//  DesignSystem_SwiftUI
//
//  Created by 윤병일 on 10/14/25.
//

import SwiftUI

struct Lecture7_Stepper_Toggle: View {
  var body: some View {
    MyStepper(count: 0, minCount: 0, maxCount: 10)
    
    MyToggle(isOn: false, isEnabled: true)
  }
}

#Preview {
  Lecture7_Stepper_Toggle()
}


struct MyStepper: View {
  
  @State var count: Int
  let minCount: Int
  let maxCount: Int
  
  var canUpStep: Bool {
    return count < maxCount
  }
  
  var canDownStep: Bool {
    return count > minCount
  }
  
  var body: some View {
    HStack(spacing: 12) {
      buildStepButton(
        image: Image(systemName: "minus").renderingMode(.template),
        action: { count -= 1 },
        isEnabled: canDownStep )

      Text(count.description)
        .textStyle(.Body1)
        .foregroundStyle(MyColor.primary)
      
      buildStepButton(
        image: Image(systemName: "plus").renderingMode(.template),
        action: { count += 1 },
        isEnabled: canUpStep )
    }
  }
  
  @ViewBuilder
  func buildStepButton(image: Image, action: @escaping () -> Void, isEnabled: Bool) -> some View {
    
    Button {
      action()
    } label: {
      Circle()
        .stroke(isEnabled ? MyColor.primary : MyColor.secondary)
        .frame(width: 24, height: 24)
        .overlay {
          image
            .foregroundStyle(isEnabled ? MyColor.primary : MyColor.secondary)
        }
    }
    .disabled(!isEnabled)
  }
}


struct MyToggle: View {
  
  @State var isOn: Bool
  let isEnabled: Bool
  
  var body: some View {
    RoundedRectangle(cornerRadius: 16)
      .fill(!isEnabled ? MyColor.secondary : (isOn ? MyColor.accent : MyColor.warn))
      .frame(width: 52, height: 30)
      .overlay {
        Circle()
          .fill(.white)
          .frame(width: 26, height: 26)
          .offset(x: isOn ? 10 : -10)
          .animation(.easeInOut(duration: 0.2), value: isOn)
          .onTapGesture {
            isOn.toggle()
          }
      }
      .disabled(!isEnabled)
  }
}
