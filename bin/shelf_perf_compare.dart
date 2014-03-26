
import 'dart_io.dart' as io;
import 'shelf.dart' as shelf;

void main() {
  int port = 8080;

  io.serveStream(port++);
  io.serveString(port++);

  shelf.syncResponse(port++);
  shelf.syncStreamResponse(port++);
  shelf.futureResponse(port++);
  shelf.futureValueResponse(port++);
}
