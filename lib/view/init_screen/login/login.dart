
// import 'package:ecommagix/imports.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../imports.dart';
import '../../../widgets/text/text_builder.dart';
import '../../../widgets/text_filed/custom_text_field.dart';
import '../../appbar/app_name.dart';
import '../../home/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future authenticateUser(String username, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('https://fakestoreapi.com/auth/login'));
    request.body = json.encode({"username": username, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Fluttertoast.showToast(msg: "Successfully Logged in");
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (_) => const Home()), (route) => false);
    } else {
      Fluttertoast.showToast(msg: response.reasonPhrase.toString());
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        title: const AppName(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(height: Get.height*.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // AppName(),
              const SizedBox(height: 30.0),
              const TextBuilder(
                text: 'Login',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10.0),
              const TextBuilder(
                text: 'Please sign in to continue.',
                fontSize: 15.0,
                color: Colors.black,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  hintText: 'example@ideamagix.com',
                  prefixIcon: Icons.email),
              const SizedBox(height: 20.0),
              CustomTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  hintText: 'Password',
                  prefixIcon: Icons.lock),
              const SizedBox(height: 30.0),
              Center(
                child: MaterialButton(
                  height: 55.0,minWidth: Get.width,
                  color: Colors.green,
                  // minWidth: 250,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () {
                    authenticateUser(
                        _emailController.text, _passwordController.text);
                    // print(users[1]['email']);
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(builder: (_) => Home()),
                    //     (route) => false);
                  },
                  child: const TextBuilder(
                    text: 'LOGIN',
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: MaterialButton( height: 55.0,minWidth: Get.width,
                    shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    onPressed: () {
                       Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const Home()),
                        (route) => false);
                      
                    },
                    child: const TextBuilder(
                      text: "SKIP",
                      fontSize: 18,fontWeight: FontWeight.bold,
                    ),
                  )),
              const SizedBox(height: 50.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     TextBuilder(
              //       text: "Don't have an account? ",
              //       color: Colors.black,
              //     ),
              //     TextBuilder(
              //       text: 'Sign Up',
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold,
              //     )
              //   ],
              // ),
              const SizedBox(height: 50.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextBuilder(
                    text: "username-johnd",
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextBuilder(
                    text: 'Pass-m38rmF\$',
                    color: Colors.black,
                    // fontWeight: FontWeight.bold,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
