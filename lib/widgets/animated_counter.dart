import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  final int initialValue;
  final int maxValue;
  final Duration animationDuration;
  final Color? primaryColor;

  const AnimatedCounter({
    Key? key,
    this.initialValue = 0,
    this.maxValue = 100,
    this.animationDuration = const Duration(milliseconds: 300),
    this.primaryColor,
  }) : super(key: key);

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with TickerProviderStateMixin {
  late int _currentValue;

  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  late AnimationController _colorController;
  late Animation<Color?> _colorAnimation;

  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;

    // --- Scale animation for number ---
    _scaleController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOut),
    );

    // --- Color animation when max is reached ---
    _colorController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _colorAnimation = ColorTween(
      begin: widget.primaryColor ?? Colors.blue,
      end: Colors.red,
    ).animate(_colorController);

    // --- Bounce animation for buttons ---
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _bounceAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _colorController.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  void _increment() {
    if (_currentValue < widget.maxValue) {
      setState(() => _currentValue++);
      _animateCounter();
    }
  }

  void _decrement() {
    if (_currentValue > 0) {
      setState(() => _currentValue--);
      _animateCounter();
    }
  }

  void _animateCounter() {
    _scaleController.forward(from: 0.0);
    _bounceController.forward(from: 0.0);

    if (_currentValue == widget.maxValue) {
      _colorController.forward();
    } else {
      _colorController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = _currentValue / widget.maxValue;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // --- Number with scale and color animation ---
        AnimatedBuilder(
          animation: _scaleController,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: AnimatedBuilder(
                animation: _colorController,
                builder: (context, _) {
                  return Text(
                    '$_currentValue',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: _colorAnimation.value,
                    ),
                  );
                },
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        // --- Progress Indicator ---
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: progress),
          duration: const Duration(milliseconds: 300),
          builder: (context, value, _) {
            return LinearProgressIndicator(
              value: value,
              backgroundColor: Colors.grey.shade300,
              color: widget.primaryColor ?? Colors.blue,
              minHeight: 8,
            );
          },
        ),
        const SizedBox(height: 16),
        // --- Buttons with bounce effect ---
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _decrement,
              child: ScaleTransition(
                scale: _bounceAnimation,
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(Icons.remove, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(width: 24),
            GestureDetector(
              onTap: _increment,
              child: ScaleTransition(
                scale: _bounceAnimation,
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(Icons.add, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
