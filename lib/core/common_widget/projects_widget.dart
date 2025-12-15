import 'package:flutter/material.dart';


class ProjectsWidget extends StatelessWidget {
  final List<Map<String, String>> projects;

  const ProjectsWidget({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: const [
              Text('المشاريع', style: TextStyle(fontSize: 16)),
              Spacer(),
              Text('عرض الكل', style: TextStyle(fontSize: 14, color: Colors.blue)),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // Projects List
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: projects.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final project = projects[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Image placeholder
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/project.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(project['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text('${project['city']} - ${project['type']}'),
                          const SizedBox(height: 8),
                          Text('تقييم المشروع: ${project['evaluation']} ريال',
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                        ],
                      ),
                    ),
                    Text(project['amount']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
