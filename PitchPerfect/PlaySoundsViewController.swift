//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by deepanshugautam on 2018/10/18.
//  Copyright © 2018 deepanshugautam. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int { case slow = 0, fast, highPitch, lowPitch, echo, reverb }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("will appear")
        configureUI(.notPlaying)
    }
    
    @IBAction func playSoundForButton (_ sender: UIButton) {
        print("play sound")
        switch (ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .highPitch:
            playSound(pitch: 1000)
        case .lowPitch:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed (_ sender: AnyObject) {
        print("stop sound")
        stopAudio()
    }
}
