import 'package:uuid/uuid.dart';

extension UuidX on Uuid {
  String get generateUid => v1();
}
