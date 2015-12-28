# DYECameraButton

# Two-In-One Button

Press for a snapshot effect, or hold for a video recording effect

# Press for SnapShot Animation

![](https://github.com/dannyYassine/DYECameraButton/blob/master/clicked_button.gif)

# Hold for Movie Recording Animation

![](https://github.com/dannyYassine/DYECameraButton/blob/master/gif_hold.gif)

# Implementation
Add an instance of a DYECameraButton subView in storyboards or programmatically, then in your UIViewController class:

    override func viewDidLoad() {
        super.viewDidLoad()

    // Set the long Gesture
        let longPress = UILongPressGestureRecognizer(target: self, action: "longPressGuesture:")
        longPress.minimumPressDuration = 0.5
        longPress.allowableMovement = 1000
        
        self.cameraButton.addGestureRecognizer(longPress)
    }
  
  You could implement your own logic when to set recording or stop recording, but just call setRecording() to start and stoppedRecording() to stop recording animations.
  
    func longPressGuesture(longPress: UILongPressGestureRecognizer) {
        
        if longPress.state == .Began {
            self.cameraButton.setRecording()
        } else if longPress.state == .Ended {
            self.cameraButton.stoppedRecording()
        }
        
    }
    
# Determine when the user was holding or pressing the button
Register a target for an TouchUpInside for the button

    // Determine when user has pressed the button
        self.cameraButton.addTarget(self, action: "finishRecording", forControlEvents: .TouchUpInside)
        
That method will check if your were recording a movie (pressing and holding) or taking a picture (pressing only)

    func finishRecording() {
        if self.cameraButton.isAnimating == true {
            // Camera was recording a movie
            
        } else {
            // Camera was taking a picture
            
        }
    }
    
# Custom Properties

    self.cameraButton.duration = 5.0
    self.cameraButton.outterRingColor = UIColor.whiteColor()
    self.cameraButton.animatingRingColor = UIColor.redColor()
    self.cameraButton.innerCirleColor = UIColor.redColor()
    self.cameraButton.backgroundCircleColor = UIColor(white: 1.0, alpha: 0.4)
