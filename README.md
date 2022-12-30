# Flappy Phoenix
Flappy Bird clone written in Elixir using Phoenix LiveView to render the game UI from the server.

Some interesting files:

* [The LiveView integration](https://github.com/Supermimine/FlappyBird/blob/main/code/flappy_tristan/lib/flappy_bird_web/live/game_live.ex)
* [The Game logic](https://github.com/Supermimine/FlappyBird/blob/main/code/flappy_tristan/lib/flappy_bird/game.ex)
* [The UI](https://github.com/Supermimine/FlappyBird/blob/main/code/flappy_tristan/lib/flappy_bird_web/templates/game/index.html.heex)

## Credits
The game assets were repurposed from the [Motion Game](https://github.com/HipByte/motion-game) sample app.

## Running it locally
To start your Phoenix server:

* Install dependencies with ˋˋˋmix deps.getˋˋˋ
* Install Node.js dependencies with ˋˋˋcd assets && npm installˋˋˋ
* Start Phoenix endpoint with ˋˋˋmix phx.serverˋˋˋ
Now you can visit [localhost:4000](http://localhost:4000/) from your browser.