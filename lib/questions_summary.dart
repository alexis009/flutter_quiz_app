import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Aligns elements to the start of the cross-axis
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    backgroundColor:
                        data['user_answer'] == data['correct_answer']
                            ? const Color.fromARGB(255, 141, 240, 144)
                            : Colors.orange,
                    radius: 15,
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                    width:
                        10), // Adds spacing between the circle avatar and the text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Aligns text elements to the start of the column
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.dmSans(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data['user_answer'] as String,
                        style: GoogleFonts.dmSans(
                          color: const Color.fromARGB(116, 255, 255, 255),
                        ),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: GoogleFonts.dmSans(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
