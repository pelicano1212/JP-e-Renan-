import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('IMC Calculator'),
        ),
        body: IMCCalculator(),
      ),
    );
  }
}

class IMCCalculator extends StatefulWidget {
  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double imc = 0.0;

  void calculateIMC() {
    double height = double.parse(heightController.text) / 100; // convertendo para metros
    double weight = double.parse(weightController.text);
    double calculatedIMC = weight / (height * height);
    setState(() {
      imc = calculatedIMC;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: heightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Height (cm)',
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: weightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Weight (kg)',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: calculateIMC,
            child: Text('Calculate IMC'),
          ),
          SizedBox(height: 20),
          Text(
            'Your IMC: ${imc.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
Neste exemplo:

TextEditingController é usado para controlar os campos de entrada de altura e peso.
A função calculateIMC() calcula o IMC com base nos valores inseridos nos campos de texto.
O resultado é exibido na tela após o cálculo.
Utiliza-se um StatefulWidget para permitir a atualização do estado quando o IMC é recalculado.
Você
diminua o codigo
ChatGPT
ChatGPT
Claro, aqui está uma versão mais concisa do código para calcular o IMC em Flutter:

dart
Copiar código
import 'package:flutter/material.dart';

void main() => runApp(IMCCalculator());

class IMCCalculator extends StatelessWidget {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double imc = 0.0;

    void calculateIMC() {
      double height = double.parse(heightController.text) / 100;
      double weight = double.parse(weightController.text);
      imc = weight / (height * height);
    }

    return MaterialApp(
      title: 'IMC Calculator',
      home: Scaffold(
        appBar: AppBar(title: Text('IMC Calculator')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Height (cm)'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Weight (kg)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateIMC,
                child: Text('Calculate IMC'),
              ),
              SizedBox(height: 20),
              Text(
                'Your IMC: ${imc.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}