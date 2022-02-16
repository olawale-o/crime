import 'package:crime/pages/connection_page.dart';
import 'package:crime/pages/suggestion_page.dart';
import 'package:flutter/material.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Suggestions'),
  Tab(text: 'Connections'),
];

class NetworkScreen extends StatefulWidget {
  const NetworkScreen({Key? key}) : super(key: key);

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> with SingleTickerProviderStateMixin,
    AutomaticKeepAliveClientMixin<NetworkScreen> {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TabBar(
              controller: _tabController,
              tabs: tabs,
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [SuggestionPage(), ConnectionPage()],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
