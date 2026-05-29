//
//  AnimalSoundsView.swift
//  Animals
//
//  SwiftUI view layer for the Animal Sounds VIPER module.
//

import SwiftUI

struct AnimalSoundsView: View {
    @StateObject private var presenter: AnimalSoundsPresenter

    init(presenter: AnimalSoundsPresenter) {
        _presenter = StateObject(wrappedValue: presenter)
    }

    var body: some View {
        ZStack {
            background

            ScrollView {
                VStack(spacing: 28) {
                    header
                    messageBanner
                    animalGrid
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 32)
            }
        }
        .onAppear(perform: presenter.onAppear)
    }

    private var background: some View {
        LinearGradient(
            colors: [Color(red: 0.12, green: 0.24, blue: 0.18), Color(red: 0.39, green: 0.58, blue: 0.36)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
        .overlay(
            Image("bg")
                .resizable()
                .scaledToFill()
                .opacity(0.18)
                .ignoresSafeArea()
        )
    }

    private var header: some View {
        VStack(spacing: 10) {
            Text("Animals")
                .font(.system(size: 44, weight: .black, design: .rounded))
                .foregroundStyle(.white)
                .shadow(radius: 8)

            Text("Tap an animal to hear its sound")
                .font(.headline)
                .foregroundStyle(.white.opacity(0.85))
                .multilineTextAlignment(.center)
        }
        .accessibilityElement(children: .combine)
    }

    @ViewBuilder
    private var messageBanner: some View {
        if let message = presenter.activeMessage {
            Text(message)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
                .padding(.horizontal, 28)
                .padding(.vertical, 14)
                .background(.ultraThinMaterial, in: Capsule())
                .transition(.scale.combined(with: .opacity))
                .accessibilityLabel("Animal sound: \(message)")
        } else {
            Text("Choose your animal")
                .font(.headline)
                .foregroundStyle(.white.opacity(0.72))
                .padding(.vertical, 18)
        }
    }

    private var animalGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: 18)], spacing: 18) {
            ForEach(presenter.animals) { animal in
                AnimalCard(animal: animal) {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                        presenter.didSelect(animal)
                    }
                }
            }
        }
    }
}

private struct AnimalCard: View {
    let animal: Animal
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 14) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 108)
                    .padding(18)
                    .background(Color.white.opacity(0.85), in: RoundedRectangle(cornerRadius: 28, style: .continuous))

                Text(animal.name)
                    .font(.title3.weight(.bold))
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity)
            .padding(18)
            .background(Color.white.opacity(0.16), in: RoundedRectangle(cornerRadius: 30, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .stroke(Color.white.opacity(0.26), lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.22), radius: 18, x: 0, y: 12)
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Play \(animal.name) sound")
    }
}

struct AnimalSoundsView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalSoundsRouter.createModule()
    }
}
