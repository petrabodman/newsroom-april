class ArticleIndex < Chewy::Index
  define_type Article.all do
    field :headline
    field :content
  end
end
