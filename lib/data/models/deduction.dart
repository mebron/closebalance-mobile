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
    @JsonKey(name: 'payment_channel_id') int? paymentChannelId,
    @JsonKey(name: 'paid_via') String? paidVia,
  }) = _Deduction;

  factory Deduction.fromJson(Map<String, dynamic> json) => _$DeductionFromJson(json);
}
