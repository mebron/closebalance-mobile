// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DayReport {

 String get date;@JsonKey(name: 'total_sales') double get totalSales;@JsonKey(name: 'cash_in_hand') double get cashInHand;@JsonKey(name: 'draft_closings') int get draftClosings;@JsonKey(name: 'finalized_closings') int get finalizedClosings;@JsonKey(name: 'total_expenses') double get totalExpenses;@JsonKey(name: 'total_deductions') double get totalDeductions;@JsonKey(name: 'net_balance') double get netProfit;@JsonKey(name: 'cash_collections') double get cashCollections;@JsonKey(name: 'cash_expenses') double get cashExpenses;@JsonKey(name: 'cash_deductions') double get cashDeductions;@JsonKey(name: 'total_counter_paid') double get totalCounterPaid;@JsonKey(name: 'online_collections') double get onlineCollections;@JsonKey(name: 'online_expenses') double get onlineExpenses;@JsonKey(name: 'online_deductions') double get onlineDeductions;@JsonKey(name: 'online_net') double get onlineNet; List<ChannelSaleTotal> get channels; List<ExpenseCategoryTotal> get expenses; List<DeductionTypeTotal> get deductions; List<CounterBalanceRow> get counters;
/// Create a copy of DayReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayReportCopyWith<DayReport> get copyWith => _$DayReportCopyWithImpl<DayReport>(this as DayReport, _$identity);

  /// Serializes this DayReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayReport&&(identical(other.date, date) || other.date == date)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.cashInHand, cashInHand) || other.cashInHand == cashInHand)&&(identical(other.draftClosings, draftClosings) || other.draftClosings == draftClosings)&&(identical(other.finalizedClosings, finalizedClosings) || other.finalizedClosings == finalizedClosings)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.totalDeductions, totalDeductions) || other.totalDeductions == totalDeductions)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit)&&(identical(other.cashCollections, cashCollections) || other.cashCollections == cashCollections)&&(identical(other.cashExpenses, cashExpenses) || other.cashExpenses == cashExpenses)&&(identical(other.cashDeductions, cashDeductions) || other.cashDeductions == cashDeductions)&&(identical(other.totalCounterPaid, totalCounterPaid) || other.totalCounterPaid == totalCounterPaid)&&(identical(other.onlineCollections, onlineCollections) || other.onlineCollections == onlineCollections)&&(identical(other.onlineExpenses, onlineExpenses) || other.onlineExpenses == onlineExpenses)&&(identical(other.onlineDeductions, onlineDeductions) || other.onlineDeductions == onlineDeductions)&&(identical(other.onlineNet, onlineNet) || other.onlineNet == onlineNet)&&const DeepCollectionEquality().equals(other.channels, channels)&&const DeepCollectionEquality().equals(other.expenses, expenses)&&const DeepCollectionEquality().equals(other.deductions, deductions)&&const DeepCollectionEquality().equals(other.counters, counters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,date,totalSales,cashInHand,draftClosings,finalizedClosings,totalExpenses,totalDeductions,netProfit,cashCollections,cashExpenses,cashDeductions,totalCounterPaid,onlineCollections,onlineExpenses,onlineDeductions,onlineNet,const DeepCollectionEquality().hash(channels),const DeepCollectionEquality().hash(expenses),const DeepCollectionEquality().hash(deductions),const DeepCollectionEquality().hash(counters)]);

@override
String toString() {
  return 'DayReport(date: $date, totalSales: $totalSales, cashInHand: $cashInHand, draftClosings: $draftClosings, finalizedClosings: $finalizedClosings, totalExpenses: $totalExpenses, totalDeductions: $totalDeductions, netProfit: $netProfit, cashCollections: $cashCollections, cashExpenses: $cashExpenses, cashDeductions: $cashDeductions, totalCounterPaid: $totalCounterPaid, onlineCollections: $onlineCollections, onlineExpenses: $onlineExpenses, onlineDeductions: $onlineDeductions, onlineNet: $onlineNet, channels: $channels, expenses: $expenses, deductions: $deductions, counters: $counters)';
}


}

/// @nodoc
abstract mixin class $DayReportCopyWith<$Res>  {
  factory $DayReportCopyWith(DayReport value, $Res Function(DayReport) _then) = _$DayReportCopyWithImpl;
@useResult
$Res call({
 String date,@JsonKey(name: 'total_sales') double totalSales,@JsonKey(name: 'cash_in_hand') double cashInHand,@JsonKey(name: 'draft_closings') int draftClosings,@JsonKey(name: 'finalized_closings') int finalizedClosings,@JsonKey(name: 'total_expenses') double totalExpenses,@JsonKey(name: 'total_deductions') double totalDeductions,@JsonKey(name: 'net_balance') double netProfit,@JsonKey(name: 'cash_collections') double cashCollections,@JsonKey(name: 'cash_expenses') double cashExpenses,@JsonKey(name: 'cash_deductions') double cashDeductions,@JsonKey(name: 'total_counter_paid') double totalCounterPaid,@JsonKey(name: 'online_collections') double onlineCollections,@JsonKey(name: 'online_expenses') double onlineExpenses,@JsonKey(name: 'online_deductions') double onlineDeductions,@JsonKey(name: 'online_net') double onlineNet, List<ChannelSaleTotal> channels, List<ExpenseCategoryTotal> expenses, List<DeductionTypeTotal> deductions, List<CounterBalanceRow> counters
});




}
/// @nodoc
class _$DayReportCopyWithImpl<$Res>
    implements $DayReportCopyWith<$Res> {
  _$DayReportCopyWithImpl(this._self, this._then);

  final DayReport _self;
  final $Res Function(DayReport) _then;

/// Create a copy of DayReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? totalSales = null,Object? cashInHand = null,Object? draftClosings = null,Object? finalizedClosings = null,Object? totalExpenses = null,Object? totalDeductions = null,Object? netProfit = null,Object? cashCollections = null,Object? cashExpenses = null,Object? cashDeductions = null,Object? totalCounterPaid = null,Object? onlineCollections = null,Object? onlineExpenses = null,Object? onlineDeductions = null,Object? onlineNet = null,Object? channels = null,Object? expenses = null,Object? deductions = null,Object? counters = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,cashInHand: null == cashInHand ? _self.cashInHand : cashInHand // ignore: cast_nullable_to_non_nullable
as double,draftClosings: null == draftClosings ? _self.draftClosings : draftClosings // ignore: cast_nullable_to_non_nullable
as int,finalizedClosings: null == finalizedClosings ? _self.finalizedClosings : finalizedClosings // ignore: cast_nullable_to_non_nullable
as int,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,totalDeductions: null == totalDeductions ? _self.totalDeductions : totalDeductions // ignore: cast_nullable_to_non_nullable
as double,netProfit: null == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double,cashCollections: null == cashCollections ? _self.cashCollections : cashCollections // ignore: cast_nullable_to_non_nullable
as double,cashExpenses: null == cashExpenses ? _self.cashExpenses : cashExpenses // ignore: cast_nullable_to_non_nullable
as double,cashDeductions: null == cashDeductions ? _self.cashDeductions : cashDeductions // ignore: cast_nullable_to_non_nullable
as double,totalCounterPaid: null == totalCounterPaid ? _self.totalCounterPaid : totalCounterPaid // ignore: cast_nullable_to_non_nullable
as double,onlineCollections: null == onlineCollections ? _self.onlineCollections : onlineCollections // ignore: cast_nullable_to_non_nullable
as double,onlineExpenses: null == onlineExpenses ? _self.onlineExpenses : onlineExpenses // ignore: cast_nullable_to_non_nullable
as double,onlineDeductions: null == onlineDeductions ? _self.onlineDeductions : onlineDeductions // ignore: cast_nullable_to_non_nullable
as double,onlineNet: null == onlineNet ? _self.onlineNet : onlineNet // ignore: cast_nullable_to_non_nullable
as double,channels: null == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as List<ChannelSaleTotal>,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<ExpenseCategoryTotal>,deductions: null == deductions ? _self.deductions : deductions // ignore: cast_nullable_to_non_nullable
as List<DeductionTypeTotal>,counters: null == counters ? _self.counters : counters // ignore: cast_nullable_to_non_nullable
as List<CounterBalanceRow>,
  ));
}

}


/// Adds pattern-matching-related methods to [DayReport].
extension DayReportPatterns on DayReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayReport value)  $default,){
final _that = this;
switch (_that) {
case _DayReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayReport value)?  $default,){
final _that = this;
switch (_that) {
case _DayReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'cash_in_hand')  double cashInHand, @JsonKey(name: 'draft_closings')  int draftClosings, @JsonKey(name: 'finalized_closings')  int finalizedClosings, @JsonKey(name: 'total_expenses')  double totalExpenses, @JsonKey(name: 'total_deductions')  double totalDeductions, @JsonKey(name: 'net_balance')  double netProfit, @JsonKey(name: 'cash_collections')  double cashCollections, @JsonKey(name: 'cash_expenses')  double cashExpenses, @JsonKey(name: 'cash_deductions')  double cashDeductions, @JsonKey(name: 'total_counter_paid')  double totalCounterPaid, @JsonKey(name: 'online_collections')  double onlineCollections, @JsonKey(name: 'online_expenses')  double onlineExpenses, @JsonKey(name: 'online_deductions')  double onlineDeductions, @JsonKey(name: 'online_net')  double onlineNet,  List<ChannelSaleTotal> channels,  List<ExpenseCategoryTotal> expenses,  List<DeductionTypeTotal> deductions,  List<CounterBalanceRow> counters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayReport() when $default != null:
return $default(_that.date,_that.totalSales,_that.cashInHand,_that.draftClosings,_that.finalizedClosings,_that.totalExpenses,_that.totalDeductions,_that.netProfit,_that.cashCollections,_that.cashExpenses,_that.cashDeductions,_that.totalCounterPaid,_that.onlineCollections,_that.onlineExpenses,_that.onlineDeductions,_that.onlineNet,_that.channels,_that.expenses,_that.deductions,_that.counters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'cash_in_hand')  double cashInHand, @JsonKey(name: 'draft_closings')  int draftClosings, @JsonKey(name: 'finalized_closings')  int finalizedClosings, @JsonKey(name: 'total_expenses')  double totalExpenses, @JsonKey(name: 'total_deductions')  double totalDeductions, @JsonKey(name: 'net_balance')  double netProfit, @JsonKey(name: 'cash_collections')  double cashCollections, @JsonKey(name: 'cash_expenses')  double cashExpenses, @JsonKey(name: 'cash_deductions')  double cashDeductions, @JsonKey(name: 'total_counter_paid')  double totalCounterPaid, @JsonKey(name: 'online_collections')  double onlineCollections, @JsonKey(name: 'online_expenses')  double onlineExpenses, @JsonKey(name: 'online_deductions')  double onlineDeductions, @JsonKey(name: 'online_net')  double onlineNet,  List<ChannelSaleTotal> channels,  List<ExpenseCategoryTotal> expenses,  List<DeductionTypeTotal> deductions,  List<CounterBalanceRow> counters)  $default,) {final _that = this;
switch (_that) {
case _DayReport():
return $default(_that.date,_that.totalSales,_that.cashInHand,_that.draftClosings,_that.finalizedClosings,_that.totalExpenses,_that.totalDeductions,_that.netProfit,_that.cashCollections,_that.cashExpenses,_that.cashDeductions,_that.totalCounterPaid,_that.onlineCollections,_that.onlineExpenses,_that.onlineDeductions,_that.onlineNet,_that.channels,_that.expenses,_that.deductions,_that.counters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'cash_in_hand')  double cashInHand, @JsonKey(name: 'draft_closings')  int draftClosings, @JsonKey(name: 'finalized_closings')  int finalizedClosings, @JsonKey(name: 'total_expenses')  double totalExpenses, @JsonKey(name: 'total_deductions')  double totalDeductions, @JsonKey(name: 'net_balance')  double netProfit, @JsonKey(name: 'cash_collections')  double cashCollections, @JsonKey(name: 'cash_expenses')  double cashExpenses, @JsonKey(name: 'cash_deductions')  double cashDeductions, @JsonKey(name: 'total_counter_paid')  double totalCounterPaid, @JsonKey(name: 'online_collections')  double onlineCollections, @JsonKey(name: 'online_expenses')  double onlineExpenses, @JsonKey(name: 'online_deductions')  double onlineDeductions, @JsonKey(name: 'online_net')  double onlineNet,  List<ChannelSaleTotal> channels,  List<ExpenseCategoryTotal> expenses,  List<DeductionTypeTotal> deductions,  List<CounterBalanceRow> counters)?  $default,) {final _that = this;
switch (_that) {
case _DayReport() when $default != null:
return $default(_that.date,_that.totalSales,_that.cashInHand,_that.draftClosings,_that.finalizedClosings,_that.totalExpenses,_that.totalDeductions,_that.netProfit,_that.cashCollections,_that.cashExpenses,_that.cashDeductions,_that.totalCounterPaid,_that.onlineCollections,_that.onlineExpenses,_that.onlineDeductions,_that.onlineNet,_that.channels,_that.expenses,_that.deductions,_that.counters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DayReport implements DayReport {
  const _DayReport({required this.date, @JsonKey(name: 'total_sales') required this.totalSales, @JsonKey(name: 'cash_in_hand') required this.cashInHand, @JsonKey(name: 'draft_closings') required this.draftClosings, @JsonKey(name: 'finalized_closings') required this.finalizedClosings, @JsonKey(name: 'total_expenses') required this.totalExpenses, @JsonKey(name: 'total_deductions') this.totalDeductions = 0.0, @JsonKey(name: 'net_balance') this.netProfit = 0.0, @JsonKey(name: 'cash_collections') this.cashCollections = 0.0, @JsonKey(name: 'cash_expenses') this.cashExpenses = 0.0, @JsonKey(name: 'cash_deductions') this.cashDeductions = 0.0, @JsonKey(name: 'total_counter_paid') this.totalCounterPaid = 0.0, @JsonKey(name: 'online_collections') this.onlineCollections = 0.0, @JsonKey(name: 'online_expenses') this.onlineExpenses = 0.0, @JsonKey(name: 'online_deductions') this.onlineDeductions = 0.0, @JsonKey(name: 'online_net') this.onlineNet = 0.0, final  List<ChannelSaleTotal> channels = const [], final  List<ExpenseCategoryTotal> expenses = const [], final  List<DeductionTypeTotal> deductions = const [], final  List<CounterBalanceRow> counters = const []}): _channels = channels,_expenses = expenses,_deductions = deductions,_counters = counters;
  factory _DayReport.fromJson(Map<String, dynamic> json) => _$DayReportFromJson(json);

@override final  String date;
@override@JsonKey(name: 'total_sales') final  double totalSales;
@override@JsonKey(name: 'cash_in_hand') final  double cashInHand;
@override@JsonKey(name: 'draft_closings') final  int draftClosings;
@override@JsonKey(name: 'finalized_closings') final  int finalizedClosings;
@override@JsonKey(name: 'total_expenses') final  double totalExpenses;
@override@JsonKey(name: 'total_deductions') final  double totalDeductions;
@override@JsonKey(name: 'net_balance') final  double netProfit;
@override@JsonKey(name: 'cash_collections') final  double cashCollections;
@override@JsonKey(name: 'cash_expenses') final  double cashExpenses;
@override@JsonKey(name: 'cash_deductions') final  double cashDeductions;
@override@JsonKey(name: 'total_counter_paid') final  double totalCounterPaid;
@override@JsonKey(name: 'online_collections') final  double onlineCollections;
@override@JsonKey(name: 'online_expenses') final  double onlineExpenses;
@override@JsonKey(name: 'online_deductions') final  double onlineDeductions;
@override@JsonKey(name: 'online_net') final  double onlineNet;
 final  List<ChannelSaleTotal> _channels;
@override@JsonKey() List<ChannelSaleTotal> get channels {
  if (_channels is EqualUnmodifiableListView) return _channels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_channels);
}

 final  List<ExpenseCategoryTotal> _expenses;
@override@JsonKey() List<ExpenseCategoryTotal> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}

 final  List<DeductionTypeTotal> _deductions;
@override@JsonKey() List<DeductionTypeTotal> get deductions {
  if (_deductions is EqualUnmodifiableListView) return _deductions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deductions);
}

 final  List<CounterBalanceRow> _counters;
@override@JsonKey() List<CounterBalanceRow> get counters {
  if (_counters is EqualUnmodifiableListView) return _counters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_counters);
}


/// Create a copy of DayReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayReportCopyWith<_DayReport> get copyWith => __$DayReportCopyWithImpl<_DayReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DayReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayReport&&(identical(other.date, date) || other.date == date)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.cashInHand, cashInHand) || other.cashInHand == cashInHand)&&(identical(other.draftClosings, draftClosings) || other.draftClosings == draftClosings)&&(identical(other.finalizedClosings, finalizedClosings) || other.finalizedClosings == finalizedClosings)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.totalDeductions, totalDeductions) || other.totalDeductions == totalDeductions)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit)&&(identical(other.cashCollections, cashCollections) || other.cashCollections == cashCollections)&&(identical(other.cashExpenses, cashExpenses) || other.cashExpenses == cashExpenses)&&(identical(other.cashDeductions, cashDeductions) || other.cashDeductions == cashDeductions)&&(identical(other.totalCounterPaid, totalCounterPaid) || other.totalCounterPaid == totalCounterPaid)&&(identical(other.onlineCollections, onlineCollections) || other.onlineCollections == onlineCollections)&&(identical(other.onlineExpenses, onlineExpenses) || other.onlineExpenses == onlineExpenses)&&(identical(other.onlineDeductions, onlineDeductions) || other.onlineDeductions == onlineDeductions)&&(identical(other.onlineNet, onlineNet) || other.onlineNet == onlineNet)&&const DeepCollectionEquality().equals(other._channels, _channels)&&const DeepCollectionEquality().equals(other._expenses, _expenses)&&const DeepCollectionEquality().equals(other._deductions, _deductions)&&const DeepCollectionEquality().equals(other._counters, _counters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,date,totalSales,cashInHand,draftClosings,finalizedClosings,totalExpenses,totalDeductions,netProfit,cashCollections,cashExpenses,cashDeductions,totalCounterPaid,onlineCollections,onlineExpenses,onlineDeductions,onlineNet,const DeepCollectionEquality().hash(_channels),const DeepCollectionEquality().hash(_expenses),const DeepCollectionEquality().hash(_deductions),const DeepCollectionEquality().hash(_counters)]);

@override
String toString() {
  return 'DayReport(date: $date, totalSales: $totalSales, cashInHand: $cashInHand, draftClosings: $draftClosings, finalizedClosings: $finalizedClosings, totalExpenses: $totalExpenses, totalDeductions: $totalDeductions, netProfit: $netProfit, cashCollections: $cashCollections, cashExpenses: $cashExpenses, cashDeductions: $cashDeductions, totalCounterPaid: $totalCounterPaid, onlineCollections: $onlineCollections, onlineExpenses: $onlineExpenses, onlineDeductions: $onlineDeductions, onlineNet: $onlineNet, channels: $channels, expenses: $expenses, deductions: $deductions, counters: $counters)';
}


}

/// @nodoc
abstract mixin class _$DayReportCopyWith<$Res> implements $DayReportCopyWith<$Res> {
  factory _$DayReportCopyWith(_DayReport value, $Res Function(_DayReport) _then) = __$DayReportCopyWithImpl;
@override @useResult
$Res call({
 String date,@JsonKey(name: 'total_sales') double totalSales,@JsonKey(name: 'cash_in_hand') double cashInHand,@JsonKey(name: 'draft_closings') int draftClosings,@JsonKey(name: 'finalized_closings') int finalizedClosings,@JsonKey(name: 'total_expenses') double totalExpenses,@JsonKey(name: 'total_deductions') double totalDeductions,@JsonKey(name: 'net_balance') double netProfit,@JsonKey(name: 'cash_collections') double cashCollections,@JsonKey(name: 'cash_expenses') double cashExpenses,@JsonKey(name: 'cash_deductions') double cashDeductions,@JsonKey(name: 'total_counter_paid') double totalCounterPaid,@JsonKey(name: 'online_collections') double onlineCollections,@JsonKey(name: 'online_expenses') double onlineExpenses,@JsonKey(name: 'online_deductions') double onlineDeductions,@JsonKey(name: 'online_net') double onlineNet, List<ChannelSaleTotal> channels, List<ExpenseCategoryTotal> expenses, List<DeductionTypeTotal> deductions, List<CounterBalanceRow> counters
});




}
/// @nodoc
class __$DayReportCopyWithImpl<$Res>
    implements _$DayReportCopyWith<$Res> {
  __$DayReportCopyWithImpl(this._self, this._then);

  final _DayReport _self;
  final $Res Function(_DayReport) _then;

/// Create a copy of DayReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? totalSales = null,Object? cashInHand = null,Object? draftClosings = null,Object? finalizedClosings = null,Object? totalExpenses = null,Object? totalDeductions = null,Object? netProfit = null,Object? cashCollections = null,Object? cashExpenses = null,Object? cashDeductions = null,Object? totalCounterPaid = null,Object? onlineCollections = null,Object? onlineExpenses = null,Object? onlineDeductions = null,Object? onlineNet = null,Object? channels = null,Object? expenses = null,Object? deductions = null,Object? counters = null,}) {
  return _then(_DayReport(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,cashInHand: null == cashInHand ? _self.cashInHand : cashInHand // ignore: cast_nullable_to_non_nullable
as double,draftClosings: null == draftClosings ? _self.draftClosings : draftClosings // ignore: cast_nullable_to_non_nullable
as int,finalizedClosings: null == finalizedClosings ? _self.finalizedClosings : finalizedClosings // ignore: cast_nullable_to_non_nullable
as int,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,totalDeductions: null == totalDeductions ? _self.totalDeductions : totalDeductions // ignore: cast_nullable_to_non_nullable
as double,netProfit: null == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double,cashCollections: null == cashCollections ? _self.cashCollections : cashCollections // ignore: cast_nullable_to_non_nullable
as double,cashExpenses: null == cashExpenses ? _self.cashExpenses : cashExpenses // ignore: cast_nullable_to_non_nullable
as double,cashDeductions: null == cashDeductions ? _self.cashDeductions : cashDeductions // ignore: cast_nullable_to_non_nullable
as double,totalCounterPaid: null == totalCounterPaid ? _self.totalCounterPaid : totalCounterPaid // ignore: cast_nullable_to_non_nullable
as double,onlineCollections: null == onlineCollections ? _self.onlineCollections : onlineCollections // ignore: cast_nullable_to_non_nullable
as double,onlineExpenses: null == onlineExpenses ? _self.onlineExpenses : onlineExpenses // ignore: cast_nullable_to_non_nullable
as double,onlineDeductions: null == onlineDeductions ? _self.onlineDeductions : onlineDeductions // ignore: cast_nullable_to_non_nullable
as double,onlineNet: null == onlineNet ? _self.onlineNet : onlineNet // ignore: cast_nullable_to_non_nullable
as double,channels: null == channels ? _self._channels : channels // ignore: cast_nullable_to_non_nullable
as List<ChannelSaleTotal>,expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<ExpenseCategoryTotal>,deductions: null == deductions ? _self._deductions : deductions // ignore: cast_nullable_to_non_nullable
as List<DeductionTypeTotal>,counters: null == counters ? _self._counters : counters // ignore: cast_nullable_to_non_nullable
as List<CounterBalanceRow>,
  ));
}


}

// dart format on
