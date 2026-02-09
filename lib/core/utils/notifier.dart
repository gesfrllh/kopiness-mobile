import 'package:flutter/material.dart';

class Notifier {
  static void show(
    BuildContext context,
    String message, {
    Color color = Colors.black,
  }) {
    final overlay = Overlay.of(context);
    if (overlay == null) return;

    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (_) => _TopToast(
        message: message,
        color: color,
        onClose: () => entry.remove(),
      ),
    );

    overlay.insert(entry);
  }

  static void success(BuildContext context, String msg) {
    show(context, msg, color: Colors.green);
  }

  static void error(BuildContext context, String msg) {
    show(context, msg, color: Colors.red);
  }
}

class _TopToast extends StatefulWidget {
  final String message;
  final Color color;
  final VoidCallback onClose;

  const _TopToast({
    required this.message,
    required this.color,
    required this.onClose,
  });

  @override
  State<_TopToast> createState() => _TopToastState();
}

class _TopToastState extends State<_TopToast>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _slide = Tween(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Future.delayed(const Duration(seconds: 2), () {
      _controller.reverse().then((_) => widget.onClose());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 12,
      left: 16,
      right: 16,
      child: SlideTransition(
        position: _slide,
        child: Material(
          color: widget.color,
          borderRadius: BorderRadius.circular(16),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: Text(
              widget.message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
