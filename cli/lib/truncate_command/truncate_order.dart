import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:cli/database.dart';

class TruncateOrderCommand extends Command {
  @override
  final name = 'order';

  @override
  final description =
      'Truncates the maximum order count of the photos from de database.';

  final Database database;

  TruncateOrderCommand(this.database);

  @override
  void run() {
    final results = argResults!.rest;

    if (results.isNotEmpty) {
      print('This command does not receives arguments');
      return;
    }

    print('This will set to 0 the max order of the photos, are you sure you want to continue?');
    print('Type "YES" to continue, anything else to abort.');

    String? input = stdin.readLineSync();

    if(input == "YES"){
      database.maxOrder = 0;
      print('Max order reset!');
      return;
    }
    print('Aborting.');
  }
}