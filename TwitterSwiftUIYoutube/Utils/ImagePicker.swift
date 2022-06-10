//
//  ImagePicker.swift
//  TwitterSwiftUIYoutube
//
//  Created by DaeSeong on 2022/05/19.
//

import Foundation
import SwiftUI



// 포토라이브러리 선택할때
struct ImagePicker : UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

extension ImagePicker {
    
    // 프로토콜을 채택하는 공간인듯.
    class Coordinator : NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        let parent : ImagePicker
        init(_ parent : ImagePicker){
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else {return}
            
            parent.selectedImage = image
            parent.presentationMode.wrappedValue.dismiss()
            
        }
    }
}
