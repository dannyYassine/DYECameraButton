//
//  ViewController.swift
//  DYECameraButton
//
//  Created by Danny Yassine on 2015-12-28.
//  Copyright © 2015 Danny Yassine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cameraButton: DYECameraButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set the duration
        self.cameraButton.duration = 3.0
        let longPress = UILongPressGestureRecognizer(target: self, action: "longPressGuesture:")
        longPress.minimumPressDuration = 0.5
        longPress.allowableMovement = 1000
        self.cameraButton.addGestureRecognizer(longPress)
        
        // Determine when user has pressed the button
        self.cameraButton.addTarget(self, action: "finishRecording", forControlEvents: .TouchUpInside)
        
    }
    
    func longPressGuesture(longPress: UILongPressGestureRecognizer) {
        
        if longPress.state == .Began {
            self.cameraButton.setRecording()
        } else if longPress.state == .Ended {
            self.cameraButton.stoppedRecording()
        }
        
    }
    
    func finishRecording() {
        if self.cameraButton.isAnimating == true {
            // Camera was recording a movie
            
        } else {
            // Camera was taking a picture
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

