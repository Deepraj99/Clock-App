import 'package:clock_app/clockView.dart';
import 'package:clock_app/menu_info.dart';
import 'package:clock_app/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'data.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                .toList(),
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      'Clock',
                      style: TextStyle(
                          fontFamily: 'avenir',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 24),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedTime,
                          style: TextStyle(
                              fontFamily: 'avenir',
                              color: Colors.white,
                              fontSize: 64),
                        ),
                        Text(
                          formattedDate,
                          style: TextStyle(
                              fontFamily: 'avenir',
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Align(
                      alignment: Alignment.center,
                      child: ClockView(
                        size: MediaQuery.of(context).size.height / 4,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Timezone',
                          style: TextStyle(
                              fontFamily: 'avenir',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 24),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(Icons.language, color: Colors.white),
                            SizedBox(width: 16),
                            Text(
                              'UTC' + offsetSign + timezoneString,
                              style: TextStyle(
                                  fontFamily: 'avenir',
                                  color: Colors.white,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return FlatButton(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      color: currentMenuInfo.title == 'Clock' ? Colors.red : Colors.transparent,
      onPressed: () {
        var menuInfo = Provider.of<MenuInfo>(context);
        menuInfo.updateMenu(currentMenuInfo);
      },
      child: Column(
        children: [
          Image.asset(currentMenuInfo.imageSource, scale: 1.5),
          SizedBox(height: 16),
          Text(
            currentMenuInfo.title,
            style: TextStyle(
                fontFamily: 'avenir', color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
