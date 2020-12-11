import 'package:flutter/material.dart';

WidgetBuilder buildFormInsertFileNameDialog(
  BuildContext context,
  VoidCallback onTapNext,
) {
  return (BuildContext context) => SimpleDialog(
        contentPadding: EdgeInsets.all(24),
        children: [
          TextField(
            // controller: rekeningController,
            // onChanged: onChangeAccountNumber,
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(),
              hintText: 'Insert file name here',
            ),
          ),
          SizedBox(height: 12),
          RaisedButton(
            child: Text('Next'),
            onPressed: onTapNext,
          ),
        ],
      );
}
