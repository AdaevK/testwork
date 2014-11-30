module ValidateContactsOf
  class Matcher
    NON_VALID_VALUE = "34534@ru"

    def initialize(attribute)
      @attribute = attribute
      @message = "должна содержать номер телефона или адрес эл-почты"
    end

    def matches?(model)
      @model = model
      @model.update_attribute(@attribute, NON_VALID_VALUE)
      @model.valid?
      errors = @model.errors[@attribute]
      errors.any? { |error| error = @message }
    end

    def failure_message
      "#{@model.class} failed to validate :#{@attribute} contacts."
    end

    def failure_message_when_negated
      "#{@model.class} validated :#{@attribute} contacts."
    end

    def description
      "validate successfully"
    end
  end

  def validate_contacts_of(attribute)
    Matcher.new(attribute)
  end
end
