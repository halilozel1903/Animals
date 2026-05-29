//
//  Animal.swift
//  Animals
//
//  Entity layer for the Animal Sounds VIPER module.
//

import Foundation

struct Animal: Identifiable, Equatable {
    let id: String
    let name: String
    let soundText: String
    let imageName: String
    let audioResource: String
    let audioExtension: String
    let feedbackDuration: TimeInterval

    init(
        name: String,
        soundText: String,
        imageName: String,
        audioResource: String,
        audioExtension: String = "wav",
        feedbackDuration: TimeInterval = 1.5
    ) {
        self.id = audioResource
        self.name = name
        self.soundText = soundText
        self.imageName = imageName
        self.audioResource = audioResource
        self.audioExtension = audioExtension
        self.feedbackDuration = feedbackDuration
    }
}

extension Animal {
    static let all: [Animal] = [
        Animal(name: "Cat", soundText: "Miaow!!!", imageName: "cat", audioResource: "Cat", feedbackDuration: 1.25),
        Animal(name: "Dog", soundText: "Woof!!!", imageName: "dog", audioResource: "Dog", feedbackDuration: 1.25),
        Animal(name: "Elephant", soundText: "Trumpet!!!", imageName: "elephant", audioResource: "Elephant"),
        Animal(name: "Lion", soundText: "Roar!!!", imageName: "lion", audioResource: "Lion"),
        Animal(name: "Monkey", soundText: "Whoop!!!", imageName: "monkey", audioResource: "Monkey"),
        Animal(name: "Snake", soundText: "Hiss!!!", imageName: "snake", audioResource: "Snake")
    ]
}
