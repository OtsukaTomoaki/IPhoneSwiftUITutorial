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
    //SafariViewの表示有無を管理する変数
    @State var showSafari = false

    var body: some View {
        //垂直にレイアウト
        VStack {
            //文字を受け取るTextFieldを表示する
            TextField("キーワードを入力してください", text: $inputText, onCommit: {
                //入力完了直後に検索する
                okashiDataList.searchOkashi(keyword: inputText)
            })
            .padding()
            
            //リストを表示する
            List(okashiDataList.okashiList) { okashi in
                Button(action: {
                    showSafari.toggle()
                }) {
                    //okashiに要素を取り出してListを生成する
                    //水平にレイアウト
                    HStack {
                        //画像を表示する
                        Image(uiImage: okashi.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 40)
                        //テキストを表示する
                        Text(okashi.name)
                    }
                }
                .sheet(isPresented: self.$showSafari, content: {
                    //SafariViewを表示する
                    SafariView(url: okashi.link)
                        //画面かぶをいっぱいになるようにセーフエリア外までいっぱいになるように指定
                        .edgesIgnoringSafeArea(.bottom)
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
