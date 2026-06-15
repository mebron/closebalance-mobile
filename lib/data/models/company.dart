import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
abstract class Company with _$Company {
  const factory Company({
    required int id,
    required String name,
    @JsonKey(name: 'currency_symbol') required String currencySymbol,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}
