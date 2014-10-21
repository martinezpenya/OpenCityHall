class OmicService < ActiveRecord::Base
##  attr_accessible :name, :description
  has_many :omic_queries

  validates_presence_of :name, :description;

  def display_name
    name
  end
end
