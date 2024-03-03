import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:knovator/Pages/resume_preview.dart';
import 'package:knovator/Widgets/my_textfield.dart';
import 'package:knovator/util/colors.dart';
import 'package:knovator/util/constants.dart';

import '../globalVariable.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Obx(() {
      return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Create Resume'),
          actions: [
            IconButton(
                onPressed: () async {
                  nextPage(context, const PdfPreviewPage());
                },
                icon: const Icon(Icons.save))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.03),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                MyTextFiled(controller: firstName, hint: 'First Name'),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                MyTextFiled(controller: lastName, hint: 'Last Name'),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                MyTextFiled(controller: designation, hint: 'Main Title'),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                MyTextFiled(controller: bio, hint: 'Bio'),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                MyTextFiled(controller: mobileNumber, hint: 'Mobile Number'),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                MyTextFiled(controller: email, hint: 'Email'),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                MyTextFiled(controller: linkedIn, hint: 'LinkedIn'),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                MyTextFiled(controller: github, hint: 'GitHub'),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                MyTextFiled(controller: address, hint: 'Address'),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Skills'),
                    Spacer(),
                    const Text('Add'),
                    IconButton(
                        onPressed: () {
                          skills.add(TextEditingController());
                        },
                        icon: const Icon(Icons.add))
                  ],
                ),
                // Si
                ReorderableListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: skills.length,
                  shrinkWrap: true,
                  onReorder: (oldIndex, newIndex) {
                    if (oldIndex < newIndex) {
                      newIndex -=
                          1; // Compensate for the item being removed from the list
                    }
                    final TextEditingController item =
                        skills.removeAt(oldIndex);
                    skills.insert(newIndex, item);
                  },
                  itemBuilder: (context, index) {
                    return Row(
                      key: Key('$index'),
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: screenSize.height * 0.007),
                          child: Icon(
                            Icons.drag_indicator,
                            size: 35,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: screenSize.height * 0.02),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: TextFormField(
                                  controller: skills[index],
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    fillColor: colorTextField,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 2, // Border width
                                        color: Color(
                                            0xffccebc9), // Focus border color
                                      ),
                                      borderRadius: constants.borderRadius,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 12.0),
                                    filled: true,

                                    prefixIconConstraints: BoxConstraints(
                                        minWidth: 0, minHeight: 0),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          skills.removeAt(index);
                                        },
                                        icon: Icon(
                                          Icons.delete_outline,
                                          color: Colors.red,
                                        )),
                                    enabledBorder: InputBorder.none,
                                    errorStyle: TextStyle(color: Colors.red),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 0, color: Colors.transparent),
                                      borderRadius: constants.borderRadius,
                                    ),

                                    // labelText: hint,
                                    // labelStyle: textStyle.subHeading.copyWith(color: colorDark,fontSize: 20.sp),
                                  ),
                                  onSaved: (v) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  onFieldSubmitted: (v) {
                                    FocusScope.of(context).unfocus();
                                  },
                                ),
                              )),
                        ),
                      ],
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Languages'),
                    Spacer(),
                    const Text('Add'),
                    IconButton(
                        onPressed: () {
                          languages.add(TextEditingController());
                        },
                        icon: const Icon(Icons.add))
                  ],
                ),
                ReorderableListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: languages.length,
                  shrinkWrap: true,
                  onReorder: (oldIndex, newIndex) {
                    if (oldIndex < newIndex) {
                      newIndex -=
                          1; // Compensate for the item being removed from the list
                    }
                    final TextEditingController item =
                        languages.removeAt(oldIndex);
                    languages.insert(newIndex, item);
                  },
                  itemBuilder: (context, index) {
                    return Row(
                      key: Key('$index'),
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: screenSize.height * 0.007),
                          child: Icon(
                            Icons.drag_indicator,
                            size: 35,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: screenSize.height * 0.02),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: TextFormField(
                                  controller: languages[index],
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    fillColor: colorTextField,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 2, // Border width
                                        color: Color(
                                            0xffccebc9), // Focus border color
                                      ),
                                      borderRadius: constants.borderRadius,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 12.0),
                                    filled: true,
                                    enabledBorder: InputBorder.none,

                                    prefixIconConstraints: BoxConstraints(
                                        minWidth: 0, minHeight: 0),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          languages.removeAt(index);
                                        },
                                        icon: Icon(
                                          Icons.delete_outline,
                                          color: Colors.red,
                                        )),
                                    errorStyle: TextStyle(color: Colors.red),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 0, color: Colors.transparent),
                                      borderRadius: constants.borderRadius,
                                    ),

                                    // labelText: hint,
                                    // labelStyle: textStyle.subHeading.copyWith(color: colorDark,fontSize: 20.sp),
                                  ),
                                  onSaved: (v) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  onFieldSubmitted: (v) {
                                    FocusScope.of(context).unfocus();
                                  },
                                ),
                              )),
                        ),
                      ],
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Education'),
                    Spacer(),
                    const Text('Add'),
                    IconButton(
                        onPressed: () {
                          education.add(Education(
                              schoolCollage: TextEditingController(),
                              year: TextEditingController(),
                              title: TextEditingController()));
                        },
                        icon: const Icon(Icons.add))
                  ],
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: education.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(bottom: screenSize.height * 0.02),
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xffccebc9), width: 2),
                            borderRadius:
                                BorderRadius.circular(screenSize.width * 0.02)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenSize.height * 0.02,
                              vertical: screenSize.height * 0.02),
                          child: Column(
                            children: [
                              MyTextFiled(
                                  controller: education[index].schoolCollage,
                                  hint: 'School/Collage'),
                              MyTextFiled(
                                  controller: education[index].title,
                                  hint: 'Title'),
                              MyTextFiled(
                                  controller: education[index].year,
                                  hint: 'Year'),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Experience'),
                    Spacer(),
                    const Text('Add'),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            experience.add(Experience(
                              companyName: TextEditingController(),
                              year: TextEditingController(),
                              title: TextEditingController(),
                            ));
                          },
                          icon: const Icon(Icons.add)),
                    ),
                  ],
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: experience.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(bottom: screenSize.height * 0.02),
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xffccebc9), width: 2),
                            borderRadius:
                                BorderRadius.circular(screenSize.width * 0.02)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenSize.height * 0.02,
                              vertical: screenSize.height * 0.02),
                          child: Column(
                            children: [
                              MyTextFiled(
                                  controller: experience[index].companyName,
                                  hint: 'Company Name'),
                              MyTextFiled(
                                  controller: experience[index].title,
                                  hint: 'Title'),
                              MyTextFiled(
                                  controller: experience[index].year,
                                  hint: 'Year'),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

TextEditingController firstName = TextEditingController();
TextEditingController lastName = TextEditingController();
TextEditingController bio = TextEditingController();
TextEditingController designation = TextEditingController();
TextEditingController mobileNumber = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController github = TextEditingController();
TextEditingController linkedIn = TextEditingController();
TextEditingController address = TextEditingController();
RxList<TextEditingController> skills =
    <TextEditingController>[TextEditingController()].obs;
RxList<TextEditingController> languages =
    <TextEditingController>[TextEditingController()].obs;
RxList<Education> education = <Education>[
  Education(
      schoolCollage: TextEditingController(),
      year: TextEditingController(),
      title: TextEditingController())
].obs;
RxList<Experience> experience = <Experience>[
  Experience(
      year: TextEditingController(),
      title: TextEditingController(),
      companyName: TextEditingController())
].obs;

class Education {
  TextEditingController schoolCollage;
  TextEditingController year;
  TextEditingController title;

  Education(
      {required this.schoolCollage, required this.year, required this.title});
}

class Experience {
  TextEditingController title;
  TextEditingController year;
  TextEditingController companyName;

  Experience(
      {required this.companyName, required this.year, required this.title});
}
