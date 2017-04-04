# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!
class Contact

  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  @@contacts  = []
  @@unique_id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email = "N/A", note = "N/A")
    @first_name = first_name
    @last_name  = last_name
    @email      = email
    @note       = note
    @id         = @@unique_id
    @@unique_id +=1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create (first_name, last_name, email = "N/A", note = "N/A")
    contact= new(first_name, last_name, email, note)
    @@contacts << contact
    contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
        return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
    if attribute.to_s.downcase.start_with?("fir")
      @first_name = value.to_s
    elsif attribute.to_s.downcase.start_with?("las")
      @last_name = value.to_s
    elsif attribute.to_s.downcase.start_with?("ema")
      @email = value.to_s
    elsif attribute.to_s.downcase.start_with?("not")
      @note = value.to_s
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    if attribute.downcase == "first_name" || "last_name" || "email" || "note"
      case attribute.downcase
      when "first_name"
        @@contacts.each do |contact|
          if contact.first_name.downcase == value.downcase
            return contact
          end
        end
      when "last_name"
        @@contacts.each do |contact|
          if contact.last_name.downcase == value.downcase
            return contact
          end
        end
      when "email"
        @@contacts.each do |contact|
          if contact.email.downcase == value.downcase
            return contact
          end
        end
      when "note"
        @@contacts.each do |contact|
          if contact.first_name.downcase == value.downcase
            return contact
          end
        end
      end
    else
      return "ERROR: Invalid attribute please use [first_name] [last_name] [email] [note] only"
    end
  end
