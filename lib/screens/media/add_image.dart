import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metachat/color.dart';
import 'package:metachat/controllers/common.dart';
import 'package:metachat/controllers/media.dart';
import 'package:metachat/models/images.dart';
import 'package:metachat/screens/media/image_view.dart';

import '../../constant.dart';

class AddImageScreen extends StatelessWidget {
  const AddImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final commonController = Get.put(CommonController());
    final mediaController = Get.put(MediaController());
    final _id  = FirebaseAuth.instance.currentUser?.uid;
    return Scaffold(
        backgroundColor: backgroundColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: languagetextcolor,
          child: PopupMenuButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              color: Color.fromARGB(233, 255, 255, 255),
              splashRadius: 24,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              onSelected: (value) {
                if (value == 1) {
                  commonController
                      .pickImg(ImageSource.gallery)
                      .whenComplete(() {
                    if (commonController.pick.value) {
                      var img = commonController.image.value;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImageViewScreen(img: img)));
                    } else {
                      return;
                    }
                  });
                } else if (value == 2) {
                  commonController.pickImg(ImageSource.camera).whenComplete(() {
                    if (commonController.pick.value) {
                      var img2 = commonController.image.value;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ImageViewScreen(img: img2)));
                    } else {
                      return;
                    }
                  });
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(
                      child: Text(
                        'Gallery',
                        style: TextStyle(color: Colors.pink),
                      ),
                      value: 1,
                    ),
                    const PopupMenuItem(
                      child: Text(
                        'Camera',
                        style: TextStyle(color: Colors.pink),
                      ),
                      value: 2,
                    ),
                  ]),
        ),
        appBar: AppBar(
          title: Text("Image Album"),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
            future: mediaController.getimgsById(_id!),
            builder: ((context,AsyncSnapshot<List<ImgModel>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: NetworkImage(link+"/uploads/${snapshot.data?[index].img}"),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                  right: 0,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.remove_circle,
                                        color: Colors.white,
                                        size: 35,
                                      )),
                                )
                              ],
                            ));
                      }),
                );
              } else {
                return Text('Something went worng');
              }
            })));
  }
}
