import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = 'Informe seus dados';

  void _resetFields(){
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _infoText = 'Informe seus dados';
    });
  }

  void _calculate(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if(imc < 18.6){
        _infoText = 'Abaixo do peso (${imc.toStringAsPrecision(4)})';
      }else if(imc >= 18.6 && imc < 24.9){
        _infoText = 'Peso ideal (${imc.toStringAsPrecision(4)})';
      }
      else if(imc >= 24.9 && imc < 29.9){
        _infoText = 'Levemente acima do peso (${imc.toStringAsPrecision(4)})';
      }
      else if(imc >= 29.9 && imc < 34.9){
        _infoText = 'Obesidade Grau I (${imc.toStringAsPrecision(4)})';
      }
      else if(imc >= 34.9 && imc < 39.9){
        _infoText = 'Obesidade Grau II (${imc.toStringAsPrecision(4)})';
      }
      else if(imc >= 40){
        _infoText = 'Obesidade Grau III (${imc.toStringAsPrecision(4)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetFields,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(
              Icons.person_outline,
              size: 120.0,
              color: (Colors.green),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
                labelStyle: TextStyle(color: Colors.green),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green),
              controller: weightController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Altura (cm)',
                labelStyle: TextStyle(color: Colors.green),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green),
              controller: heightController,
            ),
            ElevatedButton(
              onPressed: _calculate,
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff4caf50),
                //padding: const EdgeInsets.only(top:10.0, bottom: 10.0),
              ),
              child: const Text(
                'Calcular',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
            Text(
              _infoText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 25.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
