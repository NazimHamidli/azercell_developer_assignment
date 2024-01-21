class DebitCard {
  final String cardNumber;
  final String expDate;
  final double balance;

  DebitCard(
      {required this.cardNumber, this.balance = 10.0, this.expDate = '01/27'});

  DebitCard copyWith({
    String? cardNumber,
    String? expDate,
    double? balance,
  }) {
    return DebitCard(
      cardNumber: cardNumber ?? this.cardNumber,
      expDate: expDate ?? this.expDate,
      balance: balance ?? this.balance,
    );
  }
}
