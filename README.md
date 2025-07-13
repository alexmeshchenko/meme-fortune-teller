# meme-fortune-teller

The application answers questions using random memes. Basic version: input field, button, random meme display, buttons 👍/👎.

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

## 🧩 Functionality (Basic task)
Enter question and "Get prediction" button
Display one random meme via the imgflip.com API

Two buttons: 👍 (satisfied) or 👎 (want a new meme)

## 📱 architecture
ViewModel — meme query logic and state management.

View — SwiftUI-экраны.

Model — Meme object structure, corresponding to JSON from API.

## 🛠 development plan
- [ ] Establish the structure of the project.

- [ ] Implement the imgflip API call.

- [ ] Display of memes and buttons.

- [ ] Click processing 👍/👎.

## 📚 Ресурсы
Документация [imgflip API](https://imgflip.com/api)

This project was created for educational purposes to learn Swift and SwiftUI development.
