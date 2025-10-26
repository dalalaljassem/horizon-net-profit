import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

class SheetHandle extends StatelessWidget {
  const SheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: AppDimensions.sheetHandleWidth,
        height: AppDimensions.sheetHandleHeight,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.02,
        ),
        decoration: BoxDecoration(
          color: AppColors.sheetHandle,
          borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        ),
      ),
    );
  }
}
