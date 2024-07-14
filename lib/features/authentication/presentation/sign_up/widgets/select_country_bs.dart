import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/authentication/authentication.dart';

class SelectCountryBS extends StatelessWidget {
  const SelectCountryBS({super.key});

  static Future<void> show(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: kWhiteColor,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(sr(kXtremeLarge)),
          topRight: Radius.circular(sr(kXtremeLarge)),
        ),
      ),
      builder: (context) => const SelectCountryBS(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: w(kGlobalPadding),
        right: w(kGlobalPadding),
        top: h(kfs32),
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Consumer<SignUpNotifier>(
        builder: (context, viewModel, _) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFieldWidget(
                        hintText: 'Search',
                        onChanged: viewModel.onChanged,
                        prefix: search.svg(),
                      ),
                    ),
                    hSpace(kfsMedium),
                    const TextWidget(
                      'Cancel',
                      onTap: goBack,
                      fontWeight: w700,
                      fontSize: kfsMedium,
                      textColor: kPrimaryColor,
                    ),
                  ],
                ),
                vSpace(kGlobalPadding),
                ListView.separated(
                  separatorBuilder: (_, __) => vSpace(kfs8),
                  shrinkWrap: true,
                  itemCount: viewModel.filteredCountries.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, int index) => _CountryTile(
                    isSelected: viewModel.selectedCountry ==
                        viewModel.filteredCountries[index],
                    onTap: () => viewModel
                        .selectCountry(viewModel.filteredCountries[index]),
                    country: viewModel.filteredCountries[index],
                  ),
                ),
                verticalGap(screenHeight * .04),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CountryTile extends StatelessWidget {
  const _CountryTile({
    required this.country,
    required this.isSelected,
    required this.onTap,
  });

  final Country country;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap.call();
        goBack();
      },
      child: AnimatedContainer(
        duration: duration500ms,
        curve: Curves.fastEaseInToSlowEaseOut,
        padding: EdgeInsets.symmetric(
          vertical: h(kfsExtraLarge),
          horizontal: w(kfsMedium),
        ),
        decoration: BoxDecoration(
          color: isSelected ? kBg2 : kWhiteColor,
          borderRadius: BorderRadius.circular(sr(kfsMedium)),
        ),
        child: Row(
          children: [
            country.countryFlag.svg(),
            hSpace(kfsMedium),
            TextWidget(
              country.countryCode,
              fontWeight: w500,
              fontSize: kfsMedium,
              textColor: kText4Color,
            ),
            hSpace(kfsMedium),
            TextWidget(
              country.name,
              fontWeight: w600,
              fontSize: kfsMedium,
              textColor: kPrimaryColor,
            ),
            const Spacer(),
            if (isSelected) checkMark.svg()
          ],
        ),
      ),
    );
  }
}
