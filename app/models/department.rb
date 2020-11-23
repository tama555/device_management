class Department < ActiveHash::Base
  self.data = [
      
      {id: 0, name: '西2階'}, {id: 1, name: '西3階'}, {id: 2, name: '東3階'},
      {id: 3, name: '東4階'}, {id: 4, name: '東5階'}, {id: 5, name: 'OPE室'},   
  ]

  include ActiveHash::Associations
  has_many :tasks

end