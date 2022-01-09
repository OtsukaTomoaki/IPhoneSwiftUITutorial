//
//  ContentView.swift
//  MyMusic
//
//  Created by 大塚友章 on 2022/01/08.
//

import SwiftUI

struct ContentView: View {
    let soundPlayer = SoundPlayer()
    var body: some View {
        ZStack {
            //背景画像を指定する
            Image("background")
                .resizable()
                //画面いっぱいになるようにセーフエリア外までいっぱいになるように指定
                .edgesIgnoringSafeArea(.all)
                //アスペクト比(縦横比)を維持して短辺基準に収まるようにする
                .aspectRatio(contentMode: .fill)
            //水平にレイアウト
            HStack {
                //シンバルボタン
                Button(action: {
                    //ボタンをタップした時のアクション
                    //シンバルの音を鳴らす
                    soundPlayer.cymbalPlay()
                }) {
                    //画像を表示する
                    ButtonImageView(imageName: "cymbal")
                }
                //ギターボタン
                Button(action: {
                    //ボタンをタップした時のアクション
                    //ギターの音を鳴らす
                    soundPlayer.guitarPlay()
                }) {
                    //画像を表示する
                    ButtonImageView(imageName: "guitar")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
