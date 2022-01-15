//
//  ImagePickerView.swift
//  MyCamera
//
//  Created by 大塚友章 on 2022/01/11.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        //UIImagePickerControllerのインスタンスを生成
        let myImagePickerController = UIImagePickerController()
        //sourceTypeにcameraを設定
        myImagePickerController.sourceType = .camera
        //delegate設定
        myImagePickerController.delegate = context.coordinator
        //UIImagePickerControllerを返す
        return myImagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    typealias UIViewControllerType = UINavigationController
    //UIImagePickerController（写真撮影）が表示されているか
    @Binding var isShowSheet: Bool
    //撮影した写真
    @Binding var captureImage: UIImage?
    
    //Coordinatorでコントローラのdelegateを管理
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        //ImagePickerView型の変数を用意
        let parent: ImagePickerView
        
        //イニシャライザ
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
        //撮影が終わったときに呼ばれるdelegateメソッド、必ず必要
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            //撮影した写真をcaptureImageに保存
            if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.captureImage = originalImage
            }
            //sheetを閉じる
            parent.isShowSheet = false
        }
        
        //キャンセルボタンを選択されたときに呼ばれる
        //delegateメソッド、必ず実装
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            //sheetを閉じる
            parent.isShowSheet = false
        }
    }
}


