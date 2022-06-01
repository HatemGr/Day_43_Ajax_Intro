class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show 
    @email = Email.find(params[:id])
    @email.update(read: true)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def create 
    @email = Email.create(object: Faker::Game.title,body: Faker::Lorem.paragraph)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def update 
    @email = Email.find(params[:id])
    @job = params[:job]
    puts "#" * 50
    puts params
    puts "#" * 50

    if @job == "to_not_read"
      @email.update(read: false)
      puts "@" * 50
      puts "email read to #{@email.read}"
      puts "@" * 50
    else
      @email.update(read: true)
      puts "@" * 50
      puts "email read to #{@email.read}"
      puts "@" * 50
    end

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def destroy 
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

end
