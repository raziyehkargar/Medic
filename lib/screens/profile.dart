import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/comon/appbar.dart';
import 'package:medic/comon/constant.dart';
import 'package:medic/data/app_data.dart';
import 'package:fl_chart/fl_chart.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final appData = AppData();
    List<DataItem> _chartData = appData.chartData;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //Appbar
            CustomAppbar(
              isProfileScreen: true,
            ),
            //Profile picture
            ClipRRect(
              borderRadius: BorderRadius.circular(75),
              child: Image.asset(
                appData.imageUrl,
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              appData.name,
              style: themeData.textTheme.headline3,
            ),
            Text(
              appData.place,
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Theme.of(context).colorScheme.tertiary,
                tabs: const [
                  Tab(
                    text: "STATS",
                  ),
                  Tab(
                    text: "ACHIEVEMENTS",
                  )
                ],
              ),
            ),
            // const SizedBox(height: 24),
            Expanded(
              // child: SizedBox(
              //   width: MediaQuery.of(context).size.width,
              child: TabBarView(controller: _tabController, children: [
                _ChartStats(
                  chartData: _chartData,
                  themeData: themeData,
                ),
                const Text('ACHIEVEMENTS TAb'),
              ]),
              //),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartStats extends StatelessWidget {
  _ChartStats({
    Key? key,
    required List<DataItem> chartData,
    required this.themeData,
  })  : _chartData = chartData,
        super(key: key);

  final List<DataItem> _chartData;
  final ThemeData themeData;
  final Map<int, String> weekDays = {
    0: "Mon",
    1: "Tus",
    2: "Wen",
    3: "Thr",
    4: "Fri",
    5: "Sun",
    6: "Sat",
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          Constant.defMargin + 10,
          Constant.defMargin / 2,
          Constant.defMargin + 10,
          Constant.defMargin / 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "This Week’s Stats",
                style: themeData.textTheme.caption!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Show All',
                  style: themeData.textTheme.caption!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Expanded(
            child: BarChart(
              BarChartData(
                barGroups: _chartData
                    .map((DataItem _dataItem) =>
                        BarChartGroupData(x: _dataItem.x, barRods: [
                          BarChartRodData(
                              toY: _dataItem.y1,
                              width: 15,
                              color: themeData.colorScheme.tertiary),
                          BarChartRodData(
                              toY: _dataItem.y2,
                              width: 15,
                              color: themeData.colorScheme.secondary
                                  .withOpacity(.5))
                        ]))
                    .toList(),
                titlesData: FlTitlesData(
                  //show: true,
                  rightTitles: AxisTitles(drawBehindEverything: false),
                  leftTitles: AxisTitles(
                      drawBehindEverything: true,
                      sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) => Text(
                                value.toInt().toString(),
                                style:
                                    GoogleFonts.karla(fontSize: 12, height: 1),
                              ))),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) => Text(
                        weekDays[value.toInt()]!,
                        style: GoogleFonts.karla(fontSize: 12, height: 2),
                      ),
                    ),
                  ),
                ),
                // groupsSpace: 199,
                gridData: FlGridData(show: true, drawVerticalLine: false),
                barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: themeData.colorScheme.surface)),
                alignment: BarChartAlignment.spaceEvenly,
                baselineY: 199.0,
                borderData: FlBorderData(show: false),
                minY: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Define data structure for a bar group
// class DataItem {
//   int x;
//   double y1;
//   double y2;

//   DataItem({required this.x, required this.y1, required this.y2});
// }
