import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabSlideChoose extends StatefulWidget {
  final ValueChanged<int> selection;
  final List<String> names;


  TabSlideChoose(this.names, this.selection);

  @override
  State<StatefulWidget> createState() {
    return _TabSlideChooseState();
  }
}

class _TabSlideChooseState extends State<TabSlideChoose> {
  var _selected = 0;
  List<Tab> rows = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0x8AE5E5E5),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: DefaultTabController(
        length: widget.names.length,
        child: TabBar(
          unselectedLabelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFFF8900)),
          tabs: _tabs(widget.names),
          onTap: (value) {
            setState(() {
              _selected = value;
              widget.selection(value);
            });
          },
        ),
      ),
    );
  }


  List<Tab> _tabs(List<String> names) {
    rows.clear();
    for (var tab = 0; tab < names.length; tab++) {
      rows.add(
        Tab(
            child: Container(
          padding: EdgeInsets.all(14.0),
          child: Text(
            names[tab],
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: _selected == tab ? Colors.white : Color(0x4D272727)),
          ),
        )),
      );
    }
    return rows;
  }
}

