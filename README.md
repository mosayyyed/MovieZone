# Movie Zone 🎬

![Flutter Version](https://img.shields.io/badge/Flutter-3.6.0-blue.svg)
![Dart Version](https://img.shields.io/badge/Dart-3.6.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-purple.svg)

<div align="center">
  <img src="assets/images/app_cover.png" alt="Movie Zone App Cover" width="800"/>
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
### Authentication Screens
<div align="center">
  <img src="https://github.com/user-attachments/assets/dd8b3c0f-28f0-4a84-a666-0351602a89ec" alt="Login Screen - English" width="200"/>
  <img src="assets/images/screenshots/ar/login.png" alt="Login Screen - Arabic" width="200"/>
</div>

<div align="center">
  <img src="https://github.com/user-attachments/assets/6e0a87df-9108-48d6-b573-40ff7c669839" alt="Register Screen - English" width="200"/>
  <img src="assets/images/screenshots/ar/register.png" alt="Register Screen - Arabic" width="200"/>
</div>

<div align="center">
  <img src="https://github.com/user-attachments/assets/6c4dd30e-1de7-4dfb-aa01-8b7f4320e037" alt="Verification Screen - English" width="200"/>
  <img src="assets/images/screenshots/ar/verification.png" alt="Verification Screen - Arabic" width="200"/>
</div>

### Home Screen
<div align="center">
  <table>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/ed857f10-a2fc-45e2-b8c7-875cd655ff27" alt="Home Screen - English" width="200"/></td>
      <td><img src="assets/images/screenshots/ar/home.png" alt="Home Screen - Arabic" width="200"/></td>
    </tr>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/f885407e-0386-46c5-b4b6-a8d1ea59f07b" alt="Home Screen - English" width="200"/></td>
      <td><img src="assets/images/screenshots/ar/home.png" alt="Home Screen - Arabic" width="200"/></td>
    </tr>
  </table>
</div>

### Movie Details
<div align="center">
  <table>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/e91bafa8-fcc1-4e87-a5c8-606f3b8ff47c" alt="Movie Details - English" width="200"/></td>
      <td><img src="assets/images/screenshots/ar/movie_details.png" alt="Movie Details - Arabic" width="200"/></td>
    </tr>
  </table>
</div>

### Profile Screen
<div align="center">
  <table>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/0f3c9f03-311d-4a5b-8295-e99771e39094" alt="Profile Screen - English" width="200"/></td>
      <td><img src="assets/images/screenshots/ar/profile.png" alt="Profile Screen - Arabic" width="200"/></td>
    </tr>
        <tr>
      <td><img src="https://github.com/user-attachments/assets/b8968007-a360-4212-ad2a-bb36211571f2" alt="Profile Screen - English" width="200"/></td>
      <td><img src="assets/images/screenshots/ar/profile.png" alt="Profile Screen - Arabic" width="200"/></td>
    </tr>

  </table>
</div>

### Search Screen
<div align="center">
  <table>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/e52c0166-6a4e-4359-a788-e4163ccf64be" alt="Search Screen - English" width="200"/></td>
      <td><img src="assets/images/screenshots/ar/search.png" alt="Search Screen - Arabic" width="200"/></td>
    </tr>
  </table>
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
