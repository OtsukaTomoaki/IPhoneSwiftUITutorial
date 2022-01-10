//
//  ContentView.swift
//  MyTimer
//
//  Created by 大塚友章 on 2022/01/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            //奥から手前方向にレイアウト
            ZStack {
                //背景画像
                Image("backgroundTimer")
                    .resizable()
                    //セーフエリアを超えて画面全体に配置する
                    .edgesIgnoringSafeArea(.all)
                    //アスペクト比を維持して短辺基準に収まるようにする
                    .aspectRatio(contentMode: .fill)

                //垂直にレイアウト
                VStack(spacing: 30.0) {
                    Text("残り10秒")
                        .font(.largeTitle)
                    
                    //水平にレイアウト（横方向にレイアウト）
                    HStack {
                        //スタートボタン
                        Button(action: {
                            
                        }) {
                            //テキストを表示する
                            Text("スタート")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("StartColor"))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .navigationBarItems(trailing:
                                    NavigationLink(destination: SettingView()){
                //テキストを表示
                Text("秒数設定")
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
