class RecipeType < ActiveHash::Base
  self.data = [
          {id: 0, name: '選択してください'},
          {id: 1, name: 'オリジナル'},
          {id: 2, name: '作ってみた'}
]
end
