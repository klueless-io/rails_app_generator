class RubocopCard < Avo::Dashboards::PartialCard
  self.id = "percent_done"
  self.label = "Percent done"
  self.description = "This is the progress we made so far..."

  self.cols = 3
  self.rows = 20
  self.partial = "avo/cards/rubocop_card"

end
