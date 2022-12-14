import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/models/transaction_model.dart';
import 'package:panther_central_ios_app/models/user_model.dart';
import 'package:panther_central_ios_app/screens/choose_payment_screen.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';
import 'package:tuple/tuple.dart';



class TransactionsGraph extends StatefulWidget {
  final List<Transaction> transactions;
  final UserViewModel user;

  const TransactionsGraph(this.user, this.transactions, {super.key});

  @override
  State<StatefulWidget> createState() {
    return TransactionsGraphState();
  }
}

class TransactionsGraphState extends State<TransactionsGraph> {
  final Color leftBarColor = Colors.green;
  final Color rightBarColor = Colors.red;
  final double width = 10;

  double maxY = 50;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  Map<String, Tuple2<double,double>> getMapping(UserViewModel user, List<Transaction> transactions) {
    Map<String, Tuple2<double, double>> mapping = {};
    Iterable<String> accounts = user.accounts.keys;
    for (String account in accounts){
      double added = 0.0;
      double spent = 0.0;
      for (Transaction transaction in transactions){
        if (account == transaction.account){
          String sign = transaction.amount.substring(0,1);
          double tAmount;
          if (sign == '-'){
            tAmount = double.parse(transaction.amount.substring(2));
            tAmount *= -1;
          } else {
            tAmount = double.parse(transaction.amount.substring(1));
          }
          // double tAmount = double.parse(transaction.amount.replaceAll(RegExp(r'[^\w\s]+$'), ''));
          if (tAmount < 0.0){
            spent -= tAmount;
          } else {
            added += tAmount;
          }
        }
      }
      Tuple2<double, double> values = Tuple2(added, spent);
      mapping[account] = values;
    }
    return mapping;
  }

  @override
  Widget build(BuildContext context) {

    final UserViewModel user = widget.user;
    final Map<String, Tuple2<double, double>> mapping = getMapping(user!, widget.transactions);

    for (Tuple2<double,double> t in mapping.values){
      if (t.item1 > maxY) {
        maxY = t.item1;
      }
      if(t.item2 > maxY) {
        maxY = t.item2;
      }
    }

    final pantherFunds = makeGroupData(0, mapping['Panther Funds']!.item1, mapping['Panther Funds']!.item2);
    final diningDollars = makeGroupData(1, mapping['Dining Dollars']!.item1, mapping['Dining Dollars']!.item2);
    final offCampusDiningDollars = makeGroupData(2, mapping['OC Dining Dollars']!.item1, mapping['OC Dining Dollars']!.item2);
    final addDiningDollars = makeGroupData(3, mapping['Add. Dining Dollars']!.item1, mapping['Add. Dining Dollars']!.item2);
    final bonusBucks = makeGroupData(4, mapping['Bonus Bucks']!.item1, mapping['Bonus Bucks']!.item2);

    final items = [
      pantherFunds,
      diningDollars,
      offCampusDiningDollars,
      addDiningDollars,
      bonusBucks,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;

    return AspectRatio(
      aspectRatio: 2,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 5, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: BarChart(
                  BarChartData(
                    maxY: maxY,
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.grey,
                        getTooltipItem: (a, b, c, d) => null,
                      ),
                      touchCallback: (FlTouchEvent event, response) {
                        if (response == null || response.spot == null) {
                          setState(() {
                            touchedGroupIndex = -1;
                            showingBarGroups = List.of(rawBarGroups);
                          });
                          return;
                        }

                        touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                        setState(() {
                          if (!event.isInterestedForInteractions) {
                            touchedGroupIndex = -1;
                            showingBarGroups = List.of(rawBarGroups);
                            return;
                          }
                          showingBarGroups = List.of(rawBarGroups);
                          if (touchedGroupIndex != -1) {
                            var sum = 0.0;
                            for (final rod
                            in showingBarGroups[touchedGroupIndex]
                                .barRods) {
                              sum += rod.toY;
                            }
                            final avg = sum /
                                showingBarGroups[touchedGroupIndex]
                                    .barRods
                                    .length;

                            showingBarGroups[touchedGroupIndex] =
                                showingBarGroups[touchedGroupIndex].copyWith(
                                  barRods: showingBarGroups[touchedGroupIndex]
                                      .barRods
                                      .map((rod) {
                                    return rod.copyWith(toY: avg);
                                  }).toList(),
                                );
                          }
                        });
                      },
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: bottomTitles,
                          reservedSize: 42,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 28,
                          interval: 1,
                          getTitlesWidget: leftTitles,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: showingBarGroups,
                    gridData: FlGridData(show: false),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: PC_BLUE,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;
    // Find intervals between 0 and maxY
    if (value == 0) {
      text = r'$0';
    } else if (value == 10) {
      text = r'$10';
    } else if (value == 20) {
      text = r'$20';
    } else if (value == 30) {
      text = r'$30';
    } else if (value == 40) {
      text = r'$40';
    } else if (value == 50) {
      text = r'$50';
    } else if (value == 60) {
      text = r'$60';
    } else if (value == 70) {
      text = r'$70';
    } else if (value == 80) {
      text = r'$80';
    } else if (value == 90) {
      text = r'$90';
    } else if (value == 100) {
      text = r'$100';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['PF', 'DD', 'OC', 'AD', 'BB', ];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: PC_BLUE,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: leftBarColor,
          width: width,
          borderRadius: BorderRadius.circular(0),
        ),
        BarChartRodData(
          toY: y2,
          color: rightBarColor,
          width: width,
          borderRadius: BorderRadius.circular(0),
        ),
      ],
    );
  }
}