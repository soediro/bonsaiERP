class ExpenseQuery
  def initialize(rel = Expense)
    @rel = rel
  end

  def inc
    @rel.includes(payments: [:account_to], expense_details: [:item])
  end

  def search(params={})
    @rel = @rel.where{} if params[:search].present?
    @rel.includes(:contact, transaction: [:creator, :approver])
  end

  def to_pay(contact_id)
    @rel.active.where{(state.eq 'approved') & (amount.gt 0)}.where(contact_id: contact_id)
  end
end