// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_rows.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyBranchRow {

 int get id; String get date; String get status; Branch? get branch;@JsonKey(name: 'total_sales') double get totalSales;@JsonKey(name: 'total_expenses') double get totalExpenses;@JsonKey(name: 'cash_in_hand') double get cashInHand;@JsonKey(name: 'net_profit') double get netProfit;
/// Create a copy of DailyBranchRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyBranchRowCopyWith<DailyBranchRow> get copyWith => _$DailyBranchRowCopyWithImpl<DailyBranchRow>(this as DailyBranchRow, _$identity);

  /// Serializes this DailyBranchRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyBranchRow&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.cashInHand, cashInHand) || other.cashInHand == cashInHand)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,status,branch,totalSales,totalExpenses,cashInHand,netProfit);

@override
String toString() {
  return 'DailyBranchRow(id: $id, date: $date, status: $status, branch: $branch, totalSales: $totalSales, totalExpenses: $totalExpenses, cashInHand: $cashInHand, netProfit: $netProfit)';
}


}

/// @nodoc
abstract mixin class $DailyBranchRowCopyWith<$Res>  {
  factory $DailyBranchRowCopyWith(DailyBranchRow value, $Res Function(DailyBranchRow) _then) = _$DailyBranchRowCopyWithImpl;
@useResult
$Res call({
 int id, String date, String status, Branch? branch,@JsonKey(name: 'total_sales') double totalSales,@JsonKey(name: 'total_expenses') double totalExpenses,@JsonKey(name: 'cash_in_hand') double cashInHand,@JsonKey(name: 'net_profit') double netProfit
});


$BranchCopyWith<$Res>? get branch;

}
/// @nodoc
class _$DailyBranchRowCopyWithImpl<$Res>
    implements $DailyBranchRowCopyWith<$Res> {
  _$DailyBranchRowCopyWithImpl(this._self, this._then);

  final DailyBranchRow _self;
  final $Res Function(DailyBranchRow) _then;

/// Create a copy of DailyBranchRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? date = null,Object? status = null,Object? branch = freezed,Object? totalSales = null,Object? totalExpenses = null,Object? cashInHand = null,Object? netProfit = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as Branch?,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,cashInHand: null == cashInHand ? _self.cashInHand : cashInHand // ignore: cast_nullable_to_non_nullable
as double,netProfit: null == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of DailyBranchRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchCopyWith<$Res>? get branch {
    if (_self.branch == null) {
    return null;
  }

  return $BranchCopyWith<$Res>(_self.branch!, (value) {
    return _then(_self.copyWith(branch: value));
  });
}
}


/// Adds pattern-matching-related methods to [DailyBranchRow].
extension DailyBranchRowPatterns on DailyBranchRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyBranchRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyBranchRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyBranchRow value)  $default,){
final _that = this;
switch (_that) {
case _DailyBranchRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyBranchRow value)?  $default,){
final _that = this;
switch (_that) {
case _DailyBranchRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String date,  String status,  Branch? branch, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'total_expenses')  double totalExpenses, @JsonKey(name: 'cash_in_hand')  double cashInHand, @JsonKey(name: 'net_profit')  double netProfit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyBranchRow() when $default != null:
return $default(_that.id,_that.date,_that.status,_that.branch,_that.totalSales,_that.totalExpenses,_that.cashInHand,_that.netProfit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String date,  String status,  Branch? branch, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'total_expenses')  double totalExpenses, @JsonKey(name: 'cash_in_hand')  double cashInHand, @JsonKey(name: 'net_profit')  double netProfit)  $default,) {final _that = this;
switch (_that) {
case _DailyBranchRow():
return $default(_that.id,_that.date,_that.status,_that.branch,_that.totalSales,_that.totalExpenses,_that.cashInHand,_that.netProfit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String date,  String status,  Branch? branch, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'total_expenses')  double totalExpenses, @JsonKey(name: 'cash_in_hand')  double cashInHand, @JsonKey(name: 'net_profit')  double netProfit)?  $default,) {final _that = this;
switch (_that) {
case _DailyBranchRow() when $default != null:
return $default(_that.id,_that.date,_that.status,_that.branch,_that.totalSales,_that.totalExpenses,_that.cashInHand,_that.netProfit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyBranchRow implements DailyBranchRow {
  const _DailyBranchRow({required this.id, required this.date, required this.status, this.branch, @JsonKey(name: 'total_sales') this.totalSales = 0.0, @JsonKey(name: 'total_expenses') this.totalExpenses = 0.0, @JsonKey(name: 'cash_in_hand') this.cashInHand = 0.0, @JsonKey(name: 'net_profit') this.netProfit = 0.0});
  factory _DailyBranchRow.fromJson(Map<String, dynamic> json) => _$DailyBranchRowFromJson(json);

@override final  int id;
@override final  String date;
@override final  String status;
@override final  Branch? branch;
@override@JsonKey(name: 'total_sales') final  double totalSales;
@override@JsonKey(name: 'total_expenses') final  double totalExpenses;
@override@JsonKey(name: 'cash_in_hand') final  double cashInHand;
@override@JsonKey(name: 'net_profit') final  double netProfit;

/// Create a copy of DailyBranchRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyBranchRowCopyWith<_DailyBranchRow> get copyWith => __$DailyBranchRowCopyWithImpl<_DailyBranchRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyBranchRowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyBranchRow&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.cashInHand, cashInHand) || other.cashInHand == cashInHand)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,status,branch,totalSales,totalExpenses,cashInHand,netProfit);

@override
String toString() {
  return 'DailyBranchRow(id: $id, date: $date, status: $status, branch: $branch, totalSales: $totalSales, totalExpenses: $totalExpenses, cashInHand: $cashInHand, netProfit: $netProfit)';
}


}

/// @nodoc
abstract mixin class _$DailyBranchRowCopyWith<$Res> implements $DailyBranchRowCopyWith<$Res> {
  factory _$DailyBranchRowCopyWith(_DailyBranchRow value, $Res Function(_DailyBranchRow) _then) = __$DailyBranchRowCopyWithImpl;
@override @useResult
$Res call({
 int id, String date, String status, Branch? branch,@JsonKey(name: 'total_sales') double totalSales,@JsonKey(name: 'total_expenses') double totalExpenses,@JsonKey(name: 'cash_in_hand') double cashInHand,@JsonKey(name: 'net_profit') double netProfit
});


@override $BranchCopyWith<$Res>? get branch;

}
/// @nodoc
class __$DailyBranchRowCopyWithImpl<$Res>
    implements _$DailyBranchRowCopyWith<$Res> {
  __$DailyBranchRowCopyWithImpl(this._self, this._then);

  final _DailyBranchRow _self;
  final $Res Function(_DailyBranchRow) _then;

/// Create a copy of DailyBranchRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? status = null,Object? branch = freezed,Object? totalSales = null,Object? totalExpenses = null,Object? cashInHand = null,Object? netProfit = null,}) {
  return _then(_DailyBranchRow(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as Branch?,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,cashInHand: null == cashInHand ? _self.cashInHand : cashInHand // ignore: cast_nullable_to_non_nullable
as double,netProfit: null == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of DailyBranchRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchCopyWith<$Res>? get branch {
    if (_self.branch == null) {
    return null;
  }

  return $BranchCopyWith<$Res>(_self.branch!, (value) {
    return _then(_self.copyWith(branch: value));
  });
}
}


/// @nodoc
mixin _$ExpenseCategoryTotal {

 String get category; double get total; int get count;
/// Create a copy of ExpenseCategoryTotal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseCategoryTotalCopyWith<ExpenseCategoryTotal> get copyWith => _$ExpenseCategoryTotalCopyWithImpl<ExpenseCategoryTotal>(this as ExpenseCategoryTotal, _$identity);

  /// Serializes this ExpenseCategoryTotal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseCategoryTotal&&(identical(other.category, category) || other.category == category)&&(identical(other.total, total) || other.total == total)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,total,count);

@override
String toString() {
  return 'ExpenseCategoryTotal(category: $category, total: $total, count: $count)';
}


}

/// @nodoc
abstract mixin class $ExpenseCategoryTotalCopyWith<$Res>  {
  factory $ExpenseCategoryTotalCopyWith(ExpenseCategoryTotal value, $Res Function(ExpenseCategoryTotal) _then) = _$ExpenseCategoryTotalCopyWithImpl;
@useResult
$Res call({
 String category, double total, int count
});




}
/// @nodoc
class _$ExpenseCategoryTotalCopyWithImpl<$Res>
    implements $ExpenseCategoryTotalCopyWith<$Res> {
  _$ExpenseCategoryTotalCopyWithImpl(this._self, this._then);

  final ExpenseCategoryTotal _self;
  final $Res Function(ExpenseCategoryTotal) _then;

/// Create a copy of ExpenseCategoryTotal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? total = null,Object? count = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseCategoryTotal].
extension ExpenseCategoryTotalPatterns on ExpenseCategoryTotal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseCategoryTotal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseCategoryTotal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseCategoryTotal value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseCategoryTotal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseCategoryTotal value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseCategoryTotal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category,  double total,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseCategoryTotal() when $default != null:
return $default(_that.category,_that.total,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category,  double total,  int count)  $default,) {final _that = this;
switch (_that) {
case _ExpenseCategoryTotal():
return $default(_that.category,_that.total,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category,  double total,  int count)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseCategoryTotal() when $default != null:
return $default(_that.category,_that.total,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpenseCategoryTotal implements ExpenseCategoryTotal {
  const _ExpenseCategoryTotal({required this.category, required this.total, required this.count});
  factory _ExpenseCategoryTotal.fromJson(Map<String, dynamic> json) => _$ExpenseCategoryTotalFromJson(json);

@override final  String category;
@override final  double total;
@override final  int count;

/// Create a copy of ExpenseCategoryTotal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseCategoryTotalCopyWith<_ExpenseCategoryTotal> get copyWith => __$ExpenseCategoryTotalCopyWithImpl<_ExpenseCategoryTotal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseCategoryTotalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseCategoryTotal&&(identical(other.category, category) || other.category == category)&&(identical(other.total, total) || other.total == total)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,total,count);

@override
String toString() {
  return 'ExpenseCategoryTotal(category: $category, total: $total, count: $count)';
}


}

/// @nodoc
abstract mixin class _$ExpenseCategoryTotalCopyWith<$Res> implements $ExpenseCategoryTotalCopyWith<$Res> {
  factory _$ExpenseCategoryTotalCopyWith(_ExpenseCategoryTotal value, $Res Function(_ExpenseCategoryTotal) _then) = __$ExpenseCategoryTotalCopyWithImpl;
@override @useResult
$Res call({
 String category, double total, int count
});




}
/// @nodoc
class __$ExpenseCategoryTotalCopyWithImpl<$Res>
    implements _$ExpenseCategoryTotalCopyWith<$Res> {
  __$ExpenseCategoryTotalCopyWithImpl(this._self, this._then);

  final _ExpenseCategoryTotal _self;
  final $Res Function(_ExpenseCategoryTotal) _then;

/// Create a copy of ExpenseCategoryTotal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? total = null,Object? count = null,}) {
  return _then(_ExpenseCategoryTotal(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CounterBalanceRow {

 String get counter;@JsonKey(name: 'sale_amount') double get saleAmount;@JsonKey(name: 'paid_amount') double get paidAmount; double get balance;
/// Create a copy of CounterBalanceRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CounterBalanceRowCopyWith<CounterBalanceRow> get copyWith => _$CounterBalanceRowCopyWithImpl<CounterBalanceRow>(this as CounterBalanceRow, _$identity);

  /// Serializes this CounterBalanceRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterBalanceRow&&(identical(other.counter, counter) || other.counter == counter)&&(identical(other.saleAmount, saleAmount) || other.saleAmount == saleAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,counter,saleAmount,paidAmount,balance);

@override
String toString() {
  return 'CounterBalanceRow(counter: $counter, saleAmount: $saleAmount, paidAmount: $paidAmount, balance: $balance)';
}


}

/// @nodoc
abstract mixin class $CounterBalanceRowCopyWith<$Res>  {
  factory $CounterBalanceRowCopyWith(CounterBalanceRow value, $Res Function(CounterBalanceRow) _then) = _$CounterBalanceRowCopyWithImpl;
@useResult
$Res call({
 String counter,@JsonKey(name: 'sale_amount') double saleAmount,@JsonKey(name: 'paid_amount') double paidAmount, double balance
});




}
/// @nodoc
class _$CounterBalanceRowCopyWithImpl<$Res>
    implements $CounterBalanceRowCopyWith<$Res> {
  _$CounterBalanceRowCopyWithImpl(this._self, this._then);

  final CounterBalanceRow _self;
  final $Res Function(CounterBalanceRow) _then;

/// Create a copy of CounterBalanceRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? counter = null,Object? saleAmount = null,Object? paidAmount = null,Object? balance = null,}) {
  return _then(_self.copyWith(
counter: null == counter ? _self.counter : counter // ignore: cast_nullable_to_non_nullable
as String,saleAmount: null == saleAmount ? _self.saleAmount : saleAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CounterBalanceRow].
extension CounterBalanceRowPatterns on CounterBalanceRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CounterBalanceRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CounterBalanceRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CounterBalanceRow value)  $default,){
final _that = this;
switch (_that) {
case _CounterBalanceRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CounterBalanceRow value)?  $default,){
final _that = this;
switch (_that) {
case _CounterBalanceRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String counter, @JsonKey(name: 'sale_amount')  double saleAmount, @JsonKey(name: 'paid_amount')  double paidAmount,  double balance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CounterBalanceRow() when $default != null:
return $default(_that.counter,_that.saleAmount,_that.paidAmount,_that.balance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String counter, @JsonKey(name: 'sale_amount')  double saleAmount, @JsonKey(name: 'paid_amount')  double paidAmount,  double balance)  $default,) {final _that = this;
switch (_that) {
case _CounterBalanceRow():
return $default(_that.counter,_that.saleAmount,_that.paidAmount,_that.balance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String counter, @JsonKey(name: 'sale_amount')  double saleAmount, @JsonKey(name: 'paid_amount')  double paidAmount,  double balance)?  $default,) {final _that = this;
switch (_that) {
case _CounterBalanceRow() when $default != null:
return $default(_that.counter,_that.saleAmount,_that.paidAmount,_that.balance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CounterBalanceRow implements CounterBalanceRow {
  const _CounterBalanceRow({required this.counter, @JsonKey(name: 'sale_amount') required this.saleAmount, @JsonKey(name: 'paid_amount') required this.paidAmount, required this.balance});
  factory _CounterBalanceRow.fromJson(Map<String, dynamic> json) => _$CounterBalanceRowFromJson(json);

@override final  String counter;
@override@JsonKey(name: 'sale_amount') final  double saleAmount;
@override@JsonKey(name: 'paid_amount') final  double paidAmount;
@override final  double balance;

/// Create a copy of CounterBalanceRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CounterBalanceRowCopyWith<_CounterBalanceRow> get copyWith => __$CounterBalanceRowCopyWithImpl<_CounterBalanceRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CounterBalanceRowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CounterBalanceRow&&(identical(other.counter, counter) || other.counter == counter)&&(identical(other.saleAmount, saleAmount) || other.saleAmount == saleAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,counter,saleAmount,paidAmount,balance);

@override
String toString() {
  return 'CounterBalanceRow(counter: $counter, saleAmount: $saleAmount, paidAmount: $paidAmount, balance: $balance)';
}


}

/// @nodoc
abstract mixin class _$CounterBalanceRowCopyWith<$Res> implements $CounterBalanceRowCopyWith<$Res> {
  factory _$CounterBalanceRowCopyWith(_CounterBalanceRow value, $Res Function(_CounterBalanceRow) _then) = __$CounterBalanceRowCopyWithImpl;
@override @useResult
$Res call({
 String counter,@JsonKey(name: 'sale_amount') double saleAmount,@JsonKey(name: 'paid_amount') double paidAmount, double balance
});




}
/// @nodoc
class __$CounterBalanceRowCopyWithImpl<$Res>
    implements _$CounterBalanceRowCopyWith<$Res> {
  __$CounterBalanceRowCopyWithImpl(this._self, this._then);

  final _CounterBalanceRow _self;
  final $Res Function(_CounterBalanceRow) _then;

/// Create a copy of CounterBalanceRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? counter = null,Object? saleAmount = null,Object? paidAmount = null,Object? balance = null,}) {
  return _then(_CounterBalanceRow(
counter: null == counter ? _self.counter : counter // ignore: cast_nullable_to_non_nullable
as String,saleAmount: null == saleAmount ? _self.saleAmount : saleAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$DeductionTypeTotal {

 String get type; double get total; int get count;
/// Create a copy of DeductionTypeTotal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeductionTypeTotalCopyWith<DeductionTypeTotal> get copyWith => _$DeductionTypeTotalCopyWithImpl<DeductionTypeTotal>(this as DeductionTypeTotal, _$identity);

  /// Serializes this DeductionTypeTotal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeductionTypeTotal&&(identical(other.type, type) || other.type == type)&&(identical(other.total, total) || other.total == total)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,total,count);

@override
String toString() {
  return 'DeductionTypeTotal(type: $type, total: $total, count: $count)';
}


}

/// @nodoc
abstract mixin class $DeductionTypeTotalCopyWith<$Res>  {
  factory $DeductionTypeTotalCopyWith(DeductionTypeTotal value, $Res Function(DeductionTypeTotal) _then) = _$DeductionTypeTotalCopyWithImpl;
@useResult
$Res call({
 String type, double total, int count
});




}
/// @nodoc
class _$DeductionTypeTotalCopyWithImpl<$Res>
    implements $DeductionTypeTotalCopyWith<$Res> {
  _$DeductionTypeTotalCopyWithImpl(this._self, this._then);

  final DeductionTypeTotal _self;
  final $Res Function(DeductionTypeTotal) _then;

/// Create a copy of DeductionTypeTotal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? total = null,Object? count = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DeductionTypeTotal].
extension DeductionTypeTotalPatterns on DeductionTypeTotal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeductionTypeTotal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeductionTypeTotal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeductionTypeTotal value)  $default,){
final _that = this;
switch (_that) {
case _DeductionTypeTotal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeductionTypeTotal value)?  $default,){
final _that = this;
switch (_that) {
case _DeductionTypeTotal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  double total,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeductionTypeTotal() when $default != null:
return $default(_that.type,_that.total,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  double total,  int count)  $default,) {final _that = this;
switch (_that) {
case _DeductionTypeTotal():
return $default(_that.type,_that.total,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  double total,  int count)?  $default,) {final _that = this;
switch (_that) {
case _DeductionTypeTotal() when $default != null:
return $default(_that.type,_that.total,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeductionTypeTotal implements DeductionTypeTotal {
  const _DeductionTypeTotal({required this.type, required this.total, required this.count});
  factory _DeductionTypeTotal.fromJson(Map<String, dynamic> json) => _$DeductionTypeTotalFromJson(json);

@override final  String type;
@override final  double total;
@override final  int count;

/// Create a copy of DeductionTypeTotal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeductionTypeTotalCopyWith<_DeductionTypeTotal> get copyWith => __$DeductionTypeTotalCopyWithImpl<_DeductionTypeTotal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeductionTypeTotalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeductionTypeTotal&&(identical(other.type, type) || other.type == type)&&(identical(other.total, total) || other.total == total)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,total,count);

@override
String toString() {
  return 'DeductionTypeTotal(type: $type, total: $total, count: $count)';
}


}

/// @nodoc
abstract mixin class _$DeductionTypeTotalCopyWith<$Res> implements $DeductionTypeTotalCopyWith<$Res> {
  factory _$DeductionTypeTotalCopyWith(_DeductionTypeTotal value, $Res Function(_DeductionTypeTotal) _then) = __$DeductionTypeTotalCopyWithImpl;
@override @useResult
$Res call({
 String type, double total, int count
});




}
/// @nodoc
class __$DeductionTypeTotalCopyWithImpl<$Res>
    implements _$DeductionTypeTotalCopyWith<$Res> {
  __$DeductionTypeTotalCopyWithImpl(this._self, this._then);

  final _DeductionTypeTotal _self;
  final $Res Function(_DeductionTypeTotal) _then;

/// Create a copy of DeductionTypeTotal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? total = null,Object? count = null,}) {
  return _then(_DeductionTypeTotal(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ChannelSaleTotal {

 String get channel; String get type; double get total;
/// Create a copy of ChannelSaleTotal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChannelSaleTotalCopyWith<ChannelSaleTotal> get copyWith => _$ChannelSaleTotalCopyWithImpl<ChannelSaleTotal>(this as ChannelSaleTotal, _$identity);

  /// Serializes this ChannelSaleTotal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChannelSaleTotal&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.type, type) || other.type == type)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,channel,type,total);

@override
String toString() {
  return 'ChannelSaleTotal(channel: $channel, type: $type, total: $total)';
}


}

/// @nodoc
abstract mixin class $ChannelSaleTotalCopyWith<$Res>  {
  factory $ChannelSaleTotalCopyWith(ChannelSaleTotal value, $Res Function(ChannelSaleTotal) _then) = _$ChannelSaleTotalCopyWithImpl;
@useResult
$Res call({
 String channel, String type, double total
});




}
/// @nodoc
class _$ChannelSaleTotalCopyWithImpl<$Res>
    implements $ChannelSaleTotalCopyWith<$Res> {
  _$ChannelSaleTotalCopyWithImpl(this._self, this._then);

  final ChannelSaleTotal _self;
  final $Res Function(ChannelSaleTotal) _then;

/// Create a copy of ChannelSaleTotal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? channel = null,Object? type = null,Object? total = null,}) {
  return _then(_self.copyWith(
channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ChannelSaleTotal].
extension ChannelSaleTotalPatterns on ChannelSaleTotal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChannelSaleTotal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChannelSaleTotal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChannelSaleTotal value)  $default,){
final _that = this;
switch (_that) {
case _ChannelSaleTotal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChannelSaleTotal value)?  $default,){
final _that = this;
switch (_that) {
case _ChannelSaleTotal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String channel,  String type,  double total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChannelSaleTotal() when $default != null:
return $default(_that.channel,_that.type,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String channel,  String type,  double total)  $default,) {final _that = this;
switch (_that) {
case _ChannelSaleTotal():
return $default(_that.channel,_that.type,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String channel,  String type,  double total)?  $default,) {final _that = this;
switch (_that) {
case _ChannelSaleTotal() when $default != null:
return $default(_that.channel,_that.type,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChannelSaleTotal implements ChannelSaleTotal {
  const _ChannelSaleTotal({required this.channel, required this.type, required this.total});
  factory _ChannelSaleTotal.fromJson(Map<String, dynamic> json) => _$ChannelSaleTotalFromJson(json);

@override final  String channel;
@override final  String type;
@override final  double total;

/// Create a copy of ChannelSaleTotal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChannelSaleTotalCopyWith<_ChannelSaleTotal> get copyWith => __$ChannelSaleTotalCopyWithImpl<_ChannelSaleTotal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChannelSaleTotalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChannelSaleTotal&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.type, type) || other.type == type)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,channel,type,total);

@override
String toString() {
  return 'ChannelSaleTotal(channel: $channel, type: $type, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ChannelSaleTotalCopyWith<$Res> implements $ChannelSaleTotalCopyWith<$Res> {
  factory _$ChannelSaleTotalCopyWith(_ChannelSaleTotal value, $Res Function(_ChannelSaleTotal) _then) = __$ChannelSaleTotalCopyWithImpl;
@override @useResult
$Res call({
 String channel, String type, double total
});




}
/// @nodoc
class __$ChannelSaleTotalCopyWithImpl<$Res>
    implements _$ChannelSaleTotalCopyWith<$Res> {
  __$ChannelSaleTotalCopyWithImpl(this._self, this._then);

  final _ChannelSaleTotal _self;
  final $Res Function(_ChannelSaleTotal) _then;

/// Create a copy of ChannelSaleTotal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? channel = null,Object? type = null,Object? total = null,}) {
  return _then(_ChannelSaleTotal(
channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
