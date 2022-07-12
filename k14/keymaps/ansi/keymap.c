/*
Copyright 2020 Dimitris Mantzouranis
Copyright 2022 Pablo Ramirez

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include QMK_KEYBOARD_H

// Each layer gets a name for readability, which is then used in the keymap matrix below.
// The underscores don't mean anything - you can have a layer called STUFF or any other name.
// Layer names don't all need to be of the same length, obviously, and you can also skip them
// entirely and just use numbers.
enum layer_names {
    WIN_BASE = 0,
    WIN_FN1  = 1,
    MAC_BASE = 2,
    MAC_FN1  = 3,
    FN2      = 4,
};

#define KC_TASK LGUI(KC_TAB)        // Task viewer
#define KC_FLXP LGUI(KC_E)          // Windows file explorer

#define KC_MSSN LGUI(KC_F3)         // Mission Control
#define KC_FIND LALT(LGUI(KC_SPC))  // Finder
#define KC_MSNP LSFT(LGUI(KC_4))    // Mac snip tool

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

        /*
        +--------------------------------------------------------------------------+----+----+
        | ESC |  1 |  2 |  3 |  4 |  5 |  6 |  7 |  8 |  9 |  0 |  - |  = | BACKSP | INS| RGB|
        +--------------------------------------------------------------------------+----+----+
        |  TAB  |  Q |  W |  E |  R |  T |  Y |  U |  I |  O |  P |  [ |  ] |   \  | END| DEL|
        +--------------------------------------------------------------------------+----+----+
        | CAPSLCK |  A |  S |  D |  F |  G |  H |  J |  K |  L |  ; |  ' |  RETURN | HME|PDUP|
        +--------------------------------------------------------------------------+----+----+
        | LSHIFT   |  Z |  X |  C |  V |  B |  N |  M |  , |  . |  / |   RSHIFT    | UP |PDDN|
        +--------------------------------------------------------------------------+----+----+
        |LCTRL| LGUI|  LALT|            SPACE             |RALT|LCTL| FN1| FN2| DWN| RGT|LEFT|
        +--------------------------------------------------------------------------+----+----+
        */
    [0] = LAYOUT_70_ansi(
        KC_ESC,    KC_1,      KC_2,      KC_3,    KC_4,    KC_5,    KC_6,     KC_7,    KC_8,    KC_9,      KC_0,           KC_MINS,  KC_EQL,       KC_BSPC,    KC_INS,  
        KC_TAB,    KC_Q,      KC_W,      KC_E,    KC_R,    KC_T,    KC_Y,     KC_U,    KC_I,    KC_O,      KC_P,          KC_LBRC,   KC_RBRC,     KC_BSLS,    KC_DEL,    
        KC_CAPS,   KC_A,      KC_S,      KC_D,    KC_F,    KC_G,    KC_H,     KC_J,    KC_K,    KC_L,      KC_SCLN,       KC_QUOT,           KC_ENT,         KC_HOME,   
        KC_LSFT,              KC_Z,      KC_X,    KC_C,    KC_V,    KC_B,     KC_N,    KC_M,    KC_COMM,   KC_DOT,        KC_SLSH,  KC_LSFT,        KC_UP,   KC_PGDN,  
        KC_LCTL,   KC_LGUI,   KC_LALT,                              KC_SPC,                          KC_RALT,   MO(1),   KC_RCTL,  KC_LEFT,  KC_DOWN,   KC_RGHT   
    ),

    [1] = LAYOUT_70_ansi(
            RESET,    _______,      _______,      _______,    _______,    _______,    _______,      _______,    _______,    _______,      _______,       _______,  _______,       _______,    _______,  
            _______,    _______,      _______,      _______,    _______,    _______,    _______,     _______,    _______,    _______,      _______,       _______,   _______,     _______,    _______,    
            _______,   _______,      _______,      _______,    _______,    _______,    _______,     _______,    _______,    _______,      _______,       _______,           _______,         _______,   
            _______,              _______,      _______,    _______,    _______,    _______,     _______,    _______,    _______,   _______,        _______,  _______,        _______,   _______,  
            _______,   _______,   _______,                              _______,                          _______,   MO(0),   _______,  _______,  _______,   _______   
        ),


};
bool dip_switch_update_user(uint8_t index, bool active){
  switch(index){
    case 0:
      if(active){ //Mac/iOS mode
        layer_move(MAC_BASE);
      }
      else{ // Win/Android mode
        layer_move(WIN_BASE);
      }
      break;
    case 1:
      if(active){ //BT mode
        // do stuff
      }
      else{ //Cable mode
        // do stuff
      }
      break;
  }
  return true;
}
void keyboard_post_init_user(void) {
  // Customise these values to desired behaviour
  //debug_enable=true;
  //debug_matrix=true;
  //debug_keyboard=true;
  //debug_mouse=true;
}
