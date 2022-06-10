//
//  CustomInputField.swift
//  TwitterSwiftUIYoutube
//
//  Created by DaeSeong on 2022/04/03.
//

import SwiftUI

struct CustomInputField: View {
    let imageName : String
    let placeholderText: String
    var isSecureField : Bool? = false
    @Binding var text: String

    var body: some View {
        
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecureField ?? false {
                    SecureField(placeholderText, text: $text)
                }else {
                    TextField(placeholderText, text: $text)
                }
                
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope", placeholderText: "Email", isSecureField : false, text: .constant(""))
    }
}
