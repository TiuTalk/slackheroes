class Card < OpenStruct
  def initialize(user, options = {})
    super(options.merge(user: user))
  end

  def title
    I18n.t(klass, scope: :card) if klass.present?
  end
end
