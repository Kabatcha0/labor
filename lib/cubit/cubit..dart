import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/models/auth_model.dart';
import 'package:labor/modules/add_card/add_card.dart';
import 'package:labor/modules/categories/categories.dart';
import 'package:labor/modules/history/history.dart';
import 'package:labor/modules/home/home.dart';
import 'package:labor/modules/person/person.dart';
import 'package:labor/shared/const.dart';
import 'package:labor/shared/network/local/local.dart';

class LaborCubit extends Cubit<LaborStates> {
  LaborCubit() : super(LaborInitialState());
  static LaborCubit get(context) => BlocProvider.of(context);
  List<Widget> body = [Home(), History(), Categories(), Person()];
  List<AppBar> AppbarHome = [
    AppBar(
      // centerTitle: true,
      leading: Center(
        child: Stack(alignment: AlignmentDirectional.topEnd, children: [
          const Icon(
            EvaIcons.bellOutline,
            color: Colors.black,
            size: 28,
          ),
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 5.5,
          ),
          CircleAvatar(
            backgroundColor: Color(Const.indicator),
            radius: 5,
          ),
        ]),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 90,
            height: 90,
            child: Image.asset(
              "assets/appBar.png",
            ),
          ),
        ],
      ),
    ),
    AppBar(
      // leading: IconButton(
      //     onPressed: () {

      //     },
      //     icon: const Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //       size: 26,
      //     )),
      centerTitle: true,
      title: Text(
        "History",
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: Const.fontThree,
            fontFamily: "Quicksand"),
      ),
    ),
    AppBar(
      centerTitle: true,
      title: Text(
        "Categories",
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: Const.fontThree,
            fontFamily: "Quicksand"),
      ),
    ),
    AppBar(
      // leading: IconButton(
      //     onPressed: () {

      //     },
      //     icon: const Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //       size: 26,
      //     )),
      centerTitle: true,
      title: Text(
        "Person",
        style: TextStyle(
            fontSize: Const.fontThree,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "Quicksand"),
      ),
    )
  ];
  bool check = false;
  void checkEye() {
    check = !check;
    emit(LaborCheckEyesState());
  }

  bool checkConfirm = false;
  void checkEyeConfirm() {
    checkConfirm = !checkConfirm;
    emit(LaborCheckEyesConfirmState());
  }

  int currentIndex = 0;
  void changeIndex(int v) {
    currentIndex = v;
    emit(LaborCurrentIndexState());
  }

  List<String> imageServices = [
    "assets/flat.png",
    "assets/contract cleaning.png",
    "assets/Group.png",
    "assets/Filled outline.png",
    "assets/conditioning.png",
    "assets/plumbing.png",
  ];
  List<String> textServices = [
    "hourly cleaning",
    "contract cleaning",
    "electrical",
    "car wash",
    "Conditioning",
    "plumbing"
  ];
  int segmentCurrent = 0;
  void segmentCurrentChange(int i) {
    segmentCurrent = i;
    emit(LaborSegmentCurrentChangeState());
  }

  bool theSwitch = true;
  void changeSwitch() {
    theSwitch = !theSwitch;
    emit(LaborTheSwitchState());
  }

  bool change = false;
  void changeColorOfProcess() {
    change = !change;
    emit(LaborChangeColorOfProcessState());
  }

  List<String> year = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
  List<int> daysOfNum = [18, 19, 20, 21, 22];
  List<String> hour = [
    "11:00 AM",
    "12:00 PM",
    "1:00 PM",
    "2:00 PM",
    "3:00 PM",
  ];
  // Firebase
  void auth({
    required String phone,
    required String password,
    required BuildContext context,
  }) {
    emit(LaborAuthLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: "$phone@gmail.com", password: password)
        .then((value) {
      Const.uid = value.user!.uid;
      CacheHelper.setData(key: "uid", value: Const.uid);
      emit(LaborAuthSuccessState());
    }).catchError((e) {
      if (e is FirebaseAuthException) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Ur Email Or Password",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Quicksand",
              fontSize: Const.fontTwo,
              fontWeight: FontWeight.bold),
        )));
      }
      emit(LaborAuthErrorState());
    });
  }

  AuthModel? authModel;

  void getDataAuth() {
    FirebaseFirestore.instance
        .collection("account")
        .doc(Const.uid)
        .get()
        .then((value) {
      authModel = AuthModel.fromJson(value.data()!);
      emit(LaborGetSuccessState());
    }).catchError((e) {
      log(e.toString());
    });
  }

  void register({
    required String password,
    required String phone,
    required String name,
    required String email,
    required String profile,
    required BuildContext context,
  }) {
    emit(LaborRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Const.uid = value.user!.uid;
      storeAccount(
          password: password, phone: phone, name: name, profile: profile);
    }).catchError((e) {
      if (e is FirebaseAuthException) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          e.toString(),
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Quicksand",
              fontSize: Const.fontTwo,
              fontWeight: FontWeight.bold),
        )));
        emit(LaborRegisterErrorState());
      }
    });
  }

  void storeAccount({
    required String password,
    required String phone,
    required String name,
    required String profile,
  }) {
    emit(LaborVerifyLoadingState());
    AuthModel authModel = AuthModel(
        name: name,
        password: password,
        phone: phone,
        uid: Const.uid,
        profile: profile);
    FirebaseFirestore.instance
        .collection("account")
        .doc(Const.uid)
        .set(authModel.toMap(
            phone: phone,
            name: name,
            uid: Const.uid,
            password: password,
            profile: profile))
        .then((value) {
      CacheHelper.setData(key: "uid", value: Const.uid);
      emit(LaborRegisterSuccessState());
    }).catchError((e) {
      log(e.toString());
    });
  }

  String? otp;
  void forgetPassword(
      {required String phone,
      required BuildContext context,
      required Widget widget}) {
    FirebaseAuth.instance
        .verifyPhoneNumber(
            phoneNumber: phone,
            verificationCompleted: (verificationCompleted) {
              navigator(context: context, widget: widget);
            },
            verificationFailed: (e) {
              if (e is FirebaseAuthException) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                  "Ur Email Or Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Quicksand",
                      fontSize: Const.fontTwo,
                      fontWeight: FontWeight.bold),
                )));
              }
              return;
            },
            codeSent: (verificationId, forceResendingToken) {
              otp = verificationId;
            },
            codeAutoRetrievalTimeout: (verificationId) => otp = verificationId)
        .then((value) {
      emit(LaborVerifySuccessState());
    }).catchError((e) {
      log(e.toString());
    });
  }

  void changePassword({required String password, required String phone}) {
    emit(LaborChangePasswordLoadingState());
    FirebaseAuth.instance.currentUser!.updatePassword(password).then((value) {
      FirebaseFirestore.instance.collection("account").get().then((value) {
        value.docs.forEach((element) {
          if (element.data()["phone"] == phone) {
            element.data().update("password", (value) => password);
            emit(LaborChangePasswordSuccessState());
          }
        });
      });
    }).catchError((e) {
      log(e.toString());
    });
  }

  void edit({
    required String newPassword,
    required String name,
    required String phone,
  }) {
    emit(LaborEditLoadingState());
    FirebaseAuth.instance.currentUser!
        .updatePassword(newPassword)
        .then((value) {
      FirebaseFirestore.instance
          .collection("account")
          .doc(Const.uid)
          .update({"phone": phone, "password": newPassword, "name": name}).then(
              (value) {
        emit(LaborEditSuccessState());
      }).catchError((e) {
        emit(LaborEditErrorState());

        log(e.toString());
      });
    }).catchError((e) {
      log(e.toString());
    });
  }

  void out({required BuildContext context, required Widget widget}) {
    FirebaseAuth.instance.signOut().then((value) {
      Const.uid = "";
      navigatorRemove(context: context, widget: widget);
    }).catchError((e) {
      emit(LaborSignOutState());
    });
  }

  void removeAccount({required Widget widget, required BuildContext context}) {
    FirebaseAuth.instance.currentUser!.delete().then((value) {
      FirebaseFirestore.instance
          .collection("account")
          .doc(Const.uid)
          .delete()
          .then((value) {
        navigatorRemove(context: context, widget: widget);
      }).catchError((e) {
        log(e.toString());
      });
    }).catchError((e) {
      log(e.toString());
    });
  }

  File? file;
  String? image;
  void imagePicker() {
    emit(LaborGetImagePickerLoadingState());
    ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery)
        .then((value) {
      if (value != null) {
        file = File(value.path);
        saveImagePicker();
        emit(LaborImagePickerSuccessState());
      } else {
        return null;
      }
    }).catchError((e) {
      log(e.toString());
      emit(LaborImagePickerErrorState());
    });
  }

  void saveImagePicker() {
    FirebaseStorage.instance.ref("profile").putFile(file!).then((p0) {
      FirebaseStorage.instance.ref("profile").getDownloadURL().then((value) {
        image = value;
        emit(LaborGetImagePickerSuccessState());
      }).catchError((e) {
        log(e.toString());
      });
    }).catchError((e) {
      log(e.toString());
      emit(LaborGetImagePickerErrorState());
    });
  }
}
