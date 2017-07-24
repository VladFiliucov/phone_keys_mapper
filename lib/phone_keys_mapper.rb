def validate_params(params_array)
  return false if !params_array.kind_of?(Array)

  validated_elements = params_array.map {|el| el.between?(2,9)}
  !validated_elements.include?(false)
end

def phone_keys_mapper(args_array)
  return "Invalid arguments" if !validate_params(args_array)

  all_letters = ('a'..'z').to_a
  letters_in_groups = all_letters.in_groups_of(3)

  accumulator = []

  all_buttons = args_array.map {|e| letters_in_groups[e - 2] }

  all_buttons.each_with_index do |button, index|
    rest = all_buttons.reject {|e| e == button }.flatten.compact

    button.map do |e|
      accumulator << rest.map {|possible_variation| e + possible_variation}
    end
  end

  accumulator.flatten.map {|e| e.upcase }
end
