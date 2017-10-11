require_relative 'errors'

class Patient
    attr_accessor :first_name, :last_name, :status, :current_balance, :med_list

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @med_list = []
  end

  def patient_status(status)
    begin
      raise ArgumentError,"Argument is not a string" unless status.is_a? String

      @status = status
    rescue ArgumentError => e
      puts "There's been an exception"
      puts "Exception message: #{e.message}"
      # puts "Exception backtrace: #{e.backtrace}"
    end
  end

  def patient_currently_admitted?(admit_time)
      puts "Patient currently in hospital, admitted at #{admit_time}"
  end

  def patient_new_total(amount)
    @current_balance = 0
    puts "Current balance before calculation: #{current_balance}"
    begin
      @current_balance = (current_balance + amount)/current_balance
    rescue ZeroDivisionError => e
      puts "cannot divide by 0"
      puts e.message
    end
    # This runs only if there are no exceptions
    @current_balance = amount
  end

  def add_med_to_list(med, dosage)
    raise ArgumentError,"#{med} is not a string" unless med.is_a? String

    begin
      raise ArgumentError,"#{dosage} is not a integer" unless dosage.is_a? Integer
    rescue ArgumentError => e
      puts "Dosage must be an integer."
    end

    puts "Medication added: #{med}"
    @med_list.push([med,dosage])

    #Create a new class called MedTypeError that inherits from StandardError and use that as seen below:
    begin
      raise MedTypeError, "This is not a valid medication"
    rescue MedTypeError => e
      puts e.message
    end

    puts @med_list
  end

  def patient_medications_list
    puts "User medication list:"
    begin
      raise RuntimeError, "Medications list is not valid."
    rescue RuntimeError => e
      puts e.message
    end
    puts @med_list

    # This needs to run whether there was an exception or not.
    puts "Disclaimer: The hospital is not responsible for the user's health due to medications they may be using."
  end
end