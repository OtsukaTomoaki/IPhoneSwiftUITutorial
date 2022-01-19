//
//  ContentView.swift
//  MyOkashi
//
//  Created by 大塚友章 on 2022/01/19.
//

import SwiftUI

struct ContentView: View {
    //OkashiDataを参照する状態変数
    @ObservedObject var okashiDataList = OkashiData()
    //入力された文字列を保持する状態変数
    @State var inputText = ""
    
    var body: some View {
        //垂直にレイアウト
        VStack {
            //文字を受け取るTextFieldを表示する
            TextField("キーワードを入力してください", text: $inputText, onCommit: {
                //入力完了直後に検索する
                okashiDataList.searchOkashi(keyword: inputText)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
