# ytdl

YouTube Video downloader in Dart.

## Synopsis

Provide it an `id` or `url` and it downloads the video file to a given path.

## Example


```dart
import 'ytdl.dart' as ytdl;

const url = 'https://youtu.be/ai5lnhaGm8U';

void main(List<String> args) async {
  final downloader =
      ytdl.YoutubeDownloader(args.length > 0 ? args.first : url);
  final downloadables = await downloader.options();
  for (final d in downloadables) {
    print('$d \n\n');
  }
  final res = await downloader.download(downloadables.first, '/tmp') ;
  print(res);
}
```

### Output

```
ID            : 684ea99b-664b-4062-bb71-4a1c416225cd
YoutubeID     : ai5lnhaGm8U
VideoEncoding : VideoEncoding.H264
VideoQuality  : VideoQuality.High720
AudioEncoding : AudioEncoding.Aac
Size          : 153.48 MB


https://r2---sn-pouxbg5-2qme.googlevideo.com/videoplayback?id=o-APcdWchpCorGCILwemzPds8A77MYdGTQQ9a32ok1Ryeu&itag=22&source=youtube&requiressl=yes&mm=31%2C29&mn=sn-pouxbg5-2qme%2Csn-nx5s7n7s&ms=au%2Crdu&mv=m&pl=26&ei=aozGXMH_AcmmkwaWyaPIAw&initcwndbps=1181250&mime=video%2Fmp4&ratebypass=yes&dur=2759.529&lmt=1552038409452994&mt=1556515816&fvip=5&c=WEB&txp=5535432&ip=209.210.2.134&ipbits=0&expire=1556537546&sparams=ip%2Cipbits%2Cexpire%2Cid%2Citag%2Csource%2Crequiressl%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Cei%2Cinitcwndbps%2Cmime%2Cratebypass%2Cdur%2Clmt&signature=05A65294B1521D377051DE6CE36061E5570B7543.1D0C0C4BC62CA5D18078AB178F6AAA45E7D54987&key=yt8



ID            : 1d6801ce-e098-4f86-a34e-56869f9cb245
YoutubeID     : ai5lnhaGm8U
VideoEncoding : VideoEncoding.Vp8
VideoQuality  : VideoQuality.Medium360
AudioEncoding : AudioEncoding.Vorbis
Size          : 218.64 MB


https://r2---sn-pouxbg5-2qme.googlevideo.com/videoplayback?id=o-APcdWchpCorGCILwemzPds8A77MYdGTQQ9a32ok1Ryeu&itag=43&source=youtube&requiressl=yes&mm=31%2C29&mn=sn-pouxbg5-2qme%2Csn-nx5s7n7s&ms=au%2Crdu&mv=m&pl=26&ei=aozGXMH_AcmmkwaWyaPIAw&initcwndbps=1181250&mime=video%2Fwebm&gir=yes&clen=229265182&ratebypass=yes&dur=0.000&lmt=1552042551703783&mt=1556515816&fvip=5&c=WEB&txp=5511222&ip=209.210.2.134&ipbits=0&expire=1556537546&sparams=ip%2Cipbits%2Cexpire%2Cid%2Citag%2Csource%2Crequiressl%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Cei%2Cinitcwndbps%2Cmime%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&signature=0B795C991622A1E2F090ADCAD7D6841EA9B0EC96.21ACC5366BA11ECCB4BB641CDD33D97849BF1567&key=yt8



ID            : 7e660e83-2aa0-46bd-9ea7-ad28bd152fe0
YoutubeID     : ai5lnhaGm8U
VideoEncoding : VideoEncoding.H264
VideoQuality  : VideoQuality.Medium360
AudioEncoding : AudioEncoding.Aac
Size          : 128.92 MB


https://r2---sn-pouxbg5-2qme.googlevideo.com/videoplayback?id=o-APcdWchpCorGCILwemzPds8A77MYdGTQQ9a32ok1Ryeu&itag=18&source=youtube&requiressl=yes&mm=31%2C29&mn=sn-pouxbg5-2qme%2Csn-nx5s7n7s&ms=au%2Crdu&mv=m&pl=26&ei=aozGXMH_AcmmkwaWyaPIAw&initcwndbps=1181250&mime=video%2Fmp4&gir=yes&clen=135181437&ratebypass=yes&dur=2759.529&lmt=1552033448137508&mt=1556515816&fvip=5&c=WEB&txp=5531432&ip=209.210.2.134&ipbits=0&expire=1556537546&sparams=ip%2Cipbits%2Cexpire%2Cid%2Citag%2Csource%2Crequiressl%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Cei%2Cinitcwndbps%2Cmime%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&signature=61DEC70224AD4949373786B9EB3B519C33938168.572DDFC5BF011B1FA9C9FEA81B240E05D082522B&key=yt8

/tmp/684ea99b-664b-4062-bb71-4a1c416225cd.mp4
```

The full path to the downloaded file
