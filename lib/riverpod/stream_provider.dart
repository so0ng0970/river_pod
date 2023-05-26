import 'package:flutter_riverpod/flutter_riverpod.dart';

final multipleStreamProvider = StreamProvider<List<int>>((ref) async* {
  for (int i = 0; i < 8; i++) {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
    yield List.generate(5, (index) => index * i);
  }
});
