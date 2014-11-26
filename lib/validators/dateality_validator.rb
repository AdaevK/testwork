class DatealityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    if options[:greater_than] && value
      record.errors[attribute] << "должна быть больше #{record.class.human_attribute_name(options[:greater_than])}" if ( record.send(options[:greater_than]) || Time.now ) >= value
    end
  end
end
