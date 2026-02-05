import 'dart:io';
import 'package:args/command_runner.dart';

class AddCommand extends Command {
  @override
  final name = 'add';

  @override
  final description = 'Add photos to the app';

  @override
  void run() {
    final results = argResults!.rest;

    findFile(results);

  }

  void findFile(final results){

    if(results.isEmpty){
      print('File not provided.');
      exit(2);
    }

    final dir = Directory('${Directory.current.path}/../app/assets/images');

    if(!dir.existsSync()){
      print('Directory: "app/assets/images" does not exist.');
      exit(1);
    }

    final imageFiles = dir.listSync().whereType<File>();

    File? found;

    for(final file in imageFiles){
      final name = file.uri.pathSegments.last;
      if(name == results[0]){
        found = file;
        print('Found!');
        return;
      }
    }
    print('Not found!');
    exit(1);
  }
}