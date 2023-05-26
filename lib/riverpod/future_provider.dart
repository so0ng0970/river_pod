import 'package:flutter_riverpod/flutter_riverpod.dart';

final multiplesFutureProvider = FutureProvider(
  (ref) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    return [
      1,
      2,
      3,
      4,
      5,
    ];
  },
);
