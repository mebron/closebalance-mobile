import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
abstract class CompanyBranding with _$CompanyBranding {
  const factory CompanyBranding({
    @JsonKey(name: 'primary_color') String? primaryColor,
    @JsonKey(name: 'accent_color') String? accentColor,
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'splash_bg_color') String? splashBgColor,
  }) = _CompanyBranding;

  factory CompanyBranding.fromJson(Map<String, dynamic> json) =>
      _$CompanyBrandingFromJson(json);
}

@freezed
abstract class Company with _$Company {
  const factory Company({
    required int id,
    required String name,
    @JsonKey(name: 'currency_symbol') required String currencySymbol,
    @Default(CompanyBranding()) CompanyBranding branding,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
