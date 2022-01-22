//
//  OkashiData.swift
//  MyOkashi
//
//  Created by 大塚友章 on 2022/01/19.
//

import Foundation

//お菓子データ検索用クラス
class OkashiData: ObservableObject {
    //レスポンスJSONのデータ構造
    struct ResultJson: Codable {
        //JSONのitem内のデータ構造
        struct Item: Codable {
            //お菓子の名称
            let name: String?
            //掲載URL
            let url: URL?
            //画像URL
            let image: URL?
        }
        //複数要素
        let item: [Item]?
    }
    
    //web API検索用メソッド、第一引数：keyword 検索したいワード
    func searchOkashi(keyword: String) {
        print(keyword)
        
        //お菓子の検索キーワードをURLエンコードする
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        //リクエストURLの組み立て
        guard let req_url = URL(string: "https://sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        
        print(req_url)
        
        //リクエストに必要な情報を生成
        let req = URLRequest(url: req_url)
        //データ転送を管理するためのセッションを生成
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        //リクエストをタスクとして登録
        let task = session.dataTask(with: req, completionHandler: {
            (data, response, error) in
            //セッション終了
            session.finishTasksAndInvalidate()
            do {
                //JSONDecoderのインスタンス取得
                let decoder = JSONDecoder()
                //受け取ったJSONデータをパース（解析）して格納
                let json = try decoder.decode(ResultJson.self, from: data!)
                
                print(json)
            } catch {
                //エラー処理
                print("エラーが出ました")
            }
        })
        task.resume()
    }
}
