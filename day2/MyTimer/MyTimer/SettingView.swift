//
//  SettingView.swift
//  MyTimer
//
//  Created by 大塚友章 on 2022/01/10.
//

import SwiftUI

struct SettingView: View {
    @State var timerValue = 10
    var body: some View {
        ZStack {
            //背景色を表示
            Color("backgroundSetting")
                .edgesIgnoringSafeArea(.all)
            //垂直方向にレイアウト（縦方向にレイアウト）
            VStack {
                Spacer()
                Text("\(timerValue)秒")
                    .font(.largeTitle)
                Spacer()
                //Pickerを表示
                Picker(selection: $timerValue, label: Text("選択")) {
                    Text("10").tag(10)
                    Text("20").tag(20)
                    Text("30").tag(30)
                    Text("40").tag(40)
                    Text("50").tag(50)
                    Text("60").tag(60)
                }
                //スペースを空ける
                Spacer()
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
