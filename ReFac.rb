
@contacts = [
  {first_name: "Tierra", last_name: "Whack", phone_num: "666-6666" },
  {first_name: "Martha", last_name: "Stewart", phone_num: "777-7777" },
  {first_name: "Ice", last_name: "Cube", phone_num: "888-8888" },
  {first_name: "Kitty", last_name: "Cat", phone_num: "999-9999" }
]

def main_menu 
  puts "---Ruby Contact List---"
  puts "1) Create Contact"
  puts "2) View Contact"
  puts "3) Edit Contact"
  puts "4) Delete Contact"
  puts "5) Exit"

  input = gets.strip

  case input
  when "1"
    create_contacts
  when "2"
    view_contacts
  when "3"
    edit_contacts
  when "4"
    delete_contacts  
  when "5"
    exit_list
  else
    puts "Invalid Entry, Try Again."
    main_menu
  end
end

def create_contacts
  puts "Enter Your New Contact Name"
  puts "First Name:"
  input_name = gets.strip
  puts "Last Name:"
  input_last = gets.strip
  puts "Phone:"
  input_phone = gets.strip
  @contacts << { :first_name => input_name , :last_name => input_last , :phone_num => input_phone}
  
  
  main_menu
end

def view_contacts
  puts "View Contacts:"
  @contacts.each_with_index do |contacts, index|
    puts "#{index + 1}) #{contacts[:first_name]} #{contacts[:last_name]}: #{contacts[:phone_num]}"
    end
    main_menu 
end

def edit_contacts
   puts "Edit Who?"
     @contacts.each_with_index do |contacts, index|
      puts "#{index + 1}) #{contacts[:first_name]} #{contacts[:last_name]} #{contacts[:phone_num]}" 
     end
     input = gets.strip.to_i
     index = input-1 
     puts "New First Name:"
     new_name = gets.strip
     puts "New Last Name:"
     new_last = gets.strip
     puts "New Phone:"
     new_phone = gets.strip
     @contacts[index].replace ({ :first_name => new_name , :last_name => new_last , :phone_num => new_phone})
      #@contacts.delete(index)
      #@contacts.insert(index, name_edit)
     
   view_contacts

 end

def delete_contacts
  puts "Delete Who?"
    @contacts.each_with_index do |contacts, index|
    puts "#{index + 1}) #{contacts[:first_name]} #{contacts[:last_name]} #{contacts[:phone_num]}" 
   end
    
     input = gets.strip.to_i
     index = input-1 
   puts "U sure dawg? (y/n)"
      u_sure = gets.strip.downcase
     if u_sure == "y"
      @contacts.delete_at(index)
      puts "----DELETED----"
     else 
      puts "--Not Removed--"
    
   view_contacts
  end
end


def exit_list
  puts ".:Later Bro:."
end

main_menu


