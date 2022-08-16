class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: %i[show edit update destroy]

  # GET /transactions
  def index
    # @transactions = Transaction.all
    @transactions = current_user.transactions
    @search = TransactionSearch.new(params[:search])
    @transactions = @search.scope
  end

  # GET /transactions/1
  def show; end

  # GET /transactions/new
  def new
    @category = current_user.categories
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
    @category = current_user.categories
  end

  # POST /transactions
  def create
    @transaction = current_user.transactions.new(transaction_params)
    respond_to do |format|
      if @transaction.save
        format.html do
          redirect_to transaction_url(@transaction), notice: 'Transaction was successfully transmitted.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transaction_url(@transaction), notice: 'Transaction was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:name, :amount, :category_id, :user_id)
  end
end
