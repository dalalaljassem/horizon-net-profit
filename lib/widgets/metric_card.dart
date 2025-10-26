import 'package:flutter/material.dart';
import '../models/financial_metric.dart';

class MetricCard extends StatelessWidget {
  final FinancialMetric metric;

  const MetricCard({
    super.key,
    required this.metric,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isSmallWidth = width < 300;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenWidth * 0.06),
            border: Border.all(
              color: const Color(0xFFF2F2F4),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      metric.title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.012),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              metric.unit,
                              style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF636366),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.025),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.030,
                                vertical: screenHeight * 0.002,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(
                                    0x1A007AFF), // #007AFF @ 10% opacity
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.05),
                                border: Border.all(
                                  color: const Color(
                                      0x4D177DFF), // #177DFF @ 30% opacity
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                metric.percentageChange,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.024,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      const Color(0xFF007BFF), // #007BFF solid
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Divider
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey[200],
              ),

              // Comparison Section
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: isSmallWidth
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Last Year
                          Padding(
                            padding:
                                EdgeInsets.only(bottom: screenHeight * 0.012),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Q4 (2024)',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    color: const Color(0xFF636366),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: screenHeight * 0.012),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      metric.lastYearValue,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontSize: screenWidth * 0.04,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Current Year
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Q4 (2025)',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: const Color(0xFF636366),
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: screenHeight * 0.012),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    metric.currentYearValue,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Last Year
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Q4 (2024)',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: const Color(0xFF636366),
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: screenHeight * 0.012),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    metric.lastYearValue,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Current Year
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Q4 (2025)',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: const Color(0xFF636366),
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: screenHeight * 0.012),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    metric.currentYearValue,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Example usage
class MetricCardExample extends StatelessWidget {
  const MetricCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    final metric = FinancialMetric(
      title: 'Net Profit for shareholders',
      unit: 'KWD Million',
      percentageChange: '+16.01%',
      lastYearValue: '321.0',
      currentYearValue: '342.1',
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          child: MetricCard(metric: metric),
        ),
      ),
    );
  }
}
