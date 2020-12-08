import 'package:flutter/material.dart';

class DataTransfer extends StatelessWidget {
  final params;

  const DataTransfer({Key key, this.params}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(params.toString());
  }
}
