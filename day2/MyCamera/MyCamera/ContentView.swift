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

    var body: some View {
        VStack {
            //スペース追加
            Spacer()
            //撮影した写真があるとき
            if let unwrapCaptureImage = captureImage {
                //撮影した写真を表示
                Image(uiImage: unwrapCaptureImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            //スペース追加
            Spacer()
            //カメラを起動するボタン
            Button(action: {
                //カメラが利用可能かチェック
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    print("カメラは利用できます")
                    isShowSheet = true
                    
                } else {
                    print("カメラは利用できません")
                }
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
                //UIImagePickerController（写真撮影）をsheetに表示
                ImagePickerView(
                    isShowSheet: $isShowSheet,
                    captureImage: $captureImage)
            }
            
            //「SNSに投稿する」ボタン
            Button(action: {
                //撮影した写真があるときだけ
                //UIActivityViewController（シェア機能）を表示
                if let _ = captureImage {
                    isShowActivity = true
                }
            }) {
                Text("SNSに投稿する")
                    .frame(maxWidth: .infinity)
                    //高さ50ポイントを指定
                    .frame(height: 50)
                    //文字をセンタリング指定
                    .multilineTextAlignment(.center)
                    //背景を青色に指定
                    .background(Color.blue)
                    //文字色を白色に指定
                    .foregroundColor(Color.white)
            }
            .padding()
            //isPresentedで指定した状態変数がtrueのときだけ実行
            .sheet(isPresented: $isShowActivity) {
                ActivityView(shareItems: [captureImage!])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
