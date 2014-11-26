module ValidateDatealityOf
  class Matcher
    NON_VALID_VALUE = Date.today.prev_day

    def initialize(attribute)
      @attribute = attribute
      @message = "должна быть больше"
    end

    def matches?(model)
      @model = model
      @model.update_attribute(@attribute, NON_VALID_VALUE)
      @model.valid?
      @message = "#{@message} #{@model.class.human_attribute_name(@greater_than_option)}" if @greater_than_option
      errors = @model.errors[@attribute]
      errors.any? { |error| error == @message }
    end

    def greater_than( value )
      @greater_than_option = value
      self
    end

    def failure_message
      "#{@model.class} failed to validate :#{@attribute} dateality."
    end

    def failure_message_when_negated
      "#{@model.class} validated :#{@attribute} dateality"
    end

    def description
      "validate successfully"
    end
  end

  def validate_dateality_of(attribute)
    Matcher.new(attribute)
  end
end
