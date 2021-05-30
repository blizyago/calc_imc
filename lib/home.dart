import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'resultado.dart';
import 'calcular.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Home createState() => Home();
}

class Home extends State<HomeScreen> {

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados!";

  void _resetarCampos(){
    pesoController.text= "";
    alturaController.text = "";
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }
  int calcular(){
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text) /100;
    double imc = peso / (altura * altura);
    int indice =0;
    setState(() {

      if(imc < 18.6){
      } else if (imc >= 18.6 && imc <24.9){
        indice =1;
      } else if (imc >= 24.9 && imc < 29.9){
        indice =2;
      } else if (imc >= 29.9 && imc < 34.9){
        indice =3;
      } else if (imc >= 34.9 && imc < 39.9){
        indice =4;
      } else if (imc >= 40){
        indice =5;
      }
    });
    return indice;
  }
  final resultados =[
    Resultado("assets/imc_m_06.png", "assets/imc_06.png",
        "18,5 ou menos",
        "Abaixo do Normal",
        "Procure um médico. Algumas pessoas têm um baixo peso por características "
            "do seu organismo e tudo bem. Outras podem estar enfrentando problemas,"
            " como a desnutrição. É preciso saber qual é o caso."),

    Resultado("assets/imc_m_05.png", "assets/imc_05.png",
        "Entre 18.6 e 24.9",
        "Normal",
        "Que bom que você está com o peso normal! E o melhor jeito de continuar "
            "assim é mantendo um estilo de vida ativo e uma alimentação equilibrada."),

    Resultado("assets/imc_m_04.png", "assets/imc_04.png",
        "Entre 25,0 e 29,9",
        "Sobrepeso",
        "Ele é, na verdade, uma pré-obesidade e muitas pessoas nessa faixa já "
            "apresentam doenças associadas, como diabetes e hipertensão. Importante"
            " rever hábitos e buscar ajuda antes de, por uma série de fatores, entrar"
            " na faixa da obesidade pra valer."),

    Resultado("assets/imc_m_03.png", "assets/imc_03.png",
        "Entre 30,0 e 34,9",
        "Obesidade Grau I",
        "Sinal de alerta! Chegou na hora de se cuidar, mesmo que seus exames sejam"
            " normais. Vamos dar início a mudanças hoje! Cuide de sua alimentação."
            " Você precisa iniciar um acompanhamento com nutricionista e/ou endocrinologista."),

    Resultado("assets/imc_m_02.png", "assets/imc_02.png",
        "Entre 35,0 e 39,9",
        "Obesidade Grau II",
        "Mesmo que seus exames aparentem estar normais, é hora de se cuidar, iniciando mudanças"
            " no estilo de vida com o acompanhamento próximo de profissionais de saúde."),

    Resultado("assets/imc_m_01.png", "assets/imc_01.png",
        "Acima de 40,0",
        "Obesidade Grau III",
        "Aqui o sinal é vermelho, com forte probabilidade de já existirem doenças muito"
            " graves associadas. O tratamento deve ser ainda mais urgente.")

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        actions:<Widget> [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed:_resetarCampos,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget> [
                  TextFormField(keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Peso (kg)",
                      labelStyle: TextStyle(
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 25.00),
                    controller: pesoController,
                    validator: (value) {
                      if(value.isEmpty){
                        return "Insira seu Peso!";
                      }
                      return null;
                    },
                  ),
                  TextFormField(keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Altura (cm)",
                      labelStyle: TextStyle(
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 25.00),
                    controller: alturaController,
                    validator: (value) {
                      if(value.isEmpty){
                        return "Insira sua Altura!";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:20.0,bottom: 20.0),
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            int i = calcular();
                            Resultado resultado = resultados[i];
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: ((context) => Imc(
                                  resultado: resultado,
                                )),
                                ));
                          }
                        },
                        child: Text("Calcular",
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                  Text(
                    "Informe seus dados!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 25.0),
                  )
                ],
              ),
            )
        ),

      ),

    );
  }
}