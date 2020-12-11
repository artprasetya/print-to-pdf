import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:print_to_pdf/global/components/template_page.dart';

class FormView extends StatelessWidget {
  final String fileName;
  final VoidCallback onTapCreate;

  const FormView({
    Key key,
    this.fileName,
    this.onTapCreate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      title: fileName,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Title'),
              SizedBox(height: 8),
              TextField(
                // controller: rekeningController,
                // onChanged: onChangeAccountNumber,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                  hintText: 'Insert title here',
                ),
              ),
              SizedBox(height: 12),
              Text('Content'),
              SizedBox(height: 8),
              TextField(
                // controller: rekeningController,
                // onChanged: onChangeAccountNumber,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                  hintText: 'Type some content here',
                ),
                maxLines: 10,
              ),
            ],
          ),
        ),
      ),
      footer: RaisedButton(
        child: Text('Create PDF'),
        onPressed: onTapCreate,
      ),
    );
  }
}
