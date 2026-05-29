//
//  AnimalSoundsPresenter.swift
//  Animals
//
//  Presenter layer that connects SwiftUI with VIPER business logic.
//

import Foundation

protocol AnimalSoundsPresenterInput: AnyObject {
    func onAppear()
    func didSelect(_ animal: Animal)
}

@MainActor
final class AnimalSoundsPresenter: ObservableObject, AnimalSoundsPresenterInput {
    @Published private(set) var animals: [Animal] = []
    @Published private(set) var activeMessage: String?

    private let interactor: AnimalSoundsInteractorInput
    private let router: AnimalSoundsRouterInput
    private var hideMessageTask: Task<Void, Never>?

    init(interactor: AnimalSoundsInteractorInput, router: AnimalSoundsRouterInput) {
        self.interactor = interactor
        self.router = router
    }


    func onAppear() {
        guard animals.isEmpty else { return }
        let fetchedAnimals = interactor.fetchAnimals()
        animals = fetchedAnimals
        interactor.prepareAudio(for: fetchedAnimals)
    }

    func didSelect(_ animal: Animal) {
        interactor.playSound(for: animal)
        activeMessage = animal.soundText
        scheduleMessageDismissal(after: animal.feedbackDuration)
        router.handleSelection(of: animal)
    }

    private func scheduleMessageDismissal(after duration: TimeInterval) {
        hideMessageTask?.cancel()
        hideMessageTask = Task { [weak self] in
            let nanoseconds = UInt64(duration * 1_000_000_000)
            try? await Task.sleep(nanoseconds: nanoseconds)
            guard !Task.isCancelled else { return }
            await MainActor.run {
                self?.activeMessage = nil
            }
        }
    }
}
