import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:project_management_layout_app/shared/color_styles.dart';

import 'dashboard_controller.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key key, this.title = "Dashboard"}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends ModularState<DashboardPage, DashboardController> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle textStyleScroll = TextStyle(
      color: ColorApp.cadet_blue,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: _appBar(textTheme),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create additional pages',
                  style: textTheme.headline6,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '03 days | Dec 18, 2019',
                  style: textTheme.button.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    overlapped(),
                    _chart(),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                ),
                color: ColorApp.selago,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Data',
                            style: textStyleScroll,
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          SizedBox(
                            width: 20,
                            child: CustomPaint(
                              foregroundPainter: Headerline(),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Tasks',
                            style: textStyleScroll,
                          ),
                          SizedBox(
                            width: 110,
                          ),
                          Row(
                            children: [
                              Text(
                                'Show in days',
                                style: textStyleScroll,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: ColorApp.cadet_blue,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: data.keys
                            .map((e) => ListView.builder(
                                  padding: EdgeInsets.only(bottom: 20),
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (_, index) => CardList(
                                    showDate: index == 0,
                                    date: e,
                                  ),
                                  itemCount: data[e].length,
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget overlapped() {
    final overlap = 50.0;
    final items = [
      Container(
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ]),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset('assets/images/circle-cropped.png'),
            radius: 27,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ]),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset('assets/images/circle-cropped1.png'),
            radius: 27,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ]),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset('assets/images/circle-cropped2.png'),
            radius: 27,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400],
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.add_outlined,
              color: ColorApp.martinique,
            ),
            radius: 27,
          ),
        ),
      ),
    ];

    List<Widget> stackLayers = List<Widget>.generate(items.length, (index) {
      return Padding(
        padding: EdgeInsets.fromLTRB(index.toDouble() * overlap, 0, 0, 0),
        child: items[index],
      );
    });

    return Stack(children: stackLayers);
  }

  Widget _appBar(TextTheme textTheme) => AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: ColorApp.martinique,
        ),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'OMP Dashboard',
            style: textTheme.headline4,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 30, bottom: 8),
            child: Container(
              width: 120,
              decoration: BoxDecoration(color: ColorApp.burnt_sienna, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'In Progress',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  Widget _chart() => Container(
        height: 50,
        width: 50,
        child: CustomPaint(
          foregroundPainter: RadialPainter(
            bgColor: ColorApp.burnt_sienna.withOpacity(0.3),
            lineColor: ColorApp.burnt_sienna,
            width: 5.0,
          ),
          child: Center(
            child: Text(
              '85%',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: ColorApp.burnt_sienna,
              ),
            ),
          ),
        ),
      );
}

class CardList extends StatelessWidget {
  final bool showDate;
  final String date;

  const CardList({
    Key key,
    this.showDate,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        padding: EdgeInsets.zero,
        child: showDate ? Text(date) : Container(),
        width: 46,
      ),
      Container(
        width: 16,
        height: 120,
        child: CustomPaint(
          foregroundPainter: Timeline(
            timelineType: showDate ? TimelineType.inProgress : TimelineType.review,
          ),
        ),
      ),
      SizedBox(
        width: 16,
      ),
      Expanded(
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            height: 120,
          ),
        ),
      ),
    ]);
  }
}

class RadialPainter extends CustomPainter {
  final Color bgColor;
  final Color lineColor;
  final double width;

  RadialPainter({this.bgColor, this.lineColor, this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgLine = new Paint()
      ..color = bgColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Paint completedLine = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, bgLine);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -1.7, 4.7, false, completedLine);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Timeline extends CustomPainter {
  final TimelineType timelineType;
  double dashHeight = 5;
  double dashSpace = 3;
  double startY = -15;

  Timeline({
    this.timelineType,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgLineProgress = new Paint()
      ..color = ColorApp.blue_haze
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Paint bgLineDone = new Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    Paint bgLineReview = new Paint()
      ..color = ColorApp.blue_haze
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Paint bgCircleOut = new Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;
    var color;
    switch (timelineType) {
      case TimelineType.done:
        color = ColorApp.indigo;
        break;
      case TimelineType.inProgress:
        color = ColorApp.burnt_sienna;
        break;
      default:
        color = ColorApp.blue_haze;
    }

    Paint bgCircleIn = new Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    while (startY < size.height + 15) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), bgLineProgress);
      startY += dashHeight + dashSpace;
    }

    if (timelineType == TimelineType.inProgress) {
      canvas.drawLine(
        Offset(0, size.height / 2),
        Offset(0, size.height + 15),
        bgLineDone,
      );
    }
    if (timelineType == TimelineType.done) {
      canvas.drawLine(
        Offset(0, size.height / 2),
        Offset(0, -15),
        bgLineDone,
      );
    }
    if (timelineType == TimelineType.review) {
      canvas.drawLine(
        Offset(0, size.height / 2),
        Offset(0, -15),
        bgLineReview,
      );
    }

    canvas.drawCircle(Offset(0, size.height / 2), 10, bgCircleOut);
    canvas.drawCircle(Offset(0, size.height / 2), 8, bgCircleIn);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Headerline extends CustomPainter {
  double dashHeight = 5;
  double dashSpace = 3;
  double startY = -15;

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgLineProgress = new Paint()
      ..color = ColorApp.blue_haze
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    while (startY < size.height + 10) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), bgLineProgress);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

enum TimelineType { inProgress, done, review }

var data = {
  '19.10': [
    TaskModel(
      status: 'progress',
      title: 'contact page',
      id: 10,
      label: 'Design',
      comments: 3,
      attachments: 2,
    ),
    TaskModel(
      status: 'progress',
      title: 'contact page',
      id: 10,
      label: 'Design',
      comments: 3,
      attachments: 2,
    )
  ],
  '24.12': [
    TaskModel(
      status: 'progress',
      title: 'contact page',
      id: 10,
      label: 'Design',
      comments: 3,
      attachments: 2,
    ),
    TaskModel(
      status: 'progress',
      title: 'contact page',
      id: 10,
      label: 'Design',
      comments: 3,
      attachments: 2,
    )
  ],
  '01.01': [
    TaskModel(
      status: 'progress',
      title: 'contact page',
      id: 10,
      label: 'Design',
      comments: 3,
      attachments: 2,
    ),
  ],
};

class TaskModel {
  String status;
  String title;
  int id;
  String label;
  int comments;
  int attachments;

  TaskModel({
    this.status,
    this.title,
    this.id,
    this.label,
    this.comments,
    this.attachments,
  });
}
