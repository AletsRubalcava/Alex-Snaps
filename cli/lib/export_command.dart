import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:cli/database.dart';
import 'package:path/path.dart' as path;

class ExportCommand extends Command{
  @override
  final name = 'export';

  @override
  final description = 'Copies the json file into flutter for reading';

  Database database;

  ExportCommand(this.database);

  @override
  @override
  void run() {
    if (argResults!.rest.isNotEmpty) {
      print('This command does not accept arguments.');
      return;
    }

    final source = File(
      path.join(database.projectRoot, 'cli', 'data', 'app_data.json'),
    );

    if (!source.existsSync()) {
      print('Source JSON not found.');
      return;
    }

    final destination = File(
      path.join(database.projectRoot, 'app', 'assets', 'read_only_app_data.json'),
    );

    final destDir = Directory(path.dirname(destination.path));
    if (!destDir.existsSync()) {
      destDir.createSync(recursive: true);
    }

    if(destination.existsSync()){
      destination.deleteSync();
    }

    source.copySync(destination.path);
    print('JSON exported successfully.');
  }
}