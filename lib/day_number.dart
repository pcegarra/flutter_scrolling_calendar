import 'package:flutter/material.dart';
import 'package:scrolling_years_calendar/utils/screen_sizes.dart';

class DayNumber extends StatelessWidget {
  const DayNumber({
    @required this.day,
    this.isToday,
    this.todayColor = Colors.blue,
    this.isInHighlightedDates,
    this.highlightedDatesColor = Colors.red,
  });

  final int day;
  final bool isToday;
  final Color todayColor;
  final bool isInHighlightedDates;
  final Color highlightedDatesColor;

  @override
  Widget build(BuildContext context) {
    final double size = getDayNumberSize(context);

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: _getDecoration(size),
      child: Text(
        day < 1 ? '' : day.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isToday || isInHighlightedDates ? Colors.white : Colors.black87,
          fontSize: screenSize(context) == ScreenSizes.small ? 8.0 : 10.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Decoration _getDecoration(double size){
    if(isToday){
      return BoxDecoration(
        color: todayColor,
        borderRadius: BorderRadius.circular(size / 2),
      );
    };
    if(isInHighlightedDates){
      return BoxDecoration(
        color: highlightedDatesColor,
        borderRadius: BorderRadius.circular(size / 2),
      );
    }
    return null;
  }
}
