import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const Color navy = Color(0xFF07111F);
const Color panel = Color(0xFF101F32);
const Color cyan = Color(0xFF48E5F0);
const Color muted = Color(0xFF9AAFC5);

void main() {
  runApp(const JhansiPortfolio());
}

class JhansiPortfolio extends StatelessWidget {
  const JhansiPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A JHANSI | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: navy,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: cyan,
          brightness: Brightness.dark,
        ),
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final Map<String, GlobalKey> sections = {
    'Home': GlobalKey(),
    'About': GlobalKey(),
    'Education': GlobalKey(),
    'Skills': GlobalKey(),
    'Projects': GlobalKey(),
    'Experience': GlobalKey(),
    'Contact': GlobalKey(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 850;

          return SingleChildScrollView(
            child: Column(
              children: [
                _navigation(context, sections, wide),
                _hero(
                  context,
                  sections['Home']!,
                  sections['Projects']!,
                  sections['Contact']!,
                  wide,
                ),
                _section(
                  sections['About']!,
                  '01 / ABOUT ME',
                  'Building my future in technology.',
                  'I am a Computer Science and Engineering student interested '
                      'in software development, Artificial Intelligence, and '
                      'Machine Learning. I enjoy learning by building projects '
                      'and solving practical problems.',
                  wide,
                ),
                _education(sections['Education']!, wide),
                _skills(sections['Skills']!, wide),
                _projects(sections['Projects']!, wide),
                _experience(sections['Experience']!, wide),
                _contact(sections['Contact']!, wide),
                const Padding(
                  padding: EdgeInsets.all(28),
                  child: Text(
                    'Designed and built with Flutter  •  © 2026 A JHANSI',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: muted, fontSize: 12),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _navigation(
    BuildContext context,
    Map<String, GlobalKey> sections,
    bool wide,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: wide ? 56 : 20,
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0x223D6078)),
        ),
      ),
      child: Row(
        children: [
          const Text(
            'AJ.',
            style: TextStyle(
              color: cyan,
              fontSize: 27,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
          const Spacer(),
          if (wide)
            Wrap(
              spacing: 22,
              children: sections.entries.map((entry) {
                return TextButton(
                  onPressed: () => _goTo(entry.value),
                  child: Text(
                    entry.key,
                    style: const TextStyle(color: Colors.white70),
                  ),
                );
              }).toList(),
            )
          else
            PopupMenuButton<String>(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu, color: cyan),
              onSelected: (name) => _goTo(sections[name]!),
              itemBuilder: (context) => sections.keys
                  .map(
                    (name) => PopupMenuItem(
                      value: name,
                      child: Text(name),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }

  Widget _hero(
    BuildContext context,
    GlobalKey key,
    GlobalKey projectsKey,
    GlobalKey contactKey,
    bool wide,
  ) {
    return Container(
      key: key,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: wide ? 72 : 24,
        vertical: wide ? 92 : 60,
      ),
      child: Flex(
        direction: wide ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: wide ? 6 : 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'HELLO, WORLD! I AM',
                  style: TextStyle(
                    color: cyan,
                    fontSize: 13,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'A JHANSI',
                  style: TextStyle(
                    fontSize: 54,
                    height: 1.05,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -2,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Computer Science Student  |  AI & Software Development',
                  style: TextStyle(
                    color: cyan,
                    fontSize: 17,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Exploring ideas, writing code, and building technology '
                  'that solves real-world problems.',
                  style: TextStyle(
                    color: muted,
                    fontSize: 15,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 30),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    Tooltip(
                      message: 'Jump to the projects section',
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: cyan,
                          foregroundColor: navy,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 18,
                          ),
                        ),
                        onPressed: () => _goTo(projectsKey),
                        child: const Text('Explore My Portfolio'),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: cyan,
                        side: const BorderSide(color: cyan),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 18,
                        ),
                      ),
                      onPressed: () => _goTo(contactKey),
                      child: const Text('Contact Me'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (wide)
            const SizedBox(width: 60)
          else
            const SizedBox(height: 42),
          Expanded(
            flex: wide ? 4 : 0,
            child: Container(
              width: wide ? null : 300,
              height: 340,
              decoration: BoxDecoration(
                color: panel,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: const Color(0x5548E5F0),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x2248E5F0),
                    blurRadius: 40,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 100,
                    color: cyan,
                  ),
                  SizedBox(height: 18),
                  Text(
                    'MY CREATIVE SPACE',
                    style: TextStyle(
                      color: cyan,
                      letterSpacing: 3,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'My illustrated presenter will be added here next.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: muted,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(
    GlobalKey key,
    String label,
    String heading,
    String description,
    bool wide,
  ) {
    return Container(
      key: key,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: wide ? 100 : 24,
        vertical: 65,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _eyebrow(label),
          const SizedBox(height: 18),
          Text(
            heading,
            style: TextStyle(
              fontSize: wide ? 34 : 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 780),
            child: Text(
              description,
              style: const TextStyle(
                color: muted,
                height: 1.9,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _education(GlobalKey key, bool wide) {
    return _cardSection(
      key,
      '02 / EDUCATION',
      'My learning journey',
      [
        _infoCard(
          'B.Tech — Computer Science & Engineering',
          'ACE Engineering College, Telangana',
          '2024 – 2028  •  CGPA: 8.2/10',
          Icons.school_outlined,
        ),
        _infoCard(
          'Intermediate — MPC',
          'Mahatma Jyotiba Phule Residential Junior College',
          '2022 – 2024  •  74%',
          Icons.menu_book_outlined,
        ),
        _infoCard(
          'SSC',
          'Mahatma Jyotiba Phule Residential School',
          '2022  •  93%',
          Icons.auto_stories_outlined,
        ),
      ],
      wide,
    );
  }

  Widget _skills(GlobalKey key, bool wide) {
    return _cardSection(
      key,
      '03 / SKILLS',
      'Technologies I am learning',
      [
        _infoCard(
          'Programming',
          'Java • C • Python basics',
          '',
          Icons.code_rounded,
        ),
        _infoCard(
          'Web Development',
          'HTML • CSS • JavaScript',
          '',
          Icons.web_rounded,
        ),
        _infoCard(
          'AI & Data',
          'AI/ML concepts • Data Analytics',
          '',
          Icons.memory_rounded,
        ),
        _infoCard(
          'Tools',
          'Git • GitHub • VS Code • Flutter',
          '',
          Icons.build_outlined,
        ),
      ],
      wide,
    );
  }

  Widget _projects(GlobalKey key, bool wide) {
    return _cardSection(
      key,
      '04 / PROJECTS',
      'Things I have built',
      [
        _infoCard(
          'V2V Vehicle Collision Alert',
          'A vehicle-to-vehicle safety concept focused on real-time collision warnings.',
          'Systems • Safety',
          Icons.directions_car_outlined,
        ),
        _infoCard(
          'Digital Certificate Verification',
          'A certificate verification concept using QR codes and database records.',
          'Verification • Database',
          Icons.verified_outlined,
        ),
        _infoCard(
          'Mini E-Commerce Web Project',
          'A responsive web development project built with HTML, CSS, and JavaScript.',
          'HTML • CSS • JavaScript',
          Icons.shopping_bag_outlined,
        ),
        _infoCard(
          'Android Dice Roller',
          'A simple mobile app project built while learning Android development.',
          'Android • Mobile',
          Icons.phone_android_outlined,
        ),
      ],
      wide,
    );
  }

  Widget _experience(GlobalKey key, bool wide) {
    return _cardSection(
      key,
      '05 / EXPERIENCE & ACHIEVEMENTS',
      'Learning beyond the classroom',
      [
        _infoCard(
          'Android Developer Virtual Internship',
          'Learning experience through the EduSkills and Google partner program.',
          'Jan – Mar 2026',
          Icons.android,
        ),
        _infoCard(
          'Google Student Ambassadors',
          'Participating in student community engagement and technology activities.',
          'Community • 2026',
          Icons.groups_outlined,
        ),
        _infoCard(
          'Technical Learning',
          'Coursework, coding practice, hackathon participation, and developer workshops.',
          'Continuous learning',
          Icons.workspace_premium_outlined,
        ),
      ],
      wide,
    );
  }

  Widget _contact(GlobalKey key, bool wide) {
    return Container(
      key: key,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: wide ? 72 : 20,
        vertical: 30,
      ),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0x5548E5F0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _eyebrow('06 / CONTACT'),
          const SizedBox(height: 18),
          const Text(
            'Let’s build something meaningful.',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Interested in software development, AI/ML, or internship opportunities? '
            'Connect with me through my professional profiles.',
            style: TextStyle(
              color: muted,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              Tooltip(
                message: 'Open LinkedIn profile',
                child: OutlinedButton.icon(
                  onPressed: () async {
                    final uri = Uri.parse(
                      'https://www.linkedin.com/in/jhansi-a-b1273a327/',
                    );
                    await launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  icon: const Icon(Icons.link),
                  label: const Text('LinkedIn'),
                ),
              ),
              Tooltip(
                message: 'Open GitHub profile',
                child: OutlinedButton.icon(
                  onPressed: () async {
                    final uri = Uri.parse(
                      'https://github.com/AJHANSI760',
                    );
                    await launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  icon: const Icon(Icons.code),
                  label: const Text('GitHub'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardSection(
    GlobalKey key,
    String label,
    String heading,
    List<Widget> cards,
    bool wide,
  ) {
    return Container(
      key: key,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: wide ? 72 : 20,
        vertical: 55,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _eyebrow(label),
          const SizedBox(height: 15),
          Text(
            heading,
            style: TextStyle(
              fontSize: wide ? 32 : 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 26),
          Wrap(
            spacing: 18,
            runSpacing: 18,
            children: cards
                .map(
                  (card) => SizedBox(
                    width: wide ? 330 : double.infinity,
                    child: card,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _infoCard(
    String title,
    String description,
    String detail,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0x223F617C),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: cyan, size: 29),
          const SizedBox(height: 18),
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              color: muted,
              height: 1.7,
            ),
          ),
          if (detail.isNotEmpty) ...[
            const SizedBox(height: 13),
            Text(
              detail,
              style: const TextStyle(
                color: cyan,
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _eyebrow(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: cyan,
        letterSpacing: 3,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  void _goTo(GlobalKey key) {
    final targetContext = key.currentContext;

    if (targetContext == null) {
      debugPrint(
        'Navigation failed: target section is not mounted.',
      );
      return;
    }

    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
      alignment: 0.0,
    );
  }
}