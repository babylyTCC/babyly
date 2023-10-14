import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Pedagodino/widgets/menuitem.dart';

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return Stack(
              children: const [
                AlertDialog(
                  content: Text(
                      "Cheque seu email para acessar o link de troca de senha\n\nCaso a mensagem não apareça, verifique sua caixa de spam!"),
                ),
              ],
            );
          });
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content:
                  Text("O email informado não está registrado no aplicativo"),
            );
          });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text(
          "",
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            MenuItems(
              icon: Icons.location_on_outlined,
              text: "Local de atuação",
              ontap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text(
                            "No momento, nossa área de atuação é apenas na Região Metropolitana de Campinas. Com o seu apoio, poderemos expandir ainda mais nossas localizações!"),
                      );
                    });
              },
            ),
            MenuItems(
              icon: Icons.contacts_outlined,
              text: "Sobre o Aplicativo",
              ontap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text(
                            "Desenvolvido por: Vinícius Souza e Rian Beluzzo. 2023     Imagens utilizadas sem fins lucrativos."),
                      );
                    });
              },
            ),
            MenuItems(
                icon: Icons.key_outlined,
                text: "Alterar senha",
                ontap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Redefinição de Senha'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Para prosseguir, informe seu e-mail!"),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(100, 235, 237, 239),
                                prefixIcon: const Icon(Icons.mail,
                                    color: Colors.purple),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                hintText: "Email",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            MaterialButton(
                              onPressed: passwordReset,
                              color: Colors.purple,
                              child: const Text("Redefinir senha"),
                              textColor: Colors.white,
                            )
                          ],
                        ),
                      );
                    },
                  );

                  // MenuItems(
                  //     icon: Icons.phone_android_outlined,
                  //     text: "Two Factor Authentication",
                  //     ontap: () {}),
                  // MenuItems(
                  //     icon: Icons.quick_contacts_dialer_outlined,
                  //     text: "Legacy Contact",
                  //     ontap: () {}),
                  // MenuItems(icon: Icons.block, text: "Block User", ontap: () {}),
                  // MenuItems(icon: Icons.devices, text: "Devices", ontap: () {}),
                })
          ],
        ),
      ),
    );
  }
}
