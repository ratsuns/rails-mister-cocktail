class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :cocktail_id, presence: true
  validates :ingredient_id, presence: true
  validates :cocktail_id, uniqueness: { :scope => [:ingredient_id] }, presence: true
end


# A dose must have a description, a cocktail and an ingredient, and [cocktail, ingredient ] pairings should be unique.
# Associations
# A cocktail has many doses
# A cocktail has many ingredients through doses
# An ingredient has many doses
# A dose belongs to an ingredient
# A dose belongs to a cocktail
# You can't delete an ingredient if it used by at least one cocktail.
# When you delete a cocktail, you should delete associated doses (but not the ingredients as they can be linked to other cocktails).
