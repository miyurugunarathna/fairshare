import 'package:flutter/material.dart';

class LifecycleProvider extends StatefulWidget {
  final Widget child;
  final Function(AppLifecycleState) onStateChange;

  const LifecycleProvider({super.key, required this.onStateChange, required this.child});

  @override
  State<LifecycleProvider> createState() => _SizeProviderState();
}

class _SizeProviderState extends State<LifecycleProvider> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    widget.onStateChange(state);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
