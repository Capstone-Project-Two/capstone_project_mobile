class CreatePaymentIntent {
  final String currency;
  final int amount;
  final int credits;

  CreatePaymentIntent({
    required this.currency,
    required this.amount,
    required this.credits,
  });

  String get getCurrency => currency;
  int get getAmount => amount;
  int get getCredits => credits;
}
