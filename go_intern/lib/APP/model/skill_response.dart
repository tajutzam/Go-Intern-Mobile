// To parse this JSON data, do
//
//     final SkillMain = SkillMainFromJson(jsonString);

import 'dart:convert';

// ignore: non_constant_identifier_names
SkillMain SkillMainFromJson(String str) => SkillMain.fromJson(json.decode(str));

// ignore: non_constant_identifier_names
String SkillMainToJson(SkillMain data) => json.encode(data.toJson());

class SkillMain {
    SkillMain({
       required this.skills,
       required this.status,
    });

    List<Skill> skills;
    String status;

    factory SkillMain.fromJson(Map<String, dynamic> json) => SkillMain(
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "status": status,
    };
}

class Skill {
    Skill({
       required this.id,
       required this.skill,
       required this.pencariMagang,
    });

    int id;
    String skill;
    int pencariMagang;

    factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        skill: json["skill"],
        pencariMagang: json["pencari_magang"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "skill": skill,
        "pencari_magang": pencariMagang,
    };
}
