//
//  ViewController.swift
//  AudioRecorder
//
//  Created by Sebastian Vogel on 25.09.18.
//  Copyright © 2018 Sebastian Vogel. All rights reserved.
//

import UIKit

class AudioTableViewController: UIViewController {

    @IBOutlet weak var fullHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var zeroHeightConstraint: NSLayoutConstraint!
    
    var playerShown = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(animatePlayer), userInfo: nil, repeats: true)


    }


  @objc  func animatePlayer(){
        playerShown = !playerShown
        
        if playerShown{
            zeroHeightConstraint.isActive = false
            fullHeightConstraint.isActive = true
            
        }else{
            fullHeightConstraint.isActive = false
            zeroHeightConstraint.isActive = true
        }
        
        UIView.animate(withDuration: 0.25){
            self.view.layoutIfNeeded()
        }
    }
    
    
    
}

