import 'package:args/command_runner.dart';
import 'package:cli/photo_commands/add_command.dart';
import 'package:cli/category_command/category_command.dart';
import 'package:cli/database.dart';
import 'package:cli/photo_commands/delete_command.dart';

void main(List<String> arguments) {
  final runner = CommandRunner(
    'alexsnaps',
    'Command runner for Alex Snaps app',
  );

  Database database = Database();
  database.initialize();

  runner.addCommand(AddCommand(database));
  runner.addCommand(DeleteCommand(database));
  runner.addCommand(CategoryCommand(database));
  runner.run(arguments);
  database.writeDatabaseFile();
}