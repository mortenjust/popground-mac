//
//  ViewController.swift
//  popGround
//
//  Created by Morten Just Petersen on 5/27/15.
//  Copyright (c) 2015 Morten Just Petersen. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var springBounciness: NSSlider!
    @IBOutlet weak var springSpeed: NSSlider!
    @IBOutlet weak var dynamicsTension: NSSlider!
    @IBOutlet weak var dynamicsFriction: NSSlider!
    @IBOutlet weak var dynamicsMass: NSSlider!
    @IBOutlet weak var velocity: NSSlider!
    var sb : Float!
    
    
    @IBOutlet weak var animationButton: NSButton!
    
    
    @IBOutlet weak var button: NSButton!
    
    func setupSlider(slider : NSSlider) {
        slider.target = self
        slider.action = "sliderChanged"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationButton.wantsLayer = true
        
        let sliders = [springBounciness, springSpeed, dynamicsTension, dynamicsFriction, dynamicsMass]
        
        for slider in sliders {
            setupSlider(slider)
        }
        
        setDefaults()
    }
    
    func setDefaults(){
        // set up a new spring animation
        var defAnim = POPSpringAnimation()
        springBounciness.floatValue = Float(defAnim.springBounciness)
        springSpeed.floatValue = Float(defAnim.springSpeed)
        dynamicsTension.floatValue = Float(defAnim.dynamicsTension)
        dynamicsFriction.floatValue = Float(defAnim.dynamicsFriction)
        dynamicsMass.floatValue = Float(defAnim.dynamicsMass)
//        velocity.floatValue = defAnim.velocity as! Float
    }
    
    func sliderChanged(){
        var anim = POPSpringAnimation()
        //springBounciness, springSpeed, dynamicsTension, dynamicsFriction, dynamicsMass, velocity
        anim.springBounciness = CGFloat(springBounciness.floatValue)
        anim.springSpeed = CGFloat(springSpeed.floatValue)
        anim.dynamicsTension = CGFloat(dynamicsTension.floatValue)
        anim.dynamicsFriction = CGFloat(dynamicsFriction.floatValue)
        anim.dynamicsMass = CGFloat(dynamicsMass.floatValue)
        anim.property = POPAnimatableProperty.propertyWithName(kPOPLayerPositionX) as! POPAnimatableProperty
        anim.toValue = 388.0
        anim.fromValue = 20
        animationButton.layer?.pop_removeAllAnimations()
        animationButton.layer?.pop_addAnimation(anim, forKey: "positionx")
    }
    
    
    @IBAction func resetClicked(sender: AnyObject) {
        println("resetting")
        setDefaults()
        sliderChanged()
    }
    

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

