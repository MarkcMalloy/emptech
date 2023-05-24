import 'package:flutter/material.dart';

class DashboardTabBarItem {
  final IconData icon;
  final String name;

  DashboardTabBarItem({required this.icon, required this.name});
}

class DashboardTabBar extends StatefulWidget {
  final List<DashboardTabBarItem> items;
  final int initialIndex;
  final Function(int index) onTabChanged;

  const DashboardTabBar({
    Key? key,
    required this.items,
    required this.initialIndex,
    required this.onTabChanged,
  }) : super(key: key);

  @override
  _DashboardTabBarState createState() => _DashboardTabBarState();
}

class _DashboardTabBarState extends State<DashboardTabBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: widget.items.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = index;
              widget.onTabChanged(index);
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            margin: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: _selectedIndex == index
                  ? Colors.grey.withOpacity(0.2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  widget.items[index].icon,
                  color: _selectedIndex == index
                      ? Colors.black
                      : Colors.black.withOpacity(0.5),
                ),
                SizedBox(width: 16),
                AnimatedDefaultTextStyle(
                  style: TextStyle(
                    color: _selectedIndex == index
                        ? Colors.black
                        : Colors.black.withOpacity(0.5),
                    fontWeight:
                    _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                    fontSize: _selectedIndex == index ? 20 : 16,
                  ),
                  duration: Duration(milliseconds: 200),
                  child: Text(widget.items[index].name),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
