class Public::MyPagesController < ApplicationController
  def show
  end

  def edit
    @customer = current_customer
  end

  def update
  end

  def confirm
  end

  def leave
  end
end
