(if INIT_FILE
 (begin
  (: 'init_file)
  (asciz INIT_FILE)))
(align 4)
(cond
  (SVGA
    (: 'vga_draw_line_x)
    (tetra 0)
    (: 'vga_draw_line_y)
    (tetra 0)
    (: 'vga_draw_line_xi)
    (tetra 0)
    (: 'vga_draw_line_yi)
    (tetra 0)
    (: 'vga_draw_line_dx)
    (tetra 0)
    (: 'vga_draw_line_dy)
    (tetra 0)
    (: 'vga_foreground)
    (tetra #xffff)
    (: 'vga_background)
    (tetra #x0000)
    (let ((in (open-input-file "pixmaps")))
      (: 'pixmaps)
      (define (loop)
        (let ((c (read-char in)))
          (cond
            ((eof-object? c) #f)
            (else (byte c) (loop)))))
      (loop)
      (close-input-port in)))
  (else
    (: 'vga_attribute)
    (tetra #x07)))
(align 4)
(: 'key_ascii)
  (tetra -1)
(: 'keyboard_buffer_pos)
  (tetra 'keyboard_buffer)
(: 'keyboard_buffer_eob)
  (tetra 0)
(: 'toggle_echo)
  (tetra 'true)
(: 'current_keymap)
  (tetra 'keymap)
(: 'keymap)
  (bytes nokey escapekey #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9 #\0 #\- #\= 8)
  (bytes 9 #\q #\w #\e #\r #\t #\y #\u #\i #\o #\p #\[ #\] 10)
  (bytes nokey #\a #\s #\d #\f #\g #\h #\j #\k #\l #\; #\' #\` shiftkey)
  (bytes #\\ #\z #\x #\c #\v #\b #\n #\m #\, #\. #\/ shiftkey)
  (bytes #\* nokey #\space)
(: 'shiftkeymap)
  (bytes nokey escapekey #\! #\@ #\# #\$ #\% #\^ #\& #\* #\( #\) #\_ #\+ 8)
  (bytes 9 #\Q #\W #\E #\R #\T #\Y #\U #\I #\O #\P #\{ #\} 10)
  (bytes nokey #\A #\S #\D #\F #\G #\H #\J #\K #\L #\: #\" #\~ shiftkey)
  (bytes #\| #\Z #\X #\C #\V #\B #\N #\M #\< #\> #\? shiftkey)
  (bytes #\* nokey #\space)
(: 'last_input_port)
  (tetra 'input_ports)