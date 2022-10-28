class PanelizationSummary {
  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  bool? containsEpubBubbles;
  bool? containsImageBubbles;

  PanelizationSummary.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> panelizationSummaryKey = map;
    containsEpubBubbles = panelizationSummaryKey['containsEpubBubbles'];
    containsImageBubbles = panelizationSummaryKey['containsImageBubbles'];
  }
}
