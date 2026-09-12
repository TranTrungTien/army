# MobiArmy Flutter

Phase 1 foundation for the Java/LibGDX to Flutter + Flame migration.

## Generate platform runners

This source snapshot intentionally keeps generated Flutter runner files out of version control. With Flutter SDK 3.47 or compatible installed:

```sh
flutter create --platforms=android,linux,windows,macos .
flutter pub get
flutter analyze
flutter test
flutter run -d linux
```

The app is configured for landscape and immersive mode, uses Flutter routing for application screens, and mounts Flame only in the gameplay sandbox.
