import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Information extends StatefulWidget {
  final String searchType;
  final String searchData;
  final String typeFirebase;

  const Information(this.searchData, this.searchType, this.typeFirebase,
      {Key? key})
      : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  late String copyLink = '';

  List<String> pdfValues = [
    'df434.pdf',
    'fr43d.pdf',
    'core.pdf',
    '4556D4.pdf',
    'df434.pdf',
    'fr43d.pdf',
    'core.pdf',
    '4556D4.pdf',
    'df434.pdf',
    'fr43d.pdf',
    'core.pdf',
    '4556D4.pdf'
  ];

  late double width;
  late double height;
  var pad;
  late double newHeight;
  late bool hasData = false;

  var resDescription;
  List<String> resLinks = [];
  List<String> resVidLinks = [];
  List<String> resImages = [];
  List<String> resImgLink = [];
  List<String> resPdf = [];
  List<String> resPdfLink = [];

  Map? res;

  @override
  void initState() {
    getData().whenComplete(() {
      setState(() {
        resDescription;
        resImgLink;
        resVidLinks;
        resImages;
        resLinks;
        hasData;
      });
    });
    super.initState();
  }

  Future getData() async {
    var collection = FirebaseFirestore.instance.collection(widget.typeFirebase);
    var docSnapshot = await collection.doc(widget.searchData).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      resDescription = data!['description'];
      try {
        resLinks = List.from(data['links']);
        resImages = List.from(data['images']);
        resPdf = List.from(data['pdf']);
        resVidLinks = List.from(data['videos']);
      } catch (e) {}
      hasData = true;
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Can not find a result",
          style: TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        ),
      ));
    }

    for (var element in resImages) {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child("${widget.typeFirebase}/${widget.searchData}/images/$element");
      String link = await ref.getDownloadURL();
      resImgLink.add(link);
    }
    for (var element in resPdf) {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child("${widget.typeFirebase}/${widget.searchData}/pdf/$element");
      String link = await ref.getDownloadURL();
      resPdfLink.add(link);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
      child: hasData
          ? Scaffold(
              key: _scaffoldKey,
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
                  Container(),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 10.0,
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
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 5),
                                      child: Text(
                                        //Description
                                        resDescription.toString(),
                                        style: const TextStyle(
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
                          icon: Icon(Icons.image_rounded,
                              color: Colors.redAccent),
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
                          icon:
                              Icon(Icons.link_rounded, color: Colors.redAccent),
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
                                imageProvider: CachedNetworkImageProvider(
                                    resImgLink[index]), //Image at 'index'
                                initialScale: PhotoViewComputedScale.covered,
                                basePosition: Alignment.center,
                                minScale: PhotoViewComputedScale.covered,
                              );
                            },
                            backgroundDecoration:
                                BoxDecoration(color: Colors.redAccent[100]),
                            itemCount: resImgLink.length,
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
                            itemCount: resPdf.length,
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
                                      resPdf[index],
                                      style: const TextStyle(
                                          color: Colors.redAccent),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.download_rounded,
                                        color: Colors.redAccent,
                                      ),
                                      onPressed: () async {
                                        try {
                                          /////////////

                                          //PDF download

                                          ////////////////////


                                        } on FirebaseException catch (e) {
                                          print(e);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                              "Unable to download ${resPdf[index]}",
                                              textAlign: TextAlign.center,style: const TextStyle(color: Colors.red),
                                            ),
                                          ));
                                        }
                                      }, //Download video
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: resVidLinks.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.insert_link_rounded,
                                        color: Colors.red,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        child: SizedBox(
                                          width: width - 100,
                                          child: GestureDetector(
                                            onLongPress: () {
                                              Clipboard.setData(ClipboardData(
                                                  text: resVidLinks[index]));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text(
                                                  "Link copied",
                                                  textAlign: TextAlign.center,
                                                ),
                                              ));
                                            },
                                            onTap: () async {
                                              Uri url = resVidLinks[index] as Uri;
                                              if (await canLaunchUrl(url)) {
                                                await launchUrl(url);
                                              } else {
                                                throw '';
                                              }
                                            },
                                            child: Text(
                                              resVidLinks[index],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: resLinks.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.insert_link_rounded,
                                        color: Colors.red,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        child: SizedBox(
                                          width: width - 100,
                                          child: GestureDetector(
                                            onLongPress: () {
                                              Clipboard.setData(ClipboardData(
                                                  text: resLinks[index]));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text(
                                                  "Link copied",
                                                  textAlign: TextAlign.center,
                                                ),
                                              ));
                                            },
                                            onTap: () async {
                                              Uri url = resLinks[index] as Uri;
                                              if (await canLaunchUrl(url)) {
                                                await launchUrl(url);
                                              } else {
                                                throw '';
                                              }
                                            },
                                            child: Text(
                                              resLinks[index],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                      ),
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
            )
          : const Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),
    );
  }
}
