class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :members

  def params_valid?
    return false  unless contact_params[:email] =~ /.+@.+/
    return false unless contact_params[:phone] =~ /[\d\-\(\)\s]+/
    true
  end

  def members
    @projects = [
      { name: "SISCAT", photo: "siscat", dialog: "siscat" },
      { name: "Amapá Shipping", photo: "amapashipping", dialog: "amapashipping" },
      { name: "uRadiu", photo: "uRadiu", dialog: "uradiu" },
      { name: "GSAN", photo: "gsan", dialog: "gsan" },
      { name: "Sistema de Atendimento", photo: "cooperativataxi", dialog: "cooperativataxi" },
      { name: "Controle de Certificados", photo: "certifica", dialog: "certifica" },
      { name: "Controle de Produção", photo: "senai-producao", dialog: "senaiproducao" },
    ]

    @members = [
      { name: "Joelma Gonçalves", photo: "joelma", job: "Gerente de Projetos", linkedin: "in/joelma-gonçalves-fernandes-08631347", twitter: "joelmag33331053", facebook: "joelma.goncalves.921" },
      { name: "Paulo Igor", photo: "pigor", job: "Engenheiro de Software", linkedin: "in/pigodinho/pt", twitter: "pigodinho", facebook: "pigodinho"},
      { name: "Jaco Júnior", photo: "junior", job: "Analista de Negócio", linkedin: "pub/jaco-j%C3%BAnior/86/620/372", facebook: "jaco.junior1"},
      { name: "Pamela Gatinho", photo: "pamela", job: "Engenheira de Software", linkedin: "pub/pamela-gatinho/19/444/991/pt", twitter: "pamelagatinho", facebook: "pamela.gatinho"},
      { name: "Felipe Santos", photo: "felipe", job: "Engenheiro de Software", linkedin: "pub/felipe-santos-marques/40/89a/546", facebook: "felipesantos2089"},
      { name: "Matheus Souza", photo: "matheus", job: "Engenheiro de Software", linkedin: "pub/matheus-souza/38/38b/186", facebook: "matheusouza"},
      { name: "Luiz Sanches", photo: "sanches", job: "Engenheiro de Software", linkedin: "in/luizgrsanches/pt", twitter: "luizsanxes", facebook: "luizgrsanches"},
      { name: "Ricardo Casseb", photo: "casseb", job: "Engenheiro de Software", linkedin: "pub/ricardo-casseb/19/524/534/pt", twitter: "rcasseb", facebook: "ricardocasseb"},
      { name: "Ewertton Bravo", photo: "ewertton", job: "Engenheiro de Software", linkedin: "in/ewertton-bravo-03b98641", twitter: "ewerttonbravo"},
      { name: "Rafaela Lobo", photo: "rafaela", job: "DBA", linkedin: "in/rafaelaslobo", twitter: "rafaelaslb", facebook: "rafaelaslobo"}
    ]
  end
end
