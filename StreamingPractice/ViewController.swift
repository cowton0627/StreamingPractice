//
//  ViewController.swift
//  StreamingPractice
//
//  Created by Chun-Li Cheng on 2021/12/22.
//

import UIKit
import StreamingKit

class ViewController: UIViewController {
    @IBOutlet weak var urlTxtField: UITextField!
//    @IBOutlet weak var playBtn: UIButton!
//    @IBOutlet weak var pauseBtn: UIButton!
//    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var grayView: UIView!
//    lazy var myLabel: UILabel = {
//        let l = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
//        view.addSubview(l)
//        l.translatesAutoresizingMaskIntoConstraints = false
//        return l
//    }()
    
    private let videoPlayer = StreamingVideoPlayer()
    private var isPlaying = false

    override func viewDidLoad() {
        super.viewDidLoad()
//        myLabel.text = NSLocalizedString("TestString", comment: "你好嗎？")
//        myLabel.center = view.center
        urlTxtField.attributedPlaceholder = NSAttributedString.init(string: "Enter url here", attributes: [
            .font: UIFont.systemFont(ofSize: 20, weight: .light),
            .foregroundColor: UIColor.darkGray
        ])
        
        setupVideoPlayer()
    }
    
    private func setupVideoPlayer() {
        videoPlayer.add(to: grayView)
    }
    
    @IBAction func txtFieldDidEnd(_ sender: UITextField) {
//        guard let text = urlTxtField.text else {
//            return
//        }
//        currentTitle = text
    }
    @IBAction func playTapped() {
        guard let text = urlTxtField.text, let url = URL(string: text) else {
            print("Error parsing URL")
            return
        }
        if !isPlaying {
            videoPlayer.play(url: url)
        }
        isPlaying = true
    }
    @IBAction func pauseTapped() {
        videoPlayer.pause()
        isPlaying = false
    }
    @IBAction func clearTapped() {
        urlTxtField.text = nil
        videoPlayer.pause()
    }



}

