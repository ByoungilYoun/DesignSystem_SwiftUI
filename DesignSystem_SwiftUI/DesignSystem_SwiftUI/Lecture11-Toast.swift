//
//  Lecture11-Toast.swift
//  DesignSystem_SwiftUI
//
//  Created by 윤병일 on 10/16/25.
//

import SwiftUI

struct Lecture11_Toast: View {
  
  @State var count = 0
  
  var body: some View {
    ZStack {
      Color.white
        .onTapGesture {
          ToastManager.shared.showToast(message: "hahaha \(count)")
          count += 1
        }
    }
    .toastView()
  }
}

#Preview {
  Lecture11_Toast()
}


class ToastManager: ObservableObject {
  
  static let shared = ToastManager()
  
  @Published var isVisible: Bool = false
  @Published var message: String = ""
  @Published var duration: TimeInterval = 3.0
  
  private var currentTask: Task<Void, Never>?
  
  private init() { }
  
  func showToast(message: String, duration: TimeInterval = 3.0) {
    self.message = message
    self.duration = duration
    
    withAnimation {
      isVisible = true
    }

    currentTask?.cancel()
    currentTask = Task {
      do {
        try await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
        
        if Task.isCancelled {
          return
        }
        
        withAnimation {
          self.isVisible = false
        }
      } catch {
        return
      }
    }
  }
  
  func hideToast() {
    currentTask?.cancel()
    currentTask = nil
    isVisible = false
  }
}


struct Toast: ViewModifier {
  @ObservedObject var toastManager = ToastManager.shared
  
  func body(content: Content) -> some View {
    content
      .overlay(alignment: .bottom) {
        if toastManager.isVisible {
          HStack(spacing: 8) {
            Text(toastManager.message)
              .textStyle(.Body1)
              .foregroundStyle(.white)
              .multilineTextAlignment(.leading)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.vertical, 14)
          }
          .padding(.horizontal, 16)
          .background(MyColor.dim)
          .clipShape(RoundedRectangle(cornerRadius: 8))
          .transition(.move(edge: .bottom).combined(with: .opacity)) // 밑에서 위로 올라오는 애니메이션
          .padding(.horizontal, 20)
          .onTapGesture {
            toastManager.hideToast()
          }
        }
      }
  }
}

extension View {
  func toastView() -> some View {
    modifier(Toast())
  }
}
