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

main :: IO()
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

operacoes 1 achados perdidos = do

 --Cadastrar Objeto Achado 
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

 --cria o novo objeto achado
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


operacoes 3 achados perdidos= do
 
 -- Lista dos  Objetos Perdidos
 putStrLn ""
 imprimirPerdidos perdidos
 programa 11 achados perdidos

operacoes 4 achados perdidos= do

 -- Lista dos  Objetos Achados
 putStrLn ""
 imprimirAchados achados
 programa 11 achados perdidos

-- operacoes 5 = do

-- operacoes 6 = do

-- operacoes 7 = do

-- operacoes 8 = do

-- operacoes 9 = do

-- operacoes 10 = do

operacoes _ achados perdidos = do
 programa 11 achados perdidos


--Objeto Achado

adicionaAchado :: [Achado] -> Achado -> [Achado]
adicionaAchado [] novo = [novo] 
adicionaAchado (x:xs) novo = [x] ++ (adicionaAchado xs novo)

--Imprimir Lista de Objetos Achados

imprimirAchados :: [Achado] -> IO()
imprimirAchados [] = do
 putStrLn ""
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
printQuemAchado (Achado {quemAchou = quem } ) = "Achado por:" ++ quem

printNomeObjAchado :: Achado -> String
printNomeObjAchado (Achado {nomeObjeto = nome} ) = "Nome do Objeto:" ++ nome 

printDescricaoAchado :: Achado -> String
printDescricaoAchado (Achado {descricao = desc} ) = "Descricao do Objeto:" ++ desc 

printCategoriaAchado :: Achado -> String
printCategoriaAchado (Achado {categoria = cate} ) = "Categoria do Objeto: " ++ cate


--Objeto Perdido

adicionaPerdido :: [Perdido] -> Perdido -> [Perdido]
adicionaPerdido [] novo = [novo] 
adicionaPerdido (x:xs) novo = [x] ++ (adicionaPerdido xs novo)

--Imprimir Lista de Objetos PPerdidos

imprimirPerdidos :: [Perdido] -> IO()
imprimirPerdidos [] = do
 putStrLn ""
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
printDonoPerdido (Perdido {dono = dono } ) = "Dono:" ++ dono

printNomeObjPerdido :: Perdido -> String
printNomeObjPerdido (Perdido {nomeObjetoEsc = nome} ) = "Nome do Objeto:" ++ nome 

printDescricaoPerdido :: Perdido -> String
printDescricaoPerdido (Perdido {descricaoEsc = desc} ) = "Descricao do Objeto:" ++ desc 

printCategoriaPerdido :: Perdido -> String
printCategoriaPerdido (Perdido {categoriaEsc = cate} ) = "Categoria do Objeto: " ++ cate

