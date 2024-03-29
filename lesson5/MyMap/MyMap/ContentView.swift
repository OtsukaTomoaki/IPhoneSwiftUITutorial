//
//  ContentView.swift
//  MyMap
//
//  Created by 大塚友章 on 2022/01/09.
//

import SwiftUI
import MapKit

struct ContentView: View {
    //入力中の文字列を保持する状態変数
    @State var inputText: String = ""
    //検索キーワードを保持する状態変数
    @State var dispSearchKey: String = ""
    //マップ種類の最初は標準から
    @State var dispMapType: MKMapType = .standard
    
    var body: some View {
        //垂直にレイアウト（縦方向にレイアウト）
        VStack {
            //テキストフィールド
            TextField("キーワードを入力してください。", text: $inputText, onCommit: {
                //入力が完了したので検索キーワードに設定する
                dispSearchKey = inputText
                //検索キーワードをデバックエリアに出力する
                print("検索キーワード；" + dispSearchKey)
            })
            .padding()
            
            //奥から手前方向にレイアウト（右下基準で配置する）
            ZStack(alignment: .bottomTrailing) {
                MapView(searchKey: dispSearchKey, mapType: dispMapType)
                //マップ種類切り替えボタン
                Button(action: {
                    //mapuTypeプロパティをトグル
                    //標準　→ 航空写真　→ 航空写真+標準
                    //→　3D Flyover →　3D Flyover+標準
                    //→ 交通機関
                    if dispMapType == .standard {
                        dispMapType = .satellite
                    } else if dispMapType == .satellite {
                        dispMapType = .hybrid
                    } else if dispMapType == .hybrid {
                        dispMapType = .satelliteFlyover
                    } else if dispMapType == .satelliteFlyover {
                        dispMapType = .hybridFlyover
                    } else if dispMapType == .hybridFlyover {
                        dispMapType = .mutedStandard
                    } else {
                        dispMapType = .standard
                    }
                    print(dispMapType.rawValue)
                }) {
                    //マップアイコンを表示
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0, alignment: .leading)
                }
                .padding(.trailing, 20.0)
                .padding(.bottom, 30.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
