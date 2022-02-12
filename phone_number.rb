class PhoneNumber
  @blacklisted_numbers = %w[2014687508 1111111111 2222222222 1234567890]

  def self.validate_phone_number(number)
    general_phone_number = number.delete('^0-9')
    return 'Blacklisted number' if @blacklisted_numbers.include?(general_phone_number)
    return 'Area Code Invalid' if general_phone_number[0..2] == '901'

    print_phone_number(general_phone_number)
    puts 'Number is Valid'
  end

  def self.print_phone_number(number)
    puts "(#{number[0..2]})-#{number[3..5]}-#{number[6..-1]}"
    puts number
  end
end

number = gets.chomp

puts PhoneNumber.validate_phone_number(number)
