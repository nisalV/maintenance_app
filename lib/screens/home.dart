import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyDialog = GlobalKey<FormState>();

  final form01Controller = TextEditingController();
  final form02Controller = TextEditingController();
  final form03Controller = TextEditingController();
  final form04Controller = TextEditingController();
  final form05Controller = TextEditingController();
  final form06Controller = TextEditingController();
  final form07Controller = TextEditingController();

  late bool form01Tap = false;
  late bool form02Tap = false;
  late bool form03Tap = false;
  late bool form04Tap = false;
  late bool form05Tap = false;
  late bool back = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    signInAnon();

    form01Controller.addListener(() => setState(() {}));
    form02Controller.addListener(() => setState(() {}));
    form03Controller.addListener(() => setState(() {}));
    form04Controller.addListener(() => setState(() {}));
    form05Controller.addListener(() => setState(() {}));
    form06Controller.addListener(() => setState(() {}));
    form07Controller.addListener(() => setState(() {}));
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Can not connect to the Database!",
          style: TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        ),
      ));
      return null;
    }
  }

  @override
  void didChangeDependencies() {
    form01Controller.text;
    form02Controller.text;
    form03Controller.text;
    form04Controller.text;
    form05Controller.text;
    form06Controller.text;
    form07Controller.text;
    form01Tap;
    form02Tap;
    form03Tap;
    form04Tap;
    form05Tap;
    super.didChangeDependencies();
  }

  void refresh() {
    setState(() {
      form01Tap = false;
      form02Tap = false;
      form03Tap = false;
      form04Tap = false;
      form05Tap = false;
    });
  }

  void clearField() {
    form01Controller.clear();
    form02Controller.clear();
    form03Controller.clear();
    form04Controller.clear();
    form05Controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w900,
            color: Colors.redAccent,
          ),
        ),
        actions: [
          form01Tap || form02Tap || form03Tap || form04Tap || form05Tap
              ? Center(
                  child: IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      clearField();
                      refresh();
                    },
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                    splashRadius: 12.0,
                    color: Colors.redAccent,
                  ),
                )
              : Container(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),

                //field 01
                form02Tap || form03Tap || form04Tap || form05Tap
                    ? const SizedBox(
                        height: 0,
                        width: 0,
                      )
                    : TextFormField(
                        autofocus: form01Tap ? true : false,
                        controller: form01Controller,
                        maxLines: 1,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent, width: 2.0),
                            ),
                            labelText: 'Fault code',
                            labelStyle: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.redAccent,
                            ),
                            prefixIcon: const Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.redAccent,
                            ),
                            suffixIcon: form01Controller.text.isEmpty
                                ? Container(
                                    width: 0,
                                  )
                                : SizedBox(
                                    width: 100,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          splashRadius: 12.0,
                                          onPressed: () {
                                            form01Controller.clear();
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                        IconButton(
                                          splashRadius: 12.0,
                                          onPressed: () async {
                                            refresh();
                                            FocusScope.of(context).unfocus();
                                            await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Information(
                                                            form01Controller
                                                                .text,
                                                            "Fault code",
                                                            "Fault Code")));
                                            clearField();
                                          },
                                          icon: const Icon(
                                            Icons.search_sharp,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        onTap: () {
                          setState(() {
                            form05Tap = false;
                            form02Tap = false;
                            form03Tap = false;
                            form04Tap = false;
                            form01Tap = true;
                          });
                        },
                      ),
                form02Tap || form03Tap || form04Tap || form05Tap
                    ? const SizedBox(
                        height: 0,
                      )
                    : const SizedBox(
                        height: 20,
                      ),

                //field 02

                form01Tap || form03Tap || form04Tap || form05Tap
                    ? const SizedBox(
                        height: 0,
                        width: 0,
                      )
                    : TextFormField(
                        autofocus: form02Tap ? true : false,
                        controller: form02Controller,
                        maxLines: 1,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent, width: 2.0),
                            ),
                            labelText: 'Sensor/ Actuator live data & pin-out',
                            labelStyle: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.redAccent,
                            ),
                            prefixIcon: const Icon(
                              Icons.sensors,
                              color: Colors.redAccent,
                            ),
                            suffixIcon: form02Controller.text.isEmpty
                                ? Container(
                                    width: 0,
                                  )
                                : SizedBox(
                                    width: 100,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          splashRadius: 12.0,
                                          onPressed: () {
                                            form02Controller.clear();
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                        IconButton(
                                          splashRadius: 12.0,
                                          onPressed: () async {
                                            refresh();
                                            FocusScope.of(context).unfocus();
                                            await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Information(
                                                            form02Controller
                                                                .text,
                                                            'Sensor/ Actuator live data & pin-out',
                                                            "Sensor Data")));
                                            clearField();
                                          },
                                          icon: const Icon(
                                            Icons.search_sharp,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        onTap: () {
                          setState(() {
                            form01Tap = false;
                            form05Tap = false;
                            form03Tap = false;
                            form04Tap = false;
                            form02Tap = true;
                          });
                        },
                      ),
                form01Tap || form03Tap || form04Tap || form05Tap
                    ? const SizedBox(
                        height: 0,
                      )
                    : const SizedBox(
                        height: 20,
                      ),

                //field 03

                form01Tap || form02Tap || form04Tap || form05Tap
                    ? const SizedBox(
                        height: 0,
                        width: 0,
                      )
                    : TextFormField(
                        autofocus: form03Tap ? true : false,
                        controller: form03Controller,
                        maxLines: 1,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent, width: 2.0),
                            ),
                            labelText: 'ECU data & pin-out',
                            labelStyle: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.redAccent,
                            ),
                            prefixIcon: const Icon(
                              Icons.account_tree_rounded,
                              color: Colors.redAccent,
                            ),
                            suffixIcon: form03Controller.text.isEmpty
                                ? Container(
                                    width: 0,
                                  )
                                : SizedBox(
                                    width: 100,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          splashRadius: 12.0,
                                          onPressed: () {
                                            form03Controller.clear();
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                        IconButton(
                                          splashRadius: 12.0,
                                          onPressed: () async {
                                            refresh();
                                            FocusScope.of(context).unfocus();
                                            await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Information(
                                                            form03Controller
                                                                .text,
                                                            'ECU data & pin-out',
                                                            "ECU")));
                                            clearField();
                                          },
                                          icon: const Icon(
                                            Icons.search_sharp,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        onTap: () {
                          setState(() {
                            form01Tap = false;
                            form02Tap = false;
                            form05Tap = false;
                            form04Tap = false;
                            form03Tap = true;
                          });
                        },
                      ),
                form01Tap || form02Tap || form04Tap || form05Tap
                    ? const SizedBox(
                        height: 0,
                      )
                    : const SizedBox(
                        height: 20,
                      ),

                //field 04

                form01Tap || form02Tap || form03Tap || form05Tap
                    ? const SizedBox(
                        height: 0,
                        width: 0,
                      )
                    : TextFormField(
                        autofocus: form04Tap ? true : false,
                        controller: form04Controller,
                        maxLines: 1,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent, width: 2.0),
                            ),
                            labelText: 'Fuse Box location & diagram',
                            labelStyle: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.redAccent,
                            ),
                            prefixIcon: const Icon(
                              Icons.lightbulb_outline_rounded,
                              color: Colors.redAccent,
                            ),
                            suffixIcon: form04Controller.text.isEmpty
                                ? Container(
                                    width: 0,
                                  )
                                : SizedBox(
                                    width: 100,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          splashRadius: 12.0,
                                          onPressed: () {
                                            form04Controller.clear();
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                        IconButton(
                                          splashRadius: 12.0,
                                          onPressed: () async {
                                            refresh();
                                            FocusScope.of(context).unfocus();
                                            await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Information(
                                                            form04Controller
                                                                .text,
                                                            'Fuse Box location & diagram',
                                                            "Fuse")));
                                            clearField();
                                          },
                                          icon: const Icon(
                                            Icons.search_sharp,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        onTap: () {
                          setState(() {
                            form01Tap = false;
                            form02Tap = false;
                            form03Tap = false;
                            form05Tap = false;
                            form04Tap = true;
                          });
                        },
                      ),
                form01Tap || form02Tap || form03Tap || form05Tap
                    ? const SizedBox(
                        height: 0,
                      )
                    : const SizedBox(
                        height: 20,
                      ),

                //field 04

                form01Tap || form02Tap || form03Tap || form04Tap
                    ? const SizedBox(
                        height: 0,
                        width: 0,
                      )
                    : TextFormField(
                        autofocus: form05Tap ? true : false,
                        controller: form05Controller,
                        maxLines: 1,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent, width: 2.0),
                            ),
                            labelText: 'Wiring diagram & workshop manual',
                            labelStyle: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.redAccent,
                            ),
                            prefixIcon: const Icon(
                              Icons.menu_book_rounded,
                              color: Colors.redAccent,
                            ),
                            suffixIcon: form05Controller.text.isEmpty
                                ? Container(
                                    width: 0,
                                  )
                                : SizedBox(
                                    width: 100,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          splashRadius: 12.0,
                                          onPressed: () {
                                            form05Controller.clear();
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                        IconButton(
                                          splashRadius: 12.0,
                                          onPressed: () async {
                                            refresh();
                                            FocusScope.of(context).unfocus();
                                            await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Information(
                                                            form05Controller
                                                                .text,
                                                            'Wiring diagram & workshop manual',
                                                            "Wiring")));
                                            clearField();
                                          },
                                          icon: const Icon(
                                            Icons.search_sharp,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        onTap: () {
                          setState(() {
                            form01Tap = false;
                            form02Tap = false;
                            form03Tap = false;
                            form04Tap = false;
                            form05Tap = true;
                          });
                        },
                      ),
                form01Tap || form02Tap || form03Tap || form04Tap || form05Tap
                    ? Container(
                        width: 0,
                        height: 0,
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50, horizontal: 0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton(
                            onPressed: () {
                              openDialog();
                            },
                            elevation: 1,
                            backgroundColor: Colors.redAccent,
                            child: const Icon(Icons.message),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future openDialog() {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    late bool feedback = false;

    return showDialog(
      context: context,
      builder: (context) => Scaffold(
        key: _scaffoldKey,
        body: AlertDialog(
          title: Row(
            children: [
              const Text(
                'Your feedback?...',
                style: TextStyle(color: Colors.redAccent),
              ),
              feedback
                  ? const Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: CircularProgressIndicator(
                        color: Colors.redAccent,
                      ),
                    )
                  : const SizedBox(
                      width: 0,
                      height: 0,
                    ),
            ],
          ),
          content: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Column(
                children: [
                  Form(
                    key: _formKeyDialog,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextFormField(
                          autofocus: true,
                          controller: form06Controller,
                          maxLines: 1,
                          maxLength: 20,
                          enableSuggestions: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent, width: 2.0),
                            ),
                            labelText: 'Your name',
                            labelStyle: TextStyle(
                              fontSize: 15.0,
                              color: Colors.redAccent,
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.redAccent,
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                        ),
                        TextFormField(
                          autofocus: true,
                          controller: form07Controller,
                          maxLines: null,
                          maxLength: 100,
                          enableSuggestions: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent, width: 2.0),
                            ),
                            labelText: 'Feedback',
                            labelStyle: TextStyle(
                              fontSize: 15.0,
                              color: Colors.redAccent,
                            ),
                            prefixIcon: Icon(
                              Icons.feedback_outlined,
                              color: Colors.redAccent,
                            ),
                          ),
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 6, 20, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          disabledColor: Colors.redAccent,
                          onPressed: () {
                            form06Controller.clear();
                            form07Controller.clear();
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close),
                          color: Colors.redAccent,
                        ),
                        IconButton(
                          onPressed: () async {
                            setState(() {
                              feedback = true;
                            });
                            if (form06Controller.text.trim().isNotEmpty &&
                                form07Controller.text.trim().isNotEmpty) {
                              try {
                                var a = await FirebaseFirestore.instance
                                    .collection("Feedbacks")
                                    .doc(form06Controller.text.trim())
                                    .get();
                                if (a.exists) {
                                  final DocumentReference documentReference =
                                      FirebaseFirestore.instance
                                          .collection("Feedbacks")
                                          .doc(form06Controller.text.trim());
                                  await documentReference.update({
                                    "feedbacks": FieldValue.arrayUnion(
                                        [form07Controller.text.trim()])
                                  });
                                } else {
                                  final DocumentReference documentReference =
                                      FirebaseFirestore.instance
                                          .collection("Feedbacks")
                                          .doc(form06Controller.text.trim());
                                  await documentReference.set({
                                    "feedbacks": FieldValue.arrayUnion(
                                        [form07Controller.text.trim()])
                                  });
                                }
                                setState(() {
                                  feedback = false;
                                });
                                form06Controller.clear();
                                form07Controller.clear();

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Feedback sent, thank you...",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.green)),
                                ));

                                Navigator.of(context).pop();
                              } catch (e) {
                                setState(() {
                                  feedback = false;
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                    "Failed!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ));
                              }
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  "All the fields required!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.red),
                                ),
                              ));
                            }
                          },
                          icon: const Icon(Icons.send),
                          color: Colors.redAccent,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
