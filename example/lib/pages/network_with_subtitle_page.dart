import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meedu_player/meedu_player.dart';

class NetworkWithSubtitlesPage extends StatefulWidget {
  @override
  _NetworkWithSubtitlesPageState createState() =>
      _NetworkWithSubtitlesPageState();
}

class _NetworkWithSubtitlesPageState extends State<NetworkWithSubtitlesPage> {
  late MeeduPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MeeduPlayerController(
      controlsStyle: ControlsStyle.primary,

    );
    this._setDataSource();
  }

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }

  _setDataSource() async {
    await _controller.setDataSource(
      DataSource(
        source:
            "https://video-downloads.googleusercontent.com/AGQNM9L-rwONoN1oNi0SMMENawziHfv4lJIs2oKuMutSzlfl8rV2RjckG-iad-4mCDQe2ROIguzs2ZdQYTmH5RSjs6PVaVP_xTmnRIUy4cjNZ95xAQZwNqxiC-Y9xRtMIbfxGs9vdi_wKu9Tg9E3vv8aU4IPncAmfrofDyJF8Od4bAKzq-27Bxb_Wa7gK3My0B4gVME1jeN7KhIZfC62s1SzfhuTxFI2BXIgvdrxssbyqY2SMEnSCjE",
        type: DataSourceType.network,
      ),
      autoplay: true,
    );
    _controller.onClosedCaptionEnabled(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: MeeduVideoPlayer(
            controller: this._controller,
            header: (ctx, controller, responsive) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black12,
                    child: Container(
                      height: 40,
                      width: 40,
                      child: CupertinoButton(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          CupertinoIcons.back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
