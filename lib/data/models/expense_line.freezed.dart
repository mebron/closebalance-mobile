// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpenseLine {

 int get id;@JsonKey(name: 'expense_category_id') int get expenseCategoryId; ExpenseCategory? get category; String get description; double get amount;@JsonKey(name: 'payment_method') String get paymentMethod; String? get remarks;
/// Create a copy of ExpenseLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseLineCopyWith<ExpenseLine> get copyWith => _$ExpenseLineCopyWithImpl<ExpenseLine>(this as ExpenseLine, _$identity);

  /// Serializes this ExpenseLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseLine&&(identical(other.id, id) || other.id == id)&&(identical(other.expenseCategoryId, expenseCategoryId) || other.expenseCategoryId == expenseCategoryId)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.remarks, remarks) || other.remarks == remarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,expenseCategoryId,category,description,amount,paymentMethod,remarks);

@override
String toString() {
  return 'ExpenseLine(id: $id, expenseCategoryId: $expenseCategoryId, category: $category, description: $description, amount: $amount, paymentMethod: $paymentMethod, remarks: $remarks)';
}


}

/// @nodoc
abstract mixin class $ExpenseLineCopyWith<$Res>  {
  factory $ExpenseLineCopyWith(ExpenseLine value, $Res Function(ExpenseLine) _then) = _$ExpenseLineCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'expense_category_id') int expenseCategoryId, ExpenseCategory? category, String description, double amount,@JsonKey(name: 'payment_method') String paymentMethod, String? remarks
});


$ExpenseCategoryCopyWith<$Res>? get category;

}
/// @nodoc
class _$ExpenseLineCopyWithImpl<$Res>
    implements $ExpenseLineCopyWith<$Res> {
  _$ExpenseLineCopyWithImpl(this._self, this._then);

  final ExpenseLine _self;
  final $Res Function(ExpenseLine) _then;

/// Create a copy of ExpenseLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? expenseCategoryId = null,Object? category = freezed,Object? description = null,Object? amount = null,Object? paymentMethod = null,Object? remarks = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,expenseCategoryId: null == expenseCategoryId ? _self.expenseCategoryId : expenseCategoryId // ignore: cast_nullable_to_non_nullable
as int,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ExpenseCategory?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ExpenseLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpenseCategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $ExpenseCategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExpenseLine].
extension ExpenseLinePatterns on ExpenseLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseLine value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseLine value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'expense_category_id')  int expenseCategoryId,  ExpenseCategory? category,  String description,  double amount, @JsonKey(name: 'payment_method')  String paymentMethod,  String? remarks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseLine() when $default != null:
return $default(_that.id,_that.expenseCategoryId,_that.category,_that.description,_that.amount,_that.paymentMethod,_that.remarks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'expense_category_id')  int expenseCategoryId,  ExpenseCategory? category,  String description,  double amount, @JsonKey(name: 'payment_method')  String paymentMethod,  String? remarks)  $default,) {final _that = this;
switch (_that) {
case _ExpenseLine():
return $default(_that.id,_that.expenseCategoryId,_that.category,_that.description,_that.amount,_that.paymentMethod,_that.remarks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'expense_category_id')  int expenseCategoryId,  ExpenseCategory? category,  String description,  double amount, @JsonKey(name: 'payment_method')  String paymentMethod,  String? remarks)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseLine() when $default != null:
return $default(_that.id,_that.expenseCategoryId,_that.category,_that.description,_that.amount,_that.paymentMethod,_that.remarks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpenseLine implements ExpenseLine {
  const _ExpenseLine({required this.id, @JsonKey(name: 'expense_category_id') required this.expenseCategoryId, this.category, required this.description, required this.amount, @JsonKey(name: 'payment_method') required this.paymentMethod, this.remarks});
  factory _ExpenseLine.fromJson(Map<String, dynamic> json) => _$ExpenseLineFromJson(json);

@override final  int id;
@override@JsonKey(name: 'expense_category_id') final  int expenseCategoryId;
@override final  ExpenseCategory? category;
@override final  String description;
@override final  double amount;
@override@JsonKey(name: 'payment_method') final  String paymentMethod;
@override final  String? remarks;

/// Create a copy of ExpenseLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseLineCopyWith<_ExpenseLine> get copyWith => __$ExpenseLineCopyWithImpl<_ExpenseLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseLineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseLine&&(identical(other.id, id) || other.id == id)&&(identical(other.expenseCategoryId, expenseCategoryId) || other.expenseCategoryId == expenseCategoryId)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.remarks, remarks) || other.remarks == remarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,expenseCategoryId,category,description,amount,paymentMethod,remarks);

@override
String toString() {
  return 'ExpenseLine(id: $id, expenseCategoryId: $expenseCategoryId, category: $category, description: $description, amount: $amount, paymentMethod: $paymentMethod, remarks: $remarks)';
}


}

/// @nodoc
abstract mixin class _$ExpenseLineCopyWith<$Res> implements $ExpenseLineCopyWith<$Res> {
  factory _$ExpenseLineCopyWith(_ExpenseLine value, $Res Function(_ExpenseLine) _then) = __$ExpenseLineCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'expense_category_id') int expenseCategoryId, ExpenseCategory? category, String description, double amount,@JsonKey(name: 'payment_method') String paymentMethod, String? remarks
});


@override $ExpenseCategoryCopyWith<$Res>? get category;

}
/// @nodoc
class __$ExpenseLineCopyWithImpl<$Res>
    implements _$ExpenseLineCopyWith<$Res> {
  __$ExpenseLineCopyWithImpl(this._self, this._then);

  final _ExpenseLine _self;
  final $Res Function(_ExpenseLine) _then;

/// Create a copy of ExpenseLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? expenseCategoryId = null,Object? category = freezed,Object? description = null,Object? amount = null,Object? paymentMethod = null,Object? remarks = freezed,}) {
  return _then(_ExpenseLine(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,expenseCategoryId: null == expenseCategoryId ? _self.expenseCategoryId : expenseCategoryId // ignore: cast_nullable_to_non_nullable
as int,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ExpenseCategory?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ExpenseLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpenseCategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $ExpenseCategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
