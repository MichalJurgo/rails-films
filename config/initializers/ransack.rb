Ransack.configure do |config|
  config.add_predicate 'year_lteq',
    arel_predicate: 'lteq',
    formatter: proc { |v| "#{v.end_of_year}" },
    validator: proc { |v| v.present? },
    compounds: true,
    type: :date
end
