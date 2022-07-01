class Group < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_one_attached :icon

  def default_image
    'https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/apps/1684840/ff056d537780500b7ed8823881b014176c6f2085.jpg'
  end

  def default_colors
    @colors = [
      ['#ADEFD1FF', '#00203FFF'],
      ['#606060FF', '#D6ED17FF'],
      ['#00539CFF', '#EEA47FFF'],
      ['#0063B2FF', '#9CC3D5FF'],
      ['#FCF6F5FF', '#2BAE66FF'],
      ['#FAD0C9FF', '#6E6E6DFF'],
      ['#990011FF', '#FCF6F5FF'],
      ['#FAEBEFFF', '#333D79FF'],
      ['#FFD662FF', '#00539CFF'],
      ['#422057FF', '#FCF951FF']
    ]
    @colors[id % 10]
  end
end
