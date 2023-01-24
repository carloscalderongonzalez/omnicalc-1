class ApplicationController < ActionController::Base

  def blank_square_form
    render({:template=>"calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    #params = {"number"=>"XX"}
    @num = params.fetch("number").to_f
    @square_of_num = @num ** 2
    render({:template=>"calculation_templates/square_results.html.erb"})
  end

  def blank_square_root_form
    render({:template=>"calculation_templates/square_root_form.html.erb"})
  end

  def calculate_square_root
    #params = {"number"=>"XX"}
    @num = params.fetch("number").to_f
    @square_root_of_num = @num ** (1/2.0)
    render({:template=>"calculation_templates/square_root_results.html.erb"})
  end

  def blank_payment_form
    render({:template=>"calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    #params = {"number"=>"XX"}
    @apr_f = params.fetch("apr").to_f
    @apr = @apr_f / 100
    @apr_perc = @apr_f.to_s(:percentage)
    @r = @apr/12
    @years = params.fetch("years").to_f
    @months = @years*12
    @principal = params.fetch("principal").to_f
    @principal_dollars = @principal.to_s(:currency)
    @payment_nom = @r * @principal 
    @payment_den = (1- (1+@r)**(-1*@months))
    @payment = @payment_nom/@payment_den
    @payment_dollars = @payment.to_s(:currency)
    render({:template=>"calculation_templates/payment_results.html.erb"})
  end

  def blank_random_form
    render({:template=>"calculation_templates/rand_form.html.erb"})
  end

  def calculate_random
    @lower = params.fetch("min").to_f
    @upper = params.fetch("max").to_f
    @result = rand(@lower..@upper)
    render({:template=>"calculation_templates/rand_results.html.erb"})
  end

end
