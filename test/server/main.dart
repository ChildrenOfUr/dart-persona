import 'dart:io';
import 'package:persona/persona_io.dart';

main(){
  verify(
      // to test, generate an assertion and paste it in the quotes.
      // run,
      // profit.
      '',
      'http://localhost:8080/client/index.html').then(print);
}