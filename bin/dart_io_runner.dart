library perf.dart_io;

import 'dart:io';

import 'package:shelf_perf_compare/shared.dart';

void main() {
  var port = 8080;
  serveStream(port++);
  serveStream(port++);
}

void serveStream([int port = 8080]) {
  HttpServer.bind('127.0.0.1', port).then((server){
    print('dart:io Stream @ ${server.address.host}:${server.port}');
    server.listen((HttpRequest request) {

      request.response.addStream(getHelloWorldStream()).then((_) {
        return request.response.close();
      });

    });
  });
}

void serveString([int port = 8080]) {
  HttpServer.bind('127.0.0.1', port).then((server){
    print('dart:io String @ ${server.address.host}:${server.port}');
    server.listen((HttpRequest request) {
      request.response.write(HELLO_WORLD);
      request.response.close();
    });
  });
}
