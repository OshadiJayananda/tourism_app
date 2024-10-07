import 'package:flutter/material.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({super.key});

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Details'),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Project Title
            const Text(
              'Project Overview',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Project Goals
            _buildProjectDetail(
              title: 'Project Goals',
              description: 'The primary goal of this project is to restore local habitats by planting native trees and plants, improving biodiversity, and mitigating the effects of climate change in the area.',
            ),

            // Tasks to be completed
            _buildProjectDetail(
              title: 'Tasks to be Completed',
              description: 'Volunteers will assist in tree planting, habitat restoration, and community outreach programs aimed at raising awareness about local conservation efforts.',
            ),

            // Environmental Impact
            _buildProjectDetail(
              title: 'Environmental Impact',
              description: 'By participating in this project, volunteers will contribute to offsetting carbon emissions, preserving endangered species, and promoting sustainable land use practices.',
            ),

            // Timelines
            _buildProjectDetail(
              title: 'Project Timelines',
              description: 'The project will span over two weeks, with scheduled activities including daily planting sessions, wildlife monitoring, and education workshops for local communities.',
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each project detail section
  Widget _buildProjectDetail({required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const Divider(height: 24, thickness: 1),
        ],
      ),
    );
  }
}
