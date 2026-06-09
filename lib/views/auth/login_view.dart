part of '../views.dart';

class LoginView extends StatefulWidget {
  static const appRoute = '/login';

  const LoginView({super.key, this.registerSuccessMessage});

  final String? registerSuccessMessage;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final message = widget.registerSuccessMessage;
    if (message != null && message.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        showSnackBar(context, message, backgroundColor: greenColor);
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppImage.logo.image(width: 122),
                const SizedBox(height: 24),
                Text(
                  "Hello There!",
                  style: blackTextStyle.copyWith(
                    color: blackColor,
                    fontWeight: bold,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Sign in to Continue",
                  style: blackTextStyle.copyWith(
                    color: blackColor,
                    fontWeight: regular,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  title: "Email Address",
                  hintText: "john.dave@gmail.com",
                  keyBoardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(
                      r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  title: "Password",
                  hintText: "",
                  isPasswordField: true,
                  keyBoardType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                Consumer<AuthProvider>(
                  builder: (context, value, child) {
                    return CustomFilledButton(
                      title: value.isLoading ? "Loading..." : "Login",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final auth = context.read<AuthProvider>();

                          await auth.fetchLogin(
                            _emailController.text,
                            _passwordController.text,
                          );
                          if (!mounted) return;
                          if (auth.isFailure) {
                            showSnackBar(
                              context,
                              auth.errorMessage ?? 'Login failed',
                            );
                          }
                        }
                      },
                    );
                  },
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    CustomTextButton(
                      title: "Register",
                      onPressed: () => context.go(RegisterView.appRoute),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
