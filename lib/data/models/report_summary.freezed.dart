// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportSummary {

 String get date;@JsonKey(name: 'total_sales') double get totalSales;@JsonKey(name: 'cash_in_hand') double get cashInHand;@JsonKey(name: 'draft_closings') int get draftClosings;@JsonKey(name: 'finalized_closings') int get finalizedClosings;@JsonKey(name: 'total_expenses') double get totalExpenses;@JsonKey(name: 'net_profit') double get netProfit;
/// Create a copy of ReportSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportSummaryCopyWith<ReportSummary> get copyWith => _$ReportSummaryCopyWithImpl<ReportSummary>(this as ReportSummary, _$identity);

  /// Serializes this ReportSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSummary&&(identical(other.date, date) || other.date == date)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.cashInHand, cashInHand) || other.cashInHand == cashInHand)&&(identical(other.draftClosings, draftClosings) || other.draftClosings == draftClosings)&&(identical(other.finalizedClosings, finalizedClosings) || other.finalizedClosings == finalizedClosings)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,totalSales,cashInHand,draftClosings,finalizedClosings,totalExpenses,netProfit);

@override
String toString() {
  return 'ReportSummary(date: $date, totalSales: $totalSales, cashInHand: $cashInHand, draftClosings: $draftClosings, finalizedClosings: $finalizedClosings, totalExpenses: $totalExpenses, netProfit: $netProfit)';
}


}

/// @nodoc
abstract mixin class $ReportSummaryCopyWith<$Res>  {
  factory $ReportSummaryCopyWith(ReportSummary value, $Res Function(ReportSummary) _then) = _$ReportSummaryCopyWithImpl;
@useResult
$Res call({
 String date,@JsonKey(name: 'total_sales') double totalSales,@JsonKey(name: 'cash_in_hand') double cashInHand,@JsonKey(name: 'draft_closings') int draftClosings,@JsonKey(name: 'finalized_closings') int finalizedClosings,@JsonKey(name: 'total_expenses') double totalExpenses,@JsonKey(name: 'net_profit') double netProfit
});




}
/// @nodoc
class _$ReportSummaryCopyWithImpl<$Res>
    implements $ReportSummaryCopyWith<$Res> {
  _$ReportSummaryCopyWithImpl(this._self, this._then);

  final ReportSummary _self;
  final $Res Function(ReportSummary) _then;

/// Create a copy of ReportSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? totalSales = null,Object? cashInHand = null,Object? draftClosings = null,Object? finalizedClosings = null,Object? totalExpenses = null,Object? netProfit = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,cashInHand: null == cashInHand ? _self.cashInHand : cashInHand // ignore: cast_nullable_to_non_nullable
as double,draftClosings: null == draftClosings ? _self.draftClosings : draftClosings // ignore: cast_nullable_to_non_nullable
as int,finalizedClosings: null == finalizedClosings ? _self.finalizedClosings : finalizedClosings // ignore: cast_nullable_to_non_nullable
as int,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,netProfit: null == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportSummary].
extension ReportSummaryPatterns on ReportSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportSummary value)  $default,){
final _that = this;
switch (_that) {
case _ReportSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ReportSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'cash_in_hand')  double cashInHand, @JsonKey(name: 'draft_closings')  int draftClosings, @JsonKey(name: 'finalized_closings')  int finalizedClosings, @JsonKey(name: 'total_expenses')  double totalExpenses, @JsonKey(name: 'net_profit')  double netProfit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportSummary() when $default != null:
return $default(_that.date,_that.totalSales,_that.cashInHand,_that.draftClosings,_that.finalizedClosings,_that.totalExpenses,_that.netProfit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'cash_in_hand')  double cashInHand, @JsonKey(name: 'draft_closings')  int draftClosings, @JsonKey(name: 'finalized_closings')  int finalizedClosings, @JsonKey(name: 'total_expenses')  double totalExpenses, @JsonKey(name: 'net_profit')  double netProfit)  $default,) {final _that = this;
switch (_that) {
case _ReportSummary():
return $default(_that.date,_that.totalSales,_that.cashInHand,_that.draftClosings,_that.finalizedClosings,_that.totalExpenses,_that.netProfit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'cash_in_hand')  double cashInHand, @JsonKey(name: 'draft_closings')  int draftClosings, @JsonKey(name: 'finalized_closings')  int finalizedClosings, @JsonKey(name: 'total_expenses')  double totalExpenses, @JsonKey(name: 'net_profit')  double netProfit)?  $default,) {final _that = this;
switch (_that) {
case _ReportSummary() when $default != null:
return $default(_that.date,_that.totalSales,_that.cashInHand,_that.draftClosings,_that.finalizedClosings,_that.totalExpenses,_that.netProfit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportSummary implements ReportSummary {
  const _ReportSummary({required this.date, @JsonKey(name: 'total_sales') required this.totalSales, @JsonKey(name: 'cash_in_hand') required this.cashInHand, @JsonKey(name: 'draft_closings') required this.draftClosings, @JsonKey(name: 'finalized_closings') required this.finalizedClosings, @JsonKey(name: 'total_expenses') required this.totalExpenses, @JsonKey(name: 'net_profit') required this.netProfit});
  factory _ReportSummary.fromJson(Map<String, dynamic> json) => _$ReportSummaryFromJson(json);

@override final  String date;
@override@JsonKey(name: 'total_sales') final  double totalSales;
@override@JsonKey(name: 'cash_in_hand') final  double cashInHand;
@override@JsonKey(name: 'draft_closings') final  int draftClosings;
@override@JsonKey(name: 'finalized_closings') final  int finalizedClosings;
@override@JsonKey(name: 'total_expenses') final  double totalExpenses;
@override@JsonKey(name: 'net_profit') final  double netProfit;

/// Create a copy of ReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportSummaryCopyWith<_ReportSummary> get copyWith => __$ReportSummaryCopyWithImpl<_ReportSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportSummary&&(identical(other.date, date) || other.date == date)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.cashInHand, cashInHand) || other.cashInHand == cashInHand)&&(identical(other.draftClosings, draftClosings) || other.draftClosings == draftClosings)&&(identical(other.finalizedClosings, finalizedClosings) || other.finalizedClosings == finalizedClosings)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,totalSales,cashInHand,draftClosings,finalizedClosings,totalExpenses,netProfit);

@override
String toString() {
  return 'ReportSummary(date: $date, totalSales: $totalSales, cashInHand: $cashInHand, draftClosings: $draftClosings, finalizedClosings: $finalizedClosings, totalExpenses: $totalExpenses, netProfit: $netProfit)';
}


}

/// @nodoc
abstract mixin class _$ReportSummaryCopyWith<$Res> implements $ReportSummaryCopyWith<$Res> {
  factory _$ReportSummaryCopyWith(_ReportSummary value, $Res Function(_ReportSummary) _then) = __$ReportSummaryCopyWithImpl;
@override @useResult
$Res call({
 String date,@JsonKey(name: 'total_sales') double totalSales,@JsonKey(name: 'cash_in_hand') double cashInHand,@JsonKey(name: 'draft_closings') int draftClosings,@JsonKey(name: 'finalized_closings') int finalizedClosings,@JsonKey(name: 'total_expenses') double totalExpenses,@JsonKey(name: 'net_profit') double netProfit
});




}
/// @nodoc
class __$ReportSummaryCopyWithImpl<$Res>
    implements _$ReportSummaryCopyWith<$Res> {
  __$ReportSummaryCopyWithImpl(this._self, this._then);

  final _ReportSummary _self;
  final $Res Function(_ReportSummary) _then;

/// Create a copy of ReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? totalSales = null,Object? cashInHand = null,Object? draftClosings = null,Object? finalizedClosings = null,Object? totalExpenses = null,Object? netProfit = null,}) {
  return _then(_ReportSummary(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,cashInHand: null == cashInHand ? _self.cashInHand : cashInHand // ignore: cast_nullable_to_non_nullable
as double,draftClosings: null == draftClosings ? _self.draftClosings : draftClosings // ignore: cast_nullable_to_non_nullable
as int,finalizedClosings: null == finalizedClosings ? _self.finalizedClosings : finalizedClosings // ignore: cast_nullable_to_non_nullable
as int,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,netProfit: null == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
