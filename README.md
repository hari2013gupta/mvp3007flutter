# mvp3007

DI, Routes, Controller, Repository

```folder structure
lib/
├── config/                  # Configuration files and settings
│   └── firebase_options.dart  # Firebase configuration settings
├── generated/               # Auto-generated code (e.g., by build_runner)
├── models/                  # Data layer and business logic
│   ├── user.dart            # Data model
│   └── repository/          # Repository for API or Firebase calls
│       ├── user_auth.dart     # Handles direct API calls
│       └── firebase_service.dart  # Handles Firebase interactions
├── services/                # Services for various app functionalities
│   ├── auth_service.dart  # Handles authentication
│   └── storage_service.dart  # Local storage management
│   ├── logger_service.dart  # Logging functionality
│   └── navigator_service.dart  # Navigation handling
├── shared_widgets/          # Common reusable UI components
│   └── custom_app_bar.dart
├── utils/                   # Utility classes and functions
│   └── validators.dart      # Form validation utilities
├── views/                   # UI components, screens
│   ├── login_view/
│   │   ├── login_view.dart     # Login screen layout and UI logic
│   │   └── login_button.dart   # Specific login button (if reusable)
│   └── home_view.dart       # Home screen
├── presenters/              # Presenters handle the business logic and update the view
│   ├── login_presenter.dart
│   └── home_presenter.dart
└── main.dart                # Entry point, Firebase initialization can be done here
```


