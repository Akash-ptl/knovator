import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:knovator/globalVariable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'create.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // clearAllData();
    loadData();
  }

  Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  void loadData() async {
    await getResumeListFromStorage();
    // print('LENGTH :: ${resumeList?.length??0}');
    // if (resumeList != null) {
    //   getResumeList.assignAll(resumeList);
    // }
  }

// Call this function wherever you want to load data from SharedPreferences
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Obx(() {
      return Scaffold(
        backgroundColor: const Color(0xfff2f2f2),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Resume Builder'),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(screenSize.width * 0.02),
          itemCount: getResumeList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: screenSize.height * 0.1,
              width: screenSize.width * 0.06,
              margin: EdgeInsets.only(bottom: screenSize.height * 0.02),
              decoration: BoxDecoration(
                  color: const Color(0xffccebc9),
                  borderRadius: BorderRadius.circular(screenSize.width * 0.02)),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
                child: Row(
                  children: [
                    Text(
                      getResumeList[index].firstName.text,
                      style: const TextStyle(fontSize: 25),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          nextPage(
                              context,
                              CreatePage(
                                isEdit: true,
                                data: getResumeList[index],
                              ));
                        },
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext ctx) {
                                return AlertDialog(
                                  title: const Text('Please Confirm'),
                                  content: const Text(
                                      'Are you sure you want to delete this resume?'),
                                  actions: [
                                    // The "Yes" button
                                    TextButton(
                                        onPressed: () async {
                                          getResumeList.removeAt(index);
                                          await saveResumeList(getResumeList);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Yes')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('No'))
                                  ],
                                );
                              });
                        },
                        icon: const Icon(Icons.delete))
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            nextPage(
                context,
                CreatePage(
                  isEdit: false,
                ));
          },
          tooltip: 'Add',
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
