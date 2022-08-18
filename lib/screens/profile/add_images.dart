// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:metachat/screens/home/home.dart';

// import '../../color.dart';
// import '../../controllers/user.dart';
// import '../../widget/button_text.dart';

// class AddImages extends StatefulWidget {
//   final String fullname;
//   final String email;
//   final String phoneno;
//   final String location;
//   final String gender;
//   final File profileimg;
//   final List interest;
//   const AddImages(
//       {Key? key,
//       required this.fullname,
//       required this.email,
//       required this.phoneno,
//       required this.location,
//       required this.gender,
//       required this.profileimg,
//       required this.interest})
//       : super(key: key);

//   @override
//   State<AddImages> createState() => _AddImagesState();
// }

// class _AddImagesState extends State<AddImages> {
//   File? image;
//   File? image1;
//   File? image2;
//   File? image3;

//   final userController = Get.put(UserController());
//   final id = FirebaseAuth.instance.currentUser?.uid;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ButtonText(
//             btnname: "CONTINUE",
//             ontap: () {
//               EasyLoading.show();
//               userController.postuserdata(
//                   id!,
//                   widget.fullname,
//                   id!,
//                   widget.phoneno,
//                   widget.email,
//                   widget.profileimg,
//                   widget.location,
//                   widget.gender,
//                   "offline",
//                   widget.interest,
//                   image!,
//                   image1!,
//                   image2!,
//                   image3!).whenComplete(() {
//                     EasyLoading.dismiss();
//                   });
//                   Navigator.push(context, MaterialPageRoute(builder: ((context) => HomeScreen())));
//             }),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text("Add Your Photos"),
//         centerTitle: true,
//         foregroundColor: foreground,
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: size.height / 30,
//           ),
//           SizedBox(
//             height: size.height / 3.5,
//             width: size.width,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: InkWell(
//                       onTap: () async {
//                         ImagePicker picker = ImagePicker();
//                         final img =
//                             await picker.pickImage(source: ImageSource.gallery);
//                         if (img != null) {
//                           final tempImg = File(img.path);
//                           setState(() {
//                             image = tempImg;
//                           });
//                         }
//                       },
//                       child: Container(
//                         height: size.height / 4,
//                         width: size.width / 2.35,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(
//                             12,
//                           ),
//                         ),
//                         child: image != null
//                             ? Image.file(
//                                 image!,
//                                 fit: BoxFit.cover,
//                               )
//                             : const Icon(
//                                 FontAwesomeIcons.plus,
//                                 color: Color.fromARGB(255, 234, 129, 164),
//                               ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: InkWell(
//                       onTap: () async {
//                         ImagePicker picker = ImagePicker();
//                         final img =
//                             await picker.pickImage(source: ImageSource.gallery);
//                         if (img != null) {
//                           final tempImg = File(img.path);
//                           setState(() {
//                             image1 = tempImg;
//                           });
//                         }
//                       },
//                       child: Container(
//                         height: size.height / 4,
//                         width: size.width / 2.35,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12)),
//                         child: image1 != null
//                             ? Image.file(
//                                 image1!,
//                                 fit: BoxFit.cover,
//                               )
//                             : const Icon(
//                                 FontAwesomeIcons.plus,
//                                 color: Color.fromARGB(255, 234, 129, 164),
//                               ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: size.height / 3.5,
//             width: size.width,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: InkWell(
//                       onTap: () async {
//                         ImagePicker picker = ImagePicker();
//                         final img =
//                             await picker.pickImage(source: ImageSource.gallery);
//                         if (img != null) {
//                           final tempImg = File(img.path);
//                           setState(() {
//                             image2 = tempImg;
//                           });
//                         }
//                       },
//                       child: Container(
//                         height: size.height / 4,
//                         width: size.width / 2.35,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(
//                             12,
//                           ),
//                         ),
//                         child: image2 != null
//                             ? Image.file(
//                                 image2!,
//                                 fit: BoxFit.cover,
//                               )
//                             : const Icon(
//                                 FontAwesomeIcons.plus,
//                                 color: Color.fromARGB(255, 234, 129, 164),
//                               ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: InkWell(
//                       onTap: () async {
//                         ImagePicker picker = ImagePicker();
//                         final img =
//                             await picker.pickImage(source: ImageSource.gallery);
//                         if (img != null) {
//                           final tempImg = File(img.path);
//                           setState(() {
//                             image3 = tempImg;
//                           });
//                         }
//                       },
//                       child: Container(
//                         height: size.height / 4,
//                         width: size.width / 2.35,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12)),
//                         child: image3 != null
//                             ? Image.file(
//                                 image3!,
//                                 fit: BoxFit.cover,
//                               )
//                             : const Icon(
//                                 FontAwesomeIcons.plus,
//                                 color: Color.fromARGB(255, 234, 129, 164),
//                               ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
