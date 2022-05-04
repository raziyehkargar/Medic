import 'package:flutter/material.dart';
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
              onTap: () {},
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
            const SizedBox(height: 12),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - defMargin,
                //height: MediaQuery.of(context).size.height / 4,
                child: Row(
                  children: [
                    Expanded(
                      child: TabBarView(controller: _tabController, children: [
                        BarChart(
                          BarChartData(
                            barGroups: _chartData
                                .map((DataItem _dataItem) =>
                                    BarChartGroupData(x: _dataItem.x, barRods: [
                                      BarChartRodData(
                                          toY: _dataItem.y1,
                                          width: 12,
                                          color:
                                              themeData.colorScheme.secondary),
                                      BarChartRodData(
                                          toY: _dataItem.y2,
                                          width: 12,
                                          color: themeData.colorScheme.secondary
                                              .withOpacity(.5))
                                    ]))
                                .toList(),
                            titlesData: FlTitlesData(
                                show: true,
                                topTitles: AxisTitles(
                                    axisNameWidget: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "This Week’s Stats",
                                      style: themeData.textTheme.caption,
                                    ),
                                  ],
                                ))),
                            groupsSpace: 150,
                            gridData: FlGridData(show: true),
                            barTouchData: BarTouchData(enabled: true),
                            rangeAnnotations: RangeAnnotations(),
                          ),
                        ),
                        const Text('ACHIEVEMENTS TAb'),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
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
