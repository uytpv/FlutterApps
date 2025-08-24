# OClock - Finnish Digital Clock

A beautiful digital clock Flutter application that displays time in real-time with Finnish date format.

## Features

- **Real-time clock**: Updates every 500ms
- **Finnish date format**: Displays date in Finnish language (e.g., "Sunnuntai, 24. elokuuta 2025")
- **Landscape optimized**: Designed for landscape orientation with 3% margin
- **System integration**: 
  - Automatically adjusts screen brightness to 30%
  - Keeps screen awake with Wakelock
  - Immersive mode (hides system UI)
- **Responsive design**: Adapts to different screen sizes
- **Modern UI**: Dark theme with flip-style number blocks

## Screenshots

The app displays:
- Digital time in HH:MM:SS format with AM/PM indicator
- Current date in Finnish format below the clock
- All text in Finnish language

## Technical Details

- **Framework**: Flutter
- **Dependencies**:
  - `screen_brightness`: For brightness control
  - `wakelock`: For keeping screen awake
  - `flutter_lints`: For code quality

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the application

## Supported Platforms

- Android
- iOS  
- Web
- Windows
- macOS
- Linux

## Finnish Date Format

The app displays dates in the following Finnish format:
- Weekday: Sunnuntai, Maanantai, Tiistai, Keskiviikko, Torstai, Perjantai, Lauantai
- Months: tammikuuta, helmikuuta, maaliskuuta, huhtikuuta, toukokuuta, kesäkuuta, heinäkuuta, elokuuta, syyskuuta, lokakuuta, marraskuuta, joulukuuta

Example: "Sunnuntai, 24. elokuuta 2025"
