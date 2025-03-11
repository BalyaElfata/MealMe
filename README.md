# MealMe

MealMe is a meal recipe iOS application built with Clean Architecture that displays meals fetched from TheMealDB API. Users can search for meals, filter them by cuisine type, save their favorite meals, and view detailed cooking instructions.

## Features

### Core Features
- Browse meals with images, names, and cuisine types
- Search meals by name
- Filter meals by cuisine type using filter buttons
- Save favorite meals for offline access
- Clean Architecture implementation (MVVM + Clean Architecture)

### Meal Details
- View high-quality meal images
- See cuisine type labels
- Read detailed ingredient lists with measurements
- Follow step-by-step cooking instructions
- Watch cooking tutorials via YouTube links
- Bookmark favorite meals

### Technical Features
- Clean Architecture with MVVM pattern
- Dependency Injection
- CoreData integration for offline storage
- Asynchronous image loading
- Unit testing coverage
- Network layer abstraction
- Custom UI components
- Coordinator pattern for navigation

## Architecture

The project follows Clean Architecture principles with the following layers:

### Domain Layer
- Entities (Menu)
- Use Cases (MenuUseCase)
- Repository Interfaces

### Data Layer
- Repository Implementations
- Network Service
- CoreData Storage

### Presentation Layer
- ViewModels
- Views (UIKit)
- Coordinators

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/MealMe.git
    ```
2. Open the project in Xcode:
    ```sh
    cd MealMe
    open MealMe.xcodeproj
    ```
3. Install SwiftLint (optional):
    ```sh
    brew install swiftlint
    ```

## Requirements
- iOS 14.0+
- Xcode 13.0+
- Swift 5.0+

## Usage

1. Launch the application
2. Browse through the meal collection
3. Use the search bar to find specific meals
4. Filter meals by cuisine type using the top filter buttons
5. Tap on a meal to view:
   - Detailed images
   - Ingredient list with measurements
   - Cooking instructions
   - YouTube tutorial link
6. Bookmark meals using the bookmark button
7. Access saved meals in the Bookmarks section

## Testing

The project includes comprehensive tests:

### Unit Tests
- `NetworkTests`: API connectivity and response validation
- `ModelTests`: CoreData operations and model mapping
- Located in [MealMeTests](http://_vscodecontentref_/1)

To run the tests, select the test target in Xcode and press `Cmd+U`.

## Project Structure
MealMe/ ├── App/ │ ├── AppDelegate.swift │ ├── SceneDelegate.swift │ └── DI/ ├── Domain/ │ ├── Entities/ │ └── UseCases/ ├── Data/ │ ├── Repositories/ │ └── Network/ ├── Presentation/ │ ├── ViewModels/ │ └── Views/ └── Resources/ └── Assets.xcassets/

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- TheMealDB API for providing the meal data
- SwiftLint for code style enforcement
