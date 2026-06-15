// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaleLine {

 int get id;@JsonKey(name: 'payment_channel_id') int get paymentChannelId;@JsonKey(name: 'payment_channel') PaymentChannel? get paymentChannel; double get amount;
/// Create a copy of SaleLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleLineCopyWith<SaleLine> get copyWith => _$SaleLineCopyWithImpl<SaleLine>(this as SaleLine, _$identity);

  /// Serializes this SaleLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleLine&&(identical(other.id, id) || other.id == id)&&(identical(other.paymentChannelId, paymentChannelId) || other.paymentChannelId == paymentChannelId)&&(identical(other.paymentChannel, paymentChannel) || other.paymentChannel == paymentChannel)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,paymentChannelId,paymentChannel,amount);

@override
String toString() {
  return 'SaleLine(id: $id, paymentChannelId: $paymentChannelId, paymentChannel: $paymentChannel, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $SaleLineCopyWith<$Res>  {
  factory $SaleLineCopyWith(SaleLine value, $Res Function(SaleLine) _then) = _$SaleLineCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'payment_channel_id') int paymentChannelId,@JsonKey(name: 'payment_channel') PaymentChannel? paymentChannel, double amount
});


$PaymentChannelCopyWith<$Res>? get paymentChannel;

}
/// @nodoc
class _$SaleLineCopyWithImpl<$Res>
    implements $SaleLineCopyWith<$Res> {
  _$SaleLineCopyWithImpl(this._self, this._then);

  final SaleLine _self;
  final $Res Function(SaleLine) _then;

/// Create a copy of SaleLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? paymentChannelId = null,Object? paymentChannel = freezed,Object? amount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,paymentChannelId: null == paymentChannelId ? _self.paymentChannelId : paymentChannelId // ignore: cast_nullable_to_non_nullable
as int,paymentChannel: freezed == paymentChannel ? _self.paymentChannel : paymentChannel // ignore: cast_nullable_to_non_nullable
as PaymentChannel?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of SaleLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentChannelCopyWith<$Res>? get paymentChannel {
    if (_self.paymentChannel == null) {
    return null;
  }

  return $PaymentChannelCopyWith<$Res>(_self.paymentChannel!, (value) {
    return _then(_self.copyWith(paymentChannel: value));
  });
}
}


/// Adds pattern-matching-related methods to [SaleLine].
extension SaleLinePatterns on SaleLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleLine value)  $default,){
final _that = this;
switch (_that) {
case _SaleLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleLine value)?  $default,){
final _that = this;
switch (_that) {
case _SaleLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'payment_channel_id')  int paymentChannelId, @JsonKey(name: 'payment_channel')  PaymentChannel? paymentChannel,  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleLine() when $default != null:
return $default(_that.id,_that.paymentChannelId,_that.paymentChannel,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'payment_channel_id')  int paymentChannelId, @JsonKey(name: 'payment_channel')  PaymentChannel? paymentChannel,  double amount)  $default,) {final _that = this;
switch (_that) {
case _SaleLine():
return $default(_that.id,_that.paymentChannelId,_that.paymentChannel,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'payment_channel_id')  int paymentChannelId, @JsonKey(name: 'payment_channel')  PaymentChannel? paymentChannel,  double amount)?  $default,) {final _that = this;
switch (_that) {
case _SaleLine() when $default != null:
return $default(_that.id,_that.paymentChannelId,_that.paymentChannel,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleLine implements SaleLine {
  const _SaleLine({required this.id, @JsonKey(name: 'payment_channel_id') required this.paymentChannelId, @JsonKey(name: 'payment_channel') this.paymentChannel, required this.amount});
  factory _SaleLine.fromJson(Map<String, dynamic> json) => _$SaleLineFromJson(json);

@override final  int id;
@override@JsonKey(name: 'payment_channel_id') final  int paymentChannelId;
@override@JsonKey(name: 'payment_channel') final  PaymentChannel? paymentChannel;
@override final  double amount;

/// Create a copy of SaleLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleLineCopyWith<_SaleLine> get copyWith => __$SaleLineCopyWithImpl<_SaleLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleLineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleLine&&(identical(other.id, id) || other.id == id)&&(identical(other.paymentChannelId, paymentChannelId) || other.paymentChannelId == paymentChannelId)&&(identical(other.paymentChannel, paymentChannel) || other.paymentChannel == paymentChannel)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,paymentChannelId,paymentChannel,amount);

@override
String toString() {
  return 'SaleLine(id: $id, paymentChannelId: $paymentChannelId, paymentChannel: $paymentChannel, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$SaleLineCopyWith<$Res> implements $SaleLineCopyWith<$Res> {
  factory _$SaleLineCopyWith(_SaleLine value, $Res Function(_SaleLine) _then) = __$SaleLineCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'payment_channel_id') int paymentChannelId,@JsonKey(name: 'payment_channel') PaymentChannel? paymentChannel, double amount
});


@override $PaymentChannelCopyWith<$Res>? get paymentChannel;

}
/// @nodoc
class __$SaleLineCopyWithImpl<$Res>
    implements _$SaleLineCopyWith<$Res> {
  __$SaleLineCopyWithImpl(this._self, this._then);

  final _SaleLine _self;
  final $Res Function(_SaleLine) _then;

/// Create a copy of SaleLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? paymentChannelId = null,Object? paymentChannel = freezed,Object? amount = null,}) {
  return _then(_SaleLine(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,paymentChannelId: null == paymentChannelId ? _self.paymentChannelId : paymentChannelId // ignore: cast_nullable_to_non_nullable
as int,paymentChannel: freezed == paymentChannel ? _self.paymentChannel : paymentChannel // ignore: cast_nullable_to_non_nullable
as PaymentChannel?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of SaleLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentChannelCopyWith<$Res>? get paymentChannel {
    if (_self.paymentChannel == null) {
    return null;
  }

  return $PaymentChannelCopyWith<$Res>(_self.paymentChannel!, (value) {
    return _then(_self.copyWith(paymentChannel: value));
  });
}
}

// dart format on
