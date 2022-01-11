class Currency {
  final String provider;
  final String base;
  final String date;
  final int time_last_updated;
  final Map rates;

  // Currency(
  //     this.provider, this.base, this.date, this.time_last_updated, this.rates);

  Currency(
      {required this.provider,
      required this.base,
      required this.date,
      required this.time_last_updated,
      required this.rates});

  // @override
  // String toString() {
  //   return 'Currency(provider: $provider, base: $base, date: $date, time_last_updated: $time_last_updated, rates: $rates)';
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'provider': provider,
  //     'base': base,
  //     'date': date,
  //     'time_last_updated': time_last_updated,
  //     'rates': rates,
  //   };
  // }

  // factory Currency.fromMap(Map<String, dynamic> map) {
  //   return Currency(
  //     map['provider'],
  //     map['base'],
  //     map['date'],
  //     map['time_last_updated'],
  //     Map.from(map['rates']),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Currency.fromJson(String source) =>
  //     Currency.fromMap(json.decode(source));
  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      provider: json['provider'],
      base: json['base'],
      date: json['date'],
      time_last_updated: json['time_last_updated'],
      rates: json['rates'],
    );
  }
}
