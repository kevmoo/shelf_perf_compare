library perf.dart_io;

import 'dart:io';

void main() {
  serve();
}

void serve([int port = 8080]) {
  HttpServer.bind('127.0.0.1', port).then((server){
    print('dart:io simple @ ${server.address.host}:${server.port}');
    server.listen((HttpRequest request) {
      request.response.write("Hello, world");
      request.response.close();
    });
  });
}
