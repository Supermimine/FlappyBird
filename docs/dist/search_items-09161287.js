searchNodes=[{"doc":"FlappyBird conserve les contextes qui définissent votre domaine et la logique métier. Les contextes sont également responsables de la gestion de vos données, quel que soit s'il provient de la base de données, d'une API externe ou autres.","ref":"FlappyBird.html","title":"FlappyBird","type":"module"},{"doc":"Context contenant les fonctions pour le déroulement d'une Game .","ref":"FlappyBird.Game.html","title":"FlappyBird.Game","type":"module"},{"doc":"Action de voler lorsque l'utilisateur appuis sur une touche ou clique sur l'écran de jeu. Description Reçois un game , puis modifie la variable velocity de son composant bird pour la valeur 3. Exemples iex&gt; flap ( %{ field : value } ) { :ok , % Game { } } iex&gt; flap ( %{ field : bad_value } ) { :error , % Ecto.Changeset { } } Type d'appel Game.flap(game) Type de retour retourne game","ref":"FlappyBird.Game.html#flap/1","title":"FlappyBird.Game.flap/1","type":"function"},{"doc":"Création d'une nouvelle partie. Exemples iex&gt; new ( ) { :ok , % Game { } } Type d'appel Game.new() Valeur par défaut game { bird : %{ x : 10 , y : 35 , wings : 0 , velocity : 0 } pipes : [ ] score : 0.0 }","ref":"FlappyBird.Game.html#new/0","title":"FlappyBird.Game.new/0","type":"function"},{"doc":"Sauvegarder le score d'une partie. Variable d'argument v -&gt; value --&gt; valeur du score à sauvegarder en string Description Appel la fonction Score.changeset() pour sauvegarder le score dans la base de données avec comme paramètre Entité/Structure Score vide --&gt; %Score{} et la valeur a changer --&gt; %{&quot;value&quot; =&gt; v} Exemples iex&gt; save_score ( value ) { :ok , % Game { } } iex&gt; save_score ( bad_value ) { :error , % Ecto.Changeset { } }","ref":"FlappyBird.Game.html#save_score/1","title":"FlappyBird.Game.save_score/1","type":"function"},{"doc":"Mise à jour de la partie. Boucle d'exécution principale du jeu en exécution Est exécuter seulement lorsque ' state == :ok' Description Il assigne 2 variables qui sont: time --&gt; qui est le temps du système actuellement dt --&gt; qui est la conversion du temps actuel en tick moins le dernier temps en tick que la partie a été updated . Par la suite, avec le game qu'il reçois il appel les fonctions privé suivante: move_bird --&gt; calcul les paramètres de bird ( wings , velocity et y ). move_pipes --&gt; calcul la nouvelle position des tuyaux. check_for_collisions --&gt; Compare la position du personnage(oiseau) et des obstacles(tuyaux, sol et bordure du navigateur web). Puis change le state selon le résultat. add_pipes --&gt; Ajout des tuyaux a une distance régulière, mais avec une hauteur aléatoire. Ensuite, il augmente le score de la partie de 0.1 * dt Finalement, il change le updated de la game pour time Exemples iex&gt; update ( %{ field : value } ) { :ok , % Game { } } iex&gt; update ( %{ field : bad_value } ) { :error , % Ecto.Changeset { } } Type d'appel Game.update(game) Type de retour retourne game","ref":"FlappyBird.Game.html#update/1","title":"FlappyBird.Game.update/1","type":"function"},{"doc":"","ref":"FlappyBird.Mailer.html","title":"FlappyBird.Mailer","type":"module"},{"doc":"","ref":"FlappyBird.Mailer.html#deliver/2","title":"FlappyBird.Mailer.deliver/2","type":"function"},{"doc":"","ref":"FlappyBird.Mailer.html#deliver!/2","title":"FlappyBird.Mailer.deliver!/2","type":"function"},{"doc":"","ref":"FlappyBird.Mailer.html#deliver_many/2","title":"FlappyBird.Mailer.deliver_many/2","type":"function"},{"doc":"","ref":"FlappyBird.Repo.html","title":"FlappyBird.Repo","type":"module"},{"doc":"Callback implementation for Ecto.Repo.aggregate/3 .","ref":"FlappyBird.Repo.html#aggregate/3","title":"FlappyBird.Repo.aggregate/3","type":"function"},{"doc":"Callback implementation for Ecto.Repo.aggregate/4 .","ref":"FlappyBird.Repo.html#aggregate/4","title":"FlappyBird.Repo.aggregate/4","type":"function"},{"doc":"Callback implementation for Ecto.Repo.all/2 .","ref":"FlappyBird.Repo.html#all/2","title":"FlappyBird.Repo.all/2","type":"function"},{"doc":"Callback implementation for Ecto.Repo.checked_out?/0 .","ref":"FlappyBird.Repo.html#checked_out?/0","title":"FlappyBird.Repo.checked_out?/0","type":"function"},{"doc":"Callback implementation for Ecto.Repo.checkout/2 .","ref":"FlappyBird.Repo.html#checkout/2","title":"FlappyBird.Repo.checkout/2","type":"function"},{"doc":"","ref":"FlappyBird.Repo.html#child_spec/1","title":"FlappyBird.Repo.child_spec/1","type":"function"},{"doc":"Callback implementation for Ecto.Repo.config/0 .","ref":"FlappyBird.Repo.html#config/0","title":"FlappyBird.Repo.config/0","type":"function"},{"doc":"Callback implementation for Ecto.Repo.default_options/1 .","ref":"FlappyBird.Repo.html#default_options/1","title":"FlappyBird.Repo.default_options/1","type":"function"},{"doc":"Callback implementation for Ecto.Repo.delete/2 .","ref":"FlappyBird.Repo.html#delete/2","title":"FlappyBird.Repo.delete/2","type":"function"},{"doc":"Callback implementation for Ecto.Repo.delete!/2 .","ref":"FlappyBird.Repo.html#delete!/2","title":"FlappyBird.Repo.delete!/2","type":"function"},{"doc":"Callback implementation for Ecto.Repo.delete_all/2 .","ref":"FlappyBird.Repo.html#delete_all/2","title":"FlappyBird.Repo.delete_all/2","type":"function"},{"doc":"A convenience function for SQL-based repositories that forces all connections in the pool to disconnect within the given interval. See Ecto.Adapters.SQL.disconnect_all/3 for more information.","ref":"FlappyBird.Repo.html#disconnect_all/2","title":"FlappyBird.Repo.disconnect_all/2","type":"function"},{"doc":"Callback implementation for Ecto.Repo.exists?/2 .","ref":"FlappyBird.Repo.html#exists?/2","title":"FlappyBird.Repo.exists?/2","type":"function"},{"doc":"A convenience function for SQL-based repositories that executes an EXPLAIN statement or similar depending on the adapter to obtain statistics for the given query. See Ecto.Adapters.SQL.explain/4 for more information.","ref":"FlappyBird.Repo.html#explain/3","title":"FlappyBird.Repo.explain/3","type":"function"},{"doc":"Callback implementation for Ecto.Repo.get/3 .","ref":"FlappyBird.Repo.html#get/3","title":"FlappyBird.Repo.get/3","type":"function"},{"doc":"Callback implementation for Ecto.Repo.get!/3 .","ref":"FlappyBird.Repo.html#get!/3","title":"FlappyBird.Repo.get!/3","type":"function"},{"doc":"Callback implementation for Ecto.Repo.get_by/3 .","ref":"FlappyBird.Repo.html#get_by/3","title":"FlappyBird.Repo.get_by/3","type":"function"},{"doc":"Callback implementation for Ecto.Repo.get_by!/3 .","ref":"FlappyBird.Repo.html#get_by!/3","title":"FlappyBird.Repo.get_by!/3","type":"function"},{"doc":"Callback implementation for Ecto.Repo.get_dynamic_repo/0 .","ref":"FlappyBird.Repo.html#get_dynamic_repo/0","title":"FlappyBird.Repo.get_dynamic_repo/0","type":"function"},{"doc":"Callback implementation for Ecto.Repo.in_transaction?/0 .","ref":"FlappyBird.Repo.html#in_transaction?/0","title":"FlappyBird.Repo.in_transaction?/0","type":"function"},{"doc":"Callback implementation for Ecto.Repo.insert/2 .","ref":"FlappyBird.Repo.html#insert/2","title":"FlappyBird.Repo.insert/2","type":"function"},{"doc":"Callback implementation for Ecto.Repo.insert!/2 .","ref":"FlappyBird.Repo.html#insert!/2","title":"FlappyBird.Repo.insert!/2","type":"function"},{"doc":"Callback implementation for Ecto.Repo.insert_all/3 .","ref":"FlappyBird.Repo.html#insert_all/3","title":"FlappyBird.Repo.insert_all/3","type":"function"},{"doc":"Callback implementation for Ecto.Repo.insert_or_update/2 .","ref":"FlappyBird.Repo.html#insert_or_update/2","title":"FlappyBird.Repo.insert_or_update/2","type":"function"},{"doc":"Callback implementation for Ecto.Repo.insert_or_update!/2 .","ref":"FlappyBird.Repo.html#insert_or_update!/2","title":"FlappyBird.Repo.insert_or_update!/2","type":"function"},{"doc":"Callback implementation for Ecto.Repo.load/2 .","ref":"FlappyBird.Repo.html#load/2","title":"FlappyBird.Repo.load/2","type":"function"},{"doc":"Callback implementation for Ecto.Repo.one/2 .","ref":"FlappyBird.Repo.html#one/2","title":"FlappyBird.Repo.one/2","type":"function"},{"doc":"Callback implementation for Ecto.Repo.one!/2 .","ref":"FlappyBird.Repo.html#one!/2","title":"FlappyBird.Repo.one!/2","type":"function"},{"doc":"Callback implementation for Ecto.Repo.preload/3 .","ref":"FlappyBird.Repo.html#preload/3","title":"FlappyBird.Repo.preload/3","type":"function"},{"doc":"Callback implementation for Ecto.Repo.prepare_query/3 .","ref":"FlappyBird.Repo.html#prepare_query/3","title":"FlappyBird.Repo.prepare_query/3","type":"function"},{"doc":"Callback implementation for Ecto.Repo.put_dynamic_repo/1 .","ref":"FlappyBird.Repo.html#put_dynamic_repo/1","title":"FlappyBird.Repo.put_dynamic_repo/1","type":"function"},{"doc":"A convenience function for SQL-based repositories that executes the given query. See Ecto.Adapters.SQL.query/4 for more information.","ref":"FlappyBird.Repo.html#query/3","title":"FlappyBird.Repo.query/3","type":"function"},{"doc":"A convenience function for SQL-based repositories that executes the given query. See Ecto.Adapters.SQL.query!/4 for more information.","ref":"FlappyBird.Repo.html#query!/3","title":"FlappyBird.Repo.query!/3","type":"function"},{"doc":"A convenience function for SQL-based repositories that executes the given multi-result query. See Ecto.Adapters.SQL.query_many/4 for more information.","ref":"FlappyBird.Repo.html#query_many/3","title":"FlappyBird.Repo.query_many/3","type":"function"},{"doc":"A convenience function for SQL-based repositories that executes the given multi-result query. See Ecto.Adapters.SQL.query_many!/4 for more information.","ref":"FlappyBird.Repo.html#query_many!/3","title":"FlappyBird.Repo.query_many!/3","type":"function"},{"doc":"Callback implementation for Ecto.Repo.reload/2 .","ref":"FlappyBird.Repo.html#reload/2","title":"FlappyBird.Repo.reload/2","type":"function"},{"doc":"Callback implementation for Ecto.Repo.reload!/2 .","ref":"FlappyBird.Repo.html#reload!/2","title":"FlappyBird.Repo.reload!/2","type":"function"},{"doc":"Callback implementation for Ecto.Repo.rollback/1 .","ref":"FlappyBird.Repo.html#rollback/1","title":"FlappyBird.Repo.rollback/1","type":"function"},{"doc":"Callback implementation for Ecto.Repo.start_link/1 .","ref":"FlappyBird.Repo.html#start_link/1","title":"FlappyBird.Repo.start_link/1","type":"function"},{"doc":"Callback implementation for Ecto.Repo.stop/1 .","ref":"FlappyBird.Repo.html#stop/1","title":"FlappyBird.Repo.stop/1","type":"function"},{"doc":"Callback implementation for Ecto.Repo.stream/2 .","ref":"FlappyBird.Repo.html#stream/2","title":"FlappyBird.Repo.stream/2","type":"function"},{"doc":"A convenience function for SQL-based repositories that translates the given query to SQL. See Ecto.Adapters.SQL.to_sql/3 for more information.","ref":"FlappyBird.Repo.html#to_sql/2","title":"FlappyBird.Repo.to_sql/2","type":"function"},{"doc":"Callback implementation for Ecto.Repo.transaction/2 .","ref":"FlappyBird.Repo.html#transaction/2","title":"FlappyBird.Repo.transaction/2","type":"function"},{"doc":"Callback implementation for Ecto.Repo.update/2 .","ref":"FlappyBird.Repo.html#update/2","title":"FlappyBird.Repo.update/2","type":"function"},{"doc":"Callback implementation for Ecto.Repo.update!/2 .","ref":"FlappyBird.Repo.html#update!/2","title":"FlappyBird.Repo.update!/2","type":"function"},{"doc":"Callback implementation for Ecto.Repo.update_all/3 .","ref":"FlappyBird.Repo.html#update_all/3","title":"FlappyBird.Repo.update_all/3","type":"function"},{"doc":"Contexte de la gestion des scores.","ref":"FlappyBird.Scores.html","title":"FlappyBird.Scores","type":"module"},{"doc":"Renvoie un %Ecto.Changeset{} pour le suivi des changements d'un score. Exemples iex&gt; change_score ( score ) % Ecto.Changeset { data : % Score { } }","ref":"FlappyBird.Scores.html#change_score/2","title":"FlappyBird.Scores.change_score/2","type":"function"},{"doc":"Créer un score. Exemples iex&gt; create_score ( %{ field : value } ) { :ok , % Score { } } iex&gt; create_score ( %{ field : bad_value } ) { :error , % Ecto.Changeset { } }","ref":"FlappyBird.Scores.html#create_score/1","title":"FlappyBird.Scores.create_score/1","type":"function"},{"doc":"Supprimer un score. Exemples iex&gt; delete_score ( score ) { :ok , % Score { } } iex&gt; delete_score ( score ) { :error , % Ecto.Changeset { } }","ref":"FlappyBird.Scores.html#delete_score/1","title":"FlappyBird.Scores.delete_score/1","type":"function"},{"doc":"Obtenir un seul score. Lève Ecto.NoResultsError si le Score n'existe pas. Exemples iex&gt; get_score! ( 123 ) % Todo { } iex&gt; get_score! ( 456 ) ** (Ecto.NoResultsError)","ref":"FlappyBird.Scores.html#get_score!/1","title":"FlappyBird.Scores.get_score!/1","type":"function"},{"doc":"Retourne la liste des scores. Exemples iex&gt; list_scores ( ) [ % Score { } , ... ]","ref":"FlappyBird.Scores.html#list_scores/0","title":"FlappyBird.Scores.list_scores/0","type":"function"},{"doc":"","ref":"FlappyBird.Scores.html#subscribe/0","title":"FlappyBird.Scores.subscribe/0","type":"function"},{"doc":"Modifier un score. Exemples iex&gt; update_score ( score , %{ field : new_value } ) { :ok , % Score { } } iex&gt; update_score ( score , %{ field : bad_value } ) { :error , % Ecto.Changeset { } }","ref":"FlappyBird.Scores.html#update_score/2","title":"FlappyBird.Scores.update_score/2","type":"function"},{"doc":"Entitée/Shema de score pour la base de donnée Shema schema &quot;scores&quot; do field :value , :string timestamps ( ) end","ref":"FlappyBird.Scores.Score.html","title":"FlappyBird.Scores.Score","type":"module"},{"doc":"Le point d'entrée pour définir votre interface Web, comme en tant que contrôleurs, vues, canaux, etc. Cela peut être utilisé dans votre application comme : utiliser FlappyBirdWeb , :controller utiliser FlappyBirdWeb , :view Les définitions ci-dessous seront exécutées pour chaque vue, contrôleur, etc., alors gardez-les courts et clairs, concentrés sur les importations, les utilisations et les pseudonymes. Ne définissez PAS de fonctions à l'intérieur des expressions entre guillemets sous. Au lieu de cela, définissez n'importe quelle fonction d'assistance dans les modules et importez ces modules ici.","ref":"FlappyBirdWeb.html","title":"FlappyBirdWeb","type":"module"},{"doc":"Lorsqu'il est utilisé, envoyez-le au controller/view/etc. approprié.","ref":"FlappyBirdWeb.html#__using__/1","title":"FlappyBirdWeb.__using__/1","type":"macro"},{"doc":"","ref":"FlappyBirdWeb.html#channel/0","title":"FlappyBirdWeb.channel/0","type":"function"},{"doc":"","ref":"FlappyBirdWeb.html#component/0","title":"FlappyBirdWeb.component/0","type":"function"},{"doc":"","ref":"FlappyBirdWeb.html#controller/0","title":"FlappyBirdWeb.controller/0","type":"function"},{"doc":"","ref":"FlappyBirdWeb.html#live_component/0","title":"FlappyBirdWeb.live_component/0","type":"function"},{"doc":"","ref":"FlappyBirdWeb.html#live_view/0","title":"FlappyBirdWeb.live_view/0","type":"function"},{"doc":"","ref":"FlappyBirdWeb.html#router/0","title":"FlappyBirdWeb.router/0","type":"function"},{"doc":"","ref":"FlappyBirdWeb.html#view/0","title":"FlappyBirdWeb.view/0","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Endpoint.html","title":"FlappyBirdWeb.Endpoint","type":"module"},{"doc":"Callback implementation for Phoenix.Endpoint.broadcast/3 .","ref":"FlappyBirdWeb.Endpoint.html#broadcast/3","title":"FlappyBirdWeb.Endpoint.broadcast/3","type":"function"},{"doc":"Callback implementation for Phoenix.Endpoint.broadcast!/3 .","ref":"FlappyBirdWeb.Endpoint.html#broadcast!/3","title":"FlappyBirdWeb.Endpoint.broadcast!/3","type":"function"},{"doc":"Callback implementation for Phoenix.Endpoint.broadcast_from/4 .","ref":"FlappyBirdWeb.Endpoint.html#broadcast_from/4","title":"FlappyBirdWeb.Endpoint.broadcast_from/4","type":"function"},{"doc":"Callback implementation for Phoenix.Endpoint.broadcast_from!/4 .","ref":"FlappyBirdWeb.Endpoint.html#broadcast_from!/4","title":"FlappyBirdWeb.Endpoint.broadcast_from!/4","type":"function"},{"doc":"Callback implementation for Plug.call/2 .","ref":"FlappyBirdWeb.Endpoint.html#call/2","title":"FlappyBirdWeb.Endpoint.call/2","type":"function"},{"doc":"Returns the child specification to start the endpoint under a supervision tree.","ref":"FlappyBirdWeb.Endpoint.html#child_spec/1","title":"FlappyBirdWeb.Endpoint.child_spec/1","type":"function"},{"doc":"Returns the endpoint configuration for key Returns default if the key does not exist.","ref":"FlappyBirdWeb.Endpoint.html#config/2","title":"FlappyBirdWeb.Endpoint.config/2","type":"function"},{"doc":"Reloads the configuration given the application environment changes.","ref":"FlappyBirdWeb.Endpoint.html#config_change/2","title":"FlappyBirdWeb.Endpoint.config_change/2","type":"function"},{"doc":"Returns the host for the given endpoint.","ref":"FlappyBirdWeb.Endpoint.html#host/0","title":"FlappyBirdWeb.Endpoint.host/0","type":"function"},{"doc":"Callback implementation for Plug.init/1 .","ref":"FlappyBirdWeb.Endpoint.html#init/1","title":"FlappyBirdWeb.Endpoint.init/1","type":"function"},{"doc":"Callback implementation for Phoenix.Endpoint.local_broadcast/3 .","ref":"FlappyBirdWeb.Endpoint.html#local_broadcast/3","title":"FlappyBirdWeb.Endpoint.local_broadcast/3","type":"function"},{"doc":"Callback implementation for Phoenix.Endpoint.local_broadcast_from/4 .","ref":"FlappyBirdWeb.Endpoint.html#local_broadcast_from/4","title":"FlappyBirdWeb.Endpoint.local_broadcast_from/4","type":"function"},{"doc":"Generates the path information when routing to this endpoint.","ref":"FlappyBirdWeb.Endpoint.html#path/1","title":"FlappyBirdWeb.Endpoint.path/1","type":"function"},{"doc":"Generates the script name.","ref":"FlappyBirdWeb.Endpoint.html#script_name/0","title":"FlappyBirdWeb.Endpoint.script_name/0","type":"function"},{"doc":"Starts the endpoint supervision tree. Options :log_access_url - if the access url should be logged once the endpoint starts All other options are merged into the endpoint configuration.","ref":"FlappyBirdWeb.Endpoint.html#start_link/1","title":"FlappyBirdWeb.Endpoint.start_link/1","type":"function"},{"doc":"Generates a base64-encoded cryptographic hash (sha512) to a static file in priv/static . Meant to be used for Subresource Integrity with CDNs.","ref":"FlappyBirdWeb.Endpoint.html#static_integrity/1","title":"FlappyBirdWeb.Endpoint.static_integrity/1","type":"function"},{"doc":"Returns a two item tuple with the first item being the static_path and the second item being the static_integrity .","ref":"FlappyBirdWeb.Endpoint.html#static_lookup/1","title":"FlappyBirdWeb.Endpoint.static_lookup/1","type":"function"},{"doc":"Generates a route to a static file in priv/static .","ref":"FlappyBirdWeb.Endpoint.html#static_path/1","title":"FlappyBirdWeb.Endpoint.static_path/1","type":"function"},{"doc":"Generates the static URL without any path information. It uses the configuration under :static_url to generate such. It falls back to :url if :static_url is not set.","ref":"FlappyBirdWeb.Endpoint.html#static_url/0","title":"FlappyBirdWeb.Endpoint.static_url/0","type":"function"},{"doc":"Generates the endpoint base URL but as a URI struct. It uses the configuration under :url to generate such. Useful for manipulating the URL data and passing it to URL helpers.","ref":"FlappyBirdWeb.Endpoint.html#struct_url/0","title":"FlappyBirdWeb.Endpoint.struct_url/0","type":"function"},{"doc":"Callback implementation for Phoenix.Endpoint.subscribe/2 .","ref":"FlappyBirdWeb.Endpoint.html#subscribe/2","title":"FlappyBirdWeb.Endpoint.subscribe/2","type":"function"},{"doc":"Callback implementation for Phoenix.Endpoint.unsubscribe/1 .","ref":"FlappyBirdWeb.Endpoint.html#unsubscribe/1","title":"FlappyBirdWeb.Endpoint.unsubscribe/1","type":"function"},{"doc":"Generates the endpoint base URL without any path information. It uses the configuration under :url to generate such.","ref":"FlappyBirdWeb.Endpoint.html#url/0","title":"FlappyBirdWeb.Endpoint.url/0","type":"function"},{"doc":"Commodités pour traduire et créer des messages d'erreur.","ref":"FlappyBirdWeb.ErrorHelpers.html","title":"FlappyBirdWeb.ErrorHelpers","type":"module"},{"doc":"Génère une balise pour les erreurs de saisie de formulaire en ligne.","ref":"FlappyBirdWeb.ErrorHelpers.html#error_tag/2","title":"FlappyBirdWeb.ErrorHelpers.error_tag/2","type":"function"},{"doc":"Traduit un message d'erreur à l'aide de gettext.","ref":"FlappyBirdWeb.ErrorHelpers.html#translate_error/1","title":"FlappyBirdWeb.ErrorHelpers.translate_error/1","type":"function"},{"doc":"","ref":"FlappyBirdWeb.ErrorView.html","title":"FlappyBirdWeb.ErrorView","type":"module"},{"doc":"The resource name, as an atom, for this view","ref":"FlappyBirdWeb.ErrorView.html#__resource__/0","title":"FlappyBirdWeb.ErrorView.__resource__/0","type":"function"},{"doc":"Renders the given template locally.","ref":"FlappyBirdWeb.ErrorView.html#render/2","title":"FlappyBirdWeb.ErrorView.render/2","type":"function"},{"doc":"Callback invoked when no template is found. By default it raises but can be customized to render a particular template.","ref":"FlappyBirdWeb.ErrorView.html#template_not_found/2","title":"FlappyBirdWeb.ErrorView.template_not_found/2","type":"function"},{"doc":"Module de liaison entre son controller dans flappy_bird et sa vue portant le même nom: game .","ref":"FlappyBirdWeb.GameLive.html","title":"FlappyBirdWeb.GameLive","type":"module"},{"doc":"Attrapeur d'événement Description récupère game dans le socket reçus, puis effectue l'action selon le nom de l'événement qui lui est associé. Nom d'événement disponible keydown --&gt; selon le state de game :ok --&gt; appel la fonction Game.flap() et assigne la valeur de retour au game contenue dans le socket autre --&gt; appel la fonction new_game() save --&gt; récupère game dans le socket et passe son score convertie en string à la fonction Game.save_score() Paramètre binary --&gt; nom de l'événement en string arg2 --&gt; non utilisé Socket","ref":"FlappyBirdWeb.GameLive.html#handle_event/3","title":"FlappyBirdWeb.GameLive.handle_event/3","type":"function"},{"doc":"Constructeur Description appel la fonction new_game de FlappyBird.Game avant de faire un rendu de sa vue, en retournant ainsi :ok et game Paramètre Params --&gt; non utilisé Session --&gt; non utilisé Socket","ref":"FlappyBirdWeb.GameLive.html#mount/3","title":"FlappyBirdWeb.GameLive.mount/3","type":"function"},{"doc":"Rendu de la page","ref":"FlappyBirdWeb.GameLive.html#render/1","title":"FlappyBirdWeb.GameLive.render/1","type":"function"},{"doc":"FlappyBirdWeb.GameView retourne la vue s'appellant 'Game'","ref":"FlappyBirdWeb.GameView.html","title":"FlappyBirdWeb.GameView","type":"module"},{"doc":"The resource name, as an atom, for this view","ref":"FlappyBirdWeb.GameView.html#__resource__/0","title":"FlappyBirdWeb.GameView.__resource__/0","type":"function"},{"doc":"Convertie un score(double) pour une valeur float Exemples iex&gt; format_score(value) {:ok, %Score{}} Type d'utilisation format_score(score) Type de retour retourne score","ref":"FlappyBirdWeb.GameView.html#format_score/1","title":"FlappyBirdWeb.GameView.format_score/1","type":"function"},{"doc":"","ref":"FlappyBirdWeb.GameView.html#index.html/1","title":"FlappyBirdWeb.GameView.index.html/1","type":"function"},{"doc":"Renders the given template locally.","ref":"FlappyBirdWeb.GameView.html#render/2","title":"FlappyBirdWeb.GameView.render/2","type":"function"},{"doc":"Callback invoked when no template is found. By default it raises but can be customized to render a particular template.","ref":"FlappyBirdWeb.GameView.html#template_not_found/2","title":"FlappyBirdWeb.GameView.template_not_found/2","type":"function"},{"doc":"Un module fournissant l'internationalisation avec une API basée sur gettext. En utilisant Gettext , votre module gagne un ensemble de macros pour les traductions, par exemple : importer FlappyBirdWeb.Gettext # Traduction simplifiée gettext ( &quot;Voici la chaîne à traduire&quot; ) # Traduction plurielle ngettext ( &quot;Voici la chaîne à traduire&quot; , &quot;Voici les chaînes à traduire&quot; , 3 ) # Traduction basée sur le domaine dgettext ( &quot;errors&quot; , &quot;Voici le message d&#39;erreur à traduire&quot; ) Voir le Gettext Docs pour une utilisation détaillée.","ref":"FlappyBirdWeb.Gettext.html","title":"FlappyBirdWeb.Gettext","type":"module"},{"doc":"Callback implementation for Gettext.Backend.dgettext/3 .","ref":"FlappyBirdWeb.Gettext.html#dgettext/3","title":"FlappyBirdWeb.Gettext.dgettext/3","type":"macro"},{"doc":"Callback implementation for Gettext.Backend.dgettext_noop/2 .","ref":"FlappyBirdWeb.Gettext.html#dgettext_noop/2","title":"FlappyBirdWeb.Gettext.dgettext_noop/2","type":"macro"},{"doc":"Callback implementation for Gettext.Backend.dngettext/5 .","ref":"FlappyBirdWeb.Gettext.html#dngettext/5","title":"FlappyBirdWeb.Gettext.dngettext/5","type":"macro"},{"doc":"Callback implementation for Gettext.Backend.dngettext_noop/3 .","ref":"FlappyBirdWeb.Gettext.html#dngettext_noop/3","title":"FlappyBirdWeb.Gettext.dngettext_noop/3","type":"macro"},{"doc":"Callback implementation for Gettext.Backend.dpgettext/4 .","ref":"FlappyBirdWeb.Gettext.html#dpgettext/4","title":"FlappyBirdWeb.Gettext.dpgettext/4","type":"macro"},{"doc":"","ref":"FlappyBirdWeb.Gettext.html#dpgettext_noop/3","title":"FlappyBirdWeb.Gettext.dpgettext_noop/3","type":"macro"},{"doc":"Callback implementation for Gettext.Backend.dpngettext/6 .","ref":"FlappyBirdWeb.Gettext.html#dpngettext/6","title":"FlappyBirdWeb.Gettext.dpngettext/6","type":"macro"},{"doc":"","ref":"FlappyBirdWeb.Gettext.html#dpngettext_noop/4","title":"FlappyBirdWeb.Gettext.dpngettext_noop/4","type":"macro"},{"doc":"Callback implementation for Gettext.Backend.gettext/2 .","ref":"FlappyBirdWeb.Gettext.html#gettext/2","title":"FlappyBirdWeb.Gettext.gettext/2","type":"macro"},{"doc":"Callback implementation for Gettext.Backend.gettext_comment/1 .","ref":"FlappyBirdWeb.Gettext.html#gettext_comment/1","title":"FlappyBirdWeb.Gettext.gettext_comment/1","type":"macro"},{"doc":"Callback implementation for Gettext.Backend.gettext_noop/1 .","ref":"FlappyBirdWeb.Gettext.html#gettext_noop/1","title":"FlappyBirdWeb.Gettext.gettext_noop/1","type":"macro"},{"doc":"Callback implementation for Gettext.Backend.handle_missing_bindings/2 .","ref":"FlappyBirdWeb.Gettext.html#handle_missing_bindings/2","title":"FlappyBirdWeb.Gettext.handle_missing_bindings/2","type":"function"},{"doc":"Callback implementation for Gettext.Backend.handle_missing_plural_translation/7 .","ref":"FlappyBirdWeb.Gettext.html#handle_missing_plural_translation/7","title":"FlappyBirdWeb.Gettext.handle_missing_plural_translation/7","type":"function"},{"doc":"Callback implementation for Gettext.Backend.handle_missing_translation/5 .","ref":"FlappyBirdWeb.Gettext.html#handle_missing_translation/5","title":"FlappyBirdWeb.Gettext.handle_missing_translation/5","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Gettext.html#lgettext/5","title":"FlappyBirdWeb.Gettext.lgettext/5","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Gettext.html#lngettext/7","title":"FlappyBirdWeb.Gettext.lngettext/7","type":"function"},{"doc":"Callback implementation for Gettext.Backend.ngettext/4 .","ref":"FlappyBirdWeb.Gettext.html#ngettext/4","title":"FlappyBirdWeb.Gettext.ngettext/4","type":"macro"},{"doc":"Callback implementation for Gettext.Backend.ngettext_noop/2 .","ref":"FlappyBirdWeb.Gettext.html#ngettext_noop/2","title":"FlappyBirdWeb.Gettext.ngettext_noop/2","type":"macro"},{"doc":"Callback implementation for Gettext.Backend.pgettext/3 .","ref":"FlappyBirdWeb.Gettext.html#pgettext/3","title":"FlappyBirdWeb.Gettext.pgettext/3","type":"macro"},{"doc":"","ref":"FlappyBirdWeb.Gettext.html#pgettext_noop/2","title":"FlappyBirdWeb.Gettext.pgettext_noop/2","type":"macro"},{"doc":"Callback implementation for Gettext.Backend.pngettext/5 .","ref":"FlappyBirdWeb.Gettext.html#pngettext/5","title":"FlappyBirdWeb.Gettext.pngettext/5","type":"macro"},{"doc":"","ref":"FlappyBirdWeb.Gettext.html#pngettext_noop/3","title":"FlappyBirdWeb.Gettext.pngettext_noop/3","type":"macro"},{"doc":"","ref":"FlappyBirdWeb.LayoutView.html","title":"FlappyBirdWeb.LayoutView","type":"module"},{"doc":"The resource name, as an atom, for this view","ref":"FlappyBirdWeb.LayoutView.html#__resource__/0","title":"FlappyBirdWeb.LayoutView.__resource__/0","type":"function"},{"doc":"","ref":"FlappyBirdWeb.LayoutView.html#app.html/1","title":"FlappyBirdWeb.LayoutView.app.html/1","type":"function"},{"doc":"","ref":"FlappyBirdWeb.LayoutView.html#live.html/1","title":"FlappyBirdWeb.LayoutView.live.html/1","type":"function"},{"doc":"Renders the given template locally.","ref":"FlappyBirdWeb.LayoutView.html#render/2","title":"FlappyBirdWeb.LayoutView.render/2","type":"function"},{"doc":"","ref":"FlappyBirdWeb.LayoutView.html#root.html/1","title":"FlappyBirdWeb.LayoutView.root.html/1","type":"function"},{"doc":"Callback invoked when no template is found. By default it raises but can be customized to render a particular template.","ref":"FlappyBirdWeb.LayoutView.html#template_not_found/2","title":"FlappyBirdWeb.LayoutView.template_not_found/2","type":"function"},{"doc":"","ref":"FlappyBirdWeb.PageController.html","title":"FlappyBirdWeb.PageController","type":"module"},{"doc":"Indexion et rendu de la page &quot;index.html&quot;","ref":"FlappyBirdWeb.PageController.html#index/2","title":"FlappyBirdWeb.PageController.index/2","type":"function"},{"doc":"FlappyBirdWeb.PageView retourne la vue s'appellant 'Page'","ref":"FlappyBirdWeb.PageView.html","title":"FlappyBirdWeb.PageView","type":"module"},{"doc":"The resource name, as an atom, for this view","ref":"FlappyBirdWeb.PageView.html#__resource__/0","title":"FlappyBirdWeb.PageView.__resource__/0","type":"function"},{"doc":"","ref":"FlappyBirdWeb.PageView.html#index.html/1","title":"FlappyBirdWeb.PageView.index.html/1","type":"function"},{"doc":"Renders the given template locally.","ref":"FlappyBirdWeb.PageView.html#render/2","title":"FlappyBirdWeb.PageView.render/2","type":"function"},{"doc":"Callback invoked when no template is found. By default it raises but can be customized to render a particular template.","ref":"FlappyBirdWeb.PageView.html#template_not_found/2","title":"FlappyBirdWeb.PageView.template_not_found/2","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Router.html","title":"FlappyBirdWeb.Router","type":"module"},{"doc":"","ref":"FlappyBirdWeb.Router.html#api/2","title":"FlappyBirdWeb.Router.api/2","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Router.html#browser/2","title":"FlappyBirdWeb.Router.browser/2","type":"function"},{"doc":"Callback invoked by Plug on every request.","ref":"FlappyBirdWeb.Router.html#call/2","title":"FlappyBirdWeb.Router.call/2","type":"function"},{"doc":"Callback required by Plug that initializes the router for serving web requests.","ref":"FlappyBirdWeb.Router.html#init/1","title":"FlappyBirdWeb.Router.init/1","type":"function"},{"doc":"Module with named helpers generated from FlappyBirdWeb.Router.","ref":"FlappyBirdWeb.Router.Helpers.html","title":"FlappyBirdWeb.Router.Helpers","type":"module"},{"doc":"","ref":"FlappyBirdWeb.Router.Helpers.html#live_dashboard_path/2","title":"FlappyBirdWeb.Router.Helpers.live_dashboard_path/2","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Router.Helpers.html#live_dashboard_path/3","title":"FlappyBirdWeb.Router.Helpers.live_dashboard_path/3","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Router.Helpers.html#live_dashboard_path/4","title":"FlappyBirdWeb.Router.Helpers.live_dashboard_path/4","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Router.Helpers.html#live_dashboard_path/5","title":"FlappyBirdWeb.Router.Helpers.live_dashboard_path/5","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Router.Helpers.html#live_dashboard_url/2","title":"FlappyBirdWeb.Router.Helpers.live_dashboard_url/2","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Router.Helpers.html#live_dashboard_url/3","title":"FlappyBirdWeb.Router.Helpers.live_dashboard_url/3","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Router.Helpers.html#live_dashboard_url/4","title":"FlappyBirdWeb.Router.Helpers.live_dashboard_url/4","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Router.Helpers.html#live_dashboard_url/5","title":"FlappyBirdWeb.Router.Helpers.live_dashboard_url/5","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Router.Helpers.html#live_path/2","title":"FlappyBirdWeb.Router.Helpers.live_path/2","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Router.Helpers.html#live_path/3","title":"FlappyBirdWeb.Router.Helpers.live_path/3","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Router.Helpers.html#live_url/2","title":"FlappyBirdWeb.Router.Helpers.live_url/2","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Router.Helpers.html#live_url/3","title":"FlappyBirdWeb.Router.Helpers.live_url/3","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Router.Helpers.html#page_path/2","title":"FlappyBirdWeb.Router.Helpers.page_path/2","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Router.Helpers.html#page_path/3","title":"FlappyBirdWeb.Router.Helpers.page_path/3","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Router.Helpers.html#page_url/2","title":"FlappyBirdWeb.Router.Helpers.page_url/2","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Router.Helpers.html#page_url/3","title":"FlappyBirdWeb.Router.Helpers.page_url/3","type":"function"},{"doc":"Generates the path information including any necessary prefix.","ref":"FlappyBirdWeb.Router.Helpers.html#path/2","title":"FlappyBirdWeb.Router.Helpers.path/2","type":"function"},{"doc":"Generates an integrity hash to a static asset given its file path.","ref":"FlappyBirdWeb.Router.Helpers.html#static_integrity/2","title":"FlappyBirdWeb.Router.Helpers.static_integrity/2","type":"function"},{"doc":"Generates path to a static asset given its file path.","ref":"FlappyBirdWeb.Router.Helpers.html#static_path/2","title":"FlappyBirdWeb.Router.Helpers.static_path/2","type":"function"},{"doc":"Generates url to a static asset given its file path.","ref":"FlappyBirdWeb.Router.Helpers.html#static_url/2","title":"FlappyBirdWeb.Router.Helpers.static_url/2","type":"function"},{"doc":"Generates the connection/endpoint base URL without any path information.","ref":"FlappyBirdWeb.Router.Helpers.html#url/1","title":"FlappyBirdWeb.Router.Helpers.url/1","type":"function"},{"doc":"FlappyBirdWeb.SVG retourne la vue contenant le svg du logo de l'application","ref":"FlappyBirdWeb.SVGView.html","title":"FlappyBirdWeb.SVGView","type":"module"},{"doc":"The resource name, as an atom, for this view","ref":"FlappyBirdWeb.SVGView.html#__resource__/0","title":"FlappyBirdWeb.SVGView.__resource__/0","type":"function"},{"doc":"","ref":"FlappyBirdWeb.SVGView.html#phoenix.html/1","title":"FlappyBirdWeb.SVGView.phoenix.html/1","type":"function"},{"doc":"Renders the given template locally.","ref":"FlappyBirdWeb.SVGView.html#render/2","title":"FlappyBirdWeb.SVGView.render/2","type":"function"},{"doc":"Callback invoked when no template is found. By default it raises but can be customized to render a particular template.","ref":"FlappyBirdWeb.SVGView.html#template_not_found/2","title":"FlappyBirdWeb.SVGView.template_not_found/2","type":"function"},{"doc":"Module de liaison entre son controller dans flappy_bird et sa vue portant le même nom: score .","ref":"FlappyBirdWeb.ScoreLive.html","title":"FlappyBirdWeb.ScoreLive","type":"module"},{"doc":"Constructeur Description appel la fonction Scores.subscribe pour être appeller a chaque changement de la liste des scores. Avant de faire un rendu de sa vue, en retournant les scores -&gt; Scores.list_scores() Paramètre Params --&gt; non utilisé Session --&gt; non utilisé Socket","ref":"FlappyBirdWeb.ScoreLive.html#mount/3","title":"FlappyBirdWeb.ScoreLive.mount/3","type":"function"},{"doc":"Rendu de la page","ref":"FlappyBirdWeb.ScoreLive.html#render/1","title":"FlappyBirdWeb.ScoreLive.render/1","type":"function"},{"doc":"FlappyBirdWeb.ScoreView retourne la vue s'appellant 'Score'","ref":"FlappyBirdWeb.ScoreView.html","title":"FlappyBirdWeb.ScoreView","type":"module"},{"doc":"The resource name, as an atom, for this view","ref":"FlappyBirdWeb.ScoreView.html#__resource__/0","title":"FlappyBirdWeb.ScoreView.__resource__/0","type":"function"},{"doc":"","ref":"FlappyBirdWeb.ScoreView.html#index.html/1","title":"FlappyBirdWeb.ScoreView.index.html/1","type":"function"},{"doc":"Renders the given template locally.","ref":"FlappyBirdWeb.ScoreView.html#render/2","title":"FlappyBirdWeb.ScoreView.render/2","type":"function"},{"doc":"Callback invoked when no template is found. By default it raises but can be customized to render a particular template.","ref":"FlappyBirdWeb.ScoreView.html#template_not_found/2","title":"FlappyBirdWeb.ScoreView.template_not_found/2","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Telemetry.html","title":"FlappyBirdWeb.Telemetry","type":"module"},{"doc":"Returns a specification to start this module under a supervisor. See Supervisor .","ref":"FlappyBirdWeb.Telemetry.html#child_spec/1","title":"FlappyBirdWeb.Telemetry.child_spec/1","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Telemetry.html#metrics/0","title":"FlappyBirdWeb.Telemetry.metrics/0","type":"function"},{"doc":"","ref":"FlappyBirdWeb.Telemetry.html#start_link/1","title":"FlappyBirdWeb.Telemetry.start_link/1","type":"function"},{"doc":"","ref":"FlappyBirdWeb.ViewHelpers.html","title":"FlappyBirdWeb.ViewHelpers","type":"module"},{"doc":"","ref":"FlappyBirdWeb.ViewHelpers.html#svg/2","title":"FlappyBirdWeb.ViewHelpers.svg/2","type":"function"},{"doc":"Pour démarrer votre serveur Phoenix : Installer les dépendances avec mix deps.get Créez et migrez votre base de données avec mix ecto.setup Démarrer le point de terminaison Phoenix avec mix phx.server ou à l'intérieur d'IEx avec iex -S mix phx.server Vous pouvez maintenant visiter localhost:4000 depuis votre navigateur. Prêt à fonctionner en production ? S'il vous plaît consultez nos guides de déploiement .","ref":"readme.html","title":"FlappyBird","type":"extras"},{"doc":"Site officiel: https://www.phoenixframework.org/ Guides: https://hexdocs.pm/phoenix/overview.html Docs: https://hexdocs.pm/phoenix Forum: https://elixirforum.com/c/phoenix-forum Source: https://github.com/phoenixframework/phoenix","ref":"readme.html#plus","title":"FlappyBird - Plus","type":"extras"}]