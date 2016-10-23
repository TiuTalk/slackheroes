class Card < OpenStruct
  def initialize(user, options = {})
    super(options.merge(user: user))
  end

  def title
    I18n.t(klass, scope: [:card, :title]).html_safe if klass.present?
  end

  def description
    I18n.t(klass, scope: [:card, :description]).html_safe if klass.present?
  end
end
