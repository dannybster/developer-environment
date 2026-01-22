# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/Projects/garmr"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "garmr"; then

  window_root "$HOME/Dropbox/shipd/neoma/neoma-garmr"

  # Create the window the runs the server and Cypress tests.
  # new_window "server/cypress"
  # split_h 50
  #
  # select_pane 1
  # run_cmd "npm run start:neoma:cypress"
  #
  # select_pane 2
  # run_cmd "npm run cypress"
  #

  # Create a window that runs the tests.
  new_window "tests"
  split_h 50

  select_pane 1
  run_cmd "npm run test:e2e"

  select_pane 2
  run_cmd "npm run test"

  # Create a window contains the IDE.
  new_window "ide"
  run_cmd "nvim"

  # Open Claude Window
  new_window "claude"
  run_cmd "claude --resume"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
