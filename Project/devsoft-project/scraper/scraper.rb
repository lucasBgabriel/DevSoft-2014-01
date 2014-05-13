# encoding:utf-8

require 'mechanize'
require 'json'

################################################
##           !USE YOUR CREDENTIALS            ##
################################################
USERNAME = '7656147' # Use your username!
PASSWORD = '2XmA==' # Use your password!

#
# Helper function that saves a HTML file on the html directory.
#
# @param [String] filename the name of the file to be saved.
# @param [String] body the body of the HTML file.
#
def save_html(filename, body)
  File.open("saved_html/#{filename}.html", "w") do |f|
    f.write(body.force_encoding('utf-8'))
  end
end

def save_json(filename, body)
  File.open("saved_html/#{filename}.json", "w") do |f|
    f.write(body.force_encoding('utf-8'))
  end
end

mechanize = Mechanize.new
mechanize.user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36"

mechanize.get('http://estagios.pcs.usp.br/')
mechanize.get('http://estagios.pcs.usp.br/semLogin/login.aspx')

save_html('before_login', mechanize.page.body)

form = mechanize.page.forms[0]

headers = {
  'Host' => 'estagios.pcs.usp.br',
  'Connection'      => 'keep-alive',
  'Cache-Control'   => 'max-age=0',
  'Accept'          => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
  'Origin'          => 'http://estagios.pcs.usp.br',
  'Content-Type'    => 'application/x-www-form-urlencoded',
  'Referer'         => 'http://estagios.pcs.usp.br/semLogin/login.aspx',
  'Accept-Encoding' => 'gzip,deflate,sdch',
  'Accept-Language' => 'en-US,en;q=0.8,pt;q=0.6,de;q=0.4'
}

params = {
  '__EVENTTARGET'     => '',
  '__EVENTARGUMENT'   => '',
  '__VIEWSTATE'       => form.field_with(name: '__VIEWSTATE').value,
  '__EVENTVALIDATION' => form.field_with(name: '__EVENTVALIDATION').value,
  'ctl00$ContentPlaceHolder1$Login1$UserName'    => USERNAME,
  'ctl00$ContentPlaceHolder1$Login1$Password'    => PASSWORD,
  'ctl00$ContentPlaceHolder1$Login1$LoginButton' => 'Logar'
}

mechanize.post("http://estagios.pcs.usp.br/semLogin/login.aspx", params, headers)

save_html('after_login', mechanize.page.body)

################################################
##         TODO: CONTINUE FROM HERE!          ##
################################################

selectors = []
  selectors << '#ContentPlaceHolder1_lblHabilitacao'
  selectors << '#ContentPlaceHolder1_lblTitulo'
  selectors << '#ContentPlaceHolder1_lblEmpresa'
  selectors << '#ContentPlaceHolder1_lblArea'
  selectors << '#ContentPlaceHolder1_lblDescricao'
  selectors << '#ContentPlaceHolder1_lblRequisitos'
  selectors << '#ContentPlaceHolder1_lblBeneficios'
  selectors << '#ContentPlaceHolder1_lblContatos'
  selectors << '#ContentPlaceHolder1_lblDataAnuncio'
  selectors << '#ContentPlaceHolder1_lblDataValidade'
  selectors << '#ContentPlaceHolder1_lblNumeroVagas'

  my_hash = { items: [] }
  
  emBranco = 0
  totalVagas = 0

(1329-49).times do |i|

  mechanize.get('http://estagios.pcs.usp.br/aluno/vagas/exibirVaga.aspx?id=' + (i+49).to_s)

  doc = mechanize.page.parser
  
  if(doc.css(selectors[8]).text == "")
    emBranco += 1
  else
    item = {
      "Habilitacao" => doc.css(selectors[0]).text.to_s,

      "Titulo" => doc.css(selectors[1]).text.to_s,

      "Empresa" => doc.css(selectors[2]).text.to_s,
      
      "Descricao" => doc.css(selectors[4]).text.to_s,

      "Requisitos" => doc.css(selectors[5]).text.to_s,

      "Beneficios" => doc.css(selectors[6]).text.to_s,

      "Contatos" => doc.css(selectors[7]).text.to_s,

      "DataAnuncio" => doc.css(selectors[8]).text.to_s,

      "DataValidade" => doc.css(selectors[9]).text.to_s,

      "NumeroVagas" => doc.css(selectors[10]).text.to_s
    }
    my_hash[:items] << item
  end
  totalVagas += 1
end

my_hash[:totalVagas] = totalVagas.to_s
my_hash[:emBranco] = emBranco.to_s

# my_hash << JSON.parse(['{
#   "Total de Vagas":'+ totalVagas.to_s + ',
#   "Vagas em Branco":'+ emBranco.to_s + '
#   }'].to_json).first

puts totalVagas
puts emBranco

save_json('teste', JSON.pretty_generate(my_hash))






















