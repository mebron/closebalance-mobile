// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deduction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Deduction {

 int get id; String get type; String? get description; double get amount;@JsonKey(name: 'payment_method') String get paymentMethod;
/// Create a copy of Deduction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeductionCopyWith<Deduction> get copyWith => _$DeductionCopyWithImpl<Deduction>(this as Deduction, _$identity);

  /// Serializes this Deduction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Deduction&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,description,amount,paymentMethod);

@override
String toString() {
  return 'Deduction(id: $id, type: $type, description: $description, amount: $amount, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class $DeductionCopyWith<$Res>  {
  factory $DeductionCopyWith(Deduction value, $Res Function(Deduction) _then) = _$DeductionCopyWithImpl;
@useResult
$Res call({
 int id, String type, String? description, double amount,@JsonKey(name: 'payment_method') String paymentMethod
});




}
/// @nodoc
class _$DeductionCopyWithImpl<$Res>
    implements $DeductionCopyWith<$Res> {
  _$DeductionCopyWithImpl(this._self, this._then);

  final Deduction _self;
  final $Res Function(Deduction) _then;

/// Create a copy of Deduction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? description = freezed,Object? amount = null,Object? paymentMethod = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Deduction].
extension DeductionPatterns on Deduction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Deduction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Deduction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Deduction value)  $default,){
final _that = this;
switch (_that) {
case _Deduction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Deduction value)?  $default,){
final _that = this;
switch (_that) {
case _Deduction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String type,  String? description,  double amount, @JsonKey(name: 'payment_method')  String paymentMethod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Deduction() when $default != null:
return $default(_that.id,_that.type,_that.description,_that.amount,_that.paymentMethod);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String type,  String? description,  double amount, @JsonKey(name: 'payment_method')  String paymentMethod)  $default,) {final _that = this;
switch (_that) {
case _Deduction():
return $default(_that.id,_that.type,_that.description,_that.amount,_that.paymentMethod);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String type,  String? description,  double amount, @JsonKey(name: 'payment_method')  String paymentMethod)?  $default,) {final _that = this;
switch (_that) {
case _Deduction() when $default != null:
return $default(_that.id,_that.type,_that.description,_that.amount,_that.paymentMethod);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Deduction implements Deduction {
  const _Deduction({required this.id, required this.type, this.description, required this.amount, @JsonKey(name: 'payment_method') required this.paymentMethod});
  factory _Deduction.fromJson(Map<String, dynamic> json) => _$DeductionFromJson(json);

@override final  int id;
@override final  String type;
@override final  String? description;
@override final  double amount;
@override@JsonKey(name: 'payment_method') final  String paymentMethod;

/// Create a copy of Deduction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeductionCopyWith<_Deduction> get copyWith => __$DeductionCopyWithImpl<_Deduction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeductionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deduction&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,description,amount,paymentMethod);

@override
String toString() {
  return 'Deduction(id: $id, type: $type, description: $description, amount: $amount, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class _$DeductionCopyWith<$Res> implements $DeductionCopyWith<$Res> {
  factory _$DeductionCopyWith(_Deduction value, $Res Function(_Deduction) _then) = __$DeductionCopyWithImpl;
@override @useResult
$Res call({
 int id, String type, String? description, double amount,@JsonKey(name: 'payment_method') String paymentMethod
});




}
/// @nodoc
class __$DeductionCopyWithImpl<$Res>
    implements _$DeductionCopyWith<$Res> {
  __$DeductionCopyWithImpl(this._self, this._then);

  final _Deduction _self;
  final $Res Function(_Deduction) _then;

/// Create a copy of Deduction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? description = freezed,Object? amount = null,Object? paymentMethod = null,}) {
  return _then(_Deduction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
