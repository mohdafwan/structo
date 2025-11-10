import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:args/args.dart';

/// Creates a directory and file structure based on the provided paths.
///
/// This function is the core logic of the CLI tool. It takes a base path
/// and lists of folders and files to create.
void createStructure(
  String basePath,
  List<String> folders,
  List<String> files,
) {
  // Ensure the base directory exists. The `recursive: true` parameter
  // is equivalent to `mkdir -p`.
  try {
    Directory(basePath).createSync(recursive: true);
  } catch (e) {
    stderr.writeln('Error: Could not create base directory "$basePath".\n$e');
    exit(2);
  }

  // Process items in the 'folders' list. This list can contain both
  // pure directory paths and paths that end in a file name.
  for (final item in folders) {
    final fullPath = p.join(basePath, item);

    // Check if the item path has a file extension. This is a simple way
    // to distinguish files from folders in the mixed list.
    if (p.extension(fullPath).isNotEmpty) {
      // If it's a file, ensure its parent directory exists first.
      final parentDir = p.dirname(fullPath);
      Directory(parentDir).createSync(recursive: true);

      // Create the empty file.
      File(fullPath).createSync();
      print('📄 Created file: $fullPath');
    } else {
      // If it's a folder, create it recursively.
      Directory(fullPath).createSync(recursive: true);
      print('📁 Created folder: $fullPath');
    }
  }

  // Process items in the dedicated 'files' list.
  for (final file in files) {
    final fullPath = p.join(basePath, file);

    // Ensure the parent directory exists before creating the file.
    final parentDir = p.dirname(fullPath);
    if (parentDir != '.' && parentDir != basePath) {
      Directory(parentDir).createSync(recursive: true);
    }

    // Create the empty file.
    File(fullPath).createSync();
    print('📄 Created file: $fullPath');
  }
}

void main(List<String> arguments) {
  // Set up the argument parser to define expected command-line flags.
  final parser = ArgParser()
    ..addOption(
      'path',
      abbr: 'p',
      help: 'Base directory path where the structure will be created.',
      mandatory: true,
    )
    ..addOption(
      'folders',
      abbr: 'd', // 'd' for directories
      help: 'Comma-separated list of folder or folder/file paths.',
      defaultsTo: '',
    )
    ..addOption(
      'files',
      abbr: 'f',
      help: 'Comma-separated list of file paths.',
      defaultsTo: '',
    )
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Displays this help message.',
    );

  try {
    // Parse the incoming arguments.
    final argResults = parser.parse(arguments);

    if (argResults['help'] as bool) {
      print('A CLI tool to create a folder and file structure.');
      print('\nUsage:');
      print(parser.usage);
      exit(0);
    }

    // Extract values from the parsed arguments.
    final basePath = argResults['path'] as String;
    final foldersArg = argResults['folders'] as String;
    final filesArg = argResults['files'] as String;

    // Convert the comma-separated strings into clean lists of strings.
    // The `map` trims whitespace, and `where` removes any empty entries
    // that might result from trailing commas or empty strings.
    final folderList = foldersArg
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    final fileList = filesArg
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    // Call the core function to perform the file system operations.
    createStructure(basePath, folderList, fileList);
  } on ArgParserException catch (e) {
    // Handle parsing errors, such as a missing mandatory option.
    stderr.writeln('Error: ${e.message}');
    stderr.writeln('\n${parser.usage}');
    exit(1);
  } catch (e) {
    // Catch any other unexpected errors during execution.
    stderr.writeln('An unexpected error occurred: $e');
    exit(1);
  }
}
