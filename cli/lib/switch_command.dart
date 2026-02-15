import 'package:args/command_runner.dart';
import 'package:cli/database.dart';

class SwitchCommand extends Command {
  @override
  final name = 'switch';

  @override
  final description = 'Switches orders between photos';

  Database database;
  SwitchCommand(this.database);

  @override
  void run() {
    final results = argResults!.rest;

    if (results.isEmpty) {
      print('Values not introduced');
      printUsage();
      return;
    }

    if (results.length != 2) {
      print('This command requieres two arguments');
      printUsage();
      return;
    }

    final originalOrder = results.first;
    final targetOrder = results.last;

    //Checks if the second argument is an int
    if (int.tryParse(targetOrder) == null) {
      print('Second argument must be an int');
      return;
    }

    //Checks if the photo with order targetOrder exists
    var target = database.photos.values
        .where((photo) => photo.order.toString() == targetOrder)
        .firstOrNull;
    if (target == null) {
      print('Photo in order $targetOrder was not found.');
      return;
    }

    late final String? photoId;

    //Checks if th first argument is an int
    if (int.tryParse(originalOrder) != null) {
      photoId = database.orderMap[int.parse(originalOrder)];
      if (photoId == null) {
        print('Photo in order $originalOrder was not found.');
        return;
      }
    }else {
      //Checks if the photo with the introduced filename exist
      photoId = database.fileNameMap[originalOrder];
      if (photoId == null) {
        print('Photo $originalOrder was not found.');
        return;
      }
    }
    final photo = database.photos[photoId];

    //Swaps the orders
    final temp = photo!.order;
    photo.order = target.order;
    target.order = temp;
    print('Photo order changed!');
  }
}
