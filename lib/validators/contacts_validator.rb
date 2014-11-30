class ContactsValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record.errors[attribute] << "должна содержать номер телефона или адрес эл-почты" if value && !( valid_phone(value) || valid_email(value) )
  end

  def valid_email(value)
    value.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
  end

  def valid_phone(value)
    value.match(/^\+?[\d\(\)\- ]+$/)
  end
end
