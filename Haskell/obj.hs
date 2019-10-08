
import System.Random

data Achado = Achado
 {
  ondeAchou :: String ,
  quandoAchou :: String ,
  quemAchou :: String ,
  nomeObjeto :: String ,
  descricao :: String ,
  categoria :: String
 }deriving Show

data Perdido = Perdido
 {
  ondeEsqueceu :: String ,
  quandoEsqueceu :: String ,
  dono :: String ,
  nomeObjetoEsc :: String ,
  descricaoEsc :: String ,
  categoriaEsc :: String
 }deriving Show


main = do
 programa 11 [] []
 -- let bola = Achado {ondeAchou = "LCC2", 
 --                    quandoAchou = "01/01/2019",
 --                    quemAchou = "Victor",
 --                    nomeObjeto = "Bola",
 --                    descricao = "E quadrada",
 --                    categoria = "Brinquedo"
 --                   }
 -- let caneta = Achado {ondeAchou = "LCC3", 
 --                    quandoAchou = "05/01/2019",
 --                    quemAchou = "Ciro",
 --                    nomeObjeto = "Caneta",
 --                    descricao = "E Azul",
 --                    categoria = "Caneta"
 --                   } 
 -- let achados = adicionaAchado (adicionaAchado novo bola) caneta
 -- mapM_ print achados

programa :: Int -> [Achado] -> [Perdido] ->  IO()
programa 0 _ _ = do
 putStrLn ""
 putStrLn "Fim do Programa"

programa 11 achados perdidos = do
 
 putStrLn ""
 putStrLn "Escolha a opcao:"
 putStrLn "1 - Cadastro de Objetos Perdidos"
 putStrLn "2 - Cadastro de Objetos Achados"
 putStrLn "3 - Lista de Objetos Perdidos"
 putStrLn "4 - Lista de Objetos Achados"
 putStrLn "5 - Lista de Objetos Perdidos por Categoria"
 putStrLn "6 - Lista de Objetos Encontrados por Categoria"
 putStrLn "7 - Busca por Nome do Objeto"
 putStrLn "8 - Busca por Pessoa que Perdeu"
 putStrLn "9 - Busca por Pessoa que Encontrou"
 putStrLn "10 - Popular Database"
 putStrLn ""
 putStrLn "Digite 0 para sair do sistema e encerrar todas as operacoes"
 putStrLn "Digite sua opcao......."
 putStrLn ""
 
 opcao <- readLn :: IO Int
 operacoes opcao achados perdidos

programa _ achados perdidos = do
 putStrLn ""
 putStrLn "Operacao Invalida"
 putStrLn ""
 programa 11 achados perdidos


operacoes :: Int -> [Achado] -> [Perdido] -> IO()


operacoes 0 achados perdidos = do
 putStrLn ""
 putStrLn "Fim do Programa"

operacoes 1 achados perdidos = do

 --Cadastrar Objeto Perdido
 putStrLn ""
 putStrLn "Local que Esqueceu:"
 localEsc <- getLine
 putStrLn ""
 putStrLn "Data que Perdeu:"
 dataEsc <- getLine
 putStrLn ""
 putStrLn "Nome do Dono:"
 donoEsc <- getLine
 putStrLn ""
 putStrLn "Nome do Objeto:"
 nomeObjEsceu <- getLine
 putStrLn ""
 putStrLn "Descreva o Objeto em Algumas Linhas:"
 descricaoEsceu <- getLine
 putStrLn ""
 putStrLn "Categoria do Objeto:"
 categoriaEsceu <- getLine
 putStrLn ""

 --cria o novo objeto perdido
 let novoPerdido = Perdido {ondeEsqueceu = localEsc, 
                            quandoEsqueceu = dataEsc,
                            dono = donoEsc,
                            nomeObjetoEsc = nomeObjEsceu,
                            descricaoEsc = descricaoEsceu,
                            categoriaEsc = categoriaEsceu
                           }

 programa 11 achados (adicionaPerdido perdidos novoPerdido)

operacoes 2 achados perdidos = do
 
 --Cadastrar Objeto Achado 
 putStrLn ""
 putStrLn "Local que Encontrou:"
 localEnc <- getLine
 putStrLn ""
 putStrLn "Data que Encontrou:"
 dataEnc <- getLine
 putStrLn ""
 putStrLn "Nome de quem Encontrou:"
 nomeQuemEnc <- getLine
 putStrLn ""
 putStrLn "Nome do Objeto:"
 nomeObjEnc <- getLine
 putStrLn ""
 putStrLn "Descreva o Objeto em Algumas Linhas:"
 descricaoEnc <- getLine
 putStrLn ""
 putStrLn "Categoria do Objeto:"
 categoriaEnc <- getLine
 putStrLn ""

 --cria o novo objeto achado
 let novoAchado = Achado {ondeAchou = localEnc, 
                       quandoAchou = dataEnc,
                       quemAchou = nomeQuemEnc,
                       nomeObjeto = nomeObjEnc,
                       descricao = descricaoEnc,
                       categoria = categoriaEnc
                      }

 programa 11 (adicionaAchado achados novoAchado) perdidos

operacoes 3 achados [] = do
 -- Lista dos Objetos Perdidos  Vazia
 putStrLn ""
 putStrLn "A Lista de Itens Perdidos esta vazia."
 putStrLn ""
 programa 11 achados []

operacoes 3 achados perdidos = do
 -- Lista dos  Objetos Perdidos
 putStrLn ""
 putStrLn "A Lista de Itens Perdidos: "
 imprimirPerdidos perdidos
 programa 11 achados perdidos

operacoes 4 [] perdidos = do
 -- Lista dos Objetos Achados Vazia
 putStrLn ""
 putStrLn "A Lista de Itens Encontrados esta vazia."
 putStrLn ""
 programa 11 [] perdidos

operacoes 4 achados perdidos= do
 -- Lista dos  Objetos Achados
 putStrLn ""
 putStrLn "A Lista de Itens Encontrados:"
 imprimirAchados achados
 programa 11 achados perdidos

operacoes 5 achados perdidos = do
 -- Lista dos Objetos Perdidos Por Categoria
 putStrLn ""
 putStrLn "Digite a Categoria:"
 categoria <- getLine
 imprimirPerdidosCat perdidos categoria 0
 programa 11 achados perdidos


-- operacoes 6 = do

-- operacoes 7 = do

-- operacoes 8 = do

-- operacoes 9 = do

operacoes 10 achados perdidos = do
 popularDatabase achados perdidos

operacoes _ achados perdidos = do
 programa 11 achados perdidos


--Objeto Achado

adicionaAchado :: [Achado] -> Achado -> [Achado]
adicionaAchado [] novo = [novo] 
adicionaAchado (x:xs) novo = [x] ++ (adicionaAchado xs novo)

--Imprimir Lista de Objetos Achados

imprimirAchados :: [Achado] -> IO()
imprimirAchados [] = do
 putStrLn "Fim da Lista"
 putStrLn ""
imprimirAchados (x:xs) = do
 putStrLn ""
 putStrLn (printLocalAchado x)
 putStrLn (printDataAchado x)
 putStrLn (printQuemAchado x)
 putStrLn (printNomeObjAchado x)
 putStrLn (printDescricaoAchado x)
 putStrLn (printCategoriaAchado x)
 putStrLn ""
 imprimirAchados xs

--Prints de Achado

printLocalAchado :: Achado -> String
printLocalAchado (Achado {ondeAchou = onde} ) = "O Objeto foi encontrado  em: " ++ onde

printDataAchado :: Achado -> String
printDataAchado (Achado {quandoAchou = quando} ) = "Data: " ++ quando

printQuemAchado :: Achado -> String
printQuemAchado (Achado {quemAchou = quem } ) = "Achado por: " ++ quem

printNomeObjAchado :: Achado -> String
printNomeObjAchado (Achado {nomeObjeto = nome} ) = "Nome do Objeto: " ++ nome 

printDescricaoAchado :: Achado -> String
printDescricaoAchado (Achado {descricao = desc} ) = "Descricao do Objeto: " ++ desc 

printCategoriaAchado :: Achado -> String
printCategoriaAchado (Achado {categoria = cate} ) = "Categoria do Objeto: " ++ cate


--Objeto Perdido

adicionaPerdido :: [Perdido] -> Perdido -> [Perdido]
adicionaPerdido [] novo = [novo] 
adicionaPerdido (x:xs) novo = [x] ++ (adicionaPerdido xs novo)

--Imprimir Lista de Objetos PPerdidos

imprimirPerdidos :: [Perdido] -> IO()
imprimirPerdidos [] = do
 putStrLn "Fim da Lista"
 putStrLn ""
imprimirPerdidos (x:xs) = do
 putStrLn ""
 putStrLn (printLocalPerdido x)
 putStrLn (printDataPerdido x)
 putStrLn (printDonoPerdido x)
 putStrLn (printNomeObjPerdido x)
 putStrLn (printDescricaoPerdido x)
 putStrLn (printCategoriaPerdido x)
 putStrLn ""
 imprimirPerdidos xs

-- prints de Perdido

printLocalPerdido :: Perdido -> String
printLocalPerdido (Perdido {ondeEsqueceu = onde} ) = "O Objeto foi esquecido  em: " ++ onde

printDataPerdido :: Perdido -> String
printDataPerdido (Perdido {quandoEsqueceu = quando} ) = "Data: " ++ quando

printDonoPerdido :: Perdido -> String
printDonoPerdido (Perdido {dono = dono } ) = "Dono: " ++ dono

printNomeObjPerdido :: Perdido -> String
printNomeObjPerdido (Perdido {nomeObjetoEsc = nome} ) = "Nome do Objeto: " ++ nome 

printDescricaoPerdido :: Perdido -> String
printDescricaoPerdido (Perdido {descricaoEsc = desc} ) = "Descricao do Objeto: " ++ desc 

printCategoriaPerdido :: Perdido -> String
printCategoriaPerdido (Perdido {categoriaEsc = cate} ) = "Categoria do Objeto: " ++ cate

--imprimir perdidos categoria

imprimirPerdidosCat :: [Perdido] -> String -> Int ->  IO()
imprimirPerdidosCat [] _ 1 = do
 -- pelo menos uma ocorrencia
 putStrLn "Fim da Lista"
 putStrLn ""
imprimirPerdidosCat [] categoria 0 = do
 -- Caso nao tenham nenhuma ocorrencia
 putStrLn ""
 putStrLn ("Nao Existem Itens Perdidos da Categoria: " ++ categoria)
 putStrLn ""
imprimirPerdidosCat (x:xs) categoria existe
 |(categoriaEsc x) == categoria && existe == 0 = do
  -- Primeira Ocorrencia
  putStrLn ""
  putStrLn ("Lista de Itens Perdidos da Categoria: " ++ categoria)
  putStrLn ""
  putStrLn (printLocalPerdido x)
  putStrLn (printDataPerdido x)
  putStrLn (printDonoPerdido x)
  putStrLn (printNomeObjPerdido x)
  putStrLn (printDescricaoPerdido x)
  putStrLn (printCategoriaPerdido x)
  putStrLn ""
  imprimirPerdidosCat xs categoria 1
 |(categoriaEsc x) == categoria && existe == 1 = do
  -- Segunda a Diante
  putStrLn ""
  putStrLn (printLocalPerdido x)
  putStrLn (printDataPerdido x)
  putStrLn (printDonoPerdido x)
  putStrLn (printNomeObjPerdido x)
  putStrLn (printDescricaoPerdido x)
  putStrLn (printCategoriaPerdido x)
  putStrLn ""
  imprimirPerdidosCat xs categoria 1
 | otherwise = imprimirPerdidosCat xs categoria existe

--popular a database com x numeros

popularDatabase :: [Achado] -> [Perdido] -> IO()
popularDatabase achados perdidos = do

 let nomes = ["João", "Maria", "Antonio", "Lucas", "Lara", "Matheus", "Barbara", "Sara", "Carlos", "Vinicius"]
 let locais = ["LCC3", "LCC2", "CAA", "CD", "BC", "Biblioteca", "Diretoria", "SPLAB", "REENGE", "Seu Olavo"]
 let descricoes = ["é Preto", "é Branco", "é Azul", "é Verde", "é Amarelo", "é Vermelho", "é Laranja", "é Rosa", "é Roxo", "é Marrom"]
 let categorias = ["Caderno", "Caneta", "Fone de Ouvido", "Bolsa", "Oculos", "Carteira", "Chave", "Capacete", "Celular", "Garrafa"]
 let datas = ["20/01/2019","30/01/2019","15/02/2019","30/05/2019","02/06/2019","19/08/2019","28/09/2019","22/10/2019","08/11/2019","12/12/2019"]

 putStrLn ""
 putStrLn "Digite o numero de Elementos a serem adicionados:"
 quant <- readLn :: IO Int
 adicionaRand achados perdidos quant quant nomes locais descricoes categorias datas

--adiciona x elementos randomicos em achados e perdidos 

adicionaRand :: [Achado] -> [Perdido] -> Int -> Int -> [String] -> [String] -> [String] -> [String] -> [String] -> IO()
adicionaRand achados perdidos 0 total _ _ _ _ _ = do
 putStrLn ""
 putStrLn (show total ++ " Itens Perdidos foram Cadastrados")
 putStrLn (show total ++ " Itens Encontrados foram Cadastrados")
 programa 11 achados perdidos
adicionaRand achados perdidos quant total nomes locais descricoes categorias datas
 |(quant < 0) = do
  putStrLn ""
  putStrLn "Numero Invalido, Digite um numero inteiro positivo maior que 0:"
  operacoes 10  achados perdidos
 |otherwise = do
  id1 <- randomRIO (0, 9) :: IO Int
  id2 <- randomRIO (0, 9) :: IO Int
  id3 <- randomRIO (0, 9) :: IO Int
  id4 <- randomRIO (0, 9) :: IO Int
  id5 <- randomRIO (0, 9) :: IO Int
  id6 <- randomRIO (0, 9) :: IO Int
  id7 <- randomRIO (0, 9) :: IO Int
  id8 <- randomRIO (0, 9) :: IO Int
  id9 <- randomRIO (0, 9) :: IO Int
  id10 <- randomRIO (0, 9) :: IO Int


  let novoAchado = Achado {ondeAchou = locais!!id1, 
                           quandoAchou = datas!!id2,
                           quemAchou = nomes!!id3,
                           nomeObjeto = categorias!!id4,
                           descricao = descricoes!!id5,
                           categoria = categorias!!id4
                          }

  let novoPerdido = Perdido {ondeEsqueceu = locais!!id6, 
                             quandoEsqueceu = datas!!id7,
                             dono = nomes!!id8,
                             nomeObjetoEsc = categorias!!id9,
                             descricaoEsc = descricoes!!id10,
                             categoriaEsc = categorias!!id9
                            }

  adicionaRand (adicionaAchado achados novoAchado) (adicionaPerdido perdidos novoPerdido) (quant-1) total nomes locais descricoes categorias datas