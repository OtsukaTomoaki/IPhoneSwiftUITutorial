//
//  ContentView.swift
//  MyTimer
//
//  Created by 大塚友章 on 2022/01/10.
//

import SwiftUI

struct ContentView: View {
    //タイマーの変数を作成
    @State var timerHandler: Timer?
    //カウント（経過時間）の変数を作成
    @State var count = 0
    //永続化する秒数設定（初期値は0）
    @AppStorage("timer_value") var timerValue = 10
    //アラート表示有無
    @State var showAlert = false

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
                    Spacer()
                    Text("残り\(timerValue - count)秒")
                        .font(.largeTitle)
                    Spacer()
                    //水平にレイアウト（横方向にレイアウト）
                    HStack {
                        //スタートボタン
                        Button(action: {
                            startTimer()
                        }) {
                            //テキストを表示する
                            Text("スタート")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("startColor"))
                                .clipShape(Circle())
                        }
                        //ストップボタン
                        Button(action: {
                            //timerHandlerをアンラップしてunwrapedTimerHandlerに代入
                            if let unwrapedTimerHandler = timerHandler {
                                //もしタイマーが実行中だったら停止
                                if unwrapedTimerHandler.isValid == true {
                                    //タイマー停止
                                    unwrapedTimerHandler.invalidate()
                                }
                            }
                        }) {
                            //テキストを表示する
                            Text("ストップ")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("stopColor"))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            //画面が表示されるときに実行される
            .onAppear {
                print("onAppear")
                count = 0
            }
            .navigationBarItems(trailing:
                                    NavigationLink(destination: SettingView()){
                //テキストを表示
                Text("秒数設定")
            })
            //状態変数showAlertがtrueになったときに実行される
            .alert(isPresented: $showAlert) {
                //アラートを表示するためのレイアウトを記述する
                //アラートを表示する
                Alert(title: Text("終了"),
                    message: Text("タイマー終了時間です"),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
    
    //1秒ごとに実行されてカウントダウンする
    func countDownTimer() {
        //count(経過時間)に+1する
        count += 1
        
        //残り時間が0以下の時、タイマーを止める
        if timerValue - count <= 0 {
            //タイマー停止
            timerHandler?.invalidate()
            //アラートを表示する
            showAlert = true
        }
    }
    
    //タイマーをカウントダウン開始する関数
    func startTimer() {
        //timerHandlerをアンラップしてunwrapedTimerHandlerに代入
        if let unwrapedTimerHandler = timerHandler {
            //もしタイマーが実行中だったらスタートしない
            if unwrapedTimerHandler.isValid == true {
                //何も処理しない
                return
            }
        }
        
        //残り時間が0以下の時、count（経過時間）を0に初期化する
        if timerValue - count <= 0 {
            //count(経過時間)を0に初期化する
            count = 0
        }
        
        //タイマーをスタート
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            //タイマー実行時に呼び出される
            //1秒ごとに実行されたカウントダウンする関数を実行する
            countDownTimer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
