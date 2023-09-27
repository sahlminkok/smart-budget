class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @expenses = @group.expenses.order(created_at: :desc)
  end

  def new
    @group = Group.find(params[:group_id])
    @expense = @group.expenses.new
  end

  def create
    @group = Group.find(params[:group_id])
    @expense = @group.expenses.new(expense_params)
    @expense.author = current_user

    if @expense.save
      @group.expenses << @expense
      redirect_to group_expenses_path(@group), notice: 'Transaction was successfully created.'
    else
      flash[:alert] = 'Transaction could not be created.'
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
