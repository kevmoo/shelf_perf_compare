// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library perf.shelf;

import 'dart:async';

import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;

void syncResponse([int port = 8080]) {
  _listen('sync', _syncHandler, port);
}

void futureValueResponse([int port = 8080]) {
  _listen('future value', _futureValueHandler, port);
}

void futureResponse([int port = 8080]) {
  _listen('future', _futureHandler, port);
}

void _listen(String description, shelf.Handler handler, int port) {
  var handler = const shelf.Stack()
      .addHandler(_syncHandler);

  io.serve(handler, 'localhost', port).then((server) {
    print('$description @ ${server.address.host}:${server.port}');
  });
}

shelf.Response _syncHandler(shelf.Request request) {
  return new shelf.Response.ok("Hello, world");
}

Future<shelf.Response> _futureValueHandler(shelf.Request request) {
  return new Future.value(new shelf.Response.ok("Hello, world"));
}

Future<shelf.Response> _futureHandler(shelf.Request request) {
  return new Future(() => new shelf.Response.ok("Hello, world"));
}

