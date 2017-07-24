require "spec_helper"
require "phone_keys_mapper"

describe "#validate_params" do
  it 'return true if params are valid' do
    valid_params = [2, 5]
    expect(validate_params(valid_params)).to eq(true)
  end

  it 'returns false if 0 is included in params' do
    params_with_zero = [0, 5]
    expect(validate_params(params_with_zero)).to eq(false)
  end

  it 'returns false if args are not an array' do
    invalid_args = "string"
    expect(validate_params(invalid_args)).to eq(false)
  end
end

describe "#phone_keys_mapper" do
  it 'returns false if params are invalid' do
    invalid_params = [0, 5]
    expect(phone_keys_mapper(invalid_params)).to eq("Invalid arguments")
  end

  it 'returns all combinations' do
    valid_params = [2, 5]
    expected_array = ["AJ", "AK", "AL", "BJ", "BK", "BL", "CJ", "CK", "CL", "JA", "JB", "JC", "KA", "KB", "KC", "LA", "LB", "LC"]
    expect(phone_keys_mapper(valid_params)).to eq(expected_array)
  end

  it 'returns all combinations with more then 2 elements' do
    valid_params = [2, 5, 6]
    expected_array = ["AJ", "AK", "AL", "AM", "AN", "AO", "BJ", "BK", "BL", "BM", "BN", "BO", "CJ", "CK", "CL", "CM", "CN", "CO", "JA", "JB", "JC", "JM", "JN", "JO", "KA", "KB", "KC", "KM", "KN", "KO", "LA", "LB", "LC", "LM", "LN", "LO", "MA", "MB", "MC", "MJ", "MK", "ML", "NA", "NB", "NC", "NJ", "NK", "NL", "OA", "OB", "OC", "OJ", "OK", "OL"]
    expect(phone_keys_mapper(valid_params)).to eq(expected_array)
  end
end

