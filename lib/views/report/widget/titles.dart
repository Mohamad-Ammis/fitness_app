import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  final Widget Function(double, TitleMeta)leftTitleWidgets;
  final double minY ;
  final double maxY ;
  final double minX ;
  final double maxX ;
  final List<FlSpot> flspot ;
  final double h ;
  final FlDotData fldot;
  final List<Color> grad ;
  final bool weight ;
  const LineChartSample2({super.key ,
   required this.leftTitleWidgets,
   required this.minY ,
   required this.maxY ,
   required this.flspot,
   required this.h ,
   required this.fldot,
   required this.grad,
   required this.minX,
   required this.maxX,
   required this.weight
   });

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 5),
      height: MediaQuery.of(context).size.height*0.3,
      width: MediaQuery.of(context).size.width,
      child: AspectRatio(
        aspectRatio: 1.70,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 18,
            left: 5,
            top: 10,
            bottom: 12,
          ),
          child: LineChart(
            mainData() ,
          ),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 13,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('1', style: style);
        break;
      case 2:
        text = const Text('2', style: style);
        break;
      case 3:
        text = const Text('3', style: style);
        break;
      case 4:
        text = const Text('4', style: style);
        break;
      case 5:
      text = const Text('5', style: style);
      break;
      case 6:
      text = const Text('6', style: style);
      break;
      case 7:
      text = const Text('7', style: style);
      break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

 
  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: widget.h,
        verticalInterval: 1,
        getDrawingVerticalLine:(value) {
          return  FlLine(
            color:widget.grad[0].withOpacity(0.3),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return  FlLine(
            color:widget.grad[1].withOpacity(0.2),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget:widget.leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color:  /* Constans.test.withOpacity(1) */Colors.black.withOpacity(0),width: 2),
      ),
      minX: widget.minX,
      maxX: widget.maxX,
      minY: widget.minY,
      maxY: widget.maxY,
      lineBarsData: [
        LineChartBarData(
          spots:widget.flspot,
          isCurved: true,
          gradient: LinearGradient(
            colors: widget.grad,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData:widget.fldot ,
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: widget.grad
                  .map((color) => color.withOpacity(widget.weight?0:0.5))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

}