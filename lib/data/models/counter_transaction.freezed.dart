// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CounterRef {

 int get id; String get name;
/// Create a copy of CounterRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CounterRefCopyWith<CounterRef> get copyWith => _$CounterRefCopyWithImpl<CounterRef>(this as CounterRef, _$identity);

  /// Serializes this CounterRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterRef&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'CounterRef(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $CounterRefCopyWith<$Res>  {
  factory $CounterRefCopyWith(CounterRef value, $Res Function(CounterRef) _then) = _$CounterRefCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$CounterRefCopyWithImpl<$Res>
    implements $CounterRefCopyWith<$Res> {
  _$CounterRefCopyWithImpl(this._self, this._then);

  final CounterRef _self;
  final $Res Function(CounterRef) _then;

/// Create a copy of CounterRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CounterRef].
extension CounterRefPatterns on CounterRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CounterRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CounterRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CounterRef value)  $default,){
final _that = this;
switch (_that) {
case _CounterRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CounterRef value)?  $default,){
final _that = this;
switch (_that) {
case _CounterRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CounterRef() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _CounterRef():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _CounterRef() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CounterRef implements CounterRef {
  const _CounterRef({required this.id, required this.name});
  factory _CounterRef.fromJson(Map<String, dynamic> json) => _$CounterRefFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of CounterRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CounterRefCopyWith<_CounterRef> get copyWith => __$CounterRefCopyWithImpl<_CounterRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CounterRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CounterRef&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'CounterRef(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CounterRefCopyWith<$Res> implements $CounterRefCopyWith<$Res> {
  factory _$CounterRefCopyWith(_CounterRef value, $Res Function(_CounterRef) _then) = __$CounterRefCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$CounterRefCopyWithImpl<$Res>
    implements _$CounterRefCopyWith<$Res> {
  __$CounterRefCopyWithImpl(this._self, this._then);

  final _CounterRef _self;
  final $Res Function(_CounterRef) _then;

/// Create a copy of CounterRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_CounterRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CounterTransaction {

 int get id;@JsonKey(name: 'counter_id') int get counterId; CounterRef? get counter; String get date;@JsonKey(name: 'sale_amount') double get saleAmount;@JsonKey(name: 'paid_amount') double get paidAmount; double get balance; String? get remarks;
/// Create a copy of CounterTransaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CounterTransactionCopyWith<CounterTransaction> get copyWith => _$CounterTransactionCopyWithImpl<CounterTransaction>(this as CounterTransaction, _$identity);

  /// Serializes this CounterTransaction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.counterId, counterId) || other.counterId == counterId)&&(identical(other.counter, counter) || other.counter == counter)&&(identical(other.date, date) || other.date == date)&&(identical(other.saleAmount, saleAmount) || other.saleAmount == saleAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.remarks, remarks) || other.remarks == remarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,counterId,counter,date,saleAmount,paidAmount,balance,remarks);

@override
String toString() {
  return 'CounterTransaction(id: $id, counterId: $counterId, counter: $counter, date: $date, saleAmount: $saleAmount, paidAmount: $paidAmount, balance: $balance, remarks: $remarks)';
}


}

/// @nodoc
abstract mixin class $CounterTransactionCopyWith<$Res>  {
  factory $CounterTransactionCopyWith(CounterTransaction value, $Res Function(CounterTransaction) _then) = _$CounterTransactionCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'counter_id') int counterId, CounterRef? counter, String date,@JsonKey(name: 'sale_amount') double saleAmount,@JsonKey(name: 'paid_amount') double paidAmount, double balance, String? remarks
});


$CounterRefCopyWith<$Res>? get counter;

}
/// @nodoc
class _$CounterTransactionCopyWithImpl<$Res>
    implements $CounterTransactionCopyWith<$Res> {
  _$CounterTransactionCopyWithImpl(this._self, this._then);

  final CounterTransaction _self;
  final $Res Function(CounterTransaction) _then;

/// Create a copy of CounterTransaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? counterId = null,Object? counter = freezed,Object? date = null,Object? saleAmount = null,Object? paidAmount = null,Object? balance = null,Object? remarks = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,counterId: null == counterId ? _self.counterId : counterId // ignore: cast_nullable_to_non_nullable
as int,counter: freezed == counter ? _self.counter : counter // ignore: cast_nullable_to_non_nullable
as CounterRef?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,saleAmount: null == saleAmount ? _self.saleAmount : saleAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CounterTransaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CounterRefCopyWith<$Res>? get counter {
    if (_self.counter == null) {
    return null;
  }

  return $CounterRefCopyWith<$Res>(_self.counter!, (value) {
    return _then(_self.copyWith(counter: value));
  });
}
}


/// Adds pattern-matching-related methods to [CounterTransaction].
extension CounterTransactionPatterns on CounterTransaction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CounterTransaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CounterTransaction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CounterTransaction value)  $default,){
final _that = this;
switch (_that) {
case _CounterTransaction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CounterTransaction value)?  $default,){
final _that = this;
switch (_that) {
case _CounterTransaction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'counter_id')  int counterId,  CounterRef? counter,  String date, @JsonKey(name: 'sale_amount')  double saleAmount, @JsonKey(name: 'paid_amount')  double paidAmount,  double balance,  String? remarks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CounterTransaction() when $default != null:
return $default(_that.id,_that.counterId,_that.counter,_that.date,_that.saleAmount,_that.paidAmount,_that.balance,_that.remarks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'counter_id')  int counterId,  CounterRef? counter,  String date, @JsonKey(name: 'sale_amount')  double saleAmount, @JsonKey(name: 'paid_amount')  double paidAmount,  double balance,  String? remarks)  $default,) {final _that = this;
switch (_that) {
case _CounterTransaction():
return $default(_that.id,_that.counterId,_that.counter,_that.date,_that.saleAmount,_that.paidAmount,_that.balance,_that.remarks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'counter_id')  int counterId,  CounterRef? counter,  String date, @JsonKey(name: 'sale_amount')  double saleAmount, @JsonKey(name: 'paid_amount')  double paidAmount,  double balance,  String? remarks)?  $default,) {final _that = this;
switch (_that) {
case _CounterTransaction() when $default != null:
return $default(_that.id,_that.counterId,_that.counter,_that.date,_that.saleAmount,_that.paidAmount,_that.balance,_that.remarks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CounterTransaction implements CounterTransaction {
  const _CounterTransaction({required this.id, @JsonKey(name: 'counter_id') required this.counterId, this.counter, required this.date, @JsonKey(name: 'sale_amount') required this.saleAmount, @JsonKey(name: 'paid_amount') required this.paidAmount, required this.balance, this.remarks});
  factory _CounterTransaction.fromJson(Map<String, dynamic> json) => _$CounterTransactionFromJson(json);

@override final  int id;
@override@JsonKey(name: 'counter_id') final  int counterId;
@override final  CounterRef? counter;
@override final  String date;
@override@JsonKey(name: 'sale_amount') final  double saleAmount;
@override@JsonKey(name: 'paid_amount') final  double paidAmount;
@override final  double balance;
@override final  String? remarks;

/// Create a copy of CounterTransaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CounterTransactionCopyWith<_CounterTransaction> get copyWith => __$CounterTransactionCopyWithImpl<_CounterTransaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CounterTransactionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CounterTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.counterId, counterId) || other.counterId == counterId)&&(identical(other.counter, counter) || other.counter == counter)&&(identical(other.date, date) || other.date == date)&&(identical(other.saleAmount, saleAmount) || other.saleAmount == saleAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.remarks, remarks) || other.remarks == remarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,counterId,counter,date,saleAmount,paidAmount,balance,remarks);

@override
String toString() {
  return 'CounterTransaction(id: $id, counterId: $counterId, counter: $counter, date: $date, saleAmount: $saleAmount, paidAmount: $paidAmount, balance: $balance, remarks: $remarks)';
}


}

/// @nodoc
abstract mixin class _$CounterTransactionCopyWith<$Res> implements $CounterTransactionCopyWith<$Res> {
  factory _$CounterTransactionCopyWith(_CounterTransaction value, $Res Function(_CounterTransaction) _then) = __$CounterTransactionCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'counter_id') int counterId, CounterRef? counter, String date,@JsonKey(name: 'sale_amount') double saleAmount,@JsonKey(name: 'paid_amount') double paidAmount, double balance, String? remarks
});


@override $CounterRefCopyWith<$Res>? get counter;

}
/// @nodoc
class __$CounterTransactionCopyWithImpl<$Res>
    implements _$CounterTransactionCopyWith<$Res> {
  __$CounterTransactionCopyWithImpl(this._self, this._then);

  final _CounterTransaction _self;
  final $Res Function(_CounterTransaction) _then;

/// Create a copy of CounterTransaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? counterId = null,Object? counter = freezed,Object? date = null,Object? saleAmount = null,Object? paidAmount = null,Object? balance = null,Object? remarks = freezed,}) {
  return _then(_CounterTransaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,counterId: null == counterId ? _self.counterId : counterId // ignore: cast_nullable_to_non_nullable
as int,counter: freezed == counter ? _self.counter : counter // ignore: cast_nullable_to_non_nullable
as CounterRef?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,saleAmount: null == saleAmount ? _self.saleAmount : saleAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CounterTransaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CounterRefCopyWith<$Res>? get counter {
    if (_self.counter == null) {
    return null;
  }

  return $CounterRefCopyWith<$Res>(_self.counter!, (value) {
    return _then(_self.copyWith(counter: value));
  });
}
}

// dart format on
