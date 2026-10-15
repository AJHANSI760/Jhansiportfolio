# Development Guide

## Prerequisites

- Flutter SDK
- Dart SDK (included with Flutter)
- Google Chrome for web development
- Git

## Verify the Environment

```bash
flutter doctor
flutter --version
git --version
```

## Install Dependencies

From the repository root, run:

```bash
flutter pub get
```

## Run the Portfolio

Launch the Flutter web app in Chrome:

```bash
flutter run -d chrome
```

## Analyze and Test

Check the Dart source for issues:

```bash
flutter analyze
```

Run the automated tests:

```bash
flutter test
```

## Build for GitHub Pages

Build the production website with the repository base path:

```bash
flutter build web --release --base-href /Jhansiportfolio/ --no-wasm-dry-run
```

The generated website files are placed in `build/web`.

## Deployment

The GitHub Actions workflow in `.github/workflows/deploy.yml` deploys the web build when changes are pushed to the `main` branch.

## Screenshots

Portfolio screenshots are stored in `docs/screenshots/`.
