class CustomAttributeManager
  attr_reader :source, :name, :date_type, :required

  def initialize(source:, name:, date_type:, required: false)
    @source = source
    @name = name
    @date_type = date_type
    @required = required
  end

  def self.create
    transaction do
    source = source.constantize.new(params)
    attribute = CustomAttribute.create(source: source, name: name, date_type: date_type, required: required)
  end

  def valid_custom_params
    CustomAttribute.where(source: source)
  end

  def edit
  end
end