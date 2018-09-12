class Supports::Manga
  attr_reader :manga, :mangas
    
  def initialize manga
    @manga = manga
  end
    
  def mangas
    @mangas ||= Manga.all
  end
    
  def comment_params
    @comment = Comment.new
  end
    
  def comments_tree
    @comments = @manga.comments
  end
end
