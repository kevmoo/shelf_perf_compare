library shelf_perf_compare;

import 'dart_io_runner.dart' as io;
import 'package:shelf_perf_compare/shelf_runner.dart' as shelf;

void main() {
  int port = 8080;

  io.serveStream(port++);
  io.serveString(port++);

  shelf.syncResponse(port++);
  shelf.syncStreamResponse(port++);
  shelf.futureResponse(port++);
  shelf.futureValueResponse(port++);
}
