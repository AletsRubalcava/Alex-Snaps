import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:cli/database.dart';

class TruncateDatabaseCommand extends Command {
  @override
  final name = 'database';

  @override
  final description =
      'Truncates the whole database.';

  final Database database;

  TruncateDatabaseCommand(this.database);

  @override
  void run() {
    final results = argResults!.rest;

    if (results.isNotEmpty) {
      print('This command does not receives arguments');
      return;
    }

    print('This will delete all the database, are you sure you want to continue?');
    print('Type "CONFIRM" to continue, anything else to abort.');

    String? input = stdin.readLineSync();

    if(input == "CONFIRM"){
      database.categories.clear();
      database.photos.clear();
      database.maxOrder = 0;
      print('Database cleared!');
      database.save();
      return;
    }
    print('Aborting.');
  }
}