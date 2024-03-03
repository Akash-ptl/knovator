import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Education {
  TextEditingController schoolCollage;
  TextEditingController year;
  TextEditingController title;

  Education({
    required this.schoolCollage,
    required this.year,
    required this.title,
  });
  Map<String, dynamic> toJson() {
    return {
      'schoolCollage': schoolCollage.text,
      'year': year.text,
      'title': title.text,
    };
  }

  // Create Education object from JSON format
  static Education fromJson(Map<String, dynamic> json) {
    return Education(
      schoolCollage: TextEditingController(text: json['schoolCollage']),
      year: TextEditingController(text: json['year']),
      title: TextEditingController(text: json['title']),
    );
  }
}

class Experience {
  TextEditingController year;
  TextEditingController title;
  TextEditingController companyName;

  Experience({
    required this.year,
    required this.title,
    required this.companyName,
  });
  Map<String, dynamic> toJson() {
    return {
      'year': year.text,
      'title': title.text,
      'companyName': companyName.text,
    };
  }

  // Create Experience object from JSON format
  static Experience fromJson(Map<String, dynamic> json) {
    return Experience(
      year: TextEditingController(text: json['year']),
      title: TextEditingController(text: json['title']),
      companyName: TextEditingController(text: json['companyName']),
    );
  }
}

class UserData {
  TextEditingController firstName;
  TextEditingController lastName;
  TextEditingController bio;
  TextEditingController designation;
  TextEditingController mobileNumber;
  TextEditingController email;
  TextEditingController github;
  TextEditingController linkedIn;
  TextEditingController address;
  RxList<TextEditingController> skills;
  RxList<TextEditingController> languages;
  RxList<Education> education;
  RxList<Experience> experience;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.designation,
    required this.mobileNumber,
    required this.email,
    required this.github,
    required this.linkedIn,
    required this.address,
    required this.skills,
    required this.languages,
    required this.education,
    required this.experience,
  });
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName.text,
      'lastName': lastName.text,
      'bio': bio.text,
      'designation': designation.text,
      'mobileNumber': mobileNumber.text,
      'email': email.text,
      'github': github.text,
      'linkedIn': linkedIn.text,
      'address': address.text,
      'skills': skills.map((controller) => controller.text).toList(),
      'languages': languages.map((controller) => controller.text).toList(),
      'education': education.map((edu) => edu.toJson()).toList(),
      'experience': experience.map((exp) => exp.toJson()).toList(),
    };
  }

  static UserData fromJson(Map<String, dynamic> json) {
    return UserData(
      firstName: TextEditingController(text: json['firstName']),
      lastName: TextEditingController(text: json['lastName']),
      bio: TextEditingController(text: json['bio']),
      designation: TextEditingController(text: json['designation']),
      mobileNumber: TextEditingController(text: json['mobileNumber']),
      email: TextEditingController(text: json['email']),
      github: TextEditingController(text: json['github']),
      linkedIn: TextEditingController(text: json['linkedIn']),
      address: TextEditingController(text: json['address']),
      skills: RxList<TextEditingController>.from(
          json['skills'].map((skill) => TextEditingController(text: skill))),
      languages: RxList<TextEditingController>.from(
          json['languages'].map((lang) => TextEditingController(text: lang))),
      education: (json['education'] as List<dynamic>)
          .map((eduJson) => Education.fromJson(eduJson))
          .toList()
          .obs,
      experience: (json['experience'] as List<dynamic>)
          .map((expJson) => Experience.fromJson(expJson))
          .toList()
          .obs,
    );
  }
}

UserData userData = UserData(
  firstName: TextEditingController(),
  lastName: TextEditingController(),
  bio: TextEditingController(),
  designation: TextEditingController(),
  mobileNumber: TextEditingController(),
  email: TextEditingController(),
  github: TextEditingController(),
  linkedIn: TextEditingController(),
  address: TextEditingController(),
  skills: <TextEditingController>[TextEditingController()].obs,
  languages: <TextEditingController>[TextEditingController()].obs,
  education: <Education>[
    Education(
      schoolCollage: TextEditingController(),
      year: TextEditingController(),
      title: TextEditingController(),
    )
  ].obs,
  experience: <Experience>[
    Experience(
      year: TextEditingController(),
      title: TextEditingController(),
      companyName: TextEditingController(),
    )
  ].obs,
);
