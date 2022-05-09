import 'package:blindside/features/dashboard/presentation/widgets/custom_bottom_nav.dart';
import 'package:blindside/features/discover/presentation/pages/discover_page.dart';
import 'package:blindside/features/more/presentation/pages/more_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;
  Menu menu = Menu.discover;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    var _pages = [
      const DiscoverPage(),
      Container(),
      Container(),
      const MorePage(),
    ];
    const menuList = [
      Menu.discover,
      Menu.browse,
      Menu.saved,
      Menu.more,
    ];
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNav(
        selectedMenu: menu,
        onChanged: (index) {
          setState(() {
            _currentIndex = index;
            menu = menuList[index];
          });
        },
      ),
    );
  }
}
