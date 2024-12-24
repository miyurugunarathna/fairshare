import 'package:flutter/material.dart';
import 'package:fairshare/components/common/common.dart';

class ResponsiveList extends StatefulWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final int accountExtraSpace;
  const ResponsiveList(
      {super.key, required this.children, this.mainAxisAlignment = MainAxisAlignment.start, this.crossAxisAlignment = CrossAxisAlignment.center, this.accountExtraSpace = 0});

  @override
  State<ResponsiveList> createState() => _ResponsiveListState();
}

class _ResponsiveListState extends State<ResponsiveList> {
  bool enableScroll = true;

  @override
  Widget build(BuildContext context) {
    return SizeProvider(
      onChildSize: (size) {
        double apparentSize = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.bottom - MediaQuery.of(context).padding.top - widget.accountExtraSpace;
        if (Scaffold.of(context).appBarMaxHeight != null) {
          apparentSize -= Scaffold.of(context).appBarMaxHeight!;
        }
        if ((size.height >= apparentSize) != enableScroll) {
          setState(() => enableScroll = !enableScroll);
        }
      },
      child: !enableScroll
          ? Column(mainAxisAlignment: widget.mainAxisAlignment, crossAxisAlignment: widget.crossAxisAlignment, children: widget.children)
          : ListView(
              shrinkWrap: true,
              children: widget.children.where((element) => element.runtimeType != Spacer && element.runtimeType != Expanded && element.runtimeType != Flexible).toList(),
            ),
    );
  }
}
