def get_first_name_of_season_winner(data, season)
  winner_name=""
  data.select do |season_num,contestant_hash_array|
    if season_num.to_s==season
        contestant_hash_array.select do |contestant_hash|
          contestant_hash.select do |attribute, value|
            if value=="Winner"
              #binding.pry
              full_name = contestant_hash["name"].split(" ")
              #question:  when I run this code in irb with a symbol as the key
              # full_name = contestant_hash[:"name"].split(" ")
              #it works, but it breaks the test.  When I remove the colon
              #full_name = contestant_hash["name"].split(" ")
              #it passes the tests, but breaks in irb. This is true for all of the
              #methods in this lab.  WTF?
              winner_name=full_name[0]
          end
        end
      end
    end
  end
winner_name
end

def get_contestant_name(data,occupation)
name=""
  data.select do |season_num,contestant_hash_array|
    contestant_hash_array.select do |contestant_hash|
      contestant_hash.select do |attribute, value|
        if value==occupation
            name=contestant_hash["name"]
          end
        end
      end
    end
    name
end

def count_contestants_by_hometown(data,hometown)
  count=0
  data.select do |season_num,contestant_hash_array|
    contestant_hash_array.select do |contestant_hash|
      contestant_hash.select do |attribute, value|
        if value==hometown
          count+=1
        end
      end
    end
  end
count
end

def get_occupation(data,hometown)
  data.select do |season_num,contestant_hash_array|
    contestant_hash_array.select do |contestant_hash|
      contestant_hash.select do |attribute, value|
        if value==hometown
          return contestant_hash["occupation"]
        end
      end
    end
  end
end

def get_average_age_for_season(data,season)
  ages=[]
  age_total=0
  average_age=0
  data.select do |season_num,contestant_hash_array|
    if season_num.to_s==season
        contestant_hash_array.select do |contestant_hash|
          contestant_hash.select do |attribute, value|
            if attribute=="age"
              ages<<contestant_hash["age"].to_i
            end
          end
        end
      end
    end
    for i in (0..ages.count)
      age_total+=ages[i].to_f
    end
    average_age=(age_total/ages.count)
    average_age.round
  end
