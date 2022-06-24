import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';

class Downloader {
  Future<void> downloadVideo(String youTubeLink, String title, int iTag) async {
    return await FlutterYoutubeDownloader.downloadVideo(
        youTubeLink, title, iTag);
  }

  //YouTube video stream format codes
  //18 	mp4 	audio/video 	360p
  //22 	mp4 	audio/video 	720p
  //37 	mp4 	audio/video 	1080p
  //83 	mp4 	audio/video 	480p

}
