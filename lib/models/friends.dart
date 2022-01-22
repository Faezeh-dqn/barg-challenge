import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'friends.g.dart';
part 'friends.freezed.dart';

@freezed
class Friends with _$Friends {
  const Friends._();
  factory Friends({
    required int id,
    required String guid,
    required String name,
  }) = _Friends;

  factory Friends.fromJson(Map<String, dynamic> json) =>
      _$FriendsFromJson(json);
}
