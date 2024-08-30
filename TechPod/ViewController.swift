//
//  ViewController.swift
//  TechPod
//
//  Created by しまうま on 30/08/2024.
//

import UIKit
import AVFoundation

    
    class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return songNameArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //ID付きのセルを取得
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            //セル付属のtextLabelにテストという文字を表示する
            var content = cell.defaultContentConfiguration()
            content.text = songNameArray[indexPath.row]
            
            //セル付属のimageViewに音楽家の画像を表示する
            content.image = UIImage(named: imageNameArray[indexPath.row])
            content.imageProperties.reservedLayoutSize = CGSize(width: 30, height: 30)
            
           
            
            cell.contentConfiguration = content
            
            return cell
        }
        
        //StoryViewで扱うtableVeiwを宣言
        @IBOutlet var table: UITableView!
        //曲名を入れるための配列
        var songNameArray = [String]()
        //曲のファイル名を入れるための配列
        var fileNameArray = [String]()
        //音楽家の画像を入れるための配列
        var imageNameArray = [String]()
        //音楽を再生するための変数
        var audioPlayer: AVAudioPlayer!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            //TableViewのデータソースメソッドはViewControllerクラスに書くよ、という設定
            table.dataSource = self
            //TableViewのデリゲートメソッドはViewControllerクラスに書くよ、という設定
            table.delegate = self
            //songNameArrayに曲名を入れていく
            songNameArray = ["カノン","エリーゼのために","G線上のアリア"]
            fileNameArray = ["cannon","elise","aria"]
            imageNameArray = ["Bach.jpg","Beethoven.jpg","Pachelbel.jpg"]
            
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("\(songNameArray[indexPath.row])が選択されました！")
            
            //音楽ファイルの設定
            let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
            //再生の準備
            audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
            //音楽を再生
            audioPlayer.play()
        }
    
    }
    

