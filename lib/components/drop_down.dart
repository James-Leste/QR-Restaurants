import 'package:flutter/material.dart';

class DropListItem extends StatefulWidget {
  final String title;
  final String detail;
  final IconData icon;

  DropListItem({
    required this.title,
    required this.detail,
    this.icon = Icons.arrow_drop_down,
  });

  @override
  _DropListItemState createState() => _DropListItemState();
}

class _DropListItemState extends State<DropListItem>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  late Animation<double> _iconRotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _heightAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _iconRotationAnimation = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
              if (_isExpanded) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            });
          },
          child: Container(
            color: Colors.white,
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              title: Text(
                widget.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              trailing: RotationTransition(
                turns: _iconRotationAnimation,
                child: Icon(widget.icon),
              ),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return SizeTransition(
              sizeFactor: _heightAnimation,
              child: SizedBox.expand(
                //color: Colors.grey[200],

                child: Text(
                  widget.detail,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            );
          },
        ),
        Divider(), // Adds a divider between items
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
