class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @expenses = @group.expenses.order(created_at: :desc)
  end

  def new
    @expense = Expense.new
  end
end
