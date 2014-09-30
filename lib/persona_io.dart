library persona;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

/// Takes an assertion from the client and verifies it.
Future <Map> verify(assertion, audience) {
  Completer c = new Completer();
  String outurl = 'https://verifier.login.persona.org/verify';
  String payload = assertion.toString();
  http.post(outurl, body: {
    'assertion': assertion,
    'audience': audience
  }).then((response) {
    c.complete(JSON.decode(response.body));
  });
  return c.future; 
}