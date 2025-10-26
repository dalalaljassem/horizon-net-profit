import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_styles.dart';
import 'sheet_handle.dart';

class ComparisonTypeSheet extends StatelessWidget {
  final String currentType;
  final Function(String) onTypeSelected;

  const ComparisonTypeSheet({
    super.key,
    required this.currentType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;

        return Container(
          padding: EdgeInsets.all(screenWidth * 0.06),
          decoration: const BoxDecoration(
            color: AppColors.sheetBackground,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppDimensions.radiusXLarge),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SheetHandle(),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.020),
                child: const Text(
                  'Set Comparison Type',
                  style: AppStyles.sheetTitle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.035),
                child: const Text(
                  'Choose how you want to compare your financial reports — by quarter or at year-end.',
                  style: AppStyles.bodyMedium,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                child: _buildOption(
                    context, 'Per Quarter', Icons.calendar_today, screenWidth),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                child: _buildOption(context, 'Per End of year',
                    Icons.calendar_month, screenWidth),
              ),
              Padding(padding: EdgeInsets.only(bottom: screenHeight * 0.05)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOption(
      BuildContext context, String type, IconData icon, double screenWidth) {
    return InkWell(
      onTap: () {
        onTypeSelected(type);
        Navigator.pop(context);
      },
      borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.iconGrey),
            SizedBox(width: screenWidth * 0.04),
            Flexible(
              child: Text(
                type,
                style: AppStyles.bodyLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YearDropdown extends StatelessWidget {
  final List<String> years;
  final String selectedYear;
  final ValueChanged<String> onYearSelected;

  const YearDropdown({
    super.key,
    required this.years,
    required this.selectedYear,
    required this.onYearSelected,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final double padding = screenWidth * 0.04;
        const double borderRadius = AppDimensions.radiusMedium;
        final double fontSize = AppStyles.bodyLarge.fontSize ?? 16;
        final double responsiveFontSize =
            fontSize * (screenWidth / 375).clamp(0.95, 1.10);

        return Container(
          padding: EdgeInsets.symmetric(
              horizontal: padding, vertical: padding * 0.7),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: const Color(0xFFE0E0E0), // subtle border
              width: 1,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedYear,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down,
                  color: AppColors.iconGrey),
              style: AppStyles.bodyLarge.copyWith(
                fontSize: responsiveFontSize,
                color: Colors.black,
              ),
              dropdownColor: const Color(0xFFF7F7F7),
              borderRadius: BorderRadius.circular(borderRadius),
              items: years.map((year) {
                return DropdownMenuItem<String>(
                  value: year,
                  child: Text(
                    year,
                    style: AppStyles.bodyLarge.copyWith(
                      fontSize: responsiveFontSize,
                      color: Colors.black,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  onYearSelected(value);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
