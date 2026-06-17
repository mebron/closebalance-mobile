// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editable_closing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EditableSale {

 String get clientId;@JsonKey(name: 'server_id') int? get serverId;@JsonKey(name: 'payment_channel_id') int get paymentChannelId; double get amount; bool get dirty; bool get deleted;
/// Create a copy of EditableSale
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditableSaleCopyWith<EditableSale> get copyWith => _$EditableSaleCopyWithImpl<EditableSale>(this as EditableSale, _$identity);

  /// Serializes this EditableSale to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditableSale&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.paymentChannelId, paymentChannelId) || other.paymentChannelId == paymentChannelId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.dirty, dirty) || other.dirty == dirty)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,serverId,paymentChannelId,amount,dirty,deleted);

@override
String toString() {
  return 'EditableSale(clientId: $clientId, serverId: $serverId, paymentChannelId: $paymentChannelId, amount: $amount, dirty: $dirty, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class $EditableSaleCopyWith<$Res>  {
  factory $EditableSaleCopyWith(EditableSale value, $Res Function(EditableSale) _then) = _$EditableSaleCopyWithImpl;
@useResult
$Res call({
 String clientId,@JsonKey(name: 'server_id') int? serverId,@JsonKey(name: 'payment_channel_id') int paymentChannelId, double amount, bool dirty, bool deleted
});




}
/// @nodoc
class _$EditableSaleCopyWithImpl<$Res>
    implements $EditableSaleCopyWith<$Res> {
  _$EditableSaleCopyWithImpl(this._self, this._then);

  final EditableSale _self;
  final $Res Function(EditableSale) _then;

/// Create a copy of EditableSale
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,Object? serverId = freezed,Object? paymentChannelId = null,Object? amount = null,Object? dirty = null,Object? deleted = null,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,paymentChannelId: null == paymentChannelId ? _self.paymentChannelId : paymentChannelId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,dirty: null == dirty ? _self.dirty : dirty // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EditableSale].
extension EditableSalePatterns on EditableSale {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditableSale value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditableSale() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditableSale value)  $default,){
final _that = this;
switch (_that) {
case _EditableSale():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditableSale value)?  $default,){
final _that = this;
switch (_that) {
case _EditableSale() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String clientId, @JsonKey(name: 'server_id')  int? serverId, @JsonKey(name: 'payment_channel_id')  int paymentChannelId,  double amount,  bool dirty,  bool deleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditableSale() when $default != null:
return $default(_that.clientId,_that.serverId,_that.paymentChannelId,_that.amount,_that.dirty,_that.deleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String clientId, @JsonKey(name: 'server_id')  int? serverId, @JsonKey(name: 'payment_channel_id')  int paymentChannelId,  double amount,  bool dirty,  bool deleted)  $default,) {final _that = this;
switch (_that) {
case _EditableSale():
return $default(_that.clientId,_that.serverId,_that.paymentChannelId,_that.amount,_that.dirty,_that.deleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String clientId, @JsonKey(name: 'server_id')  int? serverId, @JsonKey(name: 'payment_channel_id')  int paymentChannelId,  double amount,  bool dirty,  bool deleted)?  $default,) {final _that = this;
switch (_that) {
case _EditableSale() when $default != null:
return $default(_that.clientId,_that.serverId,_that.paymentChannelId,_that.amount,_that.dirty,_that.deleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EditableSale implements EditableSale {
  const _EditableSale({required this.clientId, @JsonKey(name: 'server_id') this.serverId, @JsonKey(name: 'payment_channel_id') required this.paymentChannelId, required this.amount, this.dirty = false, this.deleted = false});
  factory _EditableSale.fromJson(Map<String, dynamic> json) => _$EditableSaleFromJson(json);

@override final  String clientId;
@override@JsonKey(name: 'server_id') final  int? serverId;
@override@JsonKey(name: 'payment_channel_id') final  int paymentChannelId;
@override final  double amount;
@override@JsonKey() final  bool dirty;
@override@JsonKey() final  bool deleted;

/// Create a copy of EditableSale
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditableSaleCopyWith<_EditableSale> get copyWith => __$EditableSaleCopyWithImpl<_EditableSale>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditableSaleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditableSale&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.paymentChannelId, paymentChannelId) || other.paymentChannelId == paymentChannelId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.dirty, dirty) || other.dirty == dirty)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,serverId,paymentChannelId,amount,dirty,deleted);

@override
String toString() {
  return 'EditableSale(clientId: $clientId, serverId: $serverId, paymentChannelId: $paymentChannelId, amount: $amount, dirty: $dirty, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class _$EditableSaleCopyWith<$Res> implements $EditableSaleCopyWith<$Res> {
  factory _$EditableSaleCopyWith(_EditableSale value, $Res Function(_EditableSale) _then) = __$EditableSaleCopyWithImpl;
@override @useResult
$Res call({
 String clientId,@JsonKey(name: 'server_id') int? serverId,@JsonKey(name: 'payment_channel_id') int paymentChannelId, double amount, bool dirty, bool deleted
});




}
/// @nodoc
class __$EditableSaleCopyWithImpl<$Res>
    implements _$EditableSaleCopyWith<$Res> {
  __$EditableSaleCopyWithImpl(this._self, this._then);

  final _EditableSale _self;
  final $Res Function(_EditableSale) _then;

/// Create a copy of EditableSale
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? serverId = freezed,Object? paymentChannelId = null,Object? amount = null,Object? dirty = null,Object? deleted = null,}) {
  return _then(_EditableSale(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,paymentChannelId: null == paymentChannelId ? _self.paymentChannelId : paymentChannelId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,dirty: null == dirty ? _self.dirty : dirty // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$EditableExpense {

 String get clientId;@JsonKey(name: 'server_id') int? get serverId;@JsonKey(name: 'expense_category_id') int get expenseCategoryId; String? get description; double get amount;@JsonKey(name: 'payment_method') String get paymentMethod; bool get dirty; bool get deleted;
/// Create a copy of EditableExpense
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditableExpenseCopyWith<EditableExpense> get copyWith => _$EditableExpenseCopyWithImpl<EditableExpense>(this as EditableExpense, _$identity);

  /// Serializes this EditableExpense to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditableExpense&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.expenseCategoryId, expenseCategoryId) || other.expenseCategoryId == expenseCategoryId)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.dirty, dirty) || other.dirty == dirty)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,serverId,expenseCategoryId,description,amount,paymentMethod,dirty,deleted);

@override
String toString() {
  return 'EditableExpense(clientId: $clientId, serverId: $serverId, expenseCategoryId: $expenseCategoryId, description: $description, amount: $amount, paymentMethod: $paymentMethod, dirty: $dirty, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class $EditableExpenseCopyWith<$Res>  {
  factory $EditableExpenseCopyWith(EditableExpense value, $Res Function(EditableExpense) _then) = _$EditableExpenseCopyWithImpl;
@useResult
$Res call({
 String clientId,@JsonKey(name: 'server_id') int? serverId,@JsonKey(name: 'expense_category_id') int expenseCategoryId, String? description, double amount,@JsonKey(name: 'payment_method') String paymentMethod, bool dirty, bool deleted
});




}
/// @nodoc
class _$EditableExpenseCopyWithImpl<$Res>
    implements $EditableExpenseCopyWith<$Res> {
  _$EditableExpenseCopyWithImpl(this._self, this._then);

  final EditableExpense _self;
  final $Res Function(EditableExpense) _then;

/// Create a copy of EditableExpense
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,Object? serverId = freezed,Object? expenseCategoryId = null,Object? description = freezed,Object? amount = null,Object? paymentMethod = null,Object? dirty = null,Object? deleted = null,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,expenseCategoryId: null == expenseCategoryId ? _self.expenseCategoryId : expenseCategoryId // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,dirty: null == dirty ? _self.dirty : dirty // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EditableExpense].
extension EditableExpensePatterns on EditableExpense {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditableExpense value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditableExpense() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditableExpense value)  $default,){
final _that = this;
switch (_that) {
case _EditableExpense():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditableExpense value)?  $default,){
final _that = this;
switch (_that) {
case _EditableExpense() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String clientId, @JsonKey(name: 'server_id')  int? serverId, @JsonKey(name: 'expense_category_id')  int expenseCategoryId,  String? description,  double amount, @JsonKey(name: 'payment_method')  String paymentMethod,  bool dirty,  bool deleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditableExpense() when $default != null:
return $default(_that.clientId,_that.serverId,_that.expenseCategoryId,_that.description,_that.amount,_that.paymentMethod,_that.dirty,_that.deleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String clientId, @JsonKey(name: 'server_id')  int? serverId, @JsonKey(name: 'expense_category_id')  int expenseCategoryId,  String? description,  double amount, @JsonKey(name: 'payment_method')  String paymentMethod,  bool dirty,  bool deleted)  $default,) {final _that = this;
switch (_that) {
case _EditableExpense():
return $default(_that.clientId,_that.serverId,_that.expenseCategoryId,_that.description,_that.amount,_that.paymentMethod,_that.dirty,_that.deleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String clientId, @JsonKey(name: 'server_id')  int? serverId, @JsonKey(name: 'expense_category_id')  int expenseCategoryId,  String? description,  double amount, @JsonKey(name: 'payment_method')  String paymentMethod,  bool dirty,  bool deleted)?  $default,) {final _that = this;
switch (_that) {
case _EditableExpense() when $default != null:
return $default(_that.clientId,_that.serverId,_that.expenseCategoryId,_that.description,_that.amount,_that.paymentMethod,_that.dirty,_that.deleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EditableExpense implements EditableExpense {
  const _EditableExpense({required this.clientId, @JsonKey(name: 'server_id') this.serverId, @JsonKey(name: 'expense_category_id') required this.expenseCategoryId, this.description, required this.amount, @JsonKey(name: 'payment_method') required this.paymentMethod, this.dirty = false, this.deleted = false});
  factory _EditableExpense.fromJson(Map<String, dynamic> json) => _$EditableExpenseFromJson(json);

@override final  String clientId;
@override@JsonKey(name: 'server_id') final  int? serverId;
@override@JsonKey(name: 'expense_category_id') final  int expenseCategoryId;
@override final  String? description;
@override final  double amount;
@override@JsonKey(name: 'payment_method') final  String paymentMethod;
@override@JsonKey() final  bool dirty;
@override@JsonKey() final  bool deleted;

/// Create a copy of EditableExpense
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditableExpenseCopyWith<_EditableExpense> get copyWith => __$EditableExpenseCopyWithImpl<_EditableExpense>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditableExpenseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditableExpense&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.expenseCategoryId, expenseCategoryId) || other.expenseCategoryId == expenseCategoryId)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.dirty, dirty) || other.dirty == dirty)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,serverId,expenseCategoryId,description,amount,paymentMethod,dirty,deleted);

@override
String toString() {
  return 'EditableExpense(clientId: $clientId, serverId: $serverId, expenseCategoryId: $expenseCategoryId, description: $description, amount: $amount, paymentMethod: $paymentMethod, dirty: $dirty, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class _$EditableExpenseCopyWith<$Res> implements $EditableExpenseCopyWith<$Res> {
  factory _$EditableExpenseCopyWith(_EditableExpense value, $Res Function(_EditableExpense) _then) = __$EditableExpenseCopyWithImpl;
@override @useResult
$Res call({
 String clientId,@JsonKey(name: 'server_id') int? serverId,@JsonKey(name: 'expense_category_id') int expenseCategoryId, String? description, double amount,@JsonKey(name: 'payment_method') String paymentMethod, bool dirty, bool deleted
});




}
/// @nodoc
class __$EditableExpenseCopyWithImpl<$Res>
    implements _$EditableExpenseCopyWith<$Res> {
  __$EditableExpenseCopyWithImpl(this._self, this._then);

  final _EditableExpense _self;
  final $Res Function(_EditableExpense) _then;

/// Create a copy of EditableExpense
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? serverId = freezed,Object? expenseCategoryId = null,Object? description = freezed,Object? amount = null,Object? paymentMethod = null,Object? dirty = null,Object? deleted = null,}) {
  return _then(_EditableExpense(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,expenseCategoryId: null == expenseCategoryId ? _self.expenseCategoryId : expenseCategoryId // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,dirty: null == dirty ? _self.dirty : dirty // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$EditableDeduction {

 String get clientId;@JsonKey(name: 'server_id') int? get serverId; String get type; String? get description; double get amount;@JsonKey(name: 'payment_method') String get paymentMethod; bool get dirty; bool get deleted;
/// Create a copy of EditableDeduction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditableDeductionCopyWith<EditableDeduction> get copyWith => _$EditableDeductionCopyWithImpl<EditableDeduction>(this as EditableDeduction, _$identity);

  /// Serializes this EditableDeduction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditableDeduction&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.dirty, dirty) || other.dirty == dirty)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,serverId,type,description,amount,paymentMethod,dirty,deleted);

@override
String toString() {
  return 'EditableDeduction(clientId: $clientId, serverId: $serverId, type: $type, description: $description, amount: $amount, paymentMethod: $paymentMethod, dirty: $dirty, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class $EditableDeductionCopyWith<$Res>  {
  factory $EditableDeductionCopyWith(EditableDeduction value, $Res Function(EditableDeduction) _then) = _$EditableDeductionCopyWithImpl;
@useResult
$Res call({
 String clientId,@JsonKey(name: 'server_id') int? serverId, String type, String? description, double amount,@JsonKey(name: 'payment_method') String paymentMethod, bool dirty, bool deleted
});




}
/// @nodoc
class _$EditableDeductionCopyWithImpl<$Res>
    implements $EditableDeductionCopyWith<$Res> {
  _$EditableDeductionCopyWithImpl(this._self, this._then);

  final EditableDeduction _self;
  final $Res Function(EditableDeduction) _then;

/// Create a copy of EditableDeduction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,Object? serverId = freezed,Object? type = null,Object? description = freezed,Object? amount = null,Object? paymentMethod = null,Object? dirty = null,Object? deleted = null,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,dirty: null == dirty ? _self.dirty : dirty // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EditableDeduction].
extension EditableDeductionPatterns on EditableDeduction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditableDeduction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditableDeduction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditableDeduction value)  $default,){
final _that = this;
switch (_that) {
case _EditableDeduction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditableDeduction value)?  $default,){
final _that = this;
switch (_that) {
case _EditableDeduction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String clientId, @JsonKey(name: 'server_id')  int? serverId,  String type,  String? description,  double amount, @JsonKey(name: 'payment_method')  String paymentMethod,  bool dirty,  bool deleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditableDeduction() when $default != null:
return $default(_that.clientId,_that.serverId,_that.type,_that.description,_that.amount,_that.paymentMethod,_that.dirty,_that.deleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String clientId, @JsonKey(name: 'server_id')  int? serverId,  String type,  String? description,  double amount, @JsonKey(name: 'payment_method')  String paymentMethod,  bool dirty,  bool deleted)  $default,) {final _that = this;
switch (_that) {
case _EditableDeduction():
return $default(_that.clientId,_that.serverId,_that.type,_that.description,_that.amount,_that.paymentMethod,_that.dirty,_that.deleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String clientId, @JsonKey(name: 'server_id')  int? serverId,  String type,  String? description,  double amount, @JsonKey(name: 'payment_method')  String paymentMethod,  bool dirty,  bool deleted)?  $default,) {final _that = this;
switch (_that) {
case _EditableDeduction() when $default != null:
return $default(_that.clientId,_that.serverId,_that.type,_that.description,_that.amount,_that.paymentMethod,_that.dirty,_that.deleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EditableDeduction implements EditableDeduction {
  const _EditableDeduction({required this.clientId, @JsonKey(name: 'server_id') this.serverId, required this.type, this.description, required this.amount, @JsonKey(name: 'payment_method') required this.paymentMethod, this.dirty = false, this.deleted = false});
  factory _EditableDeduction.fromJson(Map<String, dynamic> json) => _$EditableDeductionFromJson(json);

@override final  String clientId;
@override@JsonKey(name: 'server_id') final  int? serverId;
@override final  String type;
@override final  String? description;
@override final  double amount;
@override@JsonKey(name: 'payment_method') final  String paymentMethod;
@override@JsonKey() final  bool dirty;
@override@JsonKey() final  bool deleted;

/// Create a copy of EditableDeduction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditableDeductionCopyWith<_EditableDeduction> get copyWith => __$EditableDeductionCopyWithImpl<_EditableDeduction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditableDeductionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditableDeduction&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.dirty, dirty) || other.dirty == dirty)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,serverId,type,description,amount,paymentMethod,dirty,deleted);

@override
String toString() {
  return 'EditableDeduction(clientId: $clientId, serverId: $serverId, type: $type, description: $description, amount: $amount, paymentMethod: $paymentMethod, dirty: $dirty, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class _$EditableDeductionCopyWith<$Res> implements $EditableDeductionCopyWith<$Res> {
  factory _$EditableDeductionCopyWith(_EditableDeduction value, $Res Function(_EditableDeduction) _then) = __$EditableDeductionCopyWithImpl;
@override @useResult
$Res call({
 String clientId,@JsonKey(name: 'server_id') int? serverId, String type, String? description, double amount,@JsonKey(name: 'payment_method') String paymentMethod, bool dirty, bool deleted
});




}
/// @nodoc
class __$EditableDeductionCopyWithImpl<$Res>
    implements _$EditableDeductionCopyWith<$Res> {
  __$EditableDeductionCopyWithImpl(this._self, this._then);

  final _EditableDeduction _self;
  final $Res Function(_EditableDeduction) _then;

/// Create a copy of EditableDeduction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? serverId = freezed,Object? type = null,Object? description = freezed,Object? amount = null,Object? paymentMethod = null,Object? dirty = null,Object? deleted = null,}) {
  return _then(_EditableDeduction(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,dirty: null == dirty ? _self.dirty : dirty // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$EditablePayment {

 double get amount;@JsonKey(name: 'payment_method') String get paymentMethod;
/// Create a copy of EditablePayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditablePaymentCopyWith<EditablePayment> get copyWith => _$EditablePaymentCopyWithImpl<EditablePayment>(this as EditablePayment, _$identity);

  /// Serializes this EditablePayment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditablePayment&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,paymentMethod);

@override
String toString() {
  return 'EditablePayment(amount: $amount, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class $EditablePaymentCopyWith<$Res>  {
  factory $EditablePaymentCopyWith(EditablePayment value, $Res Function(EditablePayment) _then) = _$EditablePaymentCopyWithImpl;
@useResult
$Res call({
 double amount,@JsonKey(name: 'payment_method') String paymentMethod
});




}
/// @nodoc
class _$EditablePaymentCopyWithImpl<$Res>
    implements $EditablePaymentCopyWith<$Res> {
  _$EditablePaymentCopyWithImpl(this._self, this._then);

  final EditablePayment _self;
  final $Res Function(EditablePayment) _then;

/// Create a copy of EditablePayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? paymentMethod = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EditablePayment].
extension EditablePaymentPatterns on EditablePayment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditablePayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditablePayment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditablePayment value)  $default,){
final _that = this;
switch (_that) {
case _EditablePayment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditablePayment value)?  $default,){
final _that = this;
switch (_that) {
case _EditablePayment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amount, @JsonKey(name: 'payment_method')  String paymentMethod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditablePayment() when $default != null:
return $default(_that.amount,_that.paymentMethod);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amount, @JsonKey(name: 'payment_method')  String paymentMethod)  $default,) {final _that = this;
switch (_that) {
case _EditablePayment():
return $default(_that.amount,_that.paymentMethod);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amount, @JsonKey(name: 'payment_method')  String paymentMethod)?  $default,) {final _that = this;
switch (_that) {
case _EditablePayment() when $default != null:
return $default(_that.amount,_that.paymentMethod);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EditablePayment implements EditablePayment {
  const _EditablePayment({required this.amount, @JsonKey(name: 'payment_method') required this.paymentMethod});
  factory _EditablePayment.fromJson(Map<String, dynamic> json) => _$EditablePaymentFromJson(json);

@override final  double amount;
@override@JsonKey(name: 'payment_method') final  String paymentMethod;

/// Create a copy of EditablePayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditablePaymentCopyWith<_EditablePayment> get copyWith => __$EditablePaymentCopyWithImpl<_EditablePayment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditablePaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditablePayment&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,paymentMethod);

@override
String toString() {
  return 'EditablePayment(amount: $amount, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class _$EditablePaymentCopyWith<$Res> implements $EditablePaymentCopyWith<$Res> {
  factory _$EditablePaymentCopyWith(_EditablePayment value, $Res Function(_EditablePayment) _then) = __$EditablePaymentCopyWithImpl;
@override @useResult
$Res call({
 double amount,@JsonKey(name: 'payment_method') String paymentMethod
});




}
/// @nodoc
class __$EditablePaymentCopyWithImpl<$Res>
    implements _$EditablePaymentCopyWith<$Res> {
  __$EditablePaymentCopyWithImpl(this._self, this._then);

  final _EditablePayment _self;
  final $Res Function(_EditablePayment) _then;

/// Create a copy of EditablePayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? paymentMethod = null,}) {
  return _then(_EditablePayment(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$EditableCounterTxn {

 String get clientId;@JsonKey(name: 'server_id') int? get serverId;@JsonKey(name: 'counter_id') int get counterId;@JsonKey(name: 'sale_amount') double get saleAmount; List<EditablePayment> get payments; String? get remarks; bool get dirty; bool get deleted;
/// Create a copy of EditableCounterTxn
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditableCounterTxnCopyWith<EditableCounterTxn> get copyWith => _$EditableCounterTxnCopyWithImpl<EditableCounterTxn>(this as EditableCounterTxn, _$identity);

  /// Serializes this EditableCounterTxn to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditableCounterTxn&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.counterId, counterId) || other.counterId == counterId)&&(identical(other.saleAmount, saleAmount) || other.saleAmount == saleAmount)&&const DeepCollectionEquality().equals(other.payments, payments)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.dirty, dirty) || other.dirty == dirty)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,serverId,counterId,saleAmount,const DeepCollectionEquality().hash(payments),remarks,dirty,deleted);

@override
String toString() {
  return 'EditableCounterTxn(clientId: $clientId, serverId: $serverId, counterId: $counterId, saleAmount: $saleAmount, payments: $payments, remarks: $remarks, dirty: $dirty, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class $EditableCounterTxnCopyWith<$Res>  {
  factory $EditableCounterTxnCopyWith(EditableCounterTxn value, $Res Function(EditableCounterTxn) _then) = _$EditableCounterTxnCopyWithImpl;
@useResult
$Res call({
 String clientId,@JsonKey(name: 'server_id') int? serverId,@JsonKey(name: 'counter_id') int counterId,@JsonKey(name: 'sale_amount') double saleAmount, List<EditablePayment> payments, String? remarks, bool dirty, bool deleted
});




}
/// @nodoc
class _$EditableCounterTxnCopyWithImpl<$Res>
    implements $EditableCounterTxnCopyWith<$Res> {
  _$EditableCounterTxnCopyWithImpl(this._self, this._then);

  final EditableCounterTxn _self;
  final $Res Function(EditableCounterTxn) _then;

/// Create a copy of EditableCounterTxn
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,Object? serverId = freezed,Object? counterId = null,Object? saleAmount = null,Object? payments = null,Object? remarks = freezed,Object? dirty = null,Object? deleted = null,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,counterId: null == counterId ? _self.counterId : counterId // ignore: cast_nullable_to_non_nullable
as int,saleAmount: null == saleAmount ? _self.saleAmount : saleAmount // ignore: cast_nullable_to_non_nullable
as double,payments: null == payments ? _self.payments : payments // ignore: cast_nullable_to_non_nullable
as List<EditablePayment>,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,dirty: null == dirty ? _self.dirty : dirty // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EditableCounterTxn].
extension EditableCounterTxnPatterns on EditableCounterTxn {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditableCounterTxn value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditableCounterTxn() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditableCounterTxn value)  $default,){
final _that = this;
switch (_that) {
case _EditableCounterTxn():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditableCounterTxn value)?  $default,){
final _that = this;
switch (_that) {
case _EditableCounterTxn() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String clientId, @JsonKey(name: 'server_id')  int? serverId, @JsonKey(name: 'counter_id')  int counterId, @JsonKey(name: 'sale_amount')  double saleAmount,  List<EditablePayment> payments,  String? remarks,  bool dirty,  bool deleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditableCounterTxn() when $default != null:
return $default(_that.clientId,_that.serverId,_that.counterId,_that.saleAmount,_that.payments,_that.remarks,_that.dirty,_that.deleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String clientId, @JsonKey(name: 'server_id')  int? serverId, @JsonKey(name: 'counter_id')  int counterId, @JsonKey(name: 'sale_amount')  double saleAmount,  List<EditablePayment> payments,  String? remarks,  bool dirty,  bool deleted)  $default,) {final _that = this;
switch (_that) {
case _EditableCounterTxn():
return $default(_that.clientId,_that.serverId,_that.counterId,_that.saleAmount,_that.payments,_that.remarks,_that.dirty,_that.deleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String clientId, @JsonKey(name: 'server_id')  int? serverId, @JsonKey(name: 'counter_id')  int counterId, @JsonKey(name: 'sale_amount')  double saleAmount,  List<EditablePayment> payments,  String? remarks,  bool dirty,  bool deleted)?  $default,) {final _that = this;
switch (_that) {
case _EditableCounterTxn() when $default != null:
return $default(_that.clientId,_that.serverId,_that.counterId,_that.saleAmount,_that.payments,_that.remarks,_that.dirty,_that.deleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EditableCounterTxn extends EditableCounterTxn {
  const _EditableCounterTxn({required this.clientId, @JsonKey(name: 'server_id') this.serverId, @JsonKey(name: 'counter_id') required this.counterId, @JsonKey(name: 'sale_amount') required this.saleAmount, final  List<EditablePayment> payments = const <EditablePayment>[], this.remarks, this.dirty = false, this.deleted = false}): _payments = payments,super._();
  factory _EditableCounterTxn.fromJson(Map<String, dynamic> json) => _$EditableCounterTxnFromJson(json);

@override final  String clientId;
@override@JsonKey(name: 'server_id') final  int? serverId;
@override@JsonKey(name: 'counter_id') final  int counterId;
@override@JsonKey(name: 'sale_amount') final  double saleAmount;
 final  List<EditablePayment> _payments;
@override@JsonKey() List<EditablePayment> get payments {
  if (_payments is EqualUnmodifiableListView) return _payments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payments);
}

@override final  String? remarks;
@override@JsonKey() final  bool dirty;
@override@JsonKey() final  bool deleted;

/// Create a copy of EditableCounterTxn
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditableCounterTxnCopyWith<_EditableCounterTxn> get copyWith => __$EditableCounterTxnCopyWithImpl<_EditableCounterTxn>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditableCounterTxnToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditableCounterTxn&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.counterId, counterId) || other.counterId == counterId)&&(identical(other.saleAmount, saleAmount) || other.saleAmount == saleAmount)&&const DeepCollectionEquality().equals(other._payments, _payments)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.dirty, dirty) || other.dirty == dirty)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,serverId,counterId,saleAmount,const DeepCollectionEquality().hash(_payments),remarks,dirty,deleted);

@override
String toString() {
  return 'EditableCounterTxn(clientId: $clientId, serverId: $serverId, counterId: $counterId, saleAmount: $saleAmount, payments: $payments, remarks: $remarks, dirty: $dirty, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class _$EditableCounterTxnCopyWith<$Res> implements $EditableCounterTxnCopyWith<$Res> {
  factory _$EditableCounterTxnCopyWith(_EditableCounterTxn value, $Res Function(_EditableCounterTxn) _then) = __$EditableCounterTxnCopyWithImpl;
@override @useResult
$Res call({
 String clientId,@JsonKey(name: 'server_id') int? serverId,@JsonKey(name: 'counter_id') int counterId,@JsonKey(name: 'sale_amount') double saleAmount, List<EditablePayment> payments, String? remarks, bool dirty, bool deleted
});




}
/// @nodoc
class __$EditableCounterTxnCopyWithImpl<$Res>
    implements _$EditableCounterTxnCopyWith<$Res> {
  __$EditableCounterTxnCopyWithImpl(this._self, this._then);

  final _EditableCounterTxn _self;
  final $Res Function(_EditableCounterTxn) _then;

/// Create a copy of EditableCounterTxn
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? serverId = freezed,Object? counterId = null,Object? saleAmount = null,Object? payments = null,Object? remarks = freezed,Object? dirty = null,Object? deleted = null,}) {
  return _then(_EditableCounterTxn(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,counterId: null == counterId ? _self.counterId : counterId // ignore: cast_nullable_to_non_nullable
as int,saleAmount: null == saleAmount ? _self.saleAmount : saleAmount // ignore: cast_nullable_to_non_nullable
as double,payments: null == payments ? _self._payments : payments // ignore: cast_nullable_to_non_nullable
as List<EditablePayment>,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,dirty: null == dirty ? _self.dirty : dirty // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$EditableClosing {

@JsonKey(name: 'server_id') int? get serverId;@JsonKey(name: 'branch_id') int get branchId; String get date;@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) ClosingStatus get status; String? get notes;@JsonKey(name: 'total_sales') double get totalSales; List<EditableSale> get sales; List<EditableExpense> get expenses; List<EditableDeduction> get deductions;@JsonKey(name: 'counter_transactions') List<EditableCounterTxn> get counterTransactions;@JsonKey(name: 'header_dirty') bool get headerDirty;
/// Create a copy of EditableClosing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditableClosingCopyWith<EditableClosing> get copyWith => _$EditableClosingCopyWithImpl<EditableClosing>(this as EditableClosing, _$identity);

  /// Serializes this EditableClosing to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditableClosing&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&const DeepCollectionEquality().equals(other.sales, sales)&&const DeepCollectionEquality().equals(other.expenses, expenses)&&const DeepCollectionEquality().equals(other.deductions, deductions)&&const DeepCollectionEquality().equals(other.counterTransactions, counterTransactions)&&(identical(other.headerDirty, headerDirty) || other.headerDirty == headerDirty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverId,branchId,date,status,notes,totalSales,const DeepCollectionEquality().hash(sales),const DeepCollectionEquality().hash(expenses),const DeepCollectionEquality().hash(deductions),const DeepCollectionEquality().hash(counterTransactions),headerDirty);

@override
String toString() {
  return 'EditableClosing(serverId: $serverId, branchId: $branchId, date: $date, status: $status, notes: $notes, totalSales: $totalSales, sales: $sales, expenses: $expenses, deductions: $deductions, counterTransactions: $counterTransactions, headerDirty: $headerDirty)';
}


}

/// @nodoc
abstract mixin class $EditableClosingCopyWith<$Res>  {
  factory $EditableClosingCopyWith(EditableClosing value, $Res Function(EditableClosing) _then) = _$EditableClosingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'server_id') int? serverId,@JsonKey(name: 'branch_id') int branchId, String date,@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) ClosingStatus status, String? notes,@JsonKey(name: 'total_sales') double totalSales, List<EditableSale> sales, List<EditableExpense> expenses, List<EditableDeduction> deductions,@JsonKey(name: 'counter_transactions') List<EditableCounterTxn> counterTransactions,@JsonKey(name: 'header_dirty') bool headerDirty
});




}
/// @nodoc
class _$EditableClosingCopyWithImpl<$Res>
    implements $EditableClosingCopyWith<$Res> {
  _$EditableClosingCopyWithImpl(this._self, this._then);

  final EditableClosing _self;
  final $Res Function(EditableClosing) _then;

/// Create a copy of EditableClosing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverId = freezed,Object? branchId = null,Object? date = null,Object? status = null,Object? notes = freezed,Object? totalSales = null,Object? sales = null,Object? expenses = null,Object? deductions = null,Object? counterTransactions = null,Object? headerDirty = null,}) {
  return _then(_self.copyWith(
serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ClosingStatus,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as List<EditableSale>,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<EditableExpense>,deductions: null == deductions ? _self.deductions : deductions // ignore: cast_nullable_to_non_nullable
as List<EditableDeduction>,counterTransactions: null == counterTransactions ? _self.counterTransactions : counterTransactions // ignore: cast_nullable_to_non_nullable
as List<EditableCounterTxn>,headerDirty: null == headerDirty ? _self.headerDirty : headerDirty // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EditableClosing].
extension EditableClosingPatterns on EditableClosing {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditableClosing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditableClosing() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditableClosing value)  $default,){
final _that = this;
switch (_that) {
case _EditableClosing():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditableClosing value)?  $default,){
final _that = this;
switch (_that) {
case _EditableClosing() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'server_id')  int? serverId, @JsonKey(name: 'branch_id')  int branchId,  String date, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)  ClosingStatus status,  String? notes, @JsonKey(name: 'total_sales')  double totalSales,  List<EditableSale> sales,  List<EditableExpense> expenses,  List<EditableDeduction> deductions, @JsonKey(name: 'counter_transactions')  List<EditableCounterTxn> counterTransactions, @JsonKey(name: 'header_dirty')  bool headerDirty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditableClosing() when $default != null:
return $default(_that.serverId,_that.branchId,_that.date,_that.status,_that.notes,_that.totalSales,_that.sales,_that.expenses,_that.deductions,_that.counterTransactions,_that.headerDirty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'server_id')  int? serverId, @JsonKey(name: 'branch_id')  int branchId,  String date, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)  ClosingStatus status,  String? notes, @JsonKey(name: 'total_sales')  double totalSales,  List<EditableSale> sales,  List<EditableExpense> expenses,  List<EditableDeduction> deductions, @JsonKey(name: 'counter_transactions')  List<EditableCounterTxn> counterTransactions, @JsonKey(name: 'header_dirty')  bool headerDirty)  $default,) {final _that = this;
switch (_that) {
case _EditableClosing():
return $default(_that.serverId,_that.branchId,_that.date,_that.status,_that.notes,_that.totalSales,_that.sales,_that.expenses,_that.deductions,_that.counterTransactions,_that.headerDirty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'server_id')  int? serverId, @JsonKey(name: 'branch_id')  int branchId,  String date, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)  ClosingStatus status,  String? notes, @JsonKey(name: 'total_sales')  double totalSales,  List<EditableSale> sales,  List<EditableExpense> expenses,  List<EditableDeduction> deductions, @JsonKey(name: 'counter_transactions')  List<EditableCounterTxn> counterTransactions, @JsonKey(name: 'header_dirty')  bool headerDirty)?  $default,) {final _that = this;
switch (_that) {
case _EditableClosing() when $default != null:
return $default(_that.serverId,_that.branchId,_that.date,_that.status,_that.notes,_that.totalSales,_that.sales,_that.expenses,_that.deductions,_that.counterTransactions,_that.headerDirty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EditableClosing implements EditableClosing {
  const _EditableClosing({@JsonKey(name: 'server_id') this.serverId, @JsonKey(name: 'branch_id') required this.branchId, required this.date, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) required this.status, this.notes, @JsonKey(name: 'total_sales') this.totalSales = 0.0, final  List<EditableSale> sales = const <EditableSale>[], final  List<EditableExpense> expenses = const <EditableExpense>[], final  List<EditableDeduction> deductions = const <EditableDeduction>[], @JsonKey(name: 'counter_transactions') final  List<EditableCounterTxn> counterTransactions = const <EditableCounterTxn>[], @JsonKey(name: 'header_dirty') this.headerDirty = false}): _sales = sales,_expenses = expenses,_deductions = deductions,_counterTransactions = counterTransactions;
  factory _EditableClosing.fromJson(Map<String, dynamic> json) => _$EditableClosingFromJson(json);

@override@JsonKey(name: 'server_id') final  int? serverId;
@override@JsonKey(name: 'branch_id') final  int branchId;
@override final  String date;
@override@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) final  ClosingStatus status;
@override final  String? notes;
@override@JsonKey(name: 'total_sales') final  double totalSales;
 final  List<EditableSale> _sales;
@override@JsonKey() List<EditableSale> get sales {
  if (_sales is EqualUnmodifiableListView) return _sales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sales);
}

 final  List<EditableExpense> _expenses;
@override@JsonKey() List<EditableExpense> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}

 final  List<EditableDeduction> _deductions;
@override@JsonKey() List<EditableDeduction> get deductions {
  if (_deductions is EqualUnmodifiableListView) return _deductions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deductions);
}

 final  List<EditableCounterTxn> _counterTransactions;
@override@JsonKey(name: 'counter_transactions') List<EditableCounterTxn> get counterTransactions {
  if (_counterTransactions is EqualUnmodifiableListView) return _counterTransactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_counterTransactions);
}

@override@JsonKey(name: 'header_dirty') final  bool headerDirty;

/// Create a copy of EditableClosing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditableClosingCopyWith<_EditableClosing> get copyWith => __$EditableClosingCopyWithImpl<_EditableClosing>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditableClosingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditableClosing&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&const DeepCollectionEquality().equals(other._sales, _sales)&&const DeepCollectionEquality().equals(other._expenses, _expenses)&&const DeepCollectionEquality().equals(other._deductions, _deductions)&&const DeepCollectionEquality().equals(other._counterTransactions, _counterTransactions)&&(identical(other.headerDirty, headerDirty) || other.headerDirty == headerDirty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverId,branchId,date,status,notes,totalSales,const DeepCollectionEquality().hash(_sales),const DeepCollectionEquality().hash(_expenses),const DeepCollectionEquality().hash(_deductions),const DeepCollectionEquality().hash(_counterTransactions),headerDirty);

@override
String toString() {
  return 'EditableClosing(serverId: $serverId, branchId: $branchId, date: $date, status: $status, notes: $notes, totalSales: $totalSales, sales: $sales, expenses: $expenses, deductions: $deductions, counterTransactions: $counterTransactions, headerDirty: $headerDirty)';
}


}

/// @nodoc
abstract mixin class _$EditableClosingCopyWith<$Res> implements $EditableClosingCopyWith<$Res> {
  factory _$EditableClosingCopyWith(_EditableClosing value, $Res Function(_EditableClosing) _then) = __$EditableClosingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'server_id') int? serverId,@JsonKey(name: 'branch_id') int branchId, String date,@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) ClosingStatus status, String? notes,@JsonKey(name: 'total_sales') double totalSales, List<EditableSale> sales, List<EditableExpense> expenses, List<EditableDeduction> deductions,@JsonKey(name: 'counter_transactions') List<EditableCounterTxn> counterTransactions,@JsonKey(name: 'header_dirty') bool headerDirty
});




}
/// @nodoc
class __$EditableClosingCopyWithImpl<$Res>
    implements _$EditableClosingCopyWith<$Res> {
  __$EditableClosingCopyWithImpl(this._self, this._then);

  final _EditableClosing _self;
  final $Res Function(_EditableClosing) _then;

/// Create a copy of EditableClosing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverId = freezed,Object? branchId = null,Object? date = null,Object? status = null,Object? notes = freezed,Object? totalSales = null,Object? sales = null,Object? expenses = null,Object? deductions = null,Object? counterTransactions = null,Object? headerDirty = null,}) {
  return _then(_EditableClosing(
serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ClosingStatus,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,sales: null == sales ? _self._sales : sales // ignore: cast_nullable_to_non_nullable
as List<EditableSale>,expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<EditableExpense>,deductions: null == deductions ? _self._deductions : deductions // ignore: cast_nullable_to_non_nullable
as List<EditableDeduction>,counterTransactions: null == counterTransactions ? _self._counterTransactions : counterTransactions // ignore: cast_nullable_to_non_nullable
as List<EditableCounterTxn>,headerDirty: null == headerDirty ? _self.headerDirty : headerDirty // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
