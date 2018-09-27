//
//  RecordViewController.swift
//  AudioRecorder
//
//  Created by Sebastian Vogel on 25.09.18.
//  Copyright © 2018 Sebastian Vogel. All rights reserved.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController {

    
    @IBOutlet weak var informationLabel: UILabel!
    
    var accessGrandet = false
    var audioRecorder: AVAudioRecorder?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupAudioRecorder()
        
    }
    
    
    func setupAudioRecorder(){
        if let audioRecorder = Utility.getAudioRecorder(){
            self.audioRecorder = audioRecorder
            self.audioRecorder!.delegate = self
            accessGrandet = true
        } else{
            print("user denied access")
        }
        
        
    }
    
    func updateInformationLabel(recording: Bool){
        if recording{
            informationLabel.text = "Recoding.."
            informationLabel.textColor = UIColor.red
        }else{
            informationLabel.text = "Hold Button to Record"
            informationLabel.textColor = UIColor.white
        }
    }

    
    func startRecording(){
        print("starting  Recording")
        audioRecorder?.record()
    }
    
    func stopRecording (){
            print("Stopped Recording")
        audioRecorder?.stop()
    
    }
    
    
    
    @IBAction func recordButtonTouchInside(_ sender: UIButton) {
        if accessGrandet{
            
        startRecording()
        updateInformationLabel(recording: true)
        }else{
            showAccessAlert()
        }
    
    }
    
    
    func showAccessAlert(){
        let alertViewController = UIAlertController(title: "No Access to Mic", message: "Please allow Audio Memo", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        present(alertViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func recordButtonTouchDown(_ sender: UIButton) {
        if !accessGrandet{return}
        stopRecording()
        updateInformationLabel(recording: false)



    }
    
    
    
    
    @IBAction func recordButtonTouchupOutside(_ sender: UIButton) {
        if !accessGrandet{return}
        stopRecording()
    updateInformationLabel(recording: false)
    
    }

    
}




extension RecordViewController: AVAudioRecorderDelegate {
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            print("everything ok")
        }else{
            print("error during recording")
        }
    }
}
