// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyBranding {

@JsonKey(name: 'primary_color') String? get primaryColor;@JsonKey(name: 'accent_color') String? get accentColor;@JsonKey(name: 'logo_url') String? get logoUrl;@JsonKey(name: 'splash_bg_color') String? get splashBgColor;
/// Create a copy of CompanyBranding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyBrandingCopyWith<CompanyBranding> get copyWith => _$CompanyBrandingCopyWithImpl<CompanyBranding>(this as CompanyBranding, _$identity);

  /// Serializes this CompanyBranding to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyBranding&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.accentColor, accentColor) || other.accentColor == accentColor)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.splashBgColor, splashBgColor) || other.splashBgColor == splashBgColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primaryColor,accentColor,logoUrl,splashBgColor);

@override
String toString() {
  return 'CompanyBranding(primaryColor: $primaryColor, accentColor: $accentColor, logoUrl: $logoUrl, splashBgColor: $splashBgColor)';
}


}

/// @nodoc
abstract mixin class $CompanyBrandingCopyWith<$Res>  {
  factory $CompanyBrandingCopyWith(CompanyBranding value, $Res Function(CompanyBranding) _then) = _$CompanyBrandingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'primary_color') String? primaryColor,@JsonKey(name: 'accent_color') String? accentColor,@JsonKey(name: 'logo_url') String? logoUrl,@JsonKey(name: 'splash_bg_color') String? splashBgColor
});




}
/// @nodoc
class _$CompanyBrandingCopyWithImpl<$Res>
    implements $CompanyBrandingCopyWith<$Res> {
  _$CompanyBrandingCopyWithImpl(this._self, this._then);

  final CompanyBranding _self;
  final $Res Function(CompanyBranding) _then;

/// Create a copy of CompanyBranding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primaryColor = freezed,Object? accentColor = freezed,Object? logoUrl = freezed,Object? splashBgColor = freezed,}) {
  return _then(_self.copyWith(
primaryColor: freezed == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as String?,accentColor: freezed == accentColor ? _self.accentColor : accentColor // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,splashBgColor: freezed == splashBgColor ? _self.splashBgColor : splashBgColor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanyBranding].
extension CompanyBrandingPatterns on CompanyBranding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyBranding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyBranding() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyBranding value)  $default,){
final _that = this;
switch (_that) {
case _CompanyBranding():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyBranding value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyBranding() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'primary_color')  String? primaryColor, @JsonKey(name: 'accent_color')  String? accentColor, @JsonKey(name: 'logo_url')  String? logoUrl, @JsonKey(name: 'splash_bg_color')  String? splashBgColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyBranding() when $default != null:
return $default(_that.primaryColor,_that.accentColor,_that.logoUrl,_that.splashBgColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'primary_color')  String? primaryColor, @JsonKey(name: 'accent_color')  String? accentColor, @JsonKey(name: 'logo_url')  String? logoUrl, @JsonKey(name: 'splash_bg_color')  String? splashBgColor)  $default,) {final _that = this;
switch (_that) {
case _CompanyBranding():
return $default(_that.primaryColor,_that.accentColor,_that.logoUrl,_that.splashBgColor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'primary_color')  String? primaryColor, @JsonKey(name: 'accent_color')  String? accentColor, @JsonKey(name: 'logo_url')  String? logoUrl, @JsonKey(name: 'splash_bg_color')  String? splashBgColor)?  $default,) {final _that = this;
switch (_that) {
case _CompanyBranding() when $default != null:
return $default(_that.primaryColor,_that.accentColor,_that.logoUrl,_that.splashBgColor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyBranding implements CompanyBranding {
  const _CompanyBranding({@JsonKey(name: 'primary_color') this.primaryColor, @JsonKey(name: 'accent_color') this.accentColor, @JsonKey(name: 'logo_url') this.logoUrl, @JsonKey(name: 'splash_bg_color') this.splashBgColor});
  factory _CompanyBranding.fromJson(Map<String, dynamic> json) => _$CompanyBrandingFromJson(json);

@override@JsonKey(name: 'primary_color') final  String? primaryColor;
@override@JsonKey(name: 'accent_color') final  String? accentColor;
@override@JsonKey(name: 'logo_url') final  String? logoUrl;
@override@JsonKey(name: 'splash_bg_color') final  String? splashBgColor;

/// Create a copy of CompanyBranding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyBrandingCopyWith<_CompanyBranding> get copyWith => __$CompanyBrandingCopyWithImpl<_CompanyBranding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyBrandingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyBranding&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.accentColor, accentColor) || other.accentColor == accentColor)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.splashBgColor, splashBgColor) || other.splashBgColor == splashBgColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primaryColor,accentColor,logoUrl,splashBgColor);

@override
String toString() {
  return 'CompanyBranding(primaryColor: $primaryColor, accentColor: $accentColor, logoUrl: $logoUrl, splashBgColor: $splashBgColor)';
}


}

/// @nodoc
abstract mixin class _$CompanyBrandingCopyWith<$Res> implements $CompanyBrandingCopyWith<$Res> {
  factory _$CompanyBrandingCopyWith(_CompanyBranding value, $Res Function(_CompanyBranding) _then) = __$CompanyBrandingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'primary_color') String? primaryColor,@JsonKey(name: 'accent_color') String? accentColor,@JsonKey(name: 'logo_url') String? logoUrl,@JsonKey(name: 'splash_bg_color') String? splashBgColor
});




}
/// @nodoc
class __$CompanyBrandingCopyWithImpl<$Res>
    implements _$CompanyBrandingCopyWith<$Res> {
  __$CompanyBrandingCopyWithImpl(this._self, this._then);

  final _CompanyBranding _self;
  final $Res Function(_CompanyBranding) _then;

/// Create a copy of CompanyBranding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primaryColor = freezed,Object? accentColor = freezed,Object? logoUrl = freezed,Object? splashBgColor = freezed,}) {
  return _then(_CompanyBranding(
primaryColor: freezed == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as String?,accentColor: freezed == accentColor ? _self.accentColor : accentColor // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,splashBgColor: freezed == splashBgColor ? _self.splashBgColor : splashBgColor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Company {

 int get id; String get name;@JsonKey(name: 'currency_symbol') String get currencySymbol; CompanyBranding get branding;
/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyCopyWith<Company> get copyWith => _$CompanyCopyWithImpl<Company>(this as Company, _$identity);

  /// Serializes this Company to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Company&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.currencySymbol, currencySymbol) || other.currencySymbol == currencySymbol)&&(identical(other.branding, branding) || other.branding == branding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,currencySymbol,branding);

@override
String toString() {
  return 'Company(id: $id, name: $name, currencySymbol: $currencySymbol, branding: $branding)';
}


}

/// @nodoc
abstract mixin class $CompanyCopyWith<$Res>  {
  factory $CompanyCopyWith(Company value, $Res Function(Company) _then) = _$CompanyCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'currency_symbol') String currencySymbol, CompanyBranding branding
});


$CompanyBrandingCopyWith<$Res> get branding;

}
/// @nodoc
class _$CompanyCopyWithImpl<$Res>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._self, this._then);

  final Company _self;
  final $Res Function(Company) _then;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? currencySymbol = null,Object? branding = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currencySymbol: null == currencySymbol ? _self.currencySymbol : currencySymbol // ignore: cast_nullable_to_non_nullable
as String,branding: null == branding ? _self.branding : branding // ignore: cast_nullable_to_non_nullable
as CompanyBranding,
  ));
}
/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyBrandingCopyWith<$Res> get branding {
  
  return $CompanyBrandingCopyWith<$Res>(_self.branding, (value) {
    return _then(_self.copyWith(branding: value));
  });
}
}


/// Adds pattern-matching-related methods to [Company].
extension CompanyPatterns on Company {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Company value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Company() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Company value)  $default,){
final _that = this;
switch (_that) {
case _Company():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Company value)?  $default,){
final _that = this;
switch (_that) {
case _Company() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'currency_symbol')  String currencySymbol,  CompanyBranding branding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Company() when $default != null:
return $default(_that.id,_that.name,_that.currencySymbol,_that.branding);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'currency_symbol')  String currencySymbol,  CompanyBranding branding)  $default,) {final _that = this;
switch (_that) {
case _Company():
return $default(_that.id,_that.name,_that.currencySymbol,_that.branding);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'currency_symbol')  String currencySymbol,  CompanyBranding branding)?  $default,) {final _that = this;
switch (_that) {
case _Company() when $default != null:
return $default(_that.id,_that.name,_that.currencySymbol,_that.branding);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Company implements Company {
  const _Company({required this.id, required this.name, @JsonKey(name: 'currency_symbol') required this.currencySymbol, this.branding = const CompanyBranding()});
  factory _Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'currency_symbol') final  String currencySymbol;
@override@JsonKey() final  CompanyBranding branding;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyCopyWith<_Company> get copyWith => __$CompanyCopyWithImpl<_Company>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Company&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.currencySymbol, currencySymbol) || other.currencySymbol == currencySymbol)&&(identical(other.branding, branding) || other.branding == branding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,currencySymbol,branding);

@override
String toString() {
  return 'Company(id: $id, name: $name, currencySymbol: $currencySymbol, branding: $branding)';
}


}

/// @nodoc
abstract mixin class _$CompanyCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$CompanyCopyWith(_Company value, $Res Function(_Company) _then) = __$CompanyCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'currency_symbol') String currencySymbol, CompanyBranding branding
});


@override $CompanyBrandingCopyWith<$Res> get branding;

}
/// @nodoc
class __$CompanyCopyWithImpl<$Res>
    implements _$CompanyCopyWith<$Res> {
  __$CompanyCopyWithImpl(this._self, this._then);

  final _Company _self;
  final $Res Function(_Company) _then;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? currencySymbol = null,Object? branding = null,}) {
  return _then(_Company(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currencySymbol: null == currencySymbol ? _self.currencySymbol : currencySymbol // ignore: cast_nullable_to_non_nullable
as String,branding: null == branding ? _self.branding : branding // ignore: cast_nullable_to_non_nullable
as CompanyBranding,
  ));
}

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyBrandingCopyWith<$Res> get branding {
  
  return $CompanyBrandingCopyWith<$Res>(_self.branding, (value) {
    return _then(_self.copyWith(branding: value));
  });
}
}

// dart format on
