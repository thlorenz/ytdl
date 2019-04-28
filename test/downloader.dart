import '../lib/downloader.dart';
import 'package:test/test.dart';

const url = 'https://www.youtube.com/watch?v=fvws5tOHsEE';
const id = '7IG5kRFIMZw';

void main() {
  group('Argument Checks', () {
    test('Missing id and url', () {
      expect(() => YoutubeDownloader(), throwsArgumentError);
    });
    test('Given id', () {
      expect(YoutubeDownloader(id: id) is YoutubeDownloader, true);
    });
    test('Given url', () {
      expect(YoutubeDownloader(url: url) is YoutubeDownloader, true);
    });
    test('Given id and url', () {
      expect(() => YoutubeDownloader(id: id, url: url), throwsArgumentError);
    });
  });
}
