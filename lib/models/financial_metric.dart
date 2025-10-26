class FinancialMetric {
  final String title;
  final String unit;
  final String lastYearValue;
  final String currentYearValue;
  final String percentageChange;

  FinancialMetric({
    required this.title,
    required this.unit,
    required this.lastYearValue,
    required this.currentYearValue,
    required this.percentageChange,
  });
}
