import 'package:flutter/material.dart';

//Componentes
import '../components/fundo.dart';
import '../components/login/botao_login.dart';
import '../components/login/imagem_login.dart';

//Pages
import '../pages/lembrar_senha.dart';
import '../pages/criar_conta.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Snacks",
            style: TextStyle(fontFamily: "DancingScript", fontSize: 25.0)),
      ),
      body: Fundo(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const ImagemLogin(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.18),
              child: TextField(
                  controller: userController,
                  onChanged: (text) {
                    setState(() {});
                  },
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: true,
                  decoration: const InputDecoration(
                      fillColor: Colors.orange,
                      filled: true,
                      labelText: "Insira seu usuário",
                      border: OutlineInputBorder())),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.18),
              child: TextField(
                  controller: passwordController,
                  onChanged: (text) {
                    setState(() {});
                  },
                  obscureText: isVisible? false : true,
                  autocorrect: true,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: isVisible? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
                      fillColor: Colors.orange,
                      filled: true,
                      labelText: "Insira sua senha",
                      border: const OutlineInputBorder())),
            ),
            BotaoLogin(
                user: userController.text, password: passwordController.text),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CriarConta(),
                          ),
                        );
                      },
                      child: const Text("Criar conta")),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LembrarSenha(),
                          ),
                        );
                      },
                      child: const Text("Esqueci minha senha")),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
