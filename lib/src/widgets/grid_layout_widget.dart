import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'dart:math';

class GridLayoutOrientation extends StatelessWidget {
  GridLayoutOrientation({Key key, this.title}) : super(key: key);

  final String title;

  Widget build(BuildContext context) {

    final num itemHeight = _heightOfItem(context);
    final int numberColumns = _numberOfGridColumns(context);

    return Container(
      color: _getRandomColor(),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              title,
              style: Theme.of(context).textTheme.title,
            ),
            backgroundColor: Theme.of(context).primaryColorDark,
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            actions: <Widget>[
              IconButton(
                icon: new Icon(
                  Icons.menu,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () {},
              ),
            ],
          ),
          // isLargeScreen ? _largeScreenGridView(context) : _smallScreenListView(context),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: numberColumns,
              childAspectRatio: MediaQuery.of(context).size.width / numberColumns / itemHeight
            ),
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                color: _getRandomColor(),
              );
            },
            childCount: 20,
            ),
          ),
        ],
      ),
    );
  }

  int _numberOfGridColumns(BuildContext context) {
    int numberOfColumns = 0;

    if (Device.get().isTablet) {
      if (MediaQuery.of(context).orientation == Orientation.portrait) {
        numberOfColumns = 2;
      } else {
        numberOfColumns = 3;
      }
    } else {
      if (MediaQuery.of(context).orientation == Orientation.portrait) {
        numberOfColumns = 1;
      } else {
        numberOfColumns = 2;
      }
    }
    return numberOfColumns;
  }
  
  num _heightOfItem(BuildContext context) {
    num itemHeight;

    if (Device.get().isTablet) {
      if (MediaQuery.of(context).orientation == Orientation.portrait) {
        itemHeight = (MediaQuery.of(context).size.height - 200.0) / 5;
      } else {
        itemHeight = (MediaQuery.of(context).size.height - 200.0) / 3;
      }
    } else {
      itemHeight = 150.0;
    }
    return itemHeight;
  }

  Color _getRandomColor() {
    final Random _random = Random();
    return Color.fromRGBO(_random.nextInt(256), _random.nextInt(256), _random.nextInt(256), _random.nextDouble());
  }
}