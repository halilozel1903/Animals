//
//  AppDelegate.swift
//  Animals
//
//  Created by Halil Özel on 18.11.2018.
//  Modernized with SwiftUI + VIPER.
//

import SwiftUI

@main
struct AnimalsApp: App {
    var body: some Scene {
        WindowGroup {
            AnimalSoundsRouter.createModule()
        }
    }
}
