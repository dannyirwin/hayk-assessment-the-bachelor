def get_first_name_of_season_winner(data, season)
  contestants = data[season]
  winner = contestants.select{|contestant| contestant["status"] == "Winner"}

  winner[0]['name'].split()[0]
end

def get_all_contestants (data)
  data.values.flatten
end

def get_contestant_name(data, occupation)
  contestant = get_all_contestants(data).select{|contestant| contestant["occupation"] == occupation}[0]
  contestant["name"]
end

def count_contestants_by_hometown(data, hometown)
  get_all_contestants(data).count {|contestant| contestant["hometown"] == hometown}
end

def get_occupation(data, hometown)
  get_all_contestants(data).select{|contestant| contestant["hometown"] == hometown}[0]["occupation"]
end

def get_average_age_for_season(data, season)
  contestants = data[season]
  (contestants.reduce(0){|sum, contestant| sum + Float(contestant["age"])} / contestants.count).round
  
end
