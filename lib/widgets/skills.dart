import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class StateMachineSkills extends StatefulWidget {
  const StateMachineSkills({Key? key}) : super(key: key);

  @override
  _StateMachineSkillsState createState() => _StateMachineSkillsState();
}

class _StateMachineSkillsState extends State<StateMachineSkills> {
  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard? _riveArtboard;
  StateMachineController? _controller;
  SMIInput<double>? _levelInput;
  String? _level;

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/skills.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artboard, 'Designer\'s Test');
        if (controller != null) {
          artboard.addController(controller);
          _levelInput = controller.findInput('Level');
        }
        setState(() => _riveArtboard = artboard);
      },
    );

    _level = 'Baby';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff390a3b),
      body: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : Stack(
                children: [
                  Positioned.fill(
                    child: Stack(
                      alignment: Alignment(0.0, 0.5),
                      children: [
                        Rive(
                          artboard: _riveArtboard!,
                          fit: BoxFit.fitHeight,
                        ),
                        Text(
                          _level!,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    bottom: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          child: const Text('Baby'),
                          onPressed: () {
                            _levelInput?.value = 0;
                            setState(() {
                              _level = 'Baby';
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          child: const Text('Adult'),
                          onPressed: () {
                            _levelInput?.value = 1;
                            setState(() {
                              _level = 'Adult';
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          child: const Text('Elder'),
                          onPressed: () {
                            _levelInput?.value = 2;
                            setState(() {
                              _level = 'Elder';
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}