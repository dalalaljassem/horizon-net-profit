import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';
import '../models/financial_metric.dart';
import '../widgets/filter_chip_widget.dart';
import '../widgets/metric_card.dart';
import '../widgets/comparison_type_sheet.dart';
import '../widgets/period_selection_sheet.dart';

class NetProfitPage extends StatefulWidget {
  const NetProfitPage({super.key});

  @override
  State<NetProfitPage> createState() => _NetProfitPageState();
}

class _NetProfitPageState extends State<NetProfitPage> {
  String comparisonType = 'Per Quarter';
  int selectedYear = 2024;
  String selectedQuarter = 'Q1';

  final List<FinancialMetric> _metrics = [
    FinancialMetric(
      title: 'Net Profit for shareholders',
      unit: 'KWD Million',
      lastYearValue: '321.0',
      currentYearValue: '342.1',
      percentageChange: '16.01%',
    ),
    FinancialMetric(
      title: 'Earnings per share',
      unit: 'Fils',
      lastYearValue: '321.0',
      currentYearValue: '342.1',
      percentageChange: '16.01%',
    ),
    FinancialMetric(
      title: 'Net Financing Income',
      unit: 'KWD Million',
      lastYearValue: '321.0',
      currentYearValue: '342.1',
      percentageChange: '16.01%',
    ),
    FinancialMetric(
      title: 'Net Operating Income',
      unit: 'KWD Million',
      lastYearValue: '321.0',
      currentYearValue: '342.1',
      percentageChange: '16.01%',
    ),
  ];

  void _showComparisonTypeSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ComparisonTypeSheet(
        currentType: comparisonType,
        onTypeSelected: (type) {
          setState(() {
            comparisonType = type;
          });
        },
      ),
    );
  }

  void _showPeriodSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => PeriodSelectionSheet(
        initialYear: selectedYear,
        initialQuarter: selectedQuarter,
        onApply: (year, quarter) {
          setState(() {
            selectedYear = year;
            selectedQuarter = quarter;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Net Profit', style: AppStyles.pageTitle),
              SizedBox(height: screenHeight * 0.02),
              _buildFilterChips(),
              SizedBox(height: screenHeight * 0.03),
              _buildMetricsList(screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return Wrap(
      spacing: MediaQuery.of(context).size.width * 0.02,
      runSpacing: MediaQuery.of(context).size.height * 0.01,
      children: [
        FilterChipWidget(
          label: comparisonType,
          onTap: _showComparisonTypeSheet,
          onRemove: _showComparisonTypeSheet,
        ),
        if (comparisonType == 'Per Quarter')
          FilterChipWidget(
            label: '$selectedQuarter, $selectedYear',
            onTap: _showPeriodSheet,
            onRemove: _showPeriodSheet,
          ),
      ],
    );
  }

  Widget _buildMetricsList(double screenHeight) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _metrics.length,
      separatorBuilder: (context, index) =>
          SizedBox(height: screenHeight * 0.02),
      itemBuilder: (context, index) {
        return MetricCard(metric: _metrics[index]);
      },
    );
  }
}
