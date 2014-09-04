library shelf_perf_compare;

import 'dart_io_runner.dart' as io;
import 'package:shelf_perf_compare/shelf_runner.dart' as shelf;

void main() {
  io.serveStream();
  io.serveString();

  shelf.syncResponse();
  shelf.syncStreamResponse();
  shelf.futureResponse();
  shelf.futureValueResponse();
}
