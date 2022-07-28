class TransactionsController < ApplicationController
  def index
    @transactions = UserTransactions.all
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transactions_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to root_path, notice: "Transaction was successfully passed." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def transactions_params
    params.require(:transaction).permit(:amount, :sender_account_id, :recipient_account_id)
  end
end
