class Paymentmodel {
  String currency;
  int amount;
  Paymentmodel({
    required this.currency,
    required this.amount,
  });
  tojeson(String customer) {
    return {
      "amount": amount,
      "currency": currency,
      'customer': customer,
      "automatic_payment_methods[enabled]": true,
      "setup_future_usage": "off_session",
      "automatic_payment_methods[enabled]": true
    };
  }
}
