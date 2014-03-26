// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library perf.shelf;

import 'dart:async';

import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;

import 'shared.dart';

void syncResponse([int port = 8080]) {
  _listen('sync', _syncHandler, port);
}

void syncStreamResponse([int port = 8080]) {
  _listen('sync - stream', (request) {
    return new shelf.Response.ok(getHelloWorldStream());
  }, port);
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

shelf.Response _syncHandler(shelf.Request request) => _getResponse();

Future<shelf.Response> _futureValueHandler(shelf.Request request) {
  return new Future.value(_getResponse());
}

Future<shelf.Response> _futureHandler(shelf.Request request) {
  return new Future(_getResponse);
}

shelf.Response _getResponse() => new shelf.Response.ok(HELLO_WORLD);
