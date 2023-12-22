import 'details.dart';

class PaypalAmountModale {
  String? total;
  String? currency;
  Details? details;

  PaypalAmountModale({this.total, this.currency, this.details});

  factory PaypalAmountModale.fromJson(Map<String, dynamic> json) {
    return PaypalAmountModale(
      total: json['total'] as String?,
      currency: json['currency'] as String?,
      details: json['details'] == null
          ? null
          : Details.fromJson(json['details'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'total': total,
        'currency': currency,
        'details': details?.toJson(),
      };
}
