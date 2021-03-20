class ArticleType < ActiveHash::Base
  self.data = [
          {id: 0, name: '選択してください'},
          {id: 1, name: '料理'},
          {id: 2, name: '食材'},
          {id: 3, name: '道具'},
          {id: 4, name: '外食'},
          {id: 5, name: 'つぶやき'},
          {id: 6, name: 'その他'}
]
end