//
//  EffectView.swift
//  MyCamera
//
//  Created by 大塚友章 on 2022/01/16.
//

import SwiftUI

struct EffectView: View {
    //エフェクト編集画面(シート)の表示有無を管理する状態変数
    @Binding var isShowSheet: Bool
    //撮影した写真
    let captureImage: UIImage
    //表示する写真
    @State var showImage: UIImage?
    //表示有無を管理する状態変数
    @State var isShowActivity = false
    
    var body: some View {
        //縦方向にレイアウト
        VStack {
            //スペースを追加
            Spacer()
            
            if let unwrapShowImage = showImage {
                //表示する写真がある場合は画面に表示
                Image(uiImage: unwrapShowImage)
                    //リサイズする
                    .resizable()
                    //アスペクト比を維持して画面内に収まるようにする
                    .aspectRatio(contentMode: .fit)
            }
            
            Spacer()
            //「エフェクト」ボタン
            Button(action: {
                
            }) {
                //テキストを表示する
                Text("エフェクト")
                    //横幅いっぱい
                    .frame(maxWidth: .infinity)
                    //高さ50ポイントを指定
                    .frame(height: 50)
                    //文字列をセンタリング指定
                    .multilineTextAlignment(.center)
                    //背景を青色に指定
                    .background(Color.blue)
                    //文字色を白に指定
                    .foregroundColor(Color.white)
            }
            .padding()
            
            //「シェア」ボタン
            Button(action: {
                
            }) {
                Text("シェア")
                    //横幅いっぱい
                    .frame(maxWidth: .infinity)
                    //高さ50ポイント指定
                    .frame(height: 50)
                    //文字列をセンタリング指定
                    .multilineTextAlignment(.center)
                    //背景を青色に指定
                    .background(Color.blue)
                    //文字色を指定
                    .foregroundColor(Color.white)
            }
            .padding()
        }//VStack
        //写真が表示されるときに実行される
        .onAppear {
            //撮影した写真を表示する写真に設定
            showImage = captureImage
        }
    }
}

struct EffectView_Previews: PreviewProvider {
    static var previews: some View {
        EffectView(
            isShowSheet: Binding.constant(true),
            captureImage: UIImage(named: "preview_use")!
        )
    }
}
