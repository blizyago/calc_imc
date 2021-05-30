import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:calc_imc/home.dart';
import 'resultado.dart';

class Imc extends StatelessWidget {

  final Resultado resultado;

  const Imc({Key key, this.resultado}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage(resultado.image1),
                    ),
                    Image(
                      image: AssetImage(resultado.image2),
                    ),
                  ],

                ),
                Text(resultado.result,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(resultado.nome,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(resultado.descricao)

              ],
            ),
          ),
        ),
      ),

    );
  }

}


