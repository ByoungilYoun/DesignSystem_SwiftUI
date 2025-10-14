//
//  Lecture6-TextEditor.swift
//  DesignSystem_SwiftUI
//
//  Created by 윤병일 on 10/14/25.
//

import SwiftUI

struct Lecture6_TextEditor: View {
  
  @State var text: String
  
  var body: some View {
    MyTextEditor(label: "Label", placeholder: "placeholder", description: "description", limitTextCount: 100, text: $text, isEnabled: true, isFocus: false, isRequired: true)
      .padding(50)
  }
}

#Preview {
  Lecture6_TextEditor(text: "")
}

struct MyTextEditor: View {
  
  let label: String?
  let placeholder: String?
  let description: String?
  
  let limitTextCount: Int
  
  @Binding var text: String
  @State var errorText: String?
  @FocusState var focus: Bool
  
  var isEnabled: Bool
  var isFocus: Bool
  var isRequired: Bool
  
  
  
  
  var body: some View {
    VStack(spacing: 8) {
      
      buildLabel(label: label, isRequired: isRequired)
      
      TextEditor(text: Binding(get: {
        text
      }, set: {
        if $0.count > limitTextCount {
          text = String($0.prefix(limitTextCount))
          self.errorText = "최대 \(limitTextCount)자까지 입력 가능해요."
        } else {
          text = $0
          self.errorText = nil
        }
      }))
      .focused($focus)
      .padding(.horizontal, 12)
      .padding(.top, 10)
      .padding(.bottom, 34)
      .disabled(!isEnabled)
      .background(alignment: .topLeading) {
        buildPlaceholder(placeholder: placeholder, text: text)
      }
      .textStyle(.Body1)
      .textInputAutocapitalization(.none)
      .autocorrectionDisabled()
      .background(isEnabled ? .white : .secondary)
      .clipShape(RoundedRectangle(cornerRadius: 8))
      .foregroundStyle(MyColor.primary)
      .frame(minHeight: 75, maxHeight: 115)
      .scrollContentBackground(.hidden)
      .overlay(alignment: .bottomTrailing) {
        buildTextCount(textCount: text.count, limitTextCount: limitTextCount)
      }
      .overlay {
        RoundedRectangle(cornerRadius: 8)
          .stroke(borderColor(isEnabled: isEnabled, errorText: errorText), lineWidth: 1)
      }
      
      buildDescription(errorText: errorText, description: description)
    }
    .onAppear {
      if isEnabled && isFocus {
        focus = true
      }
    }
    
  }
  
  @ViewBuilder
  func buildLabel(label: String?, isRequired: Bool) -> some View {
    if let label = label {
      HStack(alignment: .center, spacing: 4, content: {
        Text(label)
          .textStyle(.Heading1)
          .foregroundStyle(MyColor.primary)
        
        if isRequired {
          Text("*")
            .textStyle(.Heading1)
            .foregroundStyle(MyColor.primary)
        }
        
        Spacer()
      })
    }
  }
  
  @ViewBuilder
  func buildPlaceholder(placeholder: String?, text: String) -> some View {
    if let placeholder = placeholder, text.isEmpty {
      Text(placeholder)
        .textStyle(.Body1)
        .foregroundStyle(MyColor.secondary)
        .padding(.horizontal, 16)
        .padding(.top, 20)
    }
  }
  
  @ViewBuilder
  func buildTextCount(textCount: Int, limitTextCount: Int) -> some View {
    Text("\(textCount)/\(limitTextCount)")
      .textStyle(.Caption1)
      .foregroundStyle(MyColor.secondary)
      .padding(.trailing, 15)
      .padding(.bottom, 15)
  }
  
  @ViewBuilder
  func buildDescription(errorText: String?, description: String?) -> some View {
    if let errorText = errorText {
      Text(errorText)
        .textStyle(.Caption1)
        .foregroundStyle(.red)
        .frame(maxWidth: .infinity, alignment: .leading)
    } else if let description = description {
      Text(description)
        .textStyle(.Caption1)
        .foregroundStyle(MyColor.secondary)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
  
  func borderColor(isEnabled: Bool, errorText: String?) -> Color {
    if isEnabled == false {
      return MyColor.secondary
    } else if errorText != nil {
      return .red
    } else {
      return MyColor.primary
    }
  }
  
}
