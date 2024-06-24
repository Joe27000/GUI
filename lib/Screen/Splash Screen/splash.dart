import 'package:flutter/material.dart';


import '../Instruction/How To Use.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _sizeAnimation = Tween<double>(begin: 50, end: 150).animate(_controller);
    _colorAnimation = ColorTween(begin: Color(0xFFDFCCF1), end: Color(0xFFF5D2D3))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Language Translate"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: CirclePainter(
                    _sizeAnimation.value,
                    _colorAnimation.value ?? Colors.indigo,
                  ),
                  size: const Size.square(200),
                );
              },
            ),
            SizedBox(height: 140),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HowToUse()),
                  );

                  print('Start');
                },
                child: Text(
                  'Start',
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF130F26)),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double _size;
  final Color _color;

  CirclePainter(this._size, this._color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), _size, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return (_size != oldDelegate._size || _color != oldDelegate._color);
  }
}