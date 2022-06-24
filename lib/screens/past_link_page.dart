import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tube_downloader/widgets/custom_tile.dart';
import 'package:youtube_metadata/youtube_metadata.dart';

import '../services/downloader.dart';
import '../services/get_shared_data.dart';
import '../services/theme.dart';
import '../widgets/bottom_sheet.dart';

class PastLinkPage extends StatefulWidget {
  const PastLinkPage({Key? key}) : super(key: key);

  @override
  State<PastLinkPage> createState() => _PastLinkPageState();
}

class _PastLinkPageState extends State<PastLinkPage> {
  final _linkDonwloadedController = TextEditingController();
  late MetaDataModel metaData;

  @override
  void initState() {
    DataClass().sharedData().then((value) {
      setState(() {
        _linkDonwloadedController.text = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkk,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            //Textfield to enter the link copyed
            Container(
              padding: const EdgeInsets.only(top: 1, left: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: darkkk,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: TextFormField(
                controller: _linkDonwloadedController,
                cursorColor: whitee,
                autofocus: false,
                style: TextStyle(color: whitee),
                decoration: InputDecoration(
                  labelText: 'Paste a Youtube valid link here!',
                  labelStyle: TextStyle(color: dark),
                  border: InputBorder.none,
                  fillColor: whitee,
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: darkk,
                      width: 0,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            GestureDetector(
              onTap: () async {
                if (_linkDonwloadedController.text.isEmpty) {
                  Get.snackbar(
                    "ERROR",
                    "Please Enter A Link",
                    icon: Icon(Icons.error, color: Colors.white),
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: redish,
                    colorText: Colors.white,
                    borderRadius: 10,
                    margin: EdgeInsets.all(10),
                  );
                } else {
                  final url = _linkDonwloadedController.text.trim();

                  _choseQuality(url);
                }
              },
              //Download Button
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 4),
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: whitee,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: redish,
                ),
                child: Center(
                  child: Text(
                    'Download',
                    style: TextStyle(
                      color: whitee,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _choseQuality(String url) async {
    metaData = await YoutubeMetaData.getData(url);
    String vidTitile = metaData.title!;
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 4),
          width: 200,
          height: 500,
          color: Color(0xff202020),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  height: 6,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomTile(
                vidTitle: metaData.title!,
                thumbnailUrl: metaData.thumbnailUrl!,
                authorName: metaData.authorName!,
              ),
              BuiltBottomSheet(
                label: '360p',
                onTap: () {
                  //360p
                  Downloader().downloadVideo(url, vidTitile, 18);
                  Get.back();
                  _snackBBar();
                },
                clr: blueDatk,
              ),
              BuiltBottomSheet(
                label: '480',
                onTap: () {
                  //480
                  Downloader().downloadVideo(url, vidTitile, 83);
                  Get.back();
                  _snackBBar();
                },
                clr: blueDatk,
              ),
              BuiltBottomSheet(
                label: '720p',
                onTap: () {
                  //720p
                  Downloader().downloadVideo(url, vidTitile, 22);
                  Get.back();
                  _snackBBar();
                },
                clr: blueDatk,
              ),
              BuiltBottomSheet(
                label: '1080p',
                onTap: () {
                  //1080p
                  Downloader().downloadVideo(url, vidTitile, 37);
                  Get.back();
                  _snackBBar();
                },
                clr: blueDatk,
              ),
              Divider(
                color: Get.isDarkMode ? Colors.grey[600] : darkGreyClr,
              ),
              BuiltBottomSheet(
                label: 'Cancel',
                onTap: () {
                  Get.back();
                },
                clr: redish,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _snackBBar() {
    Get.snackbar(
      "SUCCESS",
      "Your Video is being downloading, Slide Down to see progress",
      icon: Icon(Icons.person, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      borderRadius: 10,
      margin: EdgeInsets.all(10),
    );
  }
}
