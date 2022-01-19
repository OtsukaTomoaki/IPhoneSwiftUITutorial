//
//  OkashiData.swift
//  MyOkashi
//
//  Created by 大塚友章 on 2022/01/19.
//

import Foundation

//お菓子データ検索用クラス
class OkashiData: ObservableObject {
    //web API検索用メソッド、第一引数：keyword 検索したいワード
    func searchOkashi(keyword: String) {
        print(keyword)
    }
}
