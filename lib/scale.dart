import 'package:flutter/material.dart';

enum BtnDone { done, cancle }
BtnDone isBtnDone = BtnDone.cancle;

class Scale extends StatefulWidget {
  const Scale({Key? key}) : super(key: key);

  @override
  _ScaleState createState() => _ScaleState();
}

class _ScaleState extends State<Scale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scale Image'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isBtnDone = BtnDone.done;
              });
            },
            icon: const Icon(Icons.done),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(60),
        child: ResizebleWidget(
          // child: Text(
          //   '''I've just did simple prototype to show main idea.
          //   1. Draw size handlers with container
          //   2. Use GestureDetector to get new variables of sizes
          //   3. Refresh the main container size.''',
          // ),
          child: Image.asset('assets/images/ttd.png'),
        ),
      ),
    );
  }
}

class ResizebleWidget extends StatefulWidget {
  final Widget? child;

  const ResizebleWidget({Key? key, this.child}) : super(key: key);

  @override
  _ResizebleWidgetState createState() => _ResizebleWidgetState();
}

const ballDiameter = 30.0;

class _ResizebleWidgetState extends State<ResizebleWidget> {
  double height = 50;
  double width = 100;

  double top = 0;
  double left = 0;

  // void onDrag(double dx, double dy) {
  //   var newHeight = height + dy;
  //   var newWidth = width + dx;

  //   setState(() {
  //     height = newHeight > 0 ? newHeight : 0;
  //     width = newWidth > 0 ? newWidth : 0;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isBtnDone = BtnDone.cancle;
              });
            },
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                border: isBtnDone == BtnDone.cancle
                    ? Border.all(color: Colors.black)
                    : null,
              ),
              child: widget.child,
            ),
          ),
        ),
        // center center
        if (isBtnDone == BtnDone.cancle)
          Positioned(
            top: top + height / 2 - height / 2,
            left: left + width / 2 - width / 2,
            child: ManipulatingBall(
              onDrag: (dx, dy) {
                setState(() {
                  top = top + dy;
                  left = left + dx;
                });
              },
              dragWidget: Container(
                height: height,
                width: width,
                color: Colors.transparent,
              ),
            ),
          ),
        // top left
        // Positioned(
        //   top: top - ballDiameter / 2,
        //   left: left - ballDiameter / 2,
        //   child: ManipulatingBall(
        //     onDrag: (dx, dy) {
        //       var mid = (dx + dy) / 2;
        //       var newHeight = height - 2 * mid;
        //       var newWidth = width - 2 * mid;

        //       setState(() {
        //         height = newHeight > 0 ? newHeight : 0;
        //         width = newWidth > 0 ? newWidth : 0;
        //         top = top + mid;
        //         left = left + mid;
        //       });
        //     },
        //   ),
        // ),
        // top middle
        // Positioned(
        //   top: top - ballDiameter / 2,
        //   left: left + width / 2 - ballDiameter / 2,
        //   child: ManipulatingBall(
        //     onDrag: (dx, dy) {
        //       var newHeight = height - dy;

        //       setState(() {
        //         height = newHeight > 0 ? newHeight : 0;
        //         top = top + dy;
        //       });
        //     },
        //   ),
        // ),
        // top right
        // Positioned(
        //   top: top - ballDiameter / 2,
        //   left: left + width - ballDiameter / 2,
        //   child: ManipulatingBall(
        //     onDrag: (dx, dy) {
        //       var mid = (dx + (dy * -1)) / 2;

        //       var newHeight = height + 2 * mid;
        //       var newWidth = width + 2 * mid;

        //       setState(() {
        //         height = newHeight > 0 ? newHeight : 0;
        //         width = newWidth > 0 ? newWidth : 0;
        //         top = top - mid;
        //         left = left - mid;
        //       });
        //     },
        //   ),
        // ),
        // center right
        // Positioned(
        //   top: top + height / 2 - ballDiameter / 2,
        //   left: left + width - ballDiameter / 2,
        //   child: ManipulatingBall(
        //     onDrag: (dx, dy) {
        //       var newWidth = width + dx;

        //       setState(() {
        //         width = newWidth > 0 ? newWidth : 0;
        //       });
        //     },
        //   ),
        // ),
        // bottom right
        if (isBtnDone == BtnDone.cancle)
          Positioned(
            top: top + height - ballDiameter / 2,
            left: left + width - ballDiameter / 2,
            child: ManipulatingBall(
              onDrag: (dx, dy) {
                var mid = (dx + dy) / 2;

                var newHeight = height + 2 * mid;
                var newWidth = width + 2 * mid;

                setState(() {
                  height = newHeight > 0 ? newHeight : 0;
                  width = newWidth > 0 ? newWidth : 0;
                  top = top - mid;
                  left = left - mid;
                });
              },
            ),
          ),
        // bottom center
        // Positioned(
        //   top: top + height - ballDiameter / 2,
        //   left: left + width / 2 - ballDiameter / 2,
        //   child: ManipulatingBall(
        //     onDrag: (dx, dy) {
        //       var newHeight = height + dy;

        //       setState(() {
        //         height = newHeight > 0 ? newHeight : 0;
        //       });
        //     },
        //   ),
        // ),
        // bottom left
        // Positioned(
        //   top: top + height - ballDiameter / 2,
        //   left: left - ballDiameter / 2,
        //   child: ManipulatingBall(
        //     onDrag: (dx, dy) {
        //       var mid = ((dx * -1) + dy) / 2;

        //       var newHeight = height + 2 * mid;
        //       var newWidth = width + 2 * mid;

        //       setState(() {
        //         height = newHeight > 0 ? newHeight : 0;
        //         width = newWidth > 0 ? newWidth : 0;
        //         top = top - mid;
        //         left = left - mid;
        //       });
        //     },
        //   ),
        // ),
        //left center
        // Positioned(
        //   top: top + height / 2 - ballDiameter / 2,
        //   left: left - ballDiameter / 2,
        //   child: ManipulatingBall(
        //     onDrag: (dx, dy) {
        //       var newWidth = width - dx;

        //       setState(() {
        //         width = newWidth > 0 ? newWidth : 0;
        //         left = left + dx;
        //       });
        //     },
        //   ),
        // ),
      ],
    );
  }
}

class ManipulatingBall extends StatefulWidget {
  final Function? onDrag;
  final Widget? dragWidget;

  const ManipulatingBall({Key? key, this.onDrag, this.dragWidget})
      : super(key: key);

  @override
  _ManipulatingBallState createState() => _ManipulatingBallState();
}

class _ManipulatingBallState extends State<ManipulatingBall> {
  double? initX;
  double? initY;

  _handleDrag(details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  _handleUpdate(details) {
    var dx = details.globalPosition.dx - initX;
    var dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    widget.onDrag!(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: (widget.dragWidget == null)
          ? Container(
              width: ballDiameter,
              height: ballDiameter,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            )
          : widget.dragWidget,
    );
  }
}
