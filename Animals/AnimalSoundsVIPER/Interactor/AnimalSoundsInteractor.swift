//
//  AnimalSoundsInteractor.swift
//  Animals
//
//  Interactor layer for loading data and playing animal sounds.
//

import AVFoundation
import Foundation

protocol AnimalSoundsInteractorInput: AnyObject {
    func fetchAnimals() -> [Animal]
    func prepareAudio(for animals: [Animal])
    func playSound(for animal: Animal)
}

final class AnimalSoundsInteractor: AnimalSoundsInteractorInput {
    private var players: [Animal.ID: AVAudioPlayer] = [:]

    func fetchAnimals() -> [Animal] {
        Animal.all
    }

    func prepareAudio(for animals: [Animal]) {
        animals.forEach { animal in
            guard players[animal.id] == nil else { return }
            guard let soundURL = Bundle.main.url(forResource: animal.audioResource, withExtension: animal.audioExtension) else {
                assertionFailure("Missing sound resource: \(animal.audioResource).\(animal.audioExtension)")
                return
            }

            do {
                let player = try AVAudioPlayer(contentsOf: soundURL)
                player.prepareToPlay()
                players[animal.id] = player
            } catch {
                assertionFailure("Failed to load \(animal.audioResource).\(animal.audioExtension): \(error)")
            }
        }
    }

    func playSound(for animal: Animal) {
        guard let player = players[animal.id] else { return }
        player.currentTime = 0
        player.play()
    }
}
