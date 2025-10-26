import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class FilterChipWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final VoidCallback? onRemove;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.onTap,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: MediaQuery.of(context).size.height * 0.012,
        ),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          border: Border.all(color: AppColors.chipBorder),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                label,
                style: AppStyles.chipText,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (onRemove != null) ...[
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              GestureDetector(
                onTap: onRemove,
                child: const Icon(
                  Icons.close,
                  size: 16,
                  color: AppColors.iconGrey,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
