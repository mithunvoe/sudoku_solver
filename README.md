
# Sudoku Solver

## Overview

This app is designed to solve Sudoku puzzles using a backtracking algorithm. It is built using Flutter and Dart, providing a user-friendly interface for inputting and solving Sudoku puzzles.

## Features

- Light and dark theme support
- Real-time theme switching
- Backtracking algorithm for solving puzzles
- Responsive UI
## Download
Click here to download and install the app on your Android device: [Sudoku Solver](https://github.com/mithunvoe/sudoku_solver/releases/download/android/app-release.apk)
## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/mithunvoe/sudoku_solver.git
   cd sudoku_solver
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```

3. **Run the app:**
   ```sh
   flutter run
   ```

## Project Structure

- **lib/main.dart:** Entry point of the application.
- **lib/provider/themes_provider.dart:** Contains the theme provider and theme configurations.
- **lib/screens/sudoku_solver.dart:** Main screen for the Sudoku solver.
- **assets/img/:** Directory containing image assets.

## Usage

1. **Launch the app:**
   ```sh
   flutter run
   ```

2. **Input the Sudoku puzzle:**
   - Enter the numbers in the provided grid.
   - Leave empty cells for the numbers to be solved.

3. **Solve the puzzle:**
   - Press the "Solve" button to get the solution.

## Themes

The app supports both light and dark themes. The theme can be toggled using the switch in the app bar.

## Dependencies

- `flutter/material.dart`: For building the UI.
- `provider`: For state management.

## Assets

- **assets/img/sun.png:** Icon for light theme.
- **assets/img/moon.png:** Icon for dark theme.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any improvements.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Contact

For any questions or feedback, please contact [mithunvoe](https://github.com/mithunvoe/sudoku_solver).
