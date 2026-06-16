// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyBranding _$CompanyBrandingFromJson(Map<String, dynamic> json) =>
    _CompanyBranding(
      primaryColor: json['primary_color'] as String?,
      accentColor: json['accent_color'] as String?,
      logoUrl: json['logo_url'] as String?,
      splashBgColor: json['splash_bg_color'] as String?,
    );

Map<String, dynamic> _$CompanyBrandingToJson(_CompanyBranding instance) =>
    <String, dynamic>{
      'primary_color': instance.primaryColor,
      'accent_color': instance.accentColor,
      'logo_url': instance.logoUrl,
      'splash_bg_color': instance.splashBgColor,
    };

_Company _$CompanyFromJson(Map<String, dynamic> json) => _Company(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  currencySymbol: json['currency_symbol'] as String,
  branding: json['branding'] == null
      ? const CompanyBranding()
      : CompanyBranding.fromJson(json['branding'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CompanyToJson(_Company instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'currency_symbol': instance.currencySymbol,
  'branding': instance.branding.toJson(),
};
