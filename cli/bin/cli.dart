import 'package:args/command_runner.dart';
import 'package:cli/export_command.dart';
import 'package:cli/photo_commands/add_command.dart';
import 'package:cli/category_command/category_command.dart';
import 'package:cli/database.dart';
import 'package:cli/photo_commands/delete_command.dart';
import 'package:cli/rearrange_command.dart';
import 'package:cli/repair_command.dart';
import 'package:cli/switch_command.dart';
import 'package:cli/truncate_command/truncate_command.dart';

void main(List<String> arguments) {
  final runner = CommandRunner(
    'alexsnaps',
    'Command runner for Alex Snaps app',
  );

  Database database = Database();
  database.load();

  runner.addCommand(AddCommand(database));
  runner.addCommand(DeleteCommand(database));
  runner.addCommand(CategoryCommand(database));
  runner.addCommand(TruncateCommand(database));
  runner.addCommand(RepairCommand(database));
  runner.addCommand(SwitchCommand(database));
  runner.addCommand(RearrangeCommand(database));
  runner.addCommand(ExportCommand(database));
  runner.run(arguments);
  database.save();
}