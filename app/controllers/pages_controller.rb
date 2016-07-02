class PagesController < ApplicationController
  def index
    @newsvilles = Newsville.all.first(4)
    @comments = Comment.last(30)

  end
end
