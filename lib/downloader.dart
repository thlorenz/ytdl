import 'package:youtube_extractor/youtube_extractor.dart';
import './yt-id-from-url.dart';

class YoutubeDownloader {
  String _id;
  final String _url;
  final YouTubeExtractor _extractor;

  YoutubeDownloader({String id = null, String url = null})
      : this._id = id,
        this._url = url,
        this._extractor = YouTubeExtractor() {
    if (id == null && url == null) {
      throw ArgumentError('Need to provide either id or url');
    }
    if (id != null && url != null) {
      throw ArgumentError('Need to provide either id or url, but not both');
    }
    if (id == null) {
      this._id = ytIdFromUrl(this._url);
      if (this._id == null) throw ArgumentError('No id found in url ($url)');
    }
  }

  void download() async {
    final streamInfo = await this._extractor.getMediaStreamsAsync(this._id);
    print('URL ${streamInfo.muxed.first.url}');
  }
}
