import 'package:flutter/material.dart';
import 'package:schedule/store/themes.dart';
import 'package:schedule/widgets/common/modal.dart';
import 'package:provider/provider.dart';

class ThemeModal extends StatefulWidget {
  final int modeIndex;

  const ThemeModal(this.modeIndex, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ThemeModalState();
}

class _ThemeModalState extends State<ThemeModal> {
  int _themeMode = 0;

  @override
  void initState() {
    super.initState();
    _themeMode = widget.modeIndex;
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeProvider>();
    var watch = context.watch<ThemeProvider>();
    return Modal(
      title: const Text("Theme"),
      content: SizedBox(
        height: 108,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  ThemeProvider.colors.length,
                  (index) {
                    return InkWell(
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ThemeProvider.colors[index],
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black45,
                            width: index == watch.colorIndex ? 2 : 0,
                          ),
                        ),
                        child: InkResponse(
                          onTap: () {
                            theme.setColor(index);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Mode"),
                DropdownButton<int>(
                  alignment: Alignment.centerLeft,
                  icon: const Icon(Icons.ac_unit),
                  hint: const Text("Theme Mode"),
                  value: _themeMode,
                  items: const [
                    DropdownMenuItem(
                      child: Text("System"),
                      value: 0,
                    ),
                    DropdownMenuItem(
                      child: Text("Light"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Dark"),
                      value: 2,
                    ),
                  ],
                  onChanged: (select) {
                    setState(() => _themeMode = select ?? _themeMode);
                    if (select != null) {
                      theme.setMode(select);
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text("OK"),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
