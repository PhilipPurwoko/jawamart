import 'package:flutter/material.dart';

class AvailableSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Available Size', style: TextStyle(color: Colors.grey)),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: const <String>['S', 'M', 'L', 'XL']
                  .map(
                    (String size) => Container(
                      color: Theme.of(context).highlightColor,
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        size,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
