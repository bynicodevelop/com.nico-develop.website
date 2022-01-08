import 'package:flutter/material.dart';

class CollapseWidget extends StatefulWidget {
  final List<Map<String, dynamic>> data;

  const CollapseWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _CollapseWidgetState createState() => _CollapseWidgetState();
}

class _CollapseWidgetState extends State<CollapseWidget> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          widget.data[panelIndex]["expanded"] =
              !widget.data[panelIndex]["expanded"];
        });
      },
      children: widget.data
          .map(
            (item) => ExpansionPanel(
              headerBuilder: (context, isExpanded) => ListTile(
                title: Text(
                  item["title"],
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      item["content"],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              isExpanded: item["expanded"] ?? false,
            ),
          )
          .toList(),
    );
  }
}
