# Meme Fortune Teller

A fun iOS application that answers your questions using random memes from the internet! Ask any question, get a meme as your "fortune" - because sometimes the universe speaks in memes. 🔮✨

**Basic version includes:** question input field, "Get Prediction" button, random meme display, and accept/reject buttons (👍/👎).

# Meme Fortune Teller (SwiftUI)

![Swift](https://img.shields.io/badge/Swift-6.0-orange.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-iOS%2018-blue.svg)
![Xcode](https://img.shields.io/badge/Xcode-16.0-blue.svg)
![iOS](https://img.shields.io/badge/iOS-17.0%2B-green.svg)

## 🚀 Getting Started

### Requirements
- Xcode 16.0+
- iOS 17.0+
- Swift 6.0+

### Installation
```bash
git clone git@github.com:.../meme-fortune-teller.git
cd meme-fortune-teller
open MemeFortuneTeller.xcodeproj
```

## 🧩 Functionality (Basic Task)

- **Question Input**: Enter your question in the text field
- **Get Prediction**: Tap the button to receive your meme fortune
- **Random Meme Display**: Shows a random meme from imgflip.com API as your "answer"
- **User Actions**: 
  - 👍 Accept the prediction (satisfied with the answer)
  - 👎 Get a new meme (want a different fortune)

## 📱 Architecture

**MVVM Pattern (Model-View-ViewModel)**

- **Model** (`MemeModel.swift`) — Data structures for API responses: `Meme`, `MemeResponse`, `MemeData`
- **View** (`ContentView.swift`) — SwiftUI screens with user interface components
- **ViewModel** (`MainViewModel.swift`) — Business logic, state management, and API communication
- **Service** (`MemeService.swift`) — Network layer for imgflip.com API calls using Combine framework

**Key Components:**
- Combine framework for reactive programming
- URLSession for HTTP requests
- ObservableObject for state management
- Published properties for UI updates

## 📚 Resources

- [imgflip API Documentation](https://imgflip.com/api) — Official API documentation for meme data
- [Combine Framework](https://developer.apple.com/documentation/combine) — Reactive programming in Swift
- [MVVM Pattern in SwiftUI](https://developer.apple.com/documentation/swiftui/managing-model-data-in-your-app) — Apple's guide to data management

This project was created for educational purposes to learn Swift and SwiftUI development.
