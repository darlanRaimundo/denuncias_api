Para configurar o banco de dados necessario ir até o arquivo 'config/database.yml' e alterar usuario e senha de seu banco

comandos para iniciar o projeto:
 - bundle install
 - rails db:migrate
 - rails s                                                                                                                                                            
 
------------------------------------------------------------------------------------------------------------------------------------------------------------------
Endpoints API                                                                                                                                                       
----------- Autenticação usuário ( Inicio ) -----------------------
#### localhost:3000/api/auth -- registrar usuario (POST)
 *valores body*
  - email
  - name
  - password
  - password_confirmation
  
#### localhost:3000/api/auth  -- deletar usuario (DELETE)
 valores header
  key
   access_token
   uid
   client

#### localhost:3000/api/auth/sign_in  -- logar (POST)
 valores body
  email
  password

#### localhost:3000/api/auth/validate_token  -- validar (GET)
 valores header
  key
   access_token
   uid
   client
 
#### localhost:3000/api/auth/sign_out  -- deslogar (DELETE)
 valores header
  key
   access_token
   uid
   client
  
#### localhost:3000/api/auth/password -- alteração de senha (POST)
 valor body
  email
  
#### localhost:3000/api/auth/password -- reset de senha (PUT)
 valores body
  password
  password_confirmation
 valores header
  access_token
  uid
  client
  token                                                                                                                                                            
----------- Autenticação usuário ( Fim )-----------------------
                                                                                                                                                                    
-------------------- Denuncias ( Inicio )-----------------------

#### localhost:3000/api/denuncias -- Listar todos os registros (GET)
 valores header
  access_token
  uid
  client
 
#### localhost:3000/api/denuncias -- Criar denuncia (POST)
 valores body
  descricao
  latitude
  longitude
  usuario_criador 
  
 valores header
  access_token
  uid
  client
 
#### localhost:3000/api/denuncias -- Atualizar denuncia (PUT)
 valores body
  descricao
  latitude
  longitude
  medida

 valores header
  access_token
  uid
  client
 
#### localhost:3000/api/denuncias -- Deletar denuncia (DELETE)
 incluir id na url
 
 valores header
  access_token
  uid
  client
 
-------------------- Denuncias ( Fim )-----------------------



