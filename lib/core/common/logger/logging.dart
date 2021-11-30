import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';
import 'package:meta/meta.dart';

export 'package:logging/logging.dart';

mixin Logging {
  static Stream<LogRecord> get onRecord => Logger.root.onRecord;
  static Logger named(String name) => Logger(name);
  static Logger self(Object self) => named(self.runtimeType.toString());
  static Logger typed<T extends Object>() => named(T.toString());

  @protected
  late final logger = self(this);

  static void init() {
    PrintAppender.setupLogging();
  }
}