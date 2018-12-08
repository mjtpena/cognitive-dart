part of cognitive_services;

class BingSpellCheckResponse {
  String sType;
  List<FlaggedTokens> flaggedTokens;

  BingSpellCheckResponse({this.sType, this.flaggedTokens});

  BingSpellCheckResponse.fromJson(Map<String, dynamic> json) {
    sType = json['_type'];
    if (json['flaggedTokens'] != null) {
      flaggedTokens = new List<FlaggedTokens>();
      json['flaggedTokens'].forEach((v) {
        flaggedTokens.add(new FlaggedTokens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_type'] = this.sType;
    if (this.flaggedTokens != null) {
      data['flaggedTokens'] =
          this.flaggedTokens.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FlaggedTokens {
  int offset;
  String token;
  String type;
  List<Suggestions> suggestions;

  FlaggedTokens({this.offset, this.token, this.type, this.suggestions});

  FlaggedTokens.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    token = json['token'];
    type = json['type'];
    if (json['suggestions'] != null) {
      suggestions = new List<Suggestions>();
      json['suggestions'].forEach((v) {
        suggestions.add(new Suggestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['token'] = this.token;
    data['type'] = this.type;
    if (this.suggestions != null) {
      data['suggestions'] = this.suggestions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Suggestions {
  String suggestion;
  double score;

  Suggestions({this.suggestion, this.score});

  Suggestions.fromJson(Map<String, dynamic> json) {
    suggestion = json['suggestion'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['suggestion'] = this.suggestion;
    data['score'] = this.score;
    return data;
  }
}
