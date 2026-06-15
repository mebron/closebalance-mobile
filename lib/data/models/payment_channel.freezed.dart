// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentChannel {

 int get id; String get name; String get type;
/// Create a copy of PaymentChannel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentChannelCopyWith<PaymentChannel> get copyWith => _$PaymentChannelCopyWithImpl<PaymentChannel>(this as PaymentChannel, _$identity);

  /// Serializes this PaymentChannel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentChannel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type);

@override
String toString() {
  return 'PaymentChannel(id: $id, name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class $PaymentChannelCopyWith<$Res>  {
  factory $PaymentChannelCopyWith(PaymentChannel value, $Res Function(PaymentChannel) _then) = _$PaymentChannelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String type
});




}
/// @nodoc
class _$PaymentChannelCopyWithImpl<$Res>
    implements $PaymentChannelCopyWith<$Res> {
  _$PaymentChannelCopyWithImpl(this._self, this._then);

  final PaymentChannel _self;
  final $Res Function(PaymentChannel) _then;

/// Create a copy of PaymentChannel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentChannel].
extension PaymentChannelPatterns on PaymentChannel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentChannel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentChannel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentChannel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentChannel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentChannel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentChannel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentChannel() when $default != null:
return $default(_that.id,_that.name,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String type)  $default,) {final _that = this;
switch (_that) {
case _PaymentChannel():
return $default(_that.id,_that.name,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String type)?  $default,) {final _that = this;
switch (_that) {
case _PaymentChannel() when $default != null:
return $default(_that.id,_that.name,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentChannel implements PaymentChannel {
  const _PaymentChannel({required this.id, required this.name, required this.type});
  factory _PaymentChannel.fromJson(Map<String, dynamic> json) => _$PaymentChannelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String type;

/// Create a copy of PaymentChannel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentChannelCopyWith<_PaymentChannel> get copyWith => __$PaymentChannelCopyWithImpl<_PaymentChannel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentChannelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentChannel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type);

@override
String toString() {
  return 'PaymentChannel(id: $id, name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class _$PaymentChannelCopyWith<$Res> implements $PaymentChannelCopyWith<$Res> {
  factory _$PaymentChannelCopyWith(_PaymentChannel value, $Res Function(_PaymentChannel) _then) = __$PaymentChannelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String type
});




}
/// @nodoc
class __$PaymentChannelCopyWithImpl<$Res>
    implements _$PaymentChannelCopyWith<$Res> {
  __$PaymentChannelCopyWithImpl(this._self, this._then);

  final _PaymentChannel _self;
  final $Res Function(_PaymentChannel) _then;

/// Create a copy of PaymentChannel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,}) {
  return _then(_PaymentChannel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
