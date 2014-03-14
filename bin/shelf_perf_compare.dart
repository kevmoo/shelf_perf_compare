
import 'dart_io.dart' as io;
import 'shelf.dart' as shelf;

void main() {
  int port = 8080;

  io.serve(port++);

  shelf.syncResponse(port++);
  shelf.futureResponse(port++);
  shelf.futureValueResponse(port++);
}
