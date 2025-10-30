
# xo_and_calculator — Overview

xo_and_calculator is a compact Flutter sample app that demonstrates two small
but complete features: a local multiplayer Tic-Tac-Toe (XO) game and a basic
calculator UI. The project is intended for learning Flutter UI, simple
state handling, and navigation between screens. It's self-contained and
requires only the Flutter SDK to run.

## Features

- Tic-Tac-Toe (XO)
	- Local two-player mode on one device.
	- Game board UI built from reusable `XO` button widgets.
	- Win/draw detection, visual indicators for winners, and board reset.
	- Core logic and UI in `lib/xo_screen.dart` and `lib/widgets/xo_button.dart`.
- Calculator
	- Basic arithmetic operations (addition, subtraction, multiplication,
		division) with a simple and responsive UI.
	- Input handling and expression evaluation in `lib/calc_home_page.dart`.
- Player / Registration
	- Minimal registration screen to enter player names and simple in-memory
		player handling in `lib/register_screen.dart` and `lib/users_player.dart`.

## Project structure (important files)

- `lib/main.dart` — App entry point and route setup.
- `lib/xo_screen.dart` — Tic-Tac-Toe screen, UI and game logic.
- `lib/calc_home_page.dart` — Calculator UI and logic.
- `lib/register_screen.dart` — Player registration UI.
- `lib/users_player.dart` — Simple in-memory player storage/helper.
- `lib/models/user_model.dart` — Player/user model definition.
- `lib/widgets/` — Reusable widgets (e.g., `xo_button.dart`, text field
	wrappers).

## Repo structure (key files)

- `lib/main.dart` — app entrypoint and routing.
- `lib/xo_screen.dart` — Tic-Tac-Toe game screen and logic.
- `lib/calc_home_page.dart` — simple calculator UI logic.
- `lib/register_screen.dart`, `lib/users_player.dart` — supporting UI/screens.
- `lib/models/user_model.dart` — sample data model(s).
- `lib/widgets/` — reusable widgets (text fields, XO button, etc.).

Platform folders: `android/`, `ios/`, `web/`, `windows/`, `macos/`, `linux/`.

## Getting started (prerequisites)

- Install Flutter: https://docs.flutter.dev/get-started/install
- Ensure `flutter` is on your PATH and run `flutter doctor` to finish
	platform setup (Android SDK, Xcode for macOS/iOS, etc.).

On Windows, use PowerShell (the default) or another terminal with Flutter in
PATH.

## Run the app

Open a terminal in the project root and run one of the following depending on
your target device.

- Run on connected Android device or emulator:

	flutter pub get; flutter run -d <device-id>

- Run on Windows desktop (if enabled):

	flutter pub get; flutter run -d windows

- Run on web (Chrome):

	flutter pub get; flutter run -d chrome

To list available devices run `flutter devices`.

## Build release

- Android (APK): `flutter build apk`
- Windows: `flutter build windows`
- Web: `flutter build web`

## Tests

This repo includes a basic widget test at `test/widget_test.dart`.

Run tests with:

	flutter test

## Notable implementation details

- The XO game UI logic lives in `lib/xo_screen.dart`. The implementation is
	compact and easy to adjust if you want to change rules or the UI.
- The project uses Flutter SDK only by default. Check `pubspec.yaml` to add
	third-party packages.

## Troubleshooting

- If you get missing dependencies: `flutter pub get`.
- If platform build fails, run `flutter doctor -v` and follow the suggested
	fixes.

## Contributing

Small fixes and improvements are welcome. Suggested workflow:

1. Fork the repository.
2. Create a feature branch.
3. Open a pull request with a clear description and screenshots if UI
	 changes are involved.

## License

This project does not include an explicit license. Add one (for example, MIT)
if you plan to share publicly.

---

If you'd like, I can add a screenshot, a small CHANGELOG, or update the
`pubspec.yaml` with project metadata. Tell me which you'd like next.