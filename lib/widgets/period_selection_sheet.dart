import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_styles.dart';
import 'sheet_handle.dart';

class PeriodSelectionSheet extends StatefulWidget {
  final int initialYear;
  final String initialQuarter;
  final Function(int year, String quarter) onApply;

  const PeriodSelectionSheet({
    super.key,
    required this.initialYear,
    required this.initialQuarter,
    required this.onApply,
  });

  @override
  State<PeriodSelectionSheet> createState() => _PeriodSelectionSheetState();
}

class _PeriodSelectionSheetState extends State<PeriodSelectionSheet> {
  late int selectedYear;
  late String selectedQuarter;

  @override
  void initState() {
    super.initState();
    selectedYear = widget.initialYear;
    selectedQuarter = widget.initialQuarter;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxWidth = constraints.maxWidth;
      final maxHeight = constraints.maxHeight;

      double scaleFont(double size) => size * (maxWidth / 375);
      double verticalPadding(double factor) => maxHeight * factor;
      double horizontalPadding(double factor) => maxWidth * factor;

      return Container(
        padding: EdgeInsets.all(horizontalPadding(0.06)),
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
              padding: EdgeInsets.only(top: verticalPadding(0.01)),
              child: Text(
                'Select Period',
                style: AppStyles.sheetTitle.copyWith(fontSize: scaleFont(20)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: verticalPadding(0.008), right: horizontalPadding(0.02)),
              child: Text(
                'Choose which year and quarter you want to view or compare financial reports for.',
                style: AppStyles.bodyMedium.copyWith(fontSize: scaleFont(14)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: verticalPadding(0.025)),
              child: Text(
                'Year',
                style: AppStyles.bodyLarge.copyWith(fontSize: scaleFont(16)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: verticalPadding(0.012)),
              child: _buildYearDropdown(maxWidth),
            ),
            Padding(
              padding: EdgeInsets.only(top: verticalPadding(0.025)),
              child: Text(
                'Quarter',
                style: AppStyles.bodyLarge.copyWith(fontSize: scaleFont(16)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: verticalPadding(0.012)),
              child: _buildQuarterSelector(maxWidth, maxHeight),
            ),
            Padding(
              padding: EdgeInsets.only(top: verticalPadding(0.035)),
              child: _buildApplyButton(context, maxWidth, maxHeight),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildYearDropdown(double maxWidth) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.04),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      child: DropdownButton<int>(
        value: selectedYear,
        isExpanded: true,
        underline: const SizedBox(),
        items: [2024, 2023, 2022, 2021, 2020]
            .map((year) => DropdownMenuItem(
                  value: year,
                  child: Text(year.toString(), style: AppStyles.bodyLarge),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedYear = value!;
          });
        },
      ),
    );
  }

  Widget _buildQuarterSelector(double maxWidth, double maxHeight) {
    final quarters = ['Q1', 'Q2', 'Q3', 'Q4'];
    final spacing = maxWidth * 0.03;
    double fontSize = maxWidth / 375 * 16;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: quarters.map((q) {
        final isSelected = selectedQuarter == q;
        return Flexible(
          child: Padding(
            padding: EdgeInsets.only(
              right: q != quarters.last ? spacing : 0,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedQuarter = q;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: maxHeight * 0.018),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.buttonPrimary
                      : AppColors.buttonSecondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                      q,
                      style: AppStyles.bodyLarge.copyWith(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600,
                        color:
                            isSelected ? Colors.white : AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildApplyButton(
      BuildContext context, double maxWidth, double maxHeight) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              widget.onApply(selectedYear, selectedQuarter);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonPrimary,
              padding: EdgeInsets.symmetric(vertical: maxHeight * 0.02),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              ),
            ),
            child: const Text('Apply Changes', style: AppStyles.buttonText),
          ),
        ),
      ],
    );
  }
}
