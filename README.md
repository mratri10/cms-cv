# cms_cv

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


- Build:
flutter build web --release --base-href /./ --dart-define=FLUTTER_WEB_CANVASKIT_URL=false

Generate Database: Pastikan kode SQL lokal sudah siap.
dart run build_runner build --delete-conflicting-outputs
