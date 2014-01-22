class OmicService < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :omic_queries

  def display_name
    name
  end
end
