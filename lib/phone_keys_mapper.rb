def phone_keys_mapper(args_array)
  return "Invalid arguments" if !validate_params(args_array)

  a = args_array[0]
  b = args_array[1]
  all_letters = ('a'..'z').to_a
  letters_in_groups = all_letters.in_groups_of(3)
  combinations = letters_in_groups[a - 2].product(letters_in_groups[b - 2])
  combinations.map {|c| c.join.upcase}
end

def validate_params(params_array)
  return false if !params_array.kind_of?(Array)
  return false if !(params_array.length == 2)

  validated_elements = params_array.map {|el| el.between?(2,9)}
  !validated_elements.include?(false)
end

