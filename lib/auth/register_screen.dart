import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFBE2831),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                constraints: const BoxConstraints(
                  minHeight: 270,
                ),
                padding: const EdgeInsets.all(26),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.ellipsis,
                            color: Colors.grey.shade300,
                            size: 32,
                          ),
                          const Spacer(),
                          const FaIcon(
                            FontAwesomeIcons.close,
                            color: Colors.grey,
                            size: 32,
                          ),
                        ],
                      ),
                    ),
                    Text.rich(TextSpan(
                      text: "",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                      children: [
                        TextSpan(
                          text: "Creer\nun\ncompte",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Full Name',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: const Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: const Icon(
                            Icons.email,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: const Icon(
                            Icons.lock,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Repeat Password',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: const Icon(
                            Icons.lock,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: checked,
                          onChanged: (value) {
                            setState(() {
                              checked = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: 'J\'accepte les ',
                              style: GoogleFonts.montserrat(),
                              children: [
                                TextSpan(
                                  text: 'termes et conditions',
                                  style: GoogleFonts.montserrat(
                                    color: const Color(0xFF0A5F2C),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFBE2831),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 14,
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Créer',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Vous avez déjà un compte? ',
                        style: GoogleFonts.montserrat(),
                        children: [
                          TextSpan(
                            text: 'Se connecter',
                            style: GoogleFonts.montserrat(
                              color: const Color(0xFFBE2831),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
