import 'package:e_commerce/helper/app_colors.dart';
import 'package:e_commerce/helper/app_images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscure = true;
  final _nameCtrl = TextEditingController();

  final _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[A-Za-z]{2,}$',
  );

  //
  final _passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&._#\-]).{6,}$',
  );

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _nameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Image.asset(
                AppImages.login,
                width: double.infinity,
                height: 218,
                fit: BoxFit.cover,
              ),
              Center(
                child: Text(
                  "ShopSmart",
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColors.prim,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  controller: _nameCtrl,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Name ",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.second,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    final v = value?.trim() ?? '';
                    if (v.isEmpty) return "Name is required";
                    if (v.length < 4) {
                      return "Name must be at least 4 characters";
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 15),

              // Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Email ",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.second,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    final v = value?.trim() ?? '';
                    if (v.isEmpty) return "Email is required";
                    if (!_emailRegex.hasMatch(v)) {
                      return "Enter a valid email like example@gmail.com";
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 15),

              // Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  controller: _passwordCtrl,
                  obscureText: _obscure,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.second,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => _obscure = !_obscure),
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  validator: (value) {
                    final v = value ?? '';
                    if (v.isEmpty) return "Password is required";
                    if (!_passwordRegex.hasMatch(v)) {
                      return "Min 6 chars incl. 1 Upper, 1 lower, 1 special (@\$!%*?&._#-)";
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 15),

              // Login button
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.third,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.go('/nav');
                    }
                  },
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.background,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),
              Center(
                child: Text(
                  "Have Account",
                  style: TextStyle(color: AppColors.second, fontSize: 14),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    context.push('/login');
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: AppColors.second, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
