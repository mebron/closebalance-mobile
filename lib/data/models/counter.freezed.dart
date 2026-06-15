// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Counter {

 int get id; String get name;@JsonKey(name: 'branch_id') int? get branchId;
/// Create a copy of Counter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CounterCopyWith<Counter> get copyWith => _$CounterCopyWithImpl<Counter>(this as Counter, _$identity);

  /// Serializes this Counter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Counter&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.branchId, branchId) || other.branchId == branchId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,branchId);

@override
String toString() {
  return 'Counter(id: $id, name: $name, branchId: $branchId)';
}


}

/// @nodoc
abstract mixin class $CounterCopyWith<$Res>  {
  factory $CounterCopyWith(Counter value, $Res Function(Counter) _then) = _$CounterCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'branch_id') int? branchId
});




}
/// @nodoc
class _$CounterCopyWithImpl<$Res>
    implements $CounterCopyWith<$Res> {
  _$CounterCopyWithImpl(this._self, this._then);

  final Counter _self;
  final $Res Function(Counter) _then;

/// Create a copy of Counter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? branchId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Counter].
extension CounterPatterns on Counter {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Counter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Counter() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Counter value)  $default,){
final _that = this;
switch (_that) {
case _Counter():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Counter value)?  $default,){
final _that = this;
switch (_that) {
case _Counter() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'branch_id')  int? branchId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Counter() when $default != null:
return $default(_that.id,_that.name,_that.branchId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'branch_id')  int? branchId)  $default,) {final _that = this;
switch (_that) {
case _Counter():
return $default(_that.id,_that.name,_that.branchId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'branch_id')  int? branchId)?  $default,) {final _that = this;
switch (_that) {
case _Counter() when $default != null:
return $default(_that.id,_that.name,_that.branchId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Counter implements Counter {
  const _Counter({required this.id, required this.name, @JsonKey(name: 'branch_id') this.branchId});
  factory _Counter.fromJson(Map<String, dynamic> json) => _$CounterFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'branch_id') final  int? branchId;

/// Create a copy of Counter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CounterCopyWith<_Counter> get copyWith => __$CounterCopyWithImpl<_Counter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CounterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Counter&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.branchId, branchId) || other.branchId == branchId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,branchId);

@override
String toString() {
  return 'Counter(id: $id, name: $name, branchId: $branchId)';
}


}

/// @nodoc
abstract mixin class _$CounterCopyWith<$Res> implements $CounterCopyWith<$Res> {
  factory _$CounterCopyWith(_Counter value, $Res Function(_Counter) _then) = __$CounterCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'branch_id') int? branchId
});




}
/// @nodoc
class __$CounterCopyWithImpl<$Res>
    implements _$CounterCopyWith<$Res> {
  __$CounterCopyWithImpl(this._self, this._then);

  final _Counter _self;
  final $Res Function(_Counter) _then;

/// Create a copy of Counter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? branchId = freezed,}) {
  return _then(_Counter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
