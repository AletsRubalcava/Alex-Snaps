import 'package:args/command_runner.dart';
import 'package:cli/database.dart';
import 'package:cli/truncate_command/truncate_database.dart';
import 'package:cli/truncate_command/truncate_order.dart';
import 'package:cli/truncate_command/truncate_photos.dart';
import 'truncate_categories.dart';

class TruncateCommand extends Command {
  @override
  final name = 'truncate';

  @override
  final description =
      'Parent command for truncating the database. Requires a subcommand';

  final Database database;

  TruncateCommand(this.database) {
    addSubcommand(TruncateCategoriesCommand(database));
    addSubcommand(TruncatePhotosCommand(database));
    addSubcommand(TruncateOrderCommand(database));
    addSubcommand(TruncateDatabaseCommand(database));
  }
}