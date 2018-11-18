//
//  ViewController.swift
//  Animals
//
//  Created by Halil Özel on 18.11.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var catButton: UIButton!
    @IBOutlet weak var dogButton: UIButton!
    @IBOutlet weak var elephantButton: UIButton!
    @IBOutlet weak var lionButton: UIButton!
    @IBOutlet weak var monkeyButton: UIButton!
    @IBOutlet weak var snakeButton: UIButton!
    
    
    var catSound : AVAudioPlayer = AVAudioPlayer()
    var dogSound : AVAudioPlayer = AVAudioPlayer()
    var elephantSound : AVAudioPlayer = AVAudioPlayer()
    var lionSound : AVAudioPlayer = AVAudioPlayer()
    var monkeySound : AVAudioPlayer = AVAudioPlayer()
    var snakeSound : AVAudioPlayer = AVAudioPlayer()
    
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageLabel.isHidden = true
        
        let soundCatFile = Bundle.main.path(forResource: "Cat", ofType: "wav")
        let soundDogFile = Bundle.main.path(forResource: "Dog", ofType: "wav")
        let soundElephantFile = Bundle.main.path(forResource: "Elephant", ofType: "wav")
        let soundLionFile = Bundle.main.path(forResource: "Lion", ofType: "wav")
        let soundMonkeyFile = Bundle.main.path(forResource: "Monkey", ofType: "wav")
        let soundSnakeFile = Bundle.main.path(forResource: "Snake", ofType: "wav")
        
        do{
            try catSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundCatFile!))
        }catch{
            print(error)
        }
        
        do{
            try dogSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundDogFile!))
        }catch{
            print(error)
        }
        
        do{
            try elephantSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundElephantFile!))
        }catch{
            print(error)
        }
        
        do{
            try lionSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundLionFile!))
        }catch{
            print(error)
        }
        
        
        do{
            try monkeySound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundMonkeyFile!))
        }catch{
            print(error)
        }
        
        do{
            try snakeSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundSnakeFile!))
        }catch{
            print(error)
        }
        
    }

    /*
    @IBAction func catSound(_ sender: Any) {
        messageLabel.isHidden = false
        messageLabel.text = "Miaow!!!"
        
        catSound.play()
        
        Timer.scheduledTimer(timeInterval: 1.25, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
     
        
    }*/
    
    
    
    @IBAction func soundAnimals(_ sender: UIButton) {
        
    
        switch sender {
        case catButton:
            messageLabel.isHidden = false
            messageLabel.text = "Miaow!!!"
            
            catSound.play()
            
            Timer.scheduledTimer(timeInterval: 1.25, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
            
        case dogButton:
            messageLabel.isHidden = false
            messageLabel.text = "Woof!!!"
            
            dogSound.play()
            
            Timer.scheduledTimer(timeInterval: 1.25, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
        case elephantButton:
            
            messageLabel.isHidden = false
            messageLabel.text = "Trumpet!!!"
            
            elephantSound.play()
            
            Timer.scheduledTimer(timeInterval: 1.50, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
        case lionButton:
            messageLabel.isHidden = false
            messageLabel.text = "Roar!!!"
            
            lionSound.play()
            
            Timer.scheduledTimer(timeInterval: 1.50, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
        case monkeyButton:
            messageLabel.isHidden = false
            messageLabel.text = "Whoop!!!"
            
            monkeySound.play()
            
            Timer.scheduledTimer(timeInterval: 1.50, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
        case snakeButton:
            messageLabel.isHidden = false
            messageLabel.text = "Hiss!!!"
            
            snakeSound.play()
            
            Timer.scheduledTimer(timeInterval: 1.50, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
    
    
        default:
            break
            
        }
        
        
    }
    
    /*
    @IBAction func dogSound(_ sender: Any) {
        messageLabel.isHidden = false
        messageLabel.text = "Woof!!!"
        
        dogSound.play()
        
        Timer.scheduledTimer(timeInterval: 1.25, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)

    }*/
    
    @objc func hideLabel(){
        messageLabel.isHidden = true
    }
    
}

