import 'package:flutter/material.dart';
import '../models/user.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        backgroundColor: theme.colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailItem(
                          title: 'Name',
                          value: user.name,
                          icon: Icons.person,
                          theme: theme,
                        ),
                        DetailItem(
                          title: 'Username',
                          value: user.username ?? 'N/A',
                          icon: Icons.account_circle,
                          theme: theme,
                        ),
                        DetailItem(
                          title: 'Email',
                          value: user.email,
                          icon: Icons.email,
                          theme: theme,
                        ),
                        DetailItem(
                          title: 'Phone',
                          value: user.phone ?? 'N/A',
                          icon: Icons.phone,
                          theme: theme,
                        ),
                        DetailItem(
                          title: 'Website',
                          value: user.website ?? 'N/A',
                          icon: Icons.language,
                          theme: theme,
                        ),
                      ],
                    ),
                  ),
                ),
                if (user.address != null) ...[
                  const SizedBox(height: 16),
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: theme.colorScheme.primary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Address',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          DetailItem(
                            title: 'Street',
                            value: user.address!.street,
                            icon: Icons.streetview,
                            theme: theme,
                          ),
                          DetailItem(
                            title: 'Suite',
                            value: user.address!.suite,
                            icon: Icons.apartment,
                            theme: theme,
                          ),
                          DetailItem(
                            title: 'City',
                            value: user.address!.city,
                            icon: Icons.location_city,
                            theme: theme,
                          ),
                          DetailItem(
                            title: 'Zipcode',
                            value: user.address!.zipcode,
                            icon: Icons.local_post_office,
                            theme: theme,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final ThemeData theme;

  const DetailItem({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: theme.colorScheme.tertiary,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
