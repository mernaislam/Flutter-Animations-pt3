import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({
    super.key,
    required this.progressBarAnimation,
    required this.sizeAnimation,
    required this.slideAnimation,
  });
  final Animation<double> progressBarAnimation;
  final Animation<double> sizeAnimation;
  final Animation<Offset> slideAnimation;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    widget.progressBarAnimation.addListener(_checkVisibility);
  }

  @override
  void dispose() {
    widget.progressBarAnimation.removeListener(_checkVisibility);
    super.dispose();
  }

  void _checkVisibility() {
    if (widget.progressBarAnimation.value >= 200 && _isVisible) {
      setState(() {
        _isVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: widget.slideAnimation,
        child: Visibility(
          visible: _isVisible,
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: widget.sizeAnimation,
                builder: (context, child) {
                  return Container(
                    height: 3,
                    width: widget.sizeAnimation.value,
                    color: Colors.grey,
                  );
                },
              ),
              AnimatedBuilder(
                animation: widget.progressBarAnimation,
                builder: (context, child) {
                  return Container(
                    height: 3,
                    width: widget.progressBarAnimation.value,
                    color: Colors.pink,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
