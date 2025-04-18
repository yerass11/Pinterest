# 🖼️ Pinterest-Style Image Gallery App (SwiftUI)

A SwiftUI application that mimics Pinterest's image layout — loads random images from the internet and displays them in a responsive grid. Includes concurrent downloading via **GCD**, **image caching**, **infinite scrolling**, **detail view**, and **ProgressView**.

---

## 🚀 Features

- 🔄 Load 5 new random images on button tap or on scroll
- 🧵 Concurrent image downloading using **Grand Central Dispatch**
- 📦 In-memory **image caching**
- ♾️ Infinite scrolling (loads more when reaching bottom)
- 🔍 Fullscreen **detail view** on image tap
- ⏳ Loading indicators with **ProgressView**
- 📐 Responsive layout with **LazyVGrid**
- 🧠 MVVM architecture

---

## 🧱 Architecture
PinterestGalleryApp/ ├── Models/ │ └── ImageModel.swift ├── ViewModels/ │ └── ImageGalleryViewModel.swift ├── Views/ │ ├── ImageGalleryView.swift │ └── ImageDetailView.swift ├── Services/ │ └── ImageCache.swift └── PinterestGalleryApp.swift


---

## 📷 Screenshots

| Gallery Grid | Detail View |
|--------------|-------------|
| ![Grid](./screenshots/grid.png) | ![Detail](./screenshots/detail.png) |


---

## 🛠 Technologies

- Swift
- SwiftUI
- GCD (`DispatchQueue`, `DispatchGroup`)
- MVVM Pattern

---

## ▶️ Getting Started

1. Clone this repo:
   ```bash
   git clone https://github.com/yourusername/pinterest-gallery-app.git
  
2. Open in Xcode 15+

3. Build & Run on iOS 17+ simulator or device
