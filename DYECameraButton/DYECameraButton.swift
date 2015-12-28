//
//  DYECameraButton.swift
//  DYECameraButton
//
//  Created by Danny Yassine on 2015-12-28.
//  Copyright © 2015 Danny Yassine. All rights reserved.
//

import UIKit

let PIE: CGFloat = CGFloat(M_PI)

class DYECameraButton: UIButton {
    
    var innerCircleLayer: CAShapeLayer!
    var drawingCameraPath: CAShapeLayer!
    
    // Custom Properties
    var outterRingColor: UIColor = UIColor.whiteColor()
    var animatingRingColor: UIColor = UIColor.redColor()
    var innerCirleColor: UIColor = UIColor.redColor()
    var backgroundCircleColor: UIColor = UIColor(white: 1.0, alpha: 0.4)
    
    var duration: Double = 4.0
    
    var isAnimating: Bool = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        self.setTitle("", forState: .Normal)
        
        self.innerCircleLayer = CAShapeLayer()
        self.innerCircleLayer.backgroundColor = self.innerCirleColor.CGColor
        self.innerCircleLayer.frame = CGRectMake(20, 20, self.frame.width  - 40, self.frame.height - 40)
        self.innerCircleLayer.cornerRadius = 25.0
        self.layer.addSublayer(self.innerCircleLayer)
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.bounds.height/2.0
        
        
        // Ring Layer
        let bezierArc = UIBezierPath()
        bezierArc.moveToPoint(CGPoint(x: bounds.width/2, y: 0.0))
        bezierArc.addArcWithCenter(CGPoint(x: bounds.width/2, y: bounds.height/2), radius: bounds.width/2, startAngle: 270.1*(PIE/180.0), endAngle: (3.0/2.0)*PIE, clockwise: true)
        
        let ringShapeLayer = CAShapeLayer()
        ringShapeLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        ringShapeLayer.path = bezierArc.CGPath
        ringShapeLayer.lineCap = kCALineCapRound
        ringShapeLayer.fillColor = UIColor.clearColor().CGColor
        ringShapeLayer.strokeColor = self.outterRingColor.CGColor
        ringShapeLayer.lineWidth = 6.0
        self.layer.addSublayer(ringShapeLayer)
        
        
        self.backgroundColor = self.backgroundCircleColor
    }
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
    }
    
    
    func setRecording() {
        self.isAnimating = true
        
        let bezierArc = UIBezierPath()
        bezierArc.moveToPoint(CGPoint(x: bounds.width/2, y: 0.0))
        bezierArc.addArcWithCenter(CGPoint(x: bounds.width/2, y: bounds.height/2), radius: bounds.width/2, startAngle: 270.1*(PIE/180.0), endAngle: (3.0/2.0)*PIE, clockwise: true)
        
        self.drawingCameraPath = CAShapeLayer()
        self.drawingCameraPath.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.drawingCameraPath.path = bezierArc.CGPath
        self.drawingCameraPath.lineCap = kCALineCapSquare
        self.drawingCameraPath.fillColor = UIColor.clearColor().CGColor
        self.drawingCameraPath.strokeColor = self.animatingRingColor.CGColor
        self.drawingCameraPath.lineWidth = 6.0
        self.layer.addSublayer(self.drawingCameraPath)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = self.duration
        
        self.drawingCameraPath.addAnimation(animation, forKey: "animate drawing line recording")
        
        if (!CGAffineTransformEqualToTransform(self.transform, CGAffineTransformIdentity)) {
            self.expandButton()
        }
    }
    
    func stoppedRecording() {
        self.drawingCameraPath.removeFromSuperlayer()
        self.isAnimating = false
        self.resetExpandButton()
    }
    
    func expandButton() {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 10.0, options: .CurveEaseIn, animations: { () -> Void in
            self.transform = CGAffineTransformMakeScale(1.2, 1.2)
            }) { (done) -> Void in
                
        }
    }
    
    func resetExpandButton() {
        
        UIView.animateWithDuration(0.25, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1.0, options: .CurveEaseIn, animations: { () -> Void in
            self.transform = CGAffineTransformIdentity
            }) { (done) -> Void in
                self.sendActionsForControlEvents(.TouchUpInside)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.expandButton()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.resetExpandButton()
    }
    
}
