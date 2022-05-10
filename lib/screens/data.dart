import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class Data extends StatefulWidget {
  final String searchType;
  final String searchData;

  const Data(this.searchData, this.searchType, {Key? key}) : super(key: key);

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  late String copyLink = '';

  List<String> imgValues = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg'
  ];

  List<String> pdfValues = ['df434.pdf', 'fr43d.pdf', 'core.pdf', '4556D4.pdf','df434.pdf', 'fr43d.pdf', 'core.pdf', '4556D4.pdf','df434.pdf', 'fr43d.pdf', 'core.pdf', '4556D4.pdf'];

  List<String> videoValues = ['12345.mp4','12345.mp4','12345.mp4','12345.mp4','12345.mp4','12345.mp4'];

  List<String> linkValues = [
    'www.google.com',
    'www.yahoo.com',
    'www.bing.com',
    'www.microsoft.com'
  ];

  final field01Controller = TextEditingController();
  final field02Controller = TextEditingController();

  late double width;
  late double height;
  var pad;
  late double newHeight;

  late bool field01Tap = false;
  late bool field02Tap = false;

  @override
  void initState() {
    super.initState();
    field01Controller.addListener(() => setState(() {}));
    field02Controller.addListener(() => setState(() {}));
  }

  @override
  void didChangeDependencies() {
    field01Controller.text;
    field02Controller.text;
    field01Tap;
    field02Tap;
    super.didChangeDependencies();
  }

  void refresh() {
    setState(() {
      field01Tap = false;
      field02Tap = false;
    });
  }

  ///////

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context)
        .size
        .width; // getting width,height (safe area) of the screen
    height = MediaQuery.of(context).size.height;
    pad = MediaQuery.of(context).padding;
    newHeight = height - pad.top - pad.bottom;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.redAccent,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            widget.searchType,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              color: Colors.redAccent,
            ),
          ),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                child: IconButton(
                  alignment: Alignment.topRight,
                  icon: const Icon(Icons.info_outline_rounded),
                  splashRadius: 12.0,
                  color: Colors.redAccent,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              children: [
                Column(
                  children: [
                    TextFormField(
                      autofocus: field01Tap ? true : false,
                      controller: field01Controller,
                      maxLines: 1,
                      enableSuggestions: true,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.redAccent, width: 2.0),
                          ),
                          labelText: widget.searchType,
                          labelStyle: const TextStyle(
                            fontSize: 15.0,
                            color: Colors.redAccent,
                          ),
                          prefixIcon: const Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.redAccent,
                          ),
                          suffixIcon: field01Controller.text.isEmpty
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
                                          field01Controller.clear();
                                          FocusScope.of(context).unfocus();
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      IconButton(
                                        splashRadius: 12.0,
                                        onPressed: () {},
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
                          field01Tap = true;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    // Description

                    Card(
                      elevation: 0.0,
                      color: const Color(0xFA168FFC),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.searchData, //Searched title
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 5),
                                child: Text(
                                  //Description
                                  "Today's engines contain sensors to tell the vehicle's computer what's going on. Car sensors check for fuel-air mixture, incoming air temperature, wheel speed, and manifold pressure. They then tell your vehicle's computer what to do, based on that information.",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Search text

                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
                const TabBar(indicatorColor: Colors.redAccent, tabs: [
                  Tab(
                    icon: Icon(Icons.image_rounded, color: Colors.redAccent),
                  ),
                  Tab(
                    icon: Icon(Icons.picture_as_pdf_rounded,
                        color: Colors.redAccent),
                  ),
                  Tab(
                    icon: Icon(Icons.video_library_rounded,
                        color: Colors.redAccent),
                  ),
                  Tab(
                    icon: Icon(Icons.link_rounded, color: Colors.redAccent),
                  ),
                ]),
                SizedBox(
                  height: newHeight - 100,
                  child: TabBarView(children: [
                    //Image Viewer
                    PhotoViewGallery.builder(
                      scrollDirection: Axis.vertical,
                      scrollPhysics: const BouncingScrollPhysics(),
                      builder: (BuildContext context, int index) {
                        return PhotoViewGalleryPageOptions(
                          imageProvider:
                              AssetImage(imgValues[index]), //Image at 'index'
                          initialScale: PhotoViewComputedScale.covered,
                          basePosition: Alignment.center,
                          minScale: PhotoViewComputedScale.covered,
                        );
                      },
                      backgroundDecoration:
                          BoxDecoration(color: Colors.redAccent[100]),
                      itemCount: imgValues.length,
                      loadingBuilder: (context, event) => const Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                      pageController: PageController(),
                    ),
                    ListView.builder(
                      itemCount: pdfValues.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.picture_as_pdf,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                pdfValues[index],
                                style: const TextStyle(color: Colors.redAccent),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(
                                  Icons.download_rounded,
                                  color: Colors.redAccent,
                                ),
                                onPressed: () {}, //Download video
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: videoValues.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.video_library_rounded,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                videoValues[index],
                                style: const TextStyle(color: Colors.redAccent),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(
                                  Icons.download_rounded,
                                  color: Colors.redAccent,
                                ),
                                onPressed: () {}, //Download video
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: linkValues.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.insert_link_rounded,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  linkValues[index],
                                  style: const TextStyle(color: Colors.redAccent),
                                ),
                                const Spacer(),
                                IconButton(
                                  icon: const Icon(
                                    Icons.copy,
                                    color: Colors.redAccent,
                                  ),
                                  onPressed: () {
                                    copyLink = linkValues[index];
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text("Link copied"),
                                    ));//Copy link
                                  }, //Download video
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
