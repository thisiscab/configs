#include "keymap_common.h"

#define BASE_QWERTY_LAYER 0
#define BASE_COLEMAK_LAYER 1
#define LOWER_LAYER 2
#define RAISE_LAYER 3
#define NAVIGATION_LAYER 4
#define GUI_LAYER 5
#define KEYBOARD_LAYER 6

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  /* Main layer (Qwerty)
   *                ,-----------------------------------------------------------------------.
   *                | Tab | Q   | W   | E   | R   | T   | Y   | U   | I   | O   | P   | Fn5 |
   *                |-----------------------------------------------------------------------|
   *                |Ctrl | A   | S   | D   | F   | G   | H   | J   | K   | L   |; Fn4|Ctrl |
   *                |-----------------------------------------------------------------------|
   *                |Shift| Z   | X   | C   | V   | B   | N   | M   | ,   | .   | /   |Shift|
   *                |-----------------------------------------------------------------------|
   *                | Fn3 |Hyper| Alt |Super| Fn1 |   Space   | Fn2 |Super| Alt |Hyper| Fn3 |
   *                `-----------------------------------------------------------------------'
   */
  [BASE_QWERTY_LAYER] = {
    {KC_TAB,   KC_Q,     KC_W,     KC_E,     KC_R,  KC_T,    KC_Y,    KC_U,  KC_I,     KC_O,     KC_P,     F(6)},
    {F(10),    KC_A,     KC_S,     KC_D,     KC_F,  KC_G,    KC_H,    KC_J,  KC_K,     KC_L,     F(2),     F(11)},
    {KC_LSFT,  KC_Z,     KC_X,     KC_C,     KC_V,  KC_B,    KC_N,    KC_M,  KC_COMM,  KC_DOT,   KC_SLSH,  KC_RSFT},
    {F(4),     KC_TRNS,  KC_LALT,  KC_LGUI,  F(0),  KC_SPC,  KC_SPC,  F(1),  KC_RGUI,  KC_TRNS,  KC_RALT,  F(5)}
  },
  /* Main layer (Colemak)
   *                ,-----------------------------------------------------------------------.
   *                |     | Q   | W   | F   | P   | G   | J   | L   | U   | Y   | ;   |     |
   *                |-----------------------------------------------------------------------|
   *                |     | A   | R   | S   | T   | D   | H   | N   | E   | I   |O Fn4|     |
   *                |-----------------------------------------------------------------------|
   *                |     | Z   | X   | C   | V   | B   | K   | M   |     |     |     |     |
   *                |-----------------------------------------------------------------------|
   *                |     |     |     |     |     |           |     |     |     |     |     |
   *                `-----------------------------------------------------------------------'
   */
  [BASE_COLEMAK_LAYER] = {
    {KC_TRNS,  KC_Q,     KC_W,     KC_F,     KC_P,     KC_G,     KC_J,     KC_L,     KC_U,     KC_Y,     KC_SCLN,  KC_TRNS},
    {KC_TRNS,  KC_A,     KC_R,     KC_S,     KC_T,     KC_D,     KC_H,     KC_N,     KC_E,     KC_I,     F(3),     KC_TRNS},
    {KC_TRNS,  KC_Z,     KC_X,     KC_C,     KC_V,     KC_B,     KC_K,     KC_M,     KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS},
    {KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS}
  },
  /* Numeric layer
   *                /-----------------------------------------------------------------------\
   *                |     | 1   | 2   | 3   | +   | a   | b   | c   | d   | e   | f   |     |
   *                |-----------------------------------------------------------------------|
   *                |     | 4   | 5   | 6   | -   |     |     |     |     |     |     |     |
   *                |-----------------------------------------------------------------------|
   *                |     | 7   | 8   | 9   | =   |     |     |     |     |     |     |     |
   *                |-----------------------------------------------------------------------|
   *                |     | 0   | .   |     |     | Backspace |     |     |     |     |     |
   *                `-----------------------------------------------------------------------'
   */
  [LOWER_LAYER] = {
    {KC_TRNS,  KC_1,  KC_2,     KC_3,     KC_PLUS,  KC_A,     KC_B,     KC_C,     KC_D,     KC_E,     KC_F,     KC_TRNS},
    {KC_TRNS,  KC_4,  KC_5,     KC_6,     KC_MINS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS},
    {KC_TRNS,  KC_7,  KC_8,     KC_9,     KC_EQL,   KC_BSPC,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS},
    {KC_TRNS,  KC_0,  KC_DOT,  KC_TRNS,  KC_TRNS,  KC_BSPC,  KC_BSPC,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS}
  },
  /* Symbol layer
   *                ,-----------------------------------------------------------------------.
   *                |     | !   | @   | #   | $   | %   | ^   | &   | *   | '   | "   |     | \
   *                |-----------------------------------------------------------------------|
   *                |     | _   | +   | ~   | |   |     |     | (   |  )  |  [  |  ]  |     | /    of lower layer
   *                |-----------------------------------------------------------------------|  |-- Mostly shifted version
   *                |     | -   | =   | \   |     |     |     | {   | }   |  <  |  >  |     |
   *                |-----------------------------------------------------------------------|
   *                |     |     |     |     |     |  Delete   |     |     |     |     |     |
   *                `-----------------------------------------------------------------------'
   */
  [RAISE_LAYER] = {
    {KC_TRNS,  S(KC_1),  S(KC_2),  S(KC_3),    S(KC_4),  S(KC_5),  S(KC_6),  S(KC_7),         S(KC_8),         KC_QUOT,      S(KC_QUOT),   KC_TRNS},
    {KC_TRNS,  KC_UNDS,  KC_PLUS,  KC_TILD,    KC_PIPE,  KC_TRNS,  KC_TRNS,  S(KC_9),         S(KC_0),         KC_LBRACKET,  KC_RBRACKET,  KC_TRNS},
    {KC_TRNS,  KC_MINS,  KC_EQL,   KC_BSLASH,  KC_TRNS,  KC_TRNS,  KC_TRNS,  S(KC_LBRACKET),  S(KC_RBRACKET),  S(KC_COMMA),  S(KC_DOT),    KC_TRNS},
    {KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,    KC_TRNS,  KC_DEL,   KC_DEL,   KC_TRNS,         KC_TRNS,         KC_TRNS,      KC_TRNS,      KC_TRNS}
  },
  /* Directional navigation layer
   *
   *         Large movements -----/```````````````````\   /```````````````````\----- Vim-style arrow keys
   *                ,-----------------------------------------------------------------------.
   *                |     |     |     |     |     |     |     |     |     |     |     |     |
   *                |-----------------------------------------------------------------------|
   *                |     |     |Home |PgUp |PgDn | End |Left |Down | Up  |Right|     |     |
   *                |-----------------------------------------------------------------------|
   *                |     |     |     |     |     |     |     |     |     |     |     |     |
   *                |-----------------------------------------------------------------------|
   *                |     |     |     |     |     |           |     |     |     |     |     |
   *                `-----------------------------------------------------------------------'
   */
  [NAVIGATION_LAYER] = {
    {KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,  KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO},
    {KC_TRNS, KC_NO,   KC_HOME, KC_PGUP, KC_PGDN, KC_END, KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, F(2),    KC_TRNS},
    {KC_TRNS, KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,  KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_TRNS},
    {KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_NO,   KC_NO,  KC_NO,   KC_NO,   KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS}
  },
  /* GUI (window management/mouse/media controls) layer
   *
   *        Mouse keys -----/```````````````````\               /```````````````````\----- Window manager
   *                ,-----------------------------------------------------------------------.
   *                |     |Ms B2|Ms Up|Ms B1|Ms WD|     |     |Prev | TL  | Top | TR  |     |
   *                |-----------------------------------------------------------------------|
   *                |     |Ms L |Ms Dn|Ms R |Ms WU|     |     |Full |Left |Centr|Right|     |
   *                |-----------------------------------------------------------------------|
   *                |     |Ms WL|Ms B3|Ms WR|     |     |     |Next | BL  | Bot | BR  |     |
   *                |-----------------------------------------------------------------------|
   *                |     |Prev |Play |Next |Brig-|   Sleep   |Brig+|Mute |Vol- |Vol+ |     |
   *                `-----------------------------------------------------------------------'
   *                                          \___ Screen/sleep __/
   */
  [GUI_LAYER] = {
    {KC_TRNS, KC_BTN2, KC_MS_U, KC_BTN1, KC_WH_D, KC_NO,   KC_NO,   LCTL(LALT(LGUI(KC_LEFT))), LCTL(LGUI(KC_LEFT)),    LALT(LGUI(KC_UP)),   LCTL(LGUI(KC_RGHT)),    KC_TRNS},
    {KC_TRNS, KC_MS_L, KC_MS_D, KC_MS_R, KC_WH_U, KC_NO,   KC_NO,   LALT(LGUI(KC_F)),          LALT(LGUI(KC_LEFT)),    LALT(LGUI(KC_C)),    LALT(LGUI(KC_RGHT)),    KC_TRNS},
    {KC_TRNS, KC_WH_L, KC_BTN3, KC_WH_R, KC_NO,   KC_NO,   KC_NO,   LCTL(LALT(LGUI(KC_RGHT))), S(LCTL(LGUI(KC_LEFT))), LALT(LGUI(KC_DOWN)), S(LCTL(LGUI(KC_RGHT))), KC_TRNS},
    {KC_TRNS, KC_MPRV, KC_MPLY, KC_MNXT, KC_SLCK, KC_SLEP, KC_SLEP, KC_PAUS,                   KC_MUTE,                KC_VOLD,             KC_VOLU,                KC_TRNS}
  },
  /* Keyboard layer
   *                ,-----------------------------------------------------------------------.
   *    Firmware -- |     |Reset|Debug|     |     |     |     |     |     |     |     |     |
   *                |-----------------------------------------------------------------------|
   * Set default -- |     |Qwert|Colem| ... |     |     |     |     |     |     |     |     |
   *       layer    |-----------------------------------------------------------------------|
   *                |     |     |     |     |     |     |     |     |     |     |     |     |
   *                |-----------------------------------------------------------------------|
   *                |     |     |     |     |LED- |  Toggle   |LED+ |     |     |     |     |
   *                `-----------------------------------------------------------------------'
   *                                          \___ LED controls __/
   */
  [KEYBOARD_LAYER] = {
    {KC_NO, RESET, DEBUG, KC_NO, KC_NO,  KC_NO,   KC_NO,   KC_NO,  KC_NO, KC_NO, KC_NO, KC_TRNS},
    {KC_NO, F(7),  F(8),  KC_NO, KC_NO,  KC_NO,   KC_NO,   KC_NO,  KC_NO, KC_NO, KC_NO, KC_NO},
    {KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,  KC_NO,   KC_NO,   KC_NO,  KC_NO, KC_NO, KC_NO, KC_NO},
    {KC_NO, KC_NO, KC_NO, KC_NO, BL_DEC, BL_TOGG, BL_TOGG, BL_INC, KC_NO, KC_NO, KC_NO, KC_NO}
  }
};

const uint16_t PROGMEM fn_actions[] = {
  // Layer switching
  [0] = ACTION_LAYER_TAP_TOGGLE(LOWER_LAYER),
  [1] = ACTION_LAYER_TAP_TOGGLE(RAISE_LAYER),
  [2] = ACTION_LAYER_TAP_KEY(NAVIGATION_LAYER, KC_SCOLON),
  [3] = ACTION_LAYER_TAP_KEY(NAVIGATION_LAYER, KC_O),
  [4] = ACTION_LAYER_TAP_TOGGLE(GUI_LAYER),
  [5] = ACTION_LAYER_TAP_TOGGLE(GUI_LAYER),
  [6] = ACTION_LAYER_TAP_TOGGLE(KEYBOARD_LAYER),
  [7] = ACTION_DEFAULT_LAYER_SET(BASE_QWERTY_LAYER),
  [8] = ACTION_DEFAULT_LAYER_SET(BASE_COLEMAK_LAYER),
  [9] = 0, // Reserved

  // Modifiers
  [10] = ACTION_MODS_TAP_KEY(MOD_LCTL, KC_ESC),
  [11] = ACTION_MODS_TAP_KEY(MOD_RCTL, KC_ENT)
};

static uint16_t start[6];

