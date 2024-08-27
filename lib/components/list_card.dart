// import 'package:flutter/material.dart';

// class ListCard extends StatelessWidget {
//   final String text;
//   final IconData icon;
//   final Color cardColor;

//   ListCard({
//     required this.text,
//     required this.icon,
//     this.cardColor = const Color(0xFFf5f5f5), // Light grey color by default
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: cardColor,
//         borderRadius: BorderRadius.circular(15.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 4.0,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             text,
//             style: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//               color: Colors.black87,
//             ),
//           ),
//           Icon(
//             icon,
//             color: Colors.black54,
//             size: 24.0,
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// // Stateless widget for the custom card with animation
// class CustomCard extends StatefulWidget {
//   final String text;
//   final IconData icon;
//   final Color color;
//   final VoidCallback onTap;

//   CustomCard({
//     required this.text,
//     required this.icon,
//     this.color = const Color(0xFFf5f5f5), // Default color
//     required this.onTap,
//   });

//   @override
//   _CustomCardState createState() => _CustomCardState();
// }

// class _CustomCardState extends State<CustomCard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 200),
//       vsync: this,
//     );
//     _animation = Tween<double>(begin: 1.0, end: 0.95).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(
//       scale: _animation,
//       child: GestureDetector(
//         onTap: () {
//           _controller.forward().then((_) {
//             _controller.reverse();
//             widget.onTap();
//           });
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             color: widget.color,
//             borderRadius: BorderRadius.circular(15.0),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 4.0,
//                 offset: Offset(0, 4),
//               ),
//             ],
//           ),
//           margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 widget.text,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                 ),
//               ),
//               Icon(
//                 widget.icon,
//                 color: Colors.black45,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  CustomCard({
    required this.text,
    required this.icon,
    this.color = const Color(0xFFf5f5f5), // Default color
    required this.onTap,
  });

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTapDown: (_) {
          _controller.forward(); // Scale down when pressed
        },
        onTapUp: (_) {
          _controller.reverse().then((_) {
            widget.onTap(); // Call onTap callback after animation
          });
        },
        onTapCancel: () {
          _controller.reverse(); // Reset animation if tap is cancelled
        },
        child: Container(
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Icon(
                widget.icon,
                color: Colors.black38,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// import 'package:flutter/material.dart';

// class CustomCard extends StatefulWidget {
//   final String text;
//   final IconData icon;
//   final Color baseColor;
//   final Color pressedColor;
//   final VoidCallback onTap;

//   CustomCard({
//     required this.text,
//     required this.icon,
//     this.baseColor = Colors.white, // Default base color
//     this.pressedColor = Colors.grey, // Default pressed color
//     required this.onTap,
//   });

//   @override
//   _CustomCardState createState() => _CustomCardState();
// }

// class _CustomCardState extends State<CustomCard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Color?> _colorAnimation;
//   bool _isPressed = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _colorAnimation = ColorTween(
//       begin: widget.baseColor,
//       end: widget.pressedColor,
//     ).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (details) {
//         setState(() {
//           _isPressed = true;
//         });
//         _controller.forward();
//       },
//       onTapUp: (details) {
//         _controller.reverse().then((_) {
//           setState(() {
//             _isPressed = false;
//           });
//           widget.onTap();
//         });
//       },
//       onTapCancel: () {
//         _controller.reverse();
//         setState(() {
//           _isPressed = false;
//         });
//       },
//       child: AnimatedBuilder(
//         animation: _colorAnimation,
//         builder: (context, child) {
//           return Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   _colorAnimation.value ?? widget.baseColor,
//                   widget.baseColor,
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//             ),
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   widget.text,
//                   style: TextStyle(
//                     color: Colors
//                         .black, // Changed to black for contrast with white background
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Icon(
//                   widget.icon,
//                   color: Colors.black,
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
