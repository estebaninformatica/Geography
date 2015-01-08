class AptourDestination < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  establish_connection "aptour"
  self.table_name = 'Destino'
  self.primary_key = :id_des

  alias_attribute(:name, :nom_des)
  alias_attribute(:id, :id_des)

  scope :search, ->(term) { where('Destino.nom_des LIKE ?', "%#{term}%").order("Destino.nom_des") }
end