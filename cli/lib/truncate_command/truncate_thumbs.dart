import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:cli/database.dart';

class TruncateThumbsCommand extends Command {
  @override
  final name = 'thumbs';

  @override
  final description =
      'Truncates the thumbs from de data file.';

  final Database database;

  TruncateThumbsCommand(this.database);

  @override
  void run() {
    final results = argResults!.rest;

    if (results.isNotEmpty) {
      print('This command does not receives arguments');
      return;
    }

    print('This will delete all the thumbs, are you sure you want to continue?');
    print('Type "YES" to continue, anything else to abort.');

    String? input = stdin.readLineSync();

    if(input == "YES"){
      database.thumbs.clear();
      print('Thumbs cleared!');
      database.save();
      return;
    }
    print('Aborting.');
  }
}