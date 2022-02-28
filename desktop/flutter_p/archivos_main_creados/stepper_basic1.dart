/*
   Tema: Steper
   Una serie de pasos para una aplicacion movil y su funcionamiento
*/
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyStepper(),
  ));
}

class MyStepper extends StatefulWidget {
  const MyStepper({Key? key}) : super(key: key);

  @override
  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int _currentStep = 0;

  List<Step> mySteps = [
    new Step(title: new Text('Paso 1'), content: new Text('Aprender Futter')),
    new Step(title: new Text('Paso 2'), content: new Text('Desarrollar App')),
    new Step(
        title: new Text('Paso 3'), content: new Text('Publicar Aplicacion')),
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Demo Stepper'),
      ),
      body: new Container(
        child: new Stepper(
            //Nos indica cual es el paso actual del stepper
            currentStep: this._currentStep,
            steps: mySteps,
            //type: en q posicicion hrizontal o vertical, por defecto esta en vertical
            type: StepperType.horizontal,
            //Opcion para el boton de cancelar
            onStepCancel: () {
              setState(() {
                if (_currentStep > 0) {
                  _currentStep = _currentStep - 1;
                } else {
                  _currentStep = 0;
                }
              });
              print('Mi paso actual es: ' + _currentStep.toString());
            },
            //Para saltar los pasos y continuar al paso deseado
            onStepTapped: (step) {
              setState(() {
                _currentStep = step;
              });
              print('Mi paso actual es: ' + _currentStep.toString());
            },
            //Opcion para el boton de continuar
            onStepContinue: () {
              setState(() {
                if (_currentStep < mySteps.length - 1) {
                  _currentStep = _currentStep + 1;
                } else {
                  _currentStep = 0;
                }
              });
              print('Mi paso actual es: ' + _currentStep.toString());
            }),
      ),
    );
  }
}
