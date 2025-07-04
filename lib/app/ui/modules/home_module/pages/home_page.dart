import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController get controller => widget.homeController;

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.init();
        },
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    context.appLocalizations.welcome_back,
                    style: context.textTheme.titleLarge,
                  ),
                  // say to enjoy the app in a fancy way
                  Text(
                    context.appLocalizations.enjoy_the_app_in_a_fancy_way,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: controller.store.searchController,
                    decoration: InputDecoration(
                      hintText: context.appLocalizations.search,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListenableBuilder(
              listenable: controller.store.searchController,
              builder: (BuildContext context, Widget? child) {
                if (controller.store.isSearching) {
                  return const SizedBox();
                }

                return child!;
              },
              child: Column(
                children: [
                  LeadsSection(
                    controller: controller,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SectionDivider(
                leading: Text(
                  context.appLocalizations.featured,
                  style: context.textTheme.titleMedium,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ListenableBuilder(
              listenable: Listenable.merge([controller.store, controller.store.searchController]),
              builder: (context, child) {
                final store = controller.store;

                return ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  itemExtent: BigVerticalCard.height + 16,
                  itemCount: store.vehiclesCount,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: store.loading
                          ? BigVerticalCard.skeleton()
                          : VehicleBigVerticalCard(
                              vehicle: store.vehicles[index],
                              onPressed: () {
                                controller.leadVehicle(store.vehicles[index]);
                              },
                            ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
