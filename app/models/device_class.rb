class DeviceClass < ActiveHash::Base
  self.data = [
      
      {id: 0, name: '輸液ポンプ'}, {id: 1, name: 'シリンジポンプ'}, {id: 2, name: '経管栄養ポンプ'},
      {id: 3, name: '低圧持続吸引器'}, {id: 4, name: 'IABP'}, {id: 5, name: 'PCPS'},   
  ]

  include ActiveHash::Associations
  has_many :devices

end