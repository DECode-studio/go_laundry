import 'package:money_formatter/money_formatter.dart';

String moneyFormater(double amount) {
  MoneyFormatter formatMoney = MoneyFormatter(
    amount: amount,
    settings: MoneyFormatterSettings(
      symbol: 'Rp',
      thousandSeparator: '.',
      decimalSeparator: ',',
      symbolAndNumberSeparator: ' ',
      fractionDigits: 2,
      compactFormatType: CompactFormatType.short,
    ),
  );

  return formatMoney.output.symbolOnLeft;
}

String moneyFormater_2(double amount) {
  MoneyFormatter formatMoney = MoneyFormatter(
    amount: amount,
    settings: MoneyFormatterSettings(
      symbol: 'Rp',
      thousandSeparator: '.',
      decimalSeparator: ',',
      symbolAndNumberSeparator: ' ',
      fractionDigits: 0,
      compactFormatType: CompactFormatType.short,
    ),
  );

  return formatMoney.output.symbolOnLeft;
}
