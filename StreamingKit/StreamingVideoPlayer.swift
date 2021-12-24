//
//  VideoPlayer.swift
//  StreamingKit
//
//  Created by Chun-Li Cheng on 2021/12/22.
//

import Foundation
import AVFoundation
import AVKit

public class StreamingVideoPlayer {
    private let playerViewController = AVPlayerViewController()
    private let avPlayer = AVPlayer()
    
    private lazy var playerView: UIView = {
        guard let view = playerViewController.view else {
            return UIView()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public init() { }
    
    public func add(to view: UIView) {
        view.addSubview(playerView)
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(equalTo: view.topAnchor),
            playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    public func play(url: URL) {
        let asset = AVAsset(url: url)
        let palyerItem = AVPlayerItem(asset: asset)
        avPlayer.replaceCurrentItem(with: palyerItem)
        playerViewController.player = avPlayer
        playerViewController.player?.play()
    }
    
    public func pause() {
        avPlayer.pause()
    }
    
}
