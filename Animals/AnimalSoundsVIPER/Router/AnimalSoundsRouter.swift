//
//  AnimalSoundsRouter.swift
//  Animals
//
//  Router layer responsible for assembling the Animal Sounds module.
//

import SwiftUI

protocol AnimalSoundsRouterInput: AnyObject {
    func handleSelection(of animal: Animal)
}

final class AnimalSoundsRouter: AnimalSoundsRouterInput {
    @MainActor
    static func createModule() -> some View {
        let interactor = AnimalSoundsInteractor()
        let router = AnimalSoundsRouter()
        let presenter = AnimalSoundsPresenter(interactor: interactor, router: router)
        return AnimalSoundsView(presenter: presenter)
    }

    func handleSelection(of animal: Animal) {
        // No navigation is required yet, but this keeps the module VIPER-ready.
    }
}
