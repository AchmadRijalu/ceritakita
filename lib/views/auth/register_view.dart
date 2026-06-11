part of '../views.dart';

class RegisterView extends StatefulWidget {
  static const appRoute = '/register';
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        context.go(LoginView.appRoute);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            l10n.appTitle,
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
          ),
          shadowColor: greyColor,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.createAccount,
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 8),
                Text(l10n.joinCommunity),
                const SizedBox(height: 24),
                CustomFormField(
                  title: l10n.fullName,
                  hintText: l10n.enterFullName,
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.fullNameRequired;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  title: l10n.emailAddress,
                  hintText: l10n.emailHint,
                  keyBoardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.emailRequired;
                    }
                    if (!RegExp(
                      r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return l10n.emailInvalid;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  title: l10n.password,
                  hintText: "••••••••",
                  keyBoardType: TextInputType.visiblePassword,
                  isPasswordField: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.passwordRequired;
                    }
                    if (value.length < 8) {
                      return l10n.passwordMin8;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      l10n.atLeast8Characters,
                      style: blackTextStyle.copyWith(
                        fontSize: 11,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Consumer<AuthProvider>(
                  builder: (context, value, child) => CustomFilledButton(
                    title: value.isLoading ? l10n.loading : l10n.register,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final authContext = context.read<AuthProvider>();
                        await authContext.fetchRegister(
                          _nameController.text,
                          _emailController.text,
                          _passwordController.text,
                        );

                        if (!mounted) return;

                        if (authContext.isSuccess) {
                          final message =
                              authContext.successMessage ??
                              l10n.registrationSuccessful;
                          authContext.reset();
                          context.go(LoginView.appRoute, extra: message);
                        } else if (authContext.isFailure) {
                          showSnackBar(
                            context,
                            authContext.errorMessage ?? l10n.registerFailed,
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
