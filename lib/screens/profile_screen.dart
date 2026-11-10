import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              'My Profile',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildProfileHeader(),
            const SizedBox(height: 28),
            _buildStatsRow(),
            const SizedBox(height: 28),
            _buildMenuSection(),
            const SizedBox(height: 24),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF6C63FF), Color(0xFF9D97FF)],
            ),
          ),
          child: const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 55, color: Color(0xFF6C63FF)),
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'Alex Johnson',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          'alex.johnson@email.com',
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 14),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF6C63FF)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
          ),
          child: const Text(
            'Edit Profile',
            style: TextStyle(color: Color(0xFF6C63FF)),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _StatItem(value: '12', label: 'Orders'),
          _Divider(),
          _StatItem(value: '5', label: 'Wishlist'),
          _Divider(),
          _StatItem(value: '3', label: 'Coupons'),
        ],
      ),
    );
  }

  Widget _buildMenuSection() {
    final items = [
      {'icon': Icons.shopping_bag_outlined, 'label': 'My Orders'},
      {'icon': Icons.location_on_outlined, 'label': 'Shipping Address'},
      {'icon': Icons.credit_card_outlined, 'label': 'Payment Methods'},
      {'icon': Icons.notifications_none, 'label': 'Notifications'},
      {'icon': Icons.help_outline, 'label': 'Help & Support'},
      {'icon': Icons.settings_outlined, 'label': 'Settings'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        children: List.generate(items.length, (i) {
          final item = items[i];
          final isLast = i == items.length - 1;
          return Column(
            children: [
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6C63FF).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    item['icon'] as IconData,
                    color: const Color(0xFF6C63FF),
                    size: 20,
                  ),
                ),
                title: Text(
                  item['label'] as String,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey.shade400,
                ),
                onTap: () {},
              ),
              if (!isLast)
                Divider(
                  height: 1,
                  indent: 65,
                  endIndent: 16,
                  color: Colors.grey.shade100,
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.logout, size: 18),
        label: const Text('Log Out'),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF5252).withOpacity(0.1),
          foregroundColor: const Color(0xFFFF5252),
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6C63FF),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 30,
      color: Colors.grey.shade200,
    );
  }
}