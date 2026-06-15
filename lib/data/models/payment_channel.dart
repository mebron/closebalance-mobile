import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_channel.freezed.dart';
part 'payment_channel.g.dart';

@freezed
abstract class PaymentChannel with _$PaymentChannel {
  const factory PaymentChannel({
    required int id,
    required String name,
    required String type, // cash | online | aggregator
  }) = _PaymentChannel;

  factory PaymentChannel.fromJson(Map<String, dynamic> json) =>
      _$PaymentChannelFromJson(json);
}
