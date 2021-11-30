import 'package:freezed_annotation/freezed_annotation.dart';

part 'env.freezed.dart';

@freezed
class Env with _$Env {
  static const Env mock = Env('mock', true, true);
  static const Env sandbox = Env('sandbox', true, false);
  static const Env staging = Env('staging', true, false);
  static const Env prod = Env('prod', false, false);

  const factory Env(String name, bool isTest, bool isLocal) = _Env;
}