library perf.dart_io;

import 'dart:io';

import 'package:shelf_perf_compare/shared.dart';

void main() {
  serveStream();
  serveString();
}

void serveStream() {
  HttpServer.bind('127.0.0.1', 0).then((server){
    print('dart:io Stream @ ${server.address.host}:${server.port}');
    server.listen((HttpRequest request) {

      getHelloWorldStream().pipe(request.response);
    });
  });
}

void serveString() {
  HttpServer.bind('127.0.0.1', 0).then((server){
    print('dart:io String @ ${server.address.host}:${server.port}');
    server.listen((HttpRequest request) {
      request.response.write(HELLO_WORLD);
      request.response.close();
    });
  });
}
