class CreatePaymentIntent {
  final String currency;
  final int amount;

  CreatePaymentIntent({
    required this.currency,
    required this.amount,
  });

  String get getCurrency => currency;
  int get getAmount => amount;
}
