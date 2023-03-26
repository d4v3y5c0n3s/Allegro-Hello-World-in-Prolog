:- include(allegro_binding).

game_loop(Q, DoRedraw, Font) :-
    al_wait_for_event(Q, allegro_event(ID, _, _, _)),
    allegro_event_type(EvName, ID),
    (((EvName = 'ALLEGRO_EVENT_TIMER'; DoRedraw = redraw),
     al_is_event_queue_empty(Q, IsEmpty),
     (IsEmpty,
      al_map_rgb(0, 0, 0, Color),
      al_clear_to_color(Color),
      al_map_rgb(255, 255, 255, TextColor),
      al_draw_text(Font, TextColor, 0, 0, 0, 'Hello World!'),
      al_flip_display,
      game_loop(Q, noredraw, Font);
      game_loop(Q, redraw, Font)
     )
    );
    ((EvName = 'ALLEGRO_EVENT_KEY_DOWN';
     EvName = 'ALLEGRO_EVENT_DISPLAY_CLOSE'), write(exit));
    EvName = _,
    game_loop(Q, DoRedraw, Font)).

hello_world :-
  Speed is 1 / 30,
  al_create_timer(Speed, Timer),
  al_create_event_queue(Queue),
  al_create_display(320, 200, Display),
  al_create_builtin_font(Font),
  al_get_keyboard_event_source(KB_Events),
  al_register_event_source(Queue, KB_Events),
  al_get_display_event_source(Display, Display_EvSrc),
  al_register_event_source(Queue, Display_EvSrc),
  al_get_timer_event_source(Timer, Timer_EvSrc),
  al_register_event_source(Queue, Timer_EvSrc),
  al_start_timer(Timer),
  game_loop(Queue, redraw, Font).
