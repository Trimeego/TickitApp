class TickitsController < ApplicationController
  respond_to :html, :xml, :json
  def index
    @user = User.find(params[:user_id])
    @tickits = @user.tickits
    respond_with(@user,@tickits)
  end

  def show
    @user = User.find(params[:user_id])
    @tickit = @user.tickits.find(params[:id])
    respond_with(@user, @tickit)
  end

  def new
    @user = User.find(params[:user_id])
    @tickit = Tickit.new
    respond_with(@user, @tickit)
  end

  def edit
    @user = User.find(params[:user_id])
    @tickit = @user.tickits.find(params[:id])
  end

  def create
    sleep(3)
    @user = User.find(params[:user_id])
    @tickit = @user.tickits.create(params[:tickit])
    respond_to do |format|
      if @tickit.save
        format.html { redirect_to(@user, :notice => 'Tickit was successfully created.') }
        format.xml  { render :xml => @tickit, :status => :created, :location => @tickit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tickit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tickits/1
  # PUT /tickits/1.xml
  def update
    @user = User.find(params[:user_id])
    @tickit = @user.tickits.find(params[:id])
    @tickit.updated_at = DateTime.now
    respond_to do |format|
      if @tickit.update_attributes(params[:tickit])
        format.html { redirect_to(@user, :notice => 'Tickit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tickit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tickits/1
  # DELETE /tickits/1.xml
  def destroy
    @user = User.find(params[:user_id])
    @tickit = @user.tickits.find(params[:id])
    @tickit.destroy

    respond_to do |format|
      format.html { redirect_to(user_url(@user)) }
      format.xml  { head :ok }
    end
  end
end
