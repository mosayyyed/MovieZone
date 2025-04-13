# Movie Zone 🎬

![Flutter Version](https://img.shields.io/badge/Flutter-3.6.0-blue.svg)
![Dart Version](https://img.shields.io/badge/Dart-3.6.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-purple.svg)

<div align="center">
  <img src="https://github.com/user-attachments/assets/9bdb14d3-bd0b-49f6-be54-f478e12e692d" alt="Movie Zone App Cover" width="800"/>
</div>

## 📝 Table of Contents
- [Overview](#-overview)
- [Features](#-features)
- [Screenshots](#-screenshots)
- [Installation](#-installation)
- [Usage Guide](#-usage-guide)
- [Architecture](#-architecture)
- [API Integration](#-api-integration)
- [Contributing](#-contributing)
- [License](#-license)

## 🌟 Overview

Movie Zone is a comprehensive movie and TV show application that provides users with a rich and interactive experience for discovering, tracking, and managing their favorite content. Built with Flutter, it offers a modern, responsive interface with powerful features for movie enthusiasts.

### Key Highlights
- Real-time movie and TV show information
- Personalized recommendations
- User authentication and profile management
- Offline content access
- Multi-language support

## ✨ Features

### 🎯 Core Features
- **Movie Discovery**
  - Browse trending movies
  - Search with advanced filters
  - View detailed movie information
  - Watch trailers and clips

- **TV Shows**
  - Track ongoing series
  - Episode guides
  - Season overviews
  - Release schedules

- **User Experience**
  - Dark/Light mode
  - Customizable watchlists
  - Rating and reviews
  - Social sharing

### 🔧 Technical Features
- State management with BLoC
- Firebase integration
- Local data caching
- Responsive UI design
- Multi-language support

## 📸 Screenshots

<div align="center">
  <img src="assets/images/screenshots/home.png" alt="Home Screen" width="200"/>
  <img src="assets/images/screenshots/movie_details.png" alt="Movie Details" width="200"/>
  <img src="assets/images/screenshots/profile.png" alt="Profile Screen" width="200"/>
</div>

## 🚀 Installation

### Prerequisites
- Flutter SDK (^3.6.0)
- Dart SDK (^3.6.0)
- Android Studio / VS Code
- Git

### Setup Steps
1. Clone the repository
```bash
git clone https://github.com/yourusername/movie_zone.git
cd movie_zone
```

2. Install dependencies
```bash
flutter pub get
```

3. Configure environment
```bash
cp .env.example .env
# Edit .env with your API keys
```

4. Run the application
```bash
flutter run
```

## 📖 Usage Guide

### Getting Started
1. **First Launch**
   - Create an account or sign in
   - Set your preferred language
   - Choose your theme preference

2. **Browsing Content**
   - Use the search bar for quick access
   - Filter by genre, year, or rating
   - Save favorites for offline access

3. **Managing Watchlist**
   - Add movies to watchlist
   - Mark watched content
   - Rate and review movies

### Advanced Features
- **Notifications**
  - Get alerts for new releases
  - Track upcoming episodes
  - Receive recommendations

- **Social Features**
  - Share reviews
  - Follow other users
  - Create watch parties

## 🏗️ Architecture

### Project Structure
```
lib/
├── core/
│   ├── constants/
│   ├── errors/
│   └── utils/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── blocs/
    ├── pages/
    └── widgets/
```

### Design Patterns
- Clean Architecture
- BLoC Pattern
- Repository Pattern
- Dependency Injection

## 🔌 API Integration

### TMDB API
- Movie information
- TV show details
- Search functionality
- Image assets

### Firebase Services
- Authentication
- Cloud Firestore
- Storage
- Analytics

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

### Code Style
- Follow Flutter style guide
- Write meaningful commit messages
- Include tests for new features
- Update documentation

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

For support, please:
- Open an issue
- Contact us at mosayyyed@gmail.com

## 🌟 Acknowledgments

Special thanks to:
- The Flutter team
- TMDB API
- Firebase
- All contributors
