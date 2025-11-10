# Structo

<!-- Badges: Replace with your own. You can get these from shields.io -->
[![pub version](https://img.shields.io/pub/v/Struct.svg)](https://pub.dev/packages/Struct)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://dart.dev/guides/language/effective-dart)

A brief, one-sentence description of what your command-line tool does.

## About

A more detailed description of your CLI tool. Explain the problem it solves and why it's useful. Talk about its key features and how it works.

## Features

- Feature 1: Brief description.
- Feature 2: Brief description.
- Feature 3: Brief description.

## Installation

To use this tool, you need to have the [Dart SDK](https://dart.dev/get-dart) installed on your machine.

Once Dart is installed, you can activate the CLI tool from `pub.dev` using the following command:

```bash
dart pub global activate Structo
```

This will compile the executable and place it in your system's path, allowing you to run it from anywhere.

## Usage

After installation, you can run the tool directly from your terminal.

```bash
[your_executable_name] --option <value> [arguments]
```

### Options

| Option              | Abbreviation | Description                                  | Example                                     |
| ------------------- | ------------ | -------------------------------------------- | ------------------------------------------- |
| `--help`            | `-h`         | Show usage information.                      | `[your_executable_name] --help`             |
| `--path`            | `-p`         | The target directory path. (Required)        | `--path ./my-project`                       |
| `--folders`         | `-f`         | Comma-separated list of folders to create.   | `--folders "src,lib,test"`                  |
| `--files`           | `-i`         | Comma-separated list of files to create.     | `--files "main.dart,README.md"`             |

### Example

Here's an example of creating a new project structure:

```bash
structo --path ./riverpod_app --folders "lib/core,lib/common,lib/features/auth,lib/features/home,lib/features/settings,lib/providers,lib/widgets,assets/images" --files "pubspec.yaml,README.md,lib/main.dart,lib/bootstrap.dart"

# Expected Output:
# 📁 Created folder: ./riverpod_app/lib/core
# 📁 Created folder: ./riverpod_app/lib/common
# 📁 Created folder: ./riverpod_app/lib/features/auth
# 📁 Created folder: ./riverpod_app/lib/features/home
# 📁 Created folder: ./riverpod_app/lib/features/settings
# 📁 Created folder: ./riverpod_app/lib/providers
# 📁 Created folder: ./riverpod_app/lib/widgets
# 📁 Created folder: ./riverpod_app/assets/images
# 📄 Created file: ./riverpod_app/pubspec.yaml
# 📄 Created file: ./riverpod_app/README.md
# 📄 Created file: ./riverpod_app/lib/main.dart
# 📄 Created file: ./riverpod_app/lib/bootstrap.dart
# ✅ Structure created successfully!

lib/
├── core/
│   ├── app.dart
│   ├── router.dart
│   └── constants.dart
├── common/
│   └── theme.dart
├── features/
│   ├── auth/
│   │   ├── presentation/
│   │   ├── data/
│   │   └── domain/
│   ├── home/
│   └── settings/
├── providers/
│   └── global_providers.dart
├── widgets/
│   └── custom_button.dart
├── bootstrap.dart
└── main.dart

```

---