import 'package:flutter/material.dart';
import 'widgets/app_button.dart';
import 'widgets/app_input.dart';
import 'widgets/app_select.dart';
import 'widgets/animated_counter.dart';

void main() {
  runApp(MyApp());
}

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
              // --- AppButton Examples ---
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

              // --- AppInput Examples ---
              Text('AppInput examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              AppInput(hintText: 'Enter your name'),
              SizedBox(height: 10),
              AppInput(hintText: 'Enter your email', borderColor: Colors.green),
              SizedBox(height: 20),

              // --- AppSelect Examples ---
              Text('AppSelect examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              AppSelect(
                options: ['Option 1', 'Option 2', 'Option 3'],
                selectedValue: selectedValue,
                onChanged: (val) => setState(() => selectedValue = val),
                hint: 'Select an option',
              ),
              SizedBox(height: 20),

              // --- AnimatedCounter Example ---
              Text('Animated Counter Example:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              AnimatedCounter(
                initialValue: 10,
                maxValue: 50,
                primaryColor: Colors.green,
                animationDuration: Duration(milliseconds: 300),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
