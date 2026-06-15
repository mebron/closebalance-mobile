// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_closing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyClosing {

 int get id; String get date;@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) ClosingStatus get status; String? get notes; Branch? get branch;@JsonKey(name: 'total_sales') double get totalSales;@JsonKey(name: 'total_expenses') double get totalExpenses;@JsonKey(name: 'total_deductions') double get totalDeductions;@JsonKey(name: 'cash_collections') double get cashCollections;@JsonKey(name: 'online_collections') double get onlineCollections;@JsonKey(name: 'aggregator_collections') double get aggregatorCollections;@JsonKey(name: 'total_counter_paid') double get totalCounterPaid;@JsonKey(name: 'cash_in_hand') double get cashInHand;@JsonKey(name: 'net_position') double get netPosition; List<SaleLine> get sales; List<ExpenseLine> get expenses; List<Deduction> get deductions;@JsonKey(name: 'counter_transactions') List<CounterTransaction> get counterTransactions;
/// Create a copy of DailyClosing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyClosingCopyWith<DailyClosing> get copyWith => _$DailyClosingCopyWithImpl<DailyClosing>(this as DailyClosing, _$identity);

  /// Serializes this DailyClosing to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyClosing&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.totalDeductions, totalDeductions) || other.totalDeductions == totalDeductions)&&(identical(other.cashCollections, cashCollections) || other.cashCollections == cashCollections)&&(identical(other.onlineCollections, onlineCollections) || other.onlineCollections == onlineCollections)&&(identical(other.aggregatorCollections, aggregatorCollections) || other.aggregatorCollections == aggregatorCollections)&&(identical(other.totalCounterPaid, totalCounterPaid) || other.totalCounterPaid == totalCounterPaid)&&(identical(other.cashInHand, cashInHand) || other.cashInHand == cashInHand)&&(identical(other.netPosition, netPosition) || other.netPosition == netPosition)&&const DeepCollectionEquality().equals(other.sales, sales)&&const DeepCollectionEquality().equals(other.expenses, expenses)&&const DeepCollectionEquality().equals(other.deductions, deductions)&&const DeepCollectionEquality().equals(other.counterTransactions, counterTransactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,status,notes,branch,totalSales,totalExpenses,totalDeductions,cashCollections,onlineCollections,aggregatorCollections,totalCounterPaid,cashInHand,netPosition,const DeepCollectionEquality().hash(sales),const DeepCollectionEquality().hash(expenses),const DeepCollectionEquality().hash(deductions),const DeepCollectionEquality().hash(counterTransactions));

@override
String toString() {
  return 'DailyClosing(id: $id, date: $date, status: $status, notes: $notes, branch: $branch, totalSales: $totalSales, totalExpenses: $totalExpenses, totalDeductions: $totalDeductions, cashCollections: $cashCollections, onlineCollections: $onlineCollections, aggregatorCollections: $aggregatorCollections, totalCounterPaid: $totalCounterPaid, cashInHand: $cashInHand, netPosition: $netPosition, sales: $sales, expenses: $expenses, deductions: $deductions, counterTransactions: $counterTransactions)';
}


}

/// @nodoc
abstract mixin class $DailyClosingCopyWith<$Res>  {
  factory $DailyClosingCopyWith(DailyClosing value, $Res Function(DailyClosing) _then) = _$DailyClosingCopyWithImpl;
@useResult
$Res call({
 int id, String date,@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) ClosingStatus status, String? notes, Branch? branch,@JsonKey(name: 'total_sales') double totalSales,@JsonKey(name: 'total_expenses') double totalExpenses,@JsonKey(name: 'total_deductions') double totalDeductions,@JsonKey(name: 'cash_collections') double cashCollections,@JsonKey(name: 'online_collections') double onlineCollections,@JsonKey(name: 'aggregator_collections') double aggregatorCollections,@JsonKey(name: 'total_counter_paid') double totalCounterPaid,@JsonKey(name: 'cash_in_hand') double cashInHand,@JsonKey(name: 'net_position') double netPosition, List<SaleLine> sales, List<ExpenseLine> expenses, List<Deduction> deductions,@JsonKey(name: 'counter_transactions') List<CounterTransaction> counterTransactions
});


$BranchCopyWith<$Res>? get branch;

}
/// @nodoc
class _$DailyClosingCopyWithImpl<$Res>
    implements $DailyClosingCopyWith<$Res> {
  _$DailyClosingCopyWithImpl(this._self, this._then);

  final DailyClosing _self;
  final $Res Function(DailyClosing) _then;

/// Create a copy of DailyClosing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? date = null,Object? status = null,Object? notes = freezed,Object? branch = freezed,Object? totalSales = null,Object? totalExpenses = null,Object? totalDeductions = null,Object? cashCollections = null,Object? onlineCollections = null,Object? aggregatorCollections = null,Object? totalCounterPaid = null,Object? cashInHand = null,Object? netPosition = null,Object? sales = null,Object? expenses = null,Object? deductions = null,Object? counterTransactions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ClosingStatus,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as Branch?,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,totalDeductions: null == totalDeductions ? _self.totalDeductions : totalDeductions // ignore: cast_nullable_to_non_nullable
as double,cashCollections: null == cashCollections ? _self.cashCollections : cashCollections // ignore: cast_nullable_to_non_nullable
as double,onlineCollections: null == onlineCollections ? _self.onlineCollections : onlineCollections // ignore: cast_nullable_to_non_nullable
as double,aggregatorCollections: null == aggregatorCollections ? _self.aggregatorCollections : aggregatorCollections // ignore: cast_nullable_to_non_nullable
as double,totalCounterPaid: null == totalCounterPaid ? _self.totalCounterPaid : totalCounterPaid // ignore: cast_nullable_to_non_nullable
as double,cashInHand: null == cashInHand ? _self.cashInHand : cashInHand // ignore: cast_nullable_to_non_nullable
as double,netPosition: null == netPosition ? _self.netPosition : netPosition // ignore: cast_nullable_to_non_nullable
as double,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as List<SaleLine>,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<ExpenseLine>,deductions: null == deductions ? _self.deductions : deductions // ignore: cast_nullable_to_non_nullable
as List<Deduction>,counterTransactions: null == counterTransactions ? _self.counterTransactions : counterTransactions // ignore: cast_nullable_to_non_nullable
as List<CounterTransaction>,
  ));
}
/// Create a copy of DailyClosing
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


/// Adds pattern-matching-related methods to [DailyClosing].
extension DailyClosingPatterns on DailyClosing {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyClosing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyClosing() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyClosing value)  $default,){
final _that = this;
switch (_that) {
case _DailyClosing():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyClosing value)?  $default,){
final _that = this;
switch (_that) {
case _DailyClosing() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String date, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)  ClosingStatus status,  String? notes,  Branch? branch, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'total_expenses')  double totalExpenses, @JsonKey(name: 'total_deductions')  double totalDeductions, @JsonKey(name: 'cash_collections')  double cashCollections, @JsonKey(name: 'online_collections')  double onlineCollections, @JsonKey(name: 'aggregator_collections')  double aggregatorCollections, @JsonKey(name: 'total_counter_paid')  double totalCounterPaid, @JsonKey(name: 'cash_in_hand')  double cashInHand, @JsonKey(name: 'net_position')  double netPosition,  List<SaleLine> sales,  List<ExpenseLine> expenses,  List<Deduction> deductions, @JsonKey(name: 'counter_transactions')  List<CounterTransaction> counterTransactions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyClosing() when $default != null:
return $default(_that.id,_that.date,_that.status,_that.notes,_that.branch,_that.totalSales,_that.totalExpenses,_that.totalDeductions,_that.cashCollections,_that.onlineCollections,_that.aggregatorCollections,_that.totalCounterPaid,_that.cashInHand,_that.netPosition,_that.sales,_that.expenses,_that.deductions,_that.counterTransactions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String date, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)  ClosingStatus status,  String? notes,  Branch? branch, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'total_expenses')  double totalExpenses, @JsonKey(name: 'total_deductions')  double totalDeductions, @JsonKey(name: 'cash_collections')  double cashCollections, @JsonKey(name: 'online_collections')  double onlineCollections, @JsonKey(name: 'aggregator_collections')  double aggregatorCollections, @JsonKey(name: 'total_counter_paid')  double totalCounterPaid, @JsonKey(name: 'cash_in_hand')  double cashInHand, @JsonKey(name: 'net_position')  double netPosition,  List<SaleLine> sales,  List<ExpenseLine> expenses,  List<Deduction> deductions, @JsonKey(name: 'counter_transactions')  List<CounterTransaction> counterTransactions)  $default,) {final _that = this;
switch (_that) {
case _DailyClosing():
return $default(_that.id,_that.date,_that.status,_that.notes,_that.branch,_that.totalSales,_that.totalExpenses,_that.totalDeductions,_that.cashCollections,_that.onlineCollections,_that.aggregatorCollections,_that.totalCounterPaid,_that.cashInHand,_that.netPosition,_that.sales,_that.expenses,_that.deductions,_that.counterTransactions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String date, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)  ClosingStatus status,  String? notes,  Branch? branch, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'total_expenses')  double totalExpenses, @JsonKey(name: 'total_deductions')  double totalDeductions, @JsonKey(name: 'cash_collections')  double cashCollections, @JsonKey(name: 'online_collections')  double onlineCollections, @JsonKey(name: 'aggregator_collections')  double aggregatorCollections, @JsonKey(name: 'total_counter_paid')  double totalCounterPaid, @JsonKey(name: 'cash_in_hand')  double cashInHand, @JsonKey(name: 'net_position')  double netPosition,  List<SaleLine> sales,  List<ExpenseLine> expenses,  List<Deduction> deductions, @JsonKey(name: 'counter_transactions')  List<CounterTransaction> counterTransactions)?  $default,) {final _that = this;
switch (_that) {
case _DailyClosing() when $default != null:
return $default(_that.id,_that.date,_that.status,_that.notes,_that.branch,_that.totalSales,_that.totalExpenses,_that.totalDeductions,_that.cashCollections,_that.onlineCollections,_that.aggregatorCollections,_that.totalCounterPaid,_that.cashInHand,_that.netPosition,_that.sales,_that.expenses,_that.deductions,_that.counterTransactions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyClosing extends DailyClosing {
  const _DailyClosing({required this.id, required this.date, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) required this.status, this.notes, this.branch, @JsonKey(name: 'total_sales') this.totalSales = 0.0, @JsonKey(name: 'total_expenses') this.totalExpenses = 0.0, @JsonKey(name: 'total_deductions') this.totalDeductions = 0.0, @JsonKey(name: 'cash_collections') this.cashCollections = 0.0, @JsonKey(name: 'online_collections') this.onlineCollections = 0.0, @JsonKey(name: 'aggregator_collections') this.aggregatorCollections = 0.0, @JsonKey(name: 'total_counter_paid') this.totalCounterPaid = 0.0, @JsonKey(name: 'cash_in_hand') this.cashInHand = 0.0, @JsonKey(name: 'net_position') this.netPosition = 0.0, final  List<SaleLine> sales = const <SaleLine>[], final  List<ExpenseLine> expenses = const <ExpenseLine>[], final  List<Deduction> deductions = const <Deduction>[], @JsonKey(name: 'counter_transactions') final  List<CounterTransaction> counterTransactions = const <CounterTransaction>[]}): _sales = sales,_expenses = expenses,_deductions = deductions,_counterTransactions = counterTransactions,super._();
  factory _DailyClosing.fromJson(Map<String, dynamic> json) => _$DailyClosingFromJson(json);

@override final  int id;
@override final  String date;
@override@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) final  ClosingStatus status;
@override final  String? notes;
@override final  Branch? branch;
@override@JsonKey(name: 'total_sales') final  double totalSales;
@override@JsonKey(name: 'total_expenses') final  double totalExpenses;
@override@JsonKey(name: 'total_deductions') final  double totalDeductions;
@override@JsonKey(name: 'cash_collections') final  double cashCollections;
@override@JsonKey(name: 'online_collections') final  double onlineCollections;
@override@JsonKey(name: 'aggregator_collections') final  double aggregatorCollections;
@override@JsonKey(name: 'total_counter_paid') final  double totalCounterPaid;
@override@JsonKey(name: 'cash_in_hand') final  double cashInHand;
@override@JsonKey(name: 'net_position') final  double netPosition;
 final  List<SaleLine> _sales;
@override@JsonKey() List<SaleLine> get sales {
  if (_sales is EqualUnmodifiableListView) return _sales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sales);
}

 final  List<ExpenseLine> _expenses;
@override@JsonKey() List<ExpenseLine> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}

 final  List<Deduction> _deductions;
@override@JsonKey() List<Deduction> get deductions {
  if (_deductions is EqualUnmodifiableListView) return _deductions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deductions);
}

 final  List<CounterTransaction> _counterTransactions;
@override@JsonKey(name: 'counter_transactions') List<CounterTransaction> get counterTransactions {
  if (_counterTransactions is EqualUnmodifiableListView) return _counterTransactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_counterTransactions);
}


/// Create a copy of DailyClosing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyClosingCopyWith<_DailyClosing> get copyWith => __$DailyClosingCopyWithImpl<_DailyClosing>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyClosingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyClosing&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.totalDeductions, totalDeductions) || other.totalDeductions == totalDeductions)&&(identical(other.cashCollections, cashCollections) || other.cashCollections == cashCollections)&&(identical(other.onlineCollections, onlineCollections) || other.onlineCollections == onlineCollections)&&(identical(other.aggregatorCollections, aggregatorCollections) || other.aggregatorCollections == aggregatorCollections)&&(identical(other.totalCounterPaid, totalCounterPaid) || other.totalCounterPaid == totalCounterPaid)&&(identical(other.cashInHand, cashInHand) || other.cashInHand == cashInHand)&&(identical(other.netPosition, netPosition) || other.netPosition == netPosition)&&const DeepCollectionEquality().equals(other._sales, _sales)&&const DeepCollectionEquality().equals(other._expenses, _expenses)&&const DeepCollectionEquality().equals(other._deductions, _deductions)&&const DeepCollectionEquality().equals(other._counterTransactions, _counterTransactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,status,notes,branch,totalSales,totalExpenses,totalDeductions,cashCollections,onlineCollections,aggregatorCollections,totalCounterPaid,cashInHand,netPosition,const DeepCollectionEquality().hash(_sales),const DeepCollectionEquality().hash(_expenses),const DeepCollectionEquality().hash(_deductions),const DeepCollectionEquality().hash(_counterTransactions));

@override
String toString() {
  return 'DailyClosing(id: $id, date: $date, status: $status, notes: $notes, branch: $branch, totalSales: $totalSales, totalExpenses: $totalExpenses, totalDeductions: $totalDeductions, cashCollections: $cashCollections, onlineCollections: $onlineCollections, aggregatorCollections: $aggregatorCollections, totalCounterPaid: $totalCounterPaid, cashInHand: $cashInHand, netPosition: $netPosition, sales: $sales, expenses: $expenses, deductions: $deductions, counterTransactions: $counterTransactions)';
}


}

/// @nodoc
abstract mixin class _$DailyClosingCopyWith<$Res> implements $DailyClosingCopyWith<$Res> {
  factory _$DailyClosingCopyWith(_DailyClosing value, $Res Function(_DailyClosing) _then) = __$DailyClosingCopyWithImpl;
@override @useResult
$Res call({
 int id, String date,@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) ClosingStatus status, String? notes, Branch? branch,@JsonKey(name: 'total_sales') double totalSales,@JsonKey(name: 'total_expenses') double totalExpenses,@JsonKey(name: 'total_deductions') double totalDeductions,@JsonKey(name: 'cash_collections') double cashCollections,@JsonKey(name: 'online_collections') double onlineCollections,@JsonKey(name: 'aggregator_collections') double aggregatorCollections,@JsonKey(name: 'total_counter_paid') double totalCounterPaid,@JsonKey(name: 'cash_in_hand') double cashInHand,@JsonKey(name: 'net_position') double netPosition, List<SaleLine> sales, List<ExpenseLine> expenses, List<Deduction> deductions,@JsonKey(name: 'counter_transactions') List<CounterTransaction> counterTransactions
});


@override $BranchCopyWith<$Res>? get branch;

}
/// @nodoc
class __$DailyClosingCopyWithImpl<$Res>
    implements _$DailyClosingCopyWith<$Res> {
  __$DailyClosingCopyWithImpl(this._self, this._then);

  final _DailyClosing _self;
  final $Res Function(_DailyClosing) _then;

/// Create a copy of DailyClosing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? status = null,Object? notes = freezed,Object? branch = freezed,Object? totalSales = null,Object? totalExpenses = null,Object? totalDeductions = null,Object? cashCollections = null,Object? onlineCollections = null,Object? aggregatorCollections = null,Object? totalCounterPaid = null,Object? cashInHand = null,Object? netPosition = null,Object? sales = null,Object? expenses = null,Object? deductions = null,Object? counterTransactions = null,}) {
  return _then(_DailyClosing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ClosingStatus,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as Branch?,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,totalDeductions: null == totalDeductions ? _self.totalDeductions : totalDeductions // ignore: cast_nullable_to_non_nullable
as double,cashCollections: null == cashCollections ? _self.cashCollections : cashCollections // ignore: cast_nullable_to_non_nullable
as double,onlineCollections: null == onlineCollections ? _self.onlineCollections : onlineCollections // ignore: cast_nullable_to_non_nullable
as double,aggregatorCollections: null == aggregatorCollections ? _self.aggregatorCollections : aggregatorCollections // ignore: cast_nullable_to_non_nullable
as double,totalCounterPaid: null == totalCounterPaid ? _self.totalCounterPaid : totalCounterPaid // ignore: cast_nullable_to_non_nullable
as double,cashInHand: null == cashInHand ? _self.cashInHand : cashInHand // ignore: cast_nullable_to_non_nullable
as double,netPosition: null == netPosition ? _self.netPosition : netPosition // ignore: cast_nullable_to_non_nullable
as double,sales: null == sales ? _self._sales : sales // ignore: cast_nullable_to_non_nullable
as List<SaleLine>,expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<ExpenseLine>,deductions: null == deductions ? _self._deductions : deductions // ignore: cast_nullable_to_non_nullable
as List<Deduction>,counterTransactions: null == counterTransactions ? _self._counterTransactions : counterTransactions // ignore: cast_nullable_to_non_nullable
as List<CounterTransaction>,
  ));
}

/// Create a copy of DailyClosing
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

// dart format on
