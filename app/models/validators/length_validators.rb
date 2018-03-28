class LengthValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    unless value.length < 2 
      record.errors[attribute] << (options[:message] || "cannot be less than 2 characters")
    end
  end
end