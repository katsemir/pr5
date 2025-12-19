import 'package:flutter/material.dart';
import 'app_button.dart';
import 'app_input.dart';
import 'app_select.dart';

void main() {
  runApp(MyApp());
}

// --- Головний додаток ---
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo UI',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DemoUI(),
    );
  }
}

// --- Demo UI Сторінка ---
class DemoUI extends StatefulWidget {
  @override
  _DemoUIState createState() => _DemoUIState();
}

class _DemoUIState extends State<DemoUI> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo UI')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('AppButton examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              AppButton(
                label: 'Filled Button',
                backgroundColor: Colors.blue,
                labelColor: Colors.white,
                onPressed: () => print('Filled Button Pressed'),
                type: ButtonType.filled,
              ),
              SizedBox(height: 10),
              AppButton(
                label: 'Online Button',
                backgroundColor: Colors.transparent,
                labelColor: Colors.blue,
                onPressed: () => print('Online Button Pressed'),
                type: ButtonType.online,
              ),
              SizedBox(height: 20),
              Text('AppInput examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              AppInput(
                hintText: 'Enter your name',
              ),
              SizedBox(height: 10),
              AppInput(
                hintText: 'Enter your email',
                borderColor: Colors.green,
              ),
              SizedBox(height: 20),
              Text('AppSelect examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              AppSelect(
                options: ['Option 1', 'Option 2', 'Option 3'],
                selectedValue: selectedValue,
                onChanged: (val) => setState(() => selectedValue = val),
                hint: 'Select an option',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
