# DYECameraButton

# Two-In-One Button

Press for a snapshot effect, or hold for a video recording effect

# Press for SnapShot Animation

![](https://github.com/dannyYassine/DYECameraButton/blob/master/clicked_button.gif)

# Hold for Movie Recording Animation

![](https://github.com/dannyYassine/DYECameraButton/blob/master/gif_hold.gif)

# Implementation
Add the DYECameraButton in storyboards or programmatically, then in your UIViewController class:

    override func viewDidLoad() {
        super.viewDidLoad()

    // Set the duration
        self.cameraButton.duration = 3.0
  
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
