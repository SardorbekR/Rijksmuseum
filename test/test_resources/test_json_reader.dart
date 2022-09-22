import 'dart:io';

String readFromJson(String fileName) => File('test/test_resources/$fileName').readAsStringSync();
