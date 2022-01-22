// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'friends.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Friends _$FriendsFromJson(Map<String, dynamic> json) {
  return _Friends.fromJson(json);
}

/// @nodoc
class _$FriendsTearOff {
  const _$FriendsTearOff();

  _Friends call({required int id, required String guid, required String name}) {
    return _Friends(
      id: id,
      guid: guid,
      name: name,
    );
  }

  Friends fromJson(Map<String, Object?> json) {
    return Friends.fromJson(json);
  }
}

/// @nodoc
const $Friends = _$FriendsTearOff();

/// @nodoc
mixin _$Friends {
  int get id => throw _privateConstructorUsedError;
  String get guid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendsCopyWith<Friends> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendsCopyWith<$Res> {
  factory $FriendsCopyWith(Friends value, $Res Function(Friends) then) =
      _$FriendsCopyWithImpl<$Res>;
  $Res call({int id, String guid, String name});
}

/// @nodoc
class _$FriendsCopyWithImpl<$Res> implements $FriendsCopyWith<$Res> {
  _$FriendsCopyWithImpl(this._value, this._then);

  final Friends _value;
  // ignore: unused_field
  final $Res Function(Friends) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? guid = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      guid: guid == freezed
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FriendsCopyWith<$Res> implements $FriendsCopyWith<$Res> {
  factory _$FriendsCopyWith(_Friends value, $Res Function(_Friends) then) =
      __$FriendsCopyWithImpl<$Res>;
  @override
  $Res call({int id, String guid, String name});
}

/// @nodoc
class __$FriendsCopyWithImpl<$Res> extends _$FriendsCopyWithImpl<$Res>
    implements _$FriendsCopyWith<$Res> {
  __$FriendsCopyWithImpl(_Friends _value, $Res Function(_Friends) _then)
      : super(_value, (v) => _then(v as _Friends));

  @override
  _Friends get _value => super._value as _Friends;

  @override
  $Res call({
    Object? id = freezed,
    Object? guid = freezed,
    Object? name = freezed,
  }) {
    return _then(_Friends(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      guid: guid == freezed
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Friends extends _Friends with DiagnosticableTreeMixin {
  _$_Friends({required this.id, required this.guid, required this.name})
      : super._();

  factory _$_Friends.fromJson(Map<String, dynamic> json) =>
      _$$_FriendsFromJson(json);

  @override
  final int id;
  @override
  final String guid;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Friends(id: $id, guid: $guid, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Friends'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('guid', guid))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Friends &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.guid, guid) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(guid),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$FriendsCopyWith<_Friends> get copyWith =>
      __$FriendsCopyWithImpl<_Friends>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FriendsToJson(this);
  }
}

abstract class _Friends extends Friends {
  factory _Friends(
      {required int id,
      required String guid,
      required String name}) = _$_Friends;
  _Friends._() : super._();

  factory _Friends.fromJson(Map<String, dynamic> json) = _$_Friends.fromJson;

  @override
  int get id;
  @override
  String get guid;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$FriendsCopyWith<_Friends> get copyWith =>
      throw _privateConstructorUsedError;
}
