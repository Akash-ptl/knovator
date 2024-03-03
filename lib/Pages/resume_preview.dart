import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ResumePreview extends StatefulWidget {
  const ResumePreview({super.key});

  @override
  State<ResumePreview> createState() => _ResumePreviewState();
}

class _ResumePreviewState extends State<ResumePreview> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text('Resume Preview'),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
          ),
          body: Column(children: []));
    });
  }
}
