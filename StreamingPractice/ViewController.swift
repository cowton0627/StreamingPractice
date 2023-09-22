//
//  ViewController.swift
//  StreamingPractice
//
//  Created by Chun-Li Cheng on 2021/12/22.
//

import UIKit
import StreamingKit

class ViewController: UIViewController {
    
    /// 測試 Localized String & 多國語系
//    private lazy var myLabel: UILabel = {
//        let label = UILabel(frame: CGRect(x: 150, y: 650, width: 200, height: 40))
//        view.addSubview(label)
////        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    /// 串流播放器
    private let videoPlayer = StreamingVideoPlayer()
    
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var playBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        myLabel.text = NSLocalizedString("TestString", comment: "你好嗎？")
        
//        urlTextField.attributedPlaceholder =
//        NSAttributedString.init(string: "Please Enter URL",
//                                attributes: [
//            .font: UIFont.systemFont(ofSize: 18, weight: .light),
//            .foregroundColor: UIColor.darkGray
//        ])
        
        setupVideoPlayer()
    }
    
    private func setupVideoPlayer() {
        videoPlayer.add(to: videoView)
    }
    
    
    @IBAction func playBtnTapped() {
        guard let text = urlTextField.text,
              !text.isEmpty,
              let url = URL(string: text) else {
            print("Error parsing URL")
            return
        }
        
        if videoPlayer.isPlaying == false {
            videoPlayer.play(url: url)
            playBtn.isEnabled = false  // 禁用播放按鈕
        }
        
    }
    
    @IBAction func pauseBtnTapped() {
        videoPlayer.pause()
        playBtn.isEnabled = true  // 啟用播放按鈕
    }
    
    @IBAction func clearBtnTapped() {
        urlTextField.text = nil
        videoPlayer.pause()
        playBtn.isEnabled = true  // 啟用播放按鈕
    }


}

