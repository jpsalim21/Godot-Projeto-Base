# Projeto base para Godot 4.X

Um projeto base pra criar jogos de forma mais fácil na Godot. Use e abuse desse repositório para facilitar algumas configurações comuns a todos os jogos. 

## Como usar esse repositório?
  Baixe o arquivo .zip e importe para a Godot. Depois, troque o nome do projeto e continue o desenvolvimento. 

## Controlador de Cenas
  Criei um Singleton chamado SceneController. Ele é responsável por controlar a transição de fases. 
  Alguns comandos:
  ```gdscript
  SceneController.changeSceneTo(path, animacao1, animacao2)
  ```
  Nesse comando, você troca para a próxima cena. Começa com a animação 1 e abre a nova cena com a animação 2. De padrão, a animação 'Diamond'
  ```gdscript
  SceneController.reloadCurrentScene(animacao1, animacao2)
  ```
  Nesse comando, a cena atual é recarregada com a animação 1 abrindo e reabrindo com a animação 2
  ```gdscript
  SceneController.setPositionFocus(pos)
  ```
  Aqui, o foco da transição 'CircleToon' será a posição global passada como parâmetro. Se a câmera se mexer depois da chamada dessa função, as coisas podem dar errado. 
  Também é possível resetar o foco depois de carregar as cenas, de acordo com a variável reset focus: ```SceneController.resetFocus = true```

## Menu inicial
  O menu inicial funciona normalmente. Troque as texturas para as suas artes para deixar do jeito que quiser.
  
  ALERTA!!!! Lembre de trocar a String da cena inicial para ir para a sua cena inicial.

## Menu de pause
  Nas fases em que é possível pausar, adicione o objeto 'MenuPause.tscn'. Ele funciona quando o jogador aperta 'Esc' e pausa a cena atual

## Configurações
  As configurações do jogo, como resolução e áudio são alterados nos menus. Essas configurações ficam salvas em um arquivo, facilitando o carregamento dessas configurações ao abrir pela segunda vez.
  No áudio, troque as configurações de cada áudio do jogo pro Bus respectivo (Master, Musica, SFX)

# Comentários finais
  Com esse repostório, você não terá que se preocupar com as configurações de áudio, menus iniciais e transições de cena. Assim, vai poder focar nas mecânicas e gameplay dos seus jogos. 
