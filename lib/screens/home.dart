import 'package:flutter/material.dart';
import 'data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final form01Controller = TextEditingController();
  final form02Controller = TextEditingController();
  final form03Controller = TextEditingController();
  final form04Controller = TextEditingController();
  final form05Controller = TextEditingController();

  late bool form01Tap = false;
  late bool form02Tap = false;
  late bool form03Tap = false;
  late bool form04Tap = false;
  late bool form05Tap = false;

  late bool back = false;

  @override
  void initState() {
    super.initState();

    form01Controller.addListener(() => setState(() {}));
    form02Controller.addListener(() => setState(() {}));
    form03Controller.addListener(() => setState(() {}));
    form04Controller.addListener(() => setState(() {}));
    form05Controller.addListener(() => setState(() {}));
  }

  @override
  void didChangeDependencies() {
    form01Controller.text;
    form02Controller.text;
    form03Controller.text;
    form04Controller.text;
    form05Controller.text;
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
                        autofocus: form01Tap? true : false,
                        controller: form01Controller,
                        maxLines: 1,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.redAccent, width: 2.0),
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
                                                    builder: (context) => Data(
                                                          form01Controller.text,
                                                          "Fault code",
                                                        )));
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
                              borderSide:
                                  BorderSide(color: Colors.redAccent, width: 2.0),
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
                                                MaterialPageRoute (
                                                    builder: (context) => Data  (
                                                          form02Controller.text,
                                                          'Sensor/ Actuator live data & pin-out',
                                                        )));
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
                              borderSide:
                                  BorderSide(color: Colors.redAccent, width: 2.0),
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
                                                    builder: (context) => Data(
                                                          form03Controller.text,
                                                          'ECU data & pin-out',
                                                        )));
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
                              borderSide:
                                  BorderSide(color: Colors.redAccent, width: 2.0),
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
                                                    builder: (context) => Data(
                                                          form04Controller.text,
                                                          'Fuse Box location & diagram',
                                                        )));
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
                              borderSide:
                                  BorderSide(color: Colors.redAccent, width: 2.0),
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
                                                    builder: (context) => Data(
                                                          form05Controller.text,
                                                          'Wiring diagram & workshop manual',
                                                        )));
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
