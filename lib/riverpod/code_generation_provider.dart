import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 1) 어떤 provider를 사용할지 결정할 고민 할 필요 없도록
// provider, futureProvider, streamProvider
// stateNotifierProvider

final _testProvider = Provider(
  (ref) => 'hello soonger',
);

@riverpod
String gState(GStateRef ref) {
  return 'hello soonger with soong';
}
// autoDispose
@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return 10;
}

// FutureProvider
@Riverpod(
  keepAlive: true,
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(
    const Duration(
      seconds: 3,
    ),
  );
  return 10;
}

// 2) Parameter > family 파라미터를 일반 함수처럼 사용할 수 있도록
