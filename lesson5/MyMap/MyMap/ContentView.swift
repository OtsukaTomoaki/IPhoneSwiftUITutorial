//
//  ContentView.swift
//  MyMap
//
//  Created by 大塚友章 on 2022/01/09.
//

import SwiftUI

struct ContentView: View {
    //入力中の文字列を保持する状態変数
    @State var inputText: String = ""
    //検索キーワードを保持する状態変数
    @State var dispSearchKey: String = ""

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
            MapView(searchKey: dispSearchKey)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
