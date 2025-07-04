import 'package:flutter/material.dart';

class ProfileWire extends StatefulWidget {
  const ProfileWire({
    super.key,
    required this.controller,
  });

  final ProfileController controller;

  @override
  State<ProfileWire> createState() => _ProfileWireState();
}

class _ProfileWireState extends State<ProfileWire> {
  void _onDeleteAccount() {
    DeleteAccountConfirmDialog.show(context).then((value) {
      if (value) {
        widget.controller.deleteAccount();
      }
    });
  }

  void _onLogout() {
    LogoutConfirmDialog.show(context).then((value) {
      if (value) {
        widget.controller.logout();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //confirm email
          ListTile(
            leading: const Icon(Icons.email),
            title: Text(context.appLocalizations.confirm_email),
            onTap: () {
              widget.controller.sendEmailVerification();
            },
          ),

          ListTile(
            leading: const Icon(Icons.delete),
            title: Text(context.appLocalizations.delete_account),
            onTap: _onDeleteAccount,
          ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(context.appLocalizations.logout),
            onTap: _onLogout,
          ),
        ],
      ),
    );
  }
}
