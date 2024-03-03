import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:knovator/Pages/resume_preview.dart';
import 'package:knovator/Widgets/my_textfield.dart';
import 'package:knovator/globalVariable.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController eamil = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Create Resume'),
          actions: [
            IconButton(
                onPressed: () {
                  nextPage(context, ResumePreview());
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.03),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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
                MyTextFiled(controller: lastName, hint: 'Main Title'),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                MyTextFiled(controller: lastName, hint: 'Mobile Number'),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                MyTextFiled(controller: lastName, hint: 'Email'),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                MyTextFiled(controller: lastName, hint: 'LinkedIn'),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                MyTextFiled(controller: lastName, hint: 'GitHub'),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                MyTextFiled(controller: lastName, hint: 'Address'),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(''),
                    IconButton(
                        onPressed: () {
                          skills.add(TextEditingController());
                        },
                        icon: Icon(Icons.add))
                  ],
                ),
                // Si
                ListView.builder(
                  itemCount: skills.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(bottom: screenSize.height * 0.02),
                      child: MyTextFiled(
                          controller: skills[index],
                          hint: 'Skills ${index + 1}'),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(''),
                    IconButton(
                        onPressed: () {
                          languages.add(TextEditingController());
                        },
                        icon: Icon(Icons.add))
                  ],
                ),
                ListView.builder(
                  itemCount: languages.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(bottom: screenSize.height * 0.02),
                      child: MyTextFiled(
                          controller: languages[index],
                          hint: 'Languages ${index + 1}'),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(''),
                    IconButton(
                        onPressed: () {
                          education.add(Education(
                              schoolCollage: TextEditingController(),
                              year: TextEditingController(),
                              title: TextEditingController()));
                        },
                        icon: Icon(Icons.add))
                  ],
                ),
                ListView.builder(
                  itemCount: education.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(bottom: screenSize.height * 0.02),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(''),
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
                          icon: Icon(Icons.add)),
                    )
                  ],
                ),
                ListView.builder(
                  itemCount: experience.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(bottom: screenSize.height * 0.02),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
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
