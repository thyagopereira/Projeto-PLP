data Achados =  Achados {
    ondeAchou :: String ,
    quandoAchou :: Date ,
    quemAchou :: String ,
    nomeObjetoAchado :: String,
    descricaoAchado :: String ,
    categoriaAchado :: String 
}deriving Show 

data Date =  Date {
    dia :: Int,
    mes :: Int
}deriving Show

data Perdidos =  Perdidos{
    ondePerdeu :: String ,
    quandoPerdeu :: Date ,
    quemPerdeu :: String ,
    nomeObjetoPerdido :: String ,
    descricaoPerdido :: String,
    categoriaPerdido :: String   
}deriving Show

criaAchado :: String -> Date -> String -> String -> String -> String -> Achados
criaAchado onde quando quem nome  descricao categoria = do Achados{
    ondeAchou = onde , quandoAchou = quando , quemAchou = quem , nomeObjetoAchado = nome , descricaoAchado = descricao , categoriaAchado = categoria
}

criaPerdido :: String -> Date -> String -> String -> String -> String -> Perdidos
criaPerdido onde quando  quem nome descricao categoria = do Perdidos{
    ondePerdeu = onde  , quandoPerdeu = quando , quemPerdeu =  quem , nomeObjetoPerdido = nome ,
    descricaoPerdido = descricao , categoriaPerdido = categoria  
}

toStringPerdido :: Perdidos -> IO()
toStringPerdido perdido  = do 
    (putStrLn("\n" ++ "O objeto foi esquecido em: "  ++ (ondePerdeu perdido)))
    (toStringDate (quandoPerdeu perdido))
    (putStrLn("Dono : " ++ (quemPerdeu perdido)))
    (putStrLn("Nome do Objeto : " ++ (nomeObjetoPerdido perdido)))
    (putStrLn("Descrição do objeto : " ++ (descricaoPerdido perdido)))
    (putStrLn("Categoria do objeto : " ++ (categoriaPerdido perdido)))

toStringAchado :: Achados -> IO()
toStringAchado achado = do 
    (putStrLn("\n" ++ "O objeto foi encontrado em: "  ++ (ondeAchou achado)))
    (toStringDate (quandoAchou achado))
    (putStrLn("Achado por  : " ++ (quemAchou achado)))
    (putStrLn("Nome do Objeto : " ++ (nomeObjetoAchado achado)))
    (putStrLn("Descrição do objeto : " ++ (descricaoAchado achado)))
    (putStrLn("Categoria do objeto : " ++ (categoriaAchado achado)))


toStringDate :: Date -> IO()
toStringDate datacao = do
    putStrLn( "Data: " ++  (show( dia datacao)) ++ "/" ++  (show (mes datacao)) )

criaData :: Int -> Int -> Date
criaData  dias  mess  = do Date {
    dia = dias , mes =  mess 
}


menu  = do
    putStrLn("Escolha a opção:")
    putStrLn("1-Cadastro de objetos perdidos" )
    putStrLn("2-Cadastro de objetos encontrados")
    putStrLn("3-Lista de encontrados")
    putStrLn("4-Lista de perdidos")
    putStrLn("5-Lista de encontrados por categoria")
    putStrLn("6-Lista de perdidos por categoria")
    putStrLn("7-Busca por nome")
    putStrLn("8-Busca por pessoa que Encontrou")
    putStrLn("9-Busca por pessoa que perdeu")
    putStrLn("10-Popular DataBase")
    putStrLn("Digite  0  para sair do sistema e encerrar todas as operações")
    putStrLn("Digite sua opção ............")
    opcao <- readLn :: IO Int
   -- selecionaFuncao opcao
    putStrLn("")

main = do
    
    
     
       --  ondePerdeu = "Casa" ,
        -- quandoPerdeu = Date {dia = 10 , mes  = 2},
        -- quemPerdeu = "luquinha",
        -- nomeObjetoPerdido = "caneta",
         --descricaoPerdido = "Caneta Preta"
     
    (criaAchado "Casa" (criaData 12 10 ) "Joaozin" "caneta" "Caneta Preta Simples" "Escolar" ) 
     
    putStrLn ( show(a) )
   -- menu 
    

     

     


