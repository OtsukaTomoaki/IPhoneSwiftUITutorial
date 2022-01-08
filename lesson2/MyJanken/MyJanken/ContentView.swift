//
//  ContentView.swift
//  MyJanken
//
//  Created by 大塚友章 on 2022/01/08.
//

import SwiftUI

struct ContentView: View {
    @State var answerNumber = 0
    var body: some View {
        VStack {
            Spacer()
            //ジャンケンの数字が０だったら
            if answerNumber == 0 {
                Text("これからジャンケンをします")
                    .padding(.bottom)
            } else if answerNumber == 1 {
                Image("gu")
                    //リサイズを指定
                    .resizable()
                    //画面内に収まるように、アスペクト比（縦横比）を維持する指定
                    .aspectRatio(contentMode: .fit)
                Spacer()
                //ジャンケンの種類を指定
                Text("グー")
                    .padding(.bottom)
            } else if answerNumber == 2 {
                Image("choki")
                    //リサイズを指定
                    .resizable()
                    //画面内に収まるように、アスペクト比（縦横比）を維持する指定
                    .aspectRatio(contentMode: .fit)
                Spacer()
                //ジャンケンの種類を指定
                Text("チョキ")
                    .padding(.bottom)
            } else {
                Image("pa")
                    //リサイズを指定
                    .resizable()
                    //画面内に収まるように、アスペクト比（縦横比）を維持する指定
                    .aspectRatio(contentMode: .fit)
                Spacer()
                //ジャンケンの種類を指定
                Text("パー")
                    .padding(.bottom)
            }
            
            Button(action: {
                print("タップされたよ!")
                var newAnswerNumber = 0
                //ランダムに結果を出すが前回の結果異なる場合のみ採用
                repeat {
                    //1, 2, 3の変数をランダムに算出
                    newAnswerNumber = Int.random(in: 1...3)
                } while newAnswerNumber == answerNumber
                //
                answerNumber = newAnswerNumber
            }) {
                Text("ジャンケンをする！")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
