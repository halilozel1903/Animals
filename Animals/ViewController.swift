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
    
    
    // buttonların ve label'in tanımları
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var catButton: UIButton!
    @IBOutlet weak var dogButton: UIButton!
    @IBOutlet weak var elephantButton: UIButton!
    @IBOutlet weak var lionButton: UIButton!
    @IBOutlet weak var monkeyButton: UIButton!
    @IBOutlet weak var snakeButton: UIButton!
    
    // Ses dosyalarının tanımları
    var catSound : AVAudioPlayer = AVAudioPlayer()
    var dogSound : AVAudioPlayer = AVAudioPlayer()
    var elephantSound : AVAudioPlayer = AVAudioPlayer()
    var lionSound : AVAudioPlayer = AVAudioPlayer()
    var monkeySound : AVAudioPlayer = AVAudioPlayer()
    var snakeSound : AVAudioPlayer = AVAudioPlayer()
    
    // button nesnesi
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // labelda bulunan yazıyı gizleme
        messageLabel.isHidden = true
        
        // tanımlanan dosyalara ses dosyalarının adları ve uzantıları eklendi.
        configureSoundPlayer(forResource: "Cat", fileExtension: "wav", player: &catSound, button: catButton)
        configureSoundPlayer(forResource: "Dog", fileExtension: "wav", player: &dogSound, button: dogButton)
        configureSoundPlayer(forResource: "Elephant", fileExtension: "wav", player: &elephantSound, button: elephantButton)
        configureSoundPlayer(forResource: "Lion", fileExtension: "wav", player: &lionSound, button: lionButton)
        configureSoundPlayer(forResource: "Monkey", fileExtension: "wav", player: &monkeySound, button: monkeyButton)
        configureSoundPlayer(forResource: "Snake", fileExtension: "wav", player: &snakeSound, button: snakeButton)
        
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

    private func configureSoundPlayer(forResource resource: String, fileExtension: String, player: inout AVAudioPlayer, button: UIButton) {
        guard let soundURL = Bundle.main.url(forResource: resource, withExtension: fileExtension) else {
            print("Error: Could not find \(resource).\(fileExtension) in the main bundle.")
            button.isEnabled = false
            return
        }

        do {
            try player = AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print("Error loading \(resource).\(fileExtension): \(error)")
            button.isEnabled = false
        }
    }

}

