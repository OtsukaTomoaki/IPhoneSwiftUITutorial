//
//  ContentView.swift
//  MyCamera
//
//  Created by 大塚友章 on 2022/01/11.
//

import SwiftUI

struct ContentView: View {
    //撮影する写真を保持する状態変数
    @State var captureImage: UIImage? = nil
    //撮影画面のsheet
    @State var isShowSheet = false
    //シェア画面のsheet
    @State var isShowActivity = false
    //フォトライブラリかカメラか保持する状態変数
    @State var isPhotolibrary = false
    //ActionSheetのsheet
    @State var isShowAction = false

    var body: some View {
        VStack {
            //スペース追加
            Spacer()
            //カメラを起動するボタン
            Button(action: {
                captureImage = nil
                isShowAction = true
            }) {
                //テキストを表示
                Text("カメラを起動する")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()
            //sheetを表示
            //.isPresentedで指定した状態変数がtrueのとき実行
            .sheet(isPresented: $isShowSheet) {
                if let unwrapCaptureImage = captureImage {
                    EffectView(
                    isShowSheet: $isShowSheet, captureImage: unwrapCaptureImage)
                } else {
                    //フォトライブラリが選択された
                    if isPhotolibrary {
                        //PHPickerViewController(フォトライブラリ)を表示
                        PHPickerView(
                            isShowSheet: $isShowSheet,
                            captureImage: $captureImage
                        )
                    } else {
                        //UIImagePickerController（写真撮影）をsheetに表示
                        ImagePickerView(
                            isShowSheet: $isShowSheet,
                            captureImage: $captureImage)
                    }
                }
            }
            //状態変数:$isShowActionに変化があったら実行
            .actionSheet(isPresented: $isShowAction) {
                //ActionSheetを表示する
                ActionSheet(title: Text("確認"),
                            message: Text("選択してください"),
                            buttons: [
                                .default(Text("カメラ"), action: {
                                    //カメラを選択
                                    isPhotolibrary = false
                                    //カメラが利用可能かチェック
                                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
                                        print("カメラは利用できます")
                                        isShowSheet = true
                                    } else {
                                        print("カメラは利用できません")
                                    }
                                }),
                                .default(Text("フォトライブラリー"), action: {
                                    //カメラを選択
                                    isPhotolibrary = true
                                    isShowSheet = true
                                }),
                            .cancel(),])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
