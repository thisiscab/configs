#include "keymap_common.h"

#define BASE_QWERTY_LAYER 0
#define NUMERIC_LAYER 1
#define SYMBOL_LAYER 2
#define NAVIGATION_LAYER 3
#define GUI_LAYER 4


const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  /* Main layer (Qwerty)
   *  ,--------------------------------------------------------------------------------.
   *  | Tab      | Q   | W   | E   | R   | T   | Y   | U   | I   | O   | P     | Bksp  |
   *  |----------+-----+-----+-----+-----+-----+-----+-----+-----+-----+-------+-------|
   *  | Ctrl/ESC | A   | S   | D   | F   | G   | H   | J   | K   | L   | ;/Nav | Ctrl  |
   *  |----------+-----+-----------------+-----+-----+-----+-----+-----+-------+-------|
   *  | Shift    | Z   | X   | C   | V   | B   | N   | M   | ,   | .   | /     | Shift |
   *  |----------+-----+-----------------+-----+-----+-----+-----+-----+-------+-------|
   *  | Symbols  |     | Alt | Num | CMD |   Space   | CMD | Sym | Alt | Gui   | Num   |
   *  `--------------------------------------------------------------------------------'
   */
  [BASE_QWERTY_LAYER] = {
    {KC_TAB,   KC_Q,   KC_W,     KC_E,  KC_R,     KC_T,    KC_Y,    KC_U,     KC_I,     KC_O,     KC_P,     KC_BSPC},
    {F(10),    KC_A,   KC_S,     KC_D,  KC_F,     KC_G,    KC_H,    KC_J,     KC_K,     KC_L,     F(2),     F(11)},
    {KC_LSFT,  KC_Z,   KC_X,     KC_C,  KC_V,     KC_B,    KC_N,    KC_M,     KC_COMM,  KC_DOT,   KC_SLSH,  KC_RSFT},
    {F(1),     KC_NO,  KC_LALT,  F(0),  KC_LGUI,  KC_SPC,  KC_SPC,  KC_RGUI,  F(1),     KC_RALT,  F(4),     F(0)}
  },

  /* Numeric layer
   *  ,------------------------------------------------------------------------------.
   *  | ~        | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 0   | Bksp  |
   *  |----------+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-------|
   *  | Ctrl/ESC |     |     |     |     |     |     | +   | _   | =   |     | Ctrl  |
   *  |----------+-----+-----------------+-----+-----+-----+-----+-----+-----+-------|
   *  | Shift    |     |     |     |     |     |     |     | ,   | .   | /   | Shift |
   *  |----------+-----+-----------------+-----+-----+-----+-----+-----+-----+-------|
   *  |          |     | Alt |     | CMD |   Space   | CMD |     | Alt |     |       |
   *  `------------------------------------------------------------------------------'
   */
  [NUMERIC_LAYER] = {
    {KC_TILD,  KC_1,   KC_2,     KC_3,   KC_4,     KC_5,    KC_6,    KC_7,     KC_8,     KC_9,     KC_0,     KC_BSPC},
    {F(10),    KC_NO,  KC_NO,    KC_NO,  KC_NO,    KC_NO,   KC_NO,   KC_PLUS,  KC_MINS,  KC_EQL,   KC_NO,    F(11)},
    {KC_LSFT,  KC_NO,  KC_NO,    KC_NO,  KC_NO,    KC_NO,   KC_NO,   KC_NO,    KC_COMM,  KC_DOT,   KC_SLSH,  KC_RSFT},
    {KC_NO,    KC_NO,  KC_LALT,  KC_NO,  KC_LGUI,  KC_SPC,  KC_SPC,  KC_RGUI,  KC_NO,    KC_RALT,  KC_NO,    KC_NO}
  },

  /* Symbol layer
   *  ,------------------------------------------------------------------------------.
   *  | `        | !   | @   | #   | $   | %   | ^   | &   | *   | (   | )   | Bksp  |
   *  |----------+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-------|
   *  | Ctrl/ESC |     |     | {   | }   |     |     | '   | "   | [   | ]   | Ctrl  |
   *  |----------+-----+-----------------+-----+-----+-----+-----+-----+-----+-------|
   *  | Shift    |     |     | <   | >   |     |     | ;   | :   | {   | }   | Shift |
   *  |----------+-----+-----------------+-----+-----+-----+-----+-----+-----+-------|
   *  |          |     | Alt |     | CMD |   Space   | CMD |     | Alt |     |       |
   *  `------------------------------------------------------------------------------'
   */
  [SYMBOL_LAYER] = {
    {KC_GRV,   KC_EXLM,  KC_AT,    KC_HASH,         KC_DLR,          KC_PERC,  KC_CIRC,  KC_AMPR,  KC_ASTR,     KC_LPRN,    KC_RPRN,  KC_BSPC},
    {F(10),    KC_NO,    KC_NO,    KC_LCBR,         KC_RCBR,         KC_NO,    KC_NO,    KC_QUOT,  S(KC_QUOT),  KC_LBRC,    KC_RBRC,  F(11)},
    {KC_LSFT,  KC_NO,    KC_NO,    S(KC_LBRACKET),  S(KC_RBRACKET),  KC_NO,    KC_NO,    KC_SCLN,  KC_COL,      S(KC_COL),  KC_RCBR,  KC_RSFT},
    {KC_NO,    KC_NO,    KC_LALT,  KC_NO,           KC_LGUI,         KC_SPC,   KC_SPC,   KC_RGUI,  KC_NO,       KC_RALT,    KC_NO,    KC_NO}
  },

  /* Directional navigation layer
   *
   *     Large movements -----/```````````````````````\   /```````````````````````\----- Vim-style arrow keys
   *        ,-----------------------------------------------------------------------+-----+-----.
   *        |          |     |      |      |      |     |      |      |     |       |     |     |
   *        |----------+-----+------+------+------+-----+------+------+-----+-------+-----+-----|
   *        | Ctrl/ESC |     | Home | PgUp | PgDn | End | Left | Down | Up  | Right |     |     |
   *        |----------+-----+------+------+------+-----+------+------+-----+-------+-----+-----|
   *        | Shift    |     |      |      |      |     |      |      |     |       |     |     |
   *        |----------+-----+-----+-------+------+-----+------+------+-----+-------+-----+-----|
   *        |          |     | Alt  |      | CMD  |   Space    | CMD  |     | Alt   |     |     |
   *        `-----------------------------------------------------------------------+-----+-----'
   */
  [NAVIGATION_LAYER] = {
    {KC_NO,    KC_NO,  KC_NO,    KC_NO,    KC_NO,    KC_NO,   KC_NO,    KC_NO,    KC_NO,  KC_NO,    KC_NO,  KC_NO},
    {F(10),    KC_NO,  KC_HOME,  KC_PGUP,  KC_PGDN,  KC_END,  KC_LEFT,  KC_DOWN,  KC_UP,  KC_RGHT,  F(2),   KC_NO},
    {KC_LSFT,  KC_NO,  KC_NO,    KC_NO,    KC_NO,    KC_NO,   KC_NO,    KC_NO,    KC_NO,  KC_NO,    KC_NO,  KC_RSFT},
    {KC_NO,    KC_NO,  KC_LALT,  KC_NO,    KC_LGUI,  KC_SPC,  KC_SPC,   KC_RGUI,  KC_NO,  KC_RALT,  KC_NO,  KC_NO}
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
    {KC_NO,  KC_BTN2,  KC_MS_U,  KC_BTN1,  KC_WH_D,  KC_NO,    KC_NO,    LCTL(LALT(LGUI(KC_LEFT))),  LCTL(LGUI(KC_LEFT)),     LALT(LGUI(KC_UP)),    LCTL(LGUI(KC_RGHT)),     KC_NO},
    {KC_NO,  KC_MS_L,  KC_MS_D,  KC_MS_R,  KC_WH_U,  KC_NO,    KC_NO,    LALT(LGUI(KC_F)),           LALT(LGUI(KC_LEFT)),     LALT(LGUI(KC_C)),     LALT(LGUI(KC_RGHT)),     KC_NO},
    {KC_NO,  KC_WH_L,  KC_BTN3,  KC_WH_R,  KC_NO,    KC_NO,    KC_NO,    LCTL(LALT(LGUI(KC_RGHT))),  S(LCTL(LGUI(KC_LEFT))),  LALT(LGUI(KC_DOWN)),  S(LCTL(LGUI(KC_RGHT))),  KC_NO},
    {KC_NO,  KC_MPRV,  KC_MPLY,  KC_MNXT,  KC_SLCK,  KC_SLEP,  KC_SLEP,  KC_PAUS,                    KC_MUTE,                 KC_VOLD,              KC_VOLU,                 KC_NO}
  },
};

const uint16_t PROGMEM fn_actions[] = {
  // Layer switching
  [0] = ACTION_LAYER_TAP_TOGGLE(NUMERIC_LAYER),
  [1] = ACTION_LAYER_TAP_TOGGLE(SYMBOL_LAYER),
  [2] = ACTION_LAYER_TAP_KEY(NAVIGATION_LAYER, KC_SCOLON),
  [3] = 0, // Reserved
  [4] = ACTION_LAYER_TAP_TOGGLE(GUI_LAYER),
  [5] = 0, // Reserved
  [6] = 0, // Reserved
  [7] = 0, // Reserved
  [8] = 0, // Reserved
  [9] = 0, // Reserved

  // Modifiers
  [10] = ACTION_MODS_TAP_KEY(MOD_LCTL, KC_ESC),
  [11] = ACTION_MODS_TAP_KEY(MOD_RCTL, KC_ENT)
};

// static uint16_t start[6];
