class RussianFioValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record.errors[attribute] << "должно содержать 3 слова и только кириллические буквы и пробелы" if value && !value.match(/^[А-ЯЁа-яё]+ +[А-ЯЁа-яё]+ +[А-ЯЁа-яё]+$/)
  end

end
