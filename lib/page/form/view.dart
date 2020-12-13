import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:print_to_pdf/global/components/template_page.dart';

class FormView extends StatelessWidget {
  final String fileName;
  final VoidCallback onTapCreate;
  final TextEditingController titleController;
  final TextEditingController contentController;
  final Function(String) onChangeTitle;
  final Function(String) onChangeContent;

  const FormView({
    Key key,
    this.fileName,
    this.onTapCreate,
    this.titleController,
    this.contentController,
    this.onChangeTitle,
    this.onChangeContent,
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
              _buildInputFieldTitle(),
              SizedBox(height: 12),
              _buildInputFieldContent(),
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

  _buildInputFieldContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Content'),
        SizedBox(height: 8),
        TextField(
          controller: contentController,
          onChanged: onChangeContent,
          decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(),
            hintText: 'Type some content here',
          ),
          maxLines: 10,
        )
      ],
    );
  }

  _buildInputFieldTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Title'),
        SizedBox(height: 8),
        TextField(
          controller: titleController,
          onChanged: onChangeTitle,
          decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(),
            hintText: 'Insert title here',
          ),
        )
      ],
    );
  }
}
