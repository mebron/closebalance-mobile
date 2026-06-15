import 'package:freezed_annotation/freezed_annotation.dart';

part 'deduction.freezed.dart';
part 'deduction.g.dart';

@freezed
abstract class Deduction with _$Deduction {
  const factory Deduction({
    required int id,
    required String type,
    String? description,
    required double amount,
    @JsonKey(name: 'payment_method') required String paymentMethod,
  }) = _Deduction;

  factory Deduction.fromJson(Map<String, dynamic> json) => _$DeductionFromJson(json);
}
