module ValidateRussianFioOf
  class Matcher
    NON_VALID_VALUE = "Kirill Adaev"

    def initialize( attribute )
      @attribute = attribute
      @message = "должно содержать 3 слова и только кириллические буквы и пробелы"
    end

    def matches?(model)
      @model = model
      @model.update_attribute(@attribute, NON_VALID_VALUE)
      @model.valid?
      errors = @model.errors[@attribute]
      errors.any? { |error| error = @message }
    end

    def failure_message
      "#{@model.class} failed to validate :#{@attribute} russian fio."
    end

    def failure_message_when_negated
      "#{@model.class} validated :#{@attribute} russian fio."
    end

    def description
      "validate successfully"
    end
  end

  def validate_russian_fio_of(attribute)
    Matcher.new(attribute)
  end
end
