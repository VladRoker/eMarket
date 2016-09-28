module ProductsHelper
  def money_helper(product, currency)
    if product.sale_flag
      i =   number_to_currency(product.discount || product.price, :unit => "#{currency} ")
      i <<  ' <span class="del">'.html_safe
      i <<  number_to_currency(product.price, :unit => "#{currency} ")
      i <<  '</span>'.html_safe
    else
      number_to_currency(product.price, :unit => "#{currency} ")
    end
  end
end
