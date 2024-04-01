import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autocomplete',
      home: AutocompleteWidget(),
    );
  }
}

class AutocompleteWidget extends StatefulWidget {
  @override
  _AutocompleteWidgetState createState() => _AutocompleteWidgetState();
}


class _AutocompleteWidgetState extends State<AutocompleteWidget> {


  TextEditingController controler_Ubicacion = TextEditingController();

  static const List<String> estadosMexico = <String>[
    'Aguascalientes', 'Baja California', 'Baja California Sur', 'Campeche', 'Chiapas',
    'Chihuahua', 'Ciudad de México', 'Coahuila', 'Colima', 'Durango', 'Estado de México',
    'Guanajuato', 'Guerrero', 'Hidalgo', 'Jalisco', 'Michoacán', 'Morelos', 'Nayarit',
    'Nuevo León', 'Oaxaca', 'Puebla', 'Querétaro', 'Quintana Roo', 'San Luis Potosí',
    'Sinaloa', 'Sonora', 'Tabasco', 'Tamaulipas', 'Tlaxcala', 'Veracruz', 'Yucatán', 'Zacatecas',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Autocomplete',
          style: TextStyle(fontFamily: 'sans-serif-light'),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 60.0),


          Form(
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return estadosMexico.where((String option) {
                  return option.toLowerCase().startsWith(textEditingValue
                      .text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                debugPrint('You just selected $selection');
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController textEditingController,
                  FocusNode focusNode, VoidCallback onFieldSubmitted) {
                // Asigna el controlador al campo de texto
                controler_Ubicacion = textEditingController;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        labelText: "Ubicacion",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.location_on),

                      ),
                      onChanged: (String value) {
                        // Si el texto es vacío, llama a onFieldSubmitted para permitir la selección de un elemento de la lista
                      },
                    ),
                  ],
                );
              },
            ),
          ),


        ],
      ),
    );
  }
}
