library shelf_perf_compare.shared;

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

const HELLO_WORLD = 'Hello, world!';

final _bytes = new Uint8List.fromList(UTF8.encode(HELLO_WORLD));

final _listOfBytes = [_bytes];

Stream<List<int>> getHelloWorldStream() =>
    new Stream.fromIterable(_listOfBytes);
