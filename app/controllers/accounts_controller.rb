class AccountsController < ApplicationController

  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = Account.all
    @accountcreationrequests = AccountCreationRequest.all
    #@accountcreationrequests.sort { |a,b| a.status.downcase <=> b.status.downcase }
  end

  def accountrequest
    @accountcreationrequests = AccountCreationRequest.all
    #@accountcreationrequests.sort { |a,b| a.status.downcase <=> b.status.downcase }
  	render "accountrequest"
  end

  def create
    @request = AccountCreationRequest.find(params[:id])
    email = @request.email
    @request.status = "Approved"

    @account = Account.new
    @account.balance = 0
    @account.account_status = true
    @account.email = email
    if Account.last
      @account.account_number = Account.last.account_number + 1
    else
      @account.account_number = 60000000
    end

    if @account.save && @request.save
      puts "new account created"
      puts @account.account_number
      flash[:notice]="Successfully created account"
      redirect_to :action => 'accountrequest'
    else
      flash[:notice]="Trouble creating account"
      redirect_to :action => 'accountrequest'
    end
  end


  def admincreate
    @accounts = Account.all
    if params.has_key?(:q) and params[:q].present?
      @q = params[:q].strip
      @users = (User.where('email LIKE ?', "%#{@q}"))
      if(@users.length <= 0)
        render 'index'
        return
      end
    end

    email = @users[0].email


    @account = Account.new
    @account.balance = 0
    @account.account_status = true
    @account.email = email
    if Account.last
      @account.account_number = Account.last.account_number + 1
    else
      @account.account_number = 60000000
    end

    if @account.save
      puts "new account created"
      puts @account.account_number
      flash[:notice]="Successfully created account"
      render 'index'
    else
      flash[:notice]="Trouble creating account"
      render 'index'
    end
  end

  def deleteaccount
    if !checkPendingAccounts(params[:id])
      @account = Account.find(params[:id])
      @account.destroy
    else
      flash[:notice]="Pending transactions present on account"
    end

    redirect_to :action => "index"

  end

  def delete
    @request = AccountCreationRequest.find(params[:id])
    email = @request.email
    # @request.destroy
    @request.status = "Cancelled"
    if @request.save
      flash[:notice]="Request cancelled"
      redirect_to :action => 'accountrequest'
    else
      flash[:notice]="Trouble cancelling request"
      redirect_to :action => 'accountrequest'
    end

  end

  def destroy
    @request = AccountCreationRequest.find(params[:id])
    email = @request.email
    @request.status = "Cancelled"
    if @request.save
      puts "@request.status = Cancelled ---------------- save successful"
      flash[:notice]="Request cancelled"
      redirect_to :action => 'accountrequest'
    else
      puts "@request.status = Cancelled ---------------- save unsuccessful"
      flash[:notice]="Trouble cancelling request"
      redirect_to :action => 'accountrequest'
    end

  end

  def accountsindex
    redirect_to :action => :accountsindex
  end

  def create_account
    puts "create_account create_account create_account create_account create_account create_account create_account "
    @account = Account.new
  end

  # def show
  #   puts "***********************************************************************************************"
  #   puts "show show show show show show show show show show show show show show show show show show "
  #   if session[:admin_id]
  #     @accounts = Account.find_by_sql(["select * from accounts"])
  #   else
  #     redirect_to :action => 'accountrequest'
  #     #redirect_to :action => "login", :controller => "home"
  #   end
  # end

  def checkPendingAccounts(id)
    x='SELECT "transactions"."transaction_id" FROM "transactions","accounts" WHERE "accounts"."id" = "'<<id<<'" AND ("accounts"."account_number" = "transactions"."credited_acc_number" or "accounts"."account_number" = "transactions"."debited_acc_number") AND "transactions"."transaction_status"="Pending"'
    results = ActiveRecord::Base.connection.execute(x)
    return results.length > 0
  end

private

  def set_member
    @admin = Admin.find(params[:id])
  end

end
