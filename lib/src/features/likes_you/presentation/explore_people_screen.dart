import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widget/explore_people_app_bar_widget.dart';
import 'package:sarang_app/src/common_widget/explore_people_button_widget.dart';
import 'package:sarang_app/src/common_widget/match_card_widget.dart';
import 'package:sarang_app/src/features/authentication/data/data_user_account_local.dart';
import 'package:sarang_app/src/features/authentication/domain/user_account.dart';

class ExplorePeopleScreen extends StatefulWidget {
  static const String routeName = '/explore-people';
  const ExplorePeopleScreen({super.key});

  @override
  State<ExplorePeopleScreen> createState() => _ExplorePeopleScreenState();
}

class _ExplorePeopleScreenState extends State<ExplorePeopleScreen> {
  UserAccount? account;

  getDataUserAccount() async {
    final data = await DataUserAccountLocal.getDataUserAccountFromStorage();
    final result = UserAccount.fromMap(data);
    account = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDataUserAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 40.0,
          horizontal: 24.0,
        ),
        child: Column(
          children: [
            ExplorePeopleAppBarWidget(
              imagePath: account?.imageProfile,
            ),
            SizedBox(
              height: 50.0,
            ),
            Expanded(
              child: Column(
                children: const [
                  Expanded(child: MatchCardWidget()),
                  SizedBox(
                    height: 50.0,
                  ),
                  ExplorePeopleButtonWidget()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
