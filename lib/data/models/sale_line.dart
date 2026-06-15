import 'package:freezed_annotation/freezed_annotation.dart';
import 'payment_channel.dart';

part 'sale_line.freezed.dart';
part 'sale_line.g.dart';

@freezed
abstract class SaleLine with _$SaleLine {
  const factory SaleLine({
    required int id,
    @JsonKey(name: 'payment_channel_id') required int paymentChannelId,
    @JsonKey(name: 'payment_channel') PaymentChannel? paymentChannel,
    required double amount,
  }) = _SaleLine;

  factory SaleLine.fromJson(Map<String, dynamic> json) => _$SaleLineFromJson(json);
}
