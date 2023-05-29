import 'package:flutter_riverpod/flutter_riverpod.dart';

//* 프로바이더 모니터링
class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    super.didUpdateProvider(provider, previousValue, newValue, container);
    print(
      '[provier updated] provider: $provider / previous value: $previousValue / new value: $newValue ',
    );
  }

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    // TODO: implement didAddProvider
    super.didAddProvider(provider, value, container);
    print(
      '[provier Added] provider: $provider /  value: $value ',
    );
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    print(
      '[provier disposed] provider: $provider  ',
    );
  }
}
