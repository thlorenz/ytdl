import 'package:youtube_extractor/youtube_extractor.dart';
import 'package:youtube_extractor/src/models/media_streams/video_quality.dart';
import 'package:youtube_extractor/src/models/media_streams/video_encoding.dart';
import 'package:youtube_extractor/src/models/media_streams/audio_encoding.dart';
import 'package:youtube_extractor/src/models/media_streams/muxed_stream_info.dart';

import 'package:filesize/filesize.dart' as filesize;
import 'package:uuid/uuid.dart' as uuid;
import 'dart:io' as io;
import 'package:http/http.dart' as http;

import './yt-id-from-url.dart';

class YouTubeDownloadable {
  final String _id;
  final String _youtubeID;
  final String _streamUrl;
  final VideoEncoding _videoEncoding;
  final VideoQuality _videoQuality;
  final AudioEncoding _audioEncoding;
  final int _size;
  final String _humanSize;

  YouTubeDownloadable._(
      this._id,
      this._youtubeID,
      this._streamUrl,
      this._videoEncoding,
      this._videoQuality,
      this._audioEncoding,
      this._size,
      this._humanSize);

  factory YouTubeDownloadable(MuxedStreamInfo stream, String youtubeID) {
    final id = uuid.Uuid().v4();
    return YouTubeDownloadable._(
        id,
        youtubeID,
        stream.url,
        stream.videoEncoding,
        stream.videoQuality,
        stream.audioEncoding,
        stream.size,
        filesize.filesize(stream.size));
  }

  @override
  String toString() {
    return """
      ID            : $id
      YoutubeID     : $youtubeID
      VideoEncoding : $videoEncoding
      VideoQuality  : $videoQuality
      AudioEncoding : $audioEncoding
      Size          : $humanSize


      $streamUrl
    """;
  }

  String get id => _id;
  String get youtubeID => _youtubeID;
  String get streamUrl => _streamUrl;
  VideoEncoding get videoEncoding => _videoEncoding;
  VideoQuality get videoQuality => _videoQuality;
  AudioEncoding get audioEncoding => _audioEncoding;
  int get size => _size;
  String get humanSize => _humanSize;
}

class YoutubeDownloader {
  final String _id;
  final YouTubeExtractor _extractor;

  YoutubeDownloader(String url)
      : this._extractor = YouTubeExtractor(),
        this._id = ytIdFromUrl(url) {
    if (this._id == null)
      throw ArgumentError('URL did not contain valid video id');
  }

  Future<List<YouTubeDownloadable>> options() async {
    final List<YouTubeDownloadable> downloadables = List<YouTubeDownloadable>();
    final streamInfo = await this._extractor.getMediaStreamsAsync(this._id);

    for (final stream in streamInfo.muxed) {
      downloadables.add(YouTubeDownloadable(stream, this._id));
    }
    return downloadables;
  }

  Future<String> download(
      YouTubeDownloadable downloadable, String directory) async {
    // todo: may need different file ending depending on video encoding
    final filePath = '${directory}/${downloadable.id}.mp4';
    try {
      final res = await http.get(downloadable.streamUrl);
      if (res.statusCode != 200) {
        throw StateError('Unable to download stream, ' +
            'got status code ${res.statusCode} (${res.reasonPhrase})');
      }
      if (res.contentLength == 0) {
        throw StateError('Unable to download stream, got no content');
      }
      final file = io.File(filePath);
      await file.writeAsBytes(res.bodyBytes);
      return file.path;
    } catch (err) {
      rethrow;
    }
  }
}
