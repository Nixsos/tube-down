import 'package:flutter/material.dart';
import 'package:tube_downloader/services/theme.dart';

// ignore: must_be_immutable
class CustomTile extends StatelessWidget {
  String vidTitle;
  String thumbnailUrl;
  String authorName;

  CustomTile({
    Key? key,
    required this.vidTitle,
    required this.thumbnailUrl,
    required this.authorName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      height: 110,
      width: 320, //SizeConfig.screenWidth * 0.9,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: dark,
        ),
        borderRadius: BorderRadius.circular(10),
        color: darkkk,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image.network(thumbnailUrl),
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Image.network(
                thumbnailUrl,
                fit: BoxFit.fill,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 160,
              height: 100,
              margin: EdgeInsets.all(4.0),
              child: Stack(
                children: [
                  Positioned(
                    top: 5,
                    child: SizedBox(
                      width: 160,
                      height: 80,
                      child: Text(
                        vidTitle,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: whitee,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: 160,
                      height: 20,
                      child: Text(
                        authorName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: whitee,
                            fontSize: 10,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
