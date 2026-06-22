# myapplication

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

 steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Setup flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.44.1'

GitHub creates a runner (virtual machine).
Checkout Code → Downloads your Flutter project.
Setup Flutter → Installs Flutter SDK
