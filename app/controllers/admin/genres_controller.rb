class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new
    @genres = Genre.all
    @creategenre = Genre.new(genre_params)
    if @creategenre.save
      redirect_to "/admin/genres", notice: "ジャンルの作成に成功しました"
    else
      flash[:notice] = "ジャンル名を入力してください"
      render :index
    end
  end

  def edit
    @genre =Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to "/admin/genres", notice: "ジャンルの編集に成功しました"
    else
      redirect_to edit_admin_genre_path(@genre.id), notice: "ジャンル名を入力してください"
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
