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
    ]

    @members = [
      { name: "Joelma Gonçalves", photo: "joelma", job: "Gerente de Projetos", linkedin: "pub/joelma-gon%C3%A7alves/47/313/86", twitter: "joelmag33331053", facebook: "joelma.goncalves.921" },
      { name: "Paulo Igor", photo: "pigor", job: "Engenheiro de Software", linkedin: "in/pigodinho/pt", twitter: "pigodinho", facebook: "pigodinho"},
      { name: "Jaco Júnior", photo: "junior", job: "Analista de Negócio", linkedin: "pub/jaco-j%C3%BAnior/86/620/372", facebook: "jaco.junior1"},
      { name: "Ana Karla", photo: "ana", job: "Analista de Negócio", linkedin: "pub/ana-karla/b2/40b/4b", twitter: "anakgoncalves5", facebook: "ana.karla.92351"},
      { name: "Pamela Gatinho", photo: "pamela", job: "Engenheira de Software", linkedin: "pub/pamela-gatinho/19/444/991/pt", twitter: "pamelagatinho", facebook: "pamela.gatinho"},
      { name: "Adriana Muniz", photo: "adriana", job: "Engenheira de Software", linkedin: "pub/adriana-muniz/21/308/915", twitter: "adrianamuniz", facebook: "munizadriana"},
      { name: "Felipe Santos", photo: "felipe", job: "Engenheiro de Software", linkedin: "pub/felipe-santos-marques/40/89a/546", facebook: "felipesantos2089"},
      { name: "Matheus Souza", photo: "matheus", job: "Engenheiro de Software", linkedin: "pub/matheus-souza/38/38b/186", facebook: "matheusouza"},
      { name: "Marcelo Garcia", photo: "marcelo", job: "Engenheiro de Software", linkedin: "pub/marcelo-garcia/22/16/650", twitter: "mbgarcia_pa", facebook: "mbgarcia.pa"},
      { name: "Paulo Moura", photo: "paulo", job: "Engenheiro de Software", linkedin: "in/paulociecomp/pt", twitter: "paulociecomp", facebook: "paulo.moura.146"},
      { name: "Luiz Sanches", photo: "sanches", job: "Engenheiro de Software", linkedin: "in/luizgrsanches/pt", twitter: "luizsanxes", facebook: "luizgrsanches"},
      { name: "Fábio Aguiar", photo: "fabio", job: "Analista de Negócio", linkedin: "in/fabiogr/pt", twitter: "fabyogr", facebook: "fabyogr"},
      { name: "Felipe Iketani", photo: "iketani", job: "Engenheiro de Software", linkedin: "pub/felipe-iketani/26/103/a8a", twitter: "felipe_ik", facebook: "felipe.iketani"},
      { name: "Ricardo Casseb", photo: "casseb", job: "Engenheiro de Software", linkedin: "pub/ricardo-casseb/19/524/534/pt", twitter: "rcasseb", facebook: "ricardocasseb"},
      { name: "Camila Godinho", photo: "camila", job: "Analista de Negócio", linkedin: "pub/camila-ten%C3%B3rio-godinho/19/a54/147/pt", twitter: "milokatenorio", facebook: "milokatenorio"},
      { name: "Gustavo Costa", photo: "gustavo", job: "Engenheiro de Software", linkedin: "in/gustavobcosta", twitter: "gugabcosta", facebook: "gugabcosta"},
      { name: "Reinaldo Viana", photo: "reinaldo", job: "Engenheiro de Software", linkedin: "in/reinaldoviana", facebook: "reinaldo.viana.731"},
      { name: "Mateus Linhares", photo: "mateus", job: "Engenheiro de Software", linkedin: "in/mateuslinhares", twitter: "mateuslinhares", facebook: "mateus.linhares"},
      { name: "Ewertton Bravo", photo: "ewertton", job: "Engenheiro de Software", linkedin: "in/ewertton-bravo-03b98641", twitter: "ewerttonbravo"},
      { name: "Rafaela Lobo", photo: "rafaela", job: "DBA", linkedin: "in/rafaelaslobo", twitter: "rafaelaslb", facebook: "rafaelaslobo"},
      { name: "Vanessa Camarão", photo: "vanessa", job: "Analista de Negócio", linkedin: "in/vanessa-camarão-2a930842", twitter: "vanessacamarao", facebook: "vanessa.camarao.5"},
      { name: "Flávio Fernandes", photo: "flavio", job: "Consultor de Negócios"}
    ]
  end
end
