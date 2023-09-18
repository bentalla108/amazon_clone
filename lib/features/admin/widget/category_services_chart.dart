import 'package:amazon_clone/features/admin/models/sales.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CategoryProductsChart extends StatelessWidget {
  final List<Sales> seriesList;
  const CategoryProductsChart({
    Key? key,
    required this.seriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      series: seriesList,
    );
  }
}
