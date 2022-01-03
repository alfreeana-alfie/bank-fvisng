import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/utils/values.dart';
import 'package:google_fonts/google_fonts.dart';

import 'drawer_child.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Styles.accentColor,
            ),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  constraints: const BoxConstraints(minWidth: 20, maxWidth: 70),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(Values.userPath),
                    minRadius: 10,
                    maxRadius: 40,
                  ),
                ),
                Text('Admin Admin',
                    style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Styles.whiteColor)),
              ],
            ),
          ),
          
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: Text(Str.dashboardTxt,
                style: GoogleFonts.nunitoSans(
                    color: Styles.textColor.withOpacity(1))),
            onTap: () => {
              Navigator.pushReplacementNamed(context, RouteSTR.dashboardAdmin)
            },
          ),
          ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            leading: const Icon(Icons.transfer_within_a_station),
            title: Text(Str.depositTxt),
            children: [
              DrawerChild(
                title: Str.depositListTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.depositList);
                  },
              ),
              DrawerChild(
                title: Str.createDepositTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.createDeposit);
                  },
              ),
            ],
          ),
          ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            leading: const Icon(Icons.transfer_within_a_station),
            title: Text(Str.usersTxt),
            children: [
              DrawerChild(
                title: Str.userListTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.usersList);
                  },
              ),
              DrawerChild(
                title: Str.createUserTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.createUsers);
                  },
              ),
              DrawerChild(
                title: Str.userRoleListTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.userRoleList);
                  },
              ),
              DrawerChild(
                title: Str.createUserRoleTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.createUserRole);
                  },
              ),
              DrawerChild(
                title: Str.permissionListTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.permissionList);
                  },
              ),
              DrawerChild(
                title: Str.createPermissionTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.createPermission);
                  },
              ),
            ],
          ),
          ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            leading: const Icon(Icons.transfer_within_a_station),
            title: Text(Str.loanManagementTxt),
            children: [
              DrawerChild(
                title: Str.createLoanProductTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.createLoanProduct);
                  },
              ),
              DrawerChild(
                title: Str.loanListTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.loanProductList);
                  },
              ),
              DrawerChild(
                title: Str.loanCalculatorTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.loanCalculator);
                  },
              ),
            ],
          ),
          ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            leading: const Icon(Icons.money),
            title: Text(Str.fixedDepositTxt),
            children: [
              DrawerChild(
                title: Str.allFdrTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.fdrPlanList);
                  },
              ),
              DrawerChild(
                title: Str.createFdrPlanTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.createPlanFDR);
                  },
              ),
            ],
          ),
          ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            leading: const Icon(Icons.list_alt),
            title: Text(Str.allTransactionsTxt),
            children: [
              DrawerChild(
                title: Str.wireTransferTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.createWireTransfer);
                  },
              ),
              DrawerChild(
                title: Str.wireTransferListTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.wireTransferList);
                  },
              ),
              DrawerChild(
                title: Str.sendMoneyListTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.sendMoneyList);
                  },
              ),
              DrawerChild(
                title: Str.exchangeMoneyListTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.exchangeMoneyList);
                  },
              ),
            ],
          ),
          const Divider(
            indent: 10,
            endIndent: 10,
            height: 1,
            thickness: 1,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Values.horizontalValue * 2,
                vertical: Values.verticalValue),
            child: Text(
              Str.systemSettingsTxt,
              style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Styles.textColor.withOpacity(0.5)),
            ),
          ),
          // SYSTEM SETTINGS
          ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            leading: const Icon(Icons.money),
            title: Text(Str.branchTxt),
            children: [
              DrawerChild(
                title: Str.branchListTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.branchList);
                  },
              ),
              DrawerChild(
                title: Str.createBranchTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.createBranch);
                  },
              ),
            ],
          ),
          ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            leading: const Icon(Icons.money),
            title: Text(Str.otherBankTxt),
            children: [
              DrawerChild(
                title: Str.otherBankListTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.otherBankList);
                  },
              ),
              DrawerChild(
                title: Str.createOtherBankTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.createBank);
                  },
              ),
            ],
          ),
          ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            leading: const Icon(Icons.money),
            title: Text(Str.currencyTxt),
            children: [
              DrawerChild(
                title: Str.currencyListTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.currencyList);
                  },
              ),
              DrawerChild(
                title: Str.createCurrencyTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.createCurrency);
                  },
              ),
            ],
          ),
          ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            leading: const Icon(Icons.money),
            title: Text(Str.websiteManagementTxt),
            children: [
              DrawerChild(
                title: Str.faqListTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.faqList);
                  },
              ),
              DrawerChild(
                title: Str.createFaqTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.createFaq);
                  },
              ),
              // Navigation
              DrawerChild(
                title: Str.navigationListTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.navigationList);
                  },
              ),
              DrawerChild(
                title: Str.createNavigationTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.createNavigation);
                  },
              ),
              // Navigation Item
              DrawerChild(
                title: Str.navigationItemListTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.navigationItemList);
                  },
              ),
              DrawerChild(
                title: Str.createNavigationItemTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.createNavigationItem);
                  },
              ),
              // Services
              DrawerChild(
                title: Str.serviceListTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.serviceList);
                  },
              ),
              DrawerChild(
                title: Str.createServiceTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.createService);
                  },
              ),
              // Team
              DrawerChild(
                title: Str.teamListTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.teamList);
                  },
              ),
              DrawerChild(
                title: Str.createTeamTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.createTeam);
                  },
              ),
              // Testimonial
              DrawerChild(
                title: Str.testimonialListTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.testimonialList);
                  },
              ),
              DrawerChild(
                title: Str.createTestimonialTxt,
                onNavigate: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteSTR.createTestimonial);
                  },
              ),
            ],
          ),
           // SYSTEM SETTINGS
          ListTile(
            leading: const Icon(Icons.business),
            title: Text(Str.profileOverviewTxt,
                style: GoogleFonts.nunitoSans(
                    color: Styles.textColor.withOpacity(1))),
            onTap: () =>
                {Navigator.pushNamed(context, RouteSTR.profileOverview)},
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: Text(Str.signOutTxt,
                style: GoogleFonts.nunitoSans(
                    color: Styles.textColor.withOpacity(1))),
            onTap: () =>
                {Navigator.pushReplacementNamed(context, RouteSTR.signOut)},
          ),
        ],
      ),
    );
  }
}
