import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Política de privacidad'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Política de privacidad',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(
                  'La presente Política de Privacidad establece los términos en que YouAreNumeroUno usa y protege la información que es proporcionada por sus usuarios al momento de utilizar su producto. Esta compañía está comprometida con la seguridad de los datos de sus usuarios. Cuando le pedimos llenar los campos de información personal con la cual usted pueda ser identificado, lo hacemos asegurando que sólo se empleará de acuerdo con los términos de este documento. Sin embargo esta Política de Privacidad puede cambiar con el tiempo o ser actualizada por lo que le recomendamos y enfatizamos revisar continuamente esta página para asegurarse que está de acuerdo con dichos cambios.',
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(height: 40),
                Text(
                  'Información que es recogida',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(
                  'Nuestra aplicacion podrá recoger información personal por ejemplo: Nombre, sexo, edad, estatura y peso.',
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(height: 40),
                Text(
                  'Uso de la información recogida',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(
                  'Nuestra aplicacion emplea la información con el fin de proporcionar el mejor servicio posible, particularmente por el bien de los usuarios y mejorar nuestros productos y servicios. Es posible que sean enviados correos electrónicos periódicamente a través de nuestro sitio con ofertas especiales, nuevos productos y otra información publicitaria que consideremos relevante para usted o que pueda brindarle algún beneficio.',
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(height: 40),
                Text(
                  'Sugerencias',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(
                  'Por favor si hay algo en lo que debemos mejorar dejanos un correo en la siguiente dirección:',
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(height: 10),
                Text('YouAreNumeroUno.Fitness@teleline.es',
                    style: TextStyle(fontSize: 15))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
