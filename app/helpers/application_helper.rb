module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'おもちゃシティー'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def default_meta_tags
    {
      site: 'おもちゃシティー',
      title: 'おもちゃの投稿&検索サイト',
      reverse: true,
      charset: 'utf-8',
      description: 'おもちゃの投稿サービスです。我が子の使っているおもちゃの投稿や、気になるおもちゃを検索・購入してみてください！',
      keywords: 'おもちゃ,',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: default_image_url, 
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image', 
        site: '@', 
        image: default_image_url
      }
    }
  end

  def default_image_url
    image_url('ogp.jpg')
  end
end
