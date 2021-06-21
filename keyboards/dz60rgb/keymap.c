#include QMK_KEYBOARD_H

enum dz60rgb_layers {
    _QWERTY,
    _NAV,
    _RGB,
    _FNC
};

enum dz60rgb_keycodes {
    REBOOT = SAFE_RANGE,
    MAS_CRM,
    MAS_PRP,
    MAS_RED,
    MAS_GRN,
    MAS_BLU,
    MAS_CYN,
    MAS_MGT,
    MAS_YEL,
    MAS_KEY,
    MAS_WHT,
};

#define LT_BSLS LT(_RGB, KC_BSLS)
#define LT_DEL  LT(_FNC, KC_DEL)
#define LT_ESC  LT(_NAV, KC_ESC)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [_QWERTY] = LAYOUT(
        KC_GRV,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_MINS, KC_EQL,  KC_BSPC, \
        KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_LBRC, KC_RBRC, LT_BSLS, \
        LT_ESC,  KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT, KC_ENT,           \
        KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH,          KC_UP,   LT_DEL,  \
        KC_LCTL, KC_LOPT, KC_LCMD,       KC_SPC,                                KC_RCMD, KC_ROPT,          KC_LEFT, KC_DOWN, KC_RGHT  \
    ),
    [_NAV] = LAYOUT(
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, \
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, \
        _______, KC_HOME, KC_PGUP, KC_PGUD, KC_END,  _______, KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, _______, _______, _______,          \
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,          _______, _______, \
        _______, _______, _______,                   _______,                   _______, _______,          _______, _______, _______  \
    ),
    [_RGB] = LAYOUT(
        _______, MAS_CRM, MAS_PRP, MAS_RED, MAS_GRN, MAS_BLU, MAS_CYN, MAS_MGT,  MAS_YEL, MAS_KEY, MAS_WHT, _______, _______,  _______, \
        _______, RGB_VAI, RGB_SPI, RGB_HUI, RGB_SAI, RGB_VAI, _______, _______,  _______, _______, _______, RGB_RMOD, RGB_MOD, _______, \
        _______, RGB_VAD, RGB_SPD, RGB_HUD, RGB_SAD, RGB_VAD, _______, _______,  _______, _______, _______, _______, _______,           \
        _______, RGB_TOG, RGB_M_P, RGB_M_B, RGB_M_R, RGB_M_SN, RGB_M_G, RGB_M_X, _______, _______, _______,          _______,  _______, \
        _______, _______,  _______,                   _______,                   _______, _______,          _______, _______,  _______  \
    ),
    [_FNC] = LAYOUT( 
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, \
        _______, KC_BTN1, KC_MS_U, KC_BTN2, _______, _______, _______, _______, _______, _______, _______, KC_VOLD, KC_VOLU, KC_MUTE, \
        _______, KC_MS_L, KC_MS_D, KC_MS_R, _______, _______, _______, _______, _______, _______, _______, _______, _______,          \
        _______, KC_MPRV, KC_MPLY, KC_MNXT, _______, KC_BRID, KC_BRIU, _______, _______, _______, _______, _______, _______, _______, \
        _______, _______, _______,                   _______,                   _______, _______,          _______, _______, _______  \
    ),
/*
    [_LAYER] = LAYOUT(

        GRV  - 13, 1 - 12,    2 - 11,    3 - 10,  4 - 9,  5 - 8,  6 - 7,  7 - 6,  8 - 5,     9 - 4,     0 - 3,     - - 2,     = - 1,    BSCP - 0, \
        TAB  - 27, Q - 26,    W - 25,    E - 24,  R - 23, T - 22, Y - 21, U - 20, I - 19,    O - 18,    P - 17,    [ - 16,    ] - 15,   \ - 14,   \
        ESC  - 40, A - 39,    S - 38,    D - 37,  F - 36, G - 35, H - 34, J - 33, K - 32,    L - 31,    ; - 30,    ' - 29,    ENT - 28,           \
        LSFT - 53, Z - 52,    X - 51,    C - 50,  V - 49, B - 48, N - 47, M - 46, , - 45,    . - 44,    ? - 43,    UP - 42,   DEL - 41,           \
        LCTL - 62, LOPT - 61, LCMD - 60,                         SPACE - 59,      RCMD - 58, ROPT - 57, LEFT - 56, DOWN - 55, RIGHT - 54          \
    ),
*/
};

void rgb_matrix_indicators_user(void)
{
    uint8_t this_led = host_keyboard_leds();

    if (!g_suspend_state && rgb_matrix_config.enable) {
        switch (biton32(layer_state)) {
            case _NAV:
                rgb_matrix_set_color(39, 0x00, 0xFF, 0x00); // A - HOME
                rgb_matrix_set_color(38, 0x00, 0x00, 0xFF); // S - UP
                rgb_matrix_set_color(37, 0x00, 0x00, 0xFF); // D - DOWN
                rgb_matrix_set_color(36, 0x00, 0xFF, 0x00); // F - END

                rgb_matrix_set_color(34, 0xFF, 0x00, 0x00); // H - LEFT
                rgb_matrix_set_color(35, 0xFF, 0x00, 0x00); // J - DOWN
                rgb_matrix_set_color(36, 0xFF, 0x00, 0x00); // K - UP
                rgb_matrix_set_color(37, 0xFF, 0x00, 0x00); // L - RIGHT

                break;

            case _RGB:
                HSV hsv = { rgb_matrix_config.hsv.h, rgb_matrix_config.hsv.s, rgb_matrix_config.hsv.v };
                HSV hui = hsv;
                HSV hud = hsv;
                HSV sai = hsv;
                HSV sad = hsv;
                HSV vai = hsv;
                HSV vad = hsv;

                hui.h = hsv.h + 8;
                hud.h = hsv.h - 8;
                sai.s = hsv.s + 16 > 255 ? 255 : hsv.s + 16;
                sad.s = hsv.s - 16 < 0   ?   0 : hsv.s - 16;
                vai.v = hsv.v + 16 > 255 ? 255 : hsv.v + 16;
                vad.v = hsv.v - 16 < 0   ?   0 : hsv.v - 16;

                RGB rgb = hsv_to_rgb(hsv);
                RGB rgbHUI = hsv_to_rgb(hui);
                RGB rgbHUD = hsv_to_rgb(hud);
                RGB rgbSAI = hsv_to_rgb(sai);
                RGB rgbSAD = hsv_to_rgb(sad);
                RGB rgbVAI = hsv_to_rgb(vai);
                RGB rgbVAD = hsv_to_rgb(vad);

                rgb_matrix_set_color(59, rgb.r, rgb.g, rgb.b); // color indicator

                rgb_matrix_set_color(26, 0xFF, 0x80, 0x00); // Q - MOD
                rgb_matrix_set_color(39, 0xFF, 0x80, 0x00); // A - MOD
                rgb_matrix_set_color(16, 0xFF, 0x80, 0x00); // [ - RGB_RMOD
                rgb_matrix_set_color(15, 0xFF, 0x80, 0x00); // ] - MOD
                rgb_matrix_set_color(52, 0xFF, 0x40, 0x00); // Z - TOG
                rgb_matrix_set_color(25, 0x80, 0x80, 0x80); // W - SPI
                rgb_matrix_set_color(38, 0x80, 0x80, 0x80); // S - SPD
                rgb_matrix_set_color(24, rgbHUI.r, rgbHUI.g, rgbHUI.b); //HUI
                rgb_matrix_set_color(37, rgbHUD.r, rgbHUD.g, rgbHUD.b); //HUD
                rgb_matrix_set_color(23, rgbSAI.r, rgbSAI.g, rgbSAI.b); //SAI
                rgb_matrix_set_color(36, rgbSAD.r, rgbSAD.g, rgbSAD.b); //SAD
                rgb_matrix_set_color(22, rgbVAI.r, rgbVAI.g, rgbVAI.b); //VAI
                rgb_matrix_set_color(35, rgbVAD.r, rgbVAD.g, rgbVAD.b); //VAD
                rgb_matrix_set_color(19, 0xF0, 0x00, 0xFF); //MAS_MGT
                rgb_matrix_set_color(18, 0x00, 0x02, 0xFF); //MAS_BLU
                rgb_matrix_set_color(33, 0xFF, 0x00, 0x00); //MAS_RED
                rgb_matrix_set_color(32, 0x00, 0x00, 0x00); //MAS_KEY
                rgb_matrix_set_color(31, 0x00, 0xFF, 0xF7); //MAS_CYN
                rgb_matrix_set_color(46, 0xFF, 0xDA, 0x00); //MAS_YEL
                rgb_matrix_set_color(45, 0x00, 0xFF, 0x01); //MAS_GRN
                rgb_matrix_set_color(44, 0xFF, 0xA5, 0x18); //MAS_CRM
                rgb_matrix_set_color(30, 0x81, 0x3C, 0xFF); //MAS_PRP
                rgb_matrix_set_color(17, 0xFF, 0xFF, 0xFF); //MAS_WHT
            break;

            case _FNC:
                rgb_matrix_set_color(57, 0xFF, 0xFF, 0xFF); // layer indicator
                rgb_matrix_set_color(48, 0xFF, 0x00, 0x00); // bootloader
                rgb_matrix_set_color(42, 0x00, 0x80, 0xFF); // vol
                rgb_matrix_set_color(55, 0x00, 0x80, 0xFF);
                rgb_matrix_set_color(58, 0xFF, 0x00, 0x00); // mute
                rgb_matrix_set_color(56, 0xFF, 0x80, 0x00); // ctrl+left/right
                rgb_matrix_set_color(54, 0xFF, 0x80, 0x00);
                rgb_matrix_set_color(41, 0xFF, 0x00, 0x40); // ctrl+delete
                rgb_matrix_set_color(43, 0xFF, 0x00, 0x40); // ctrl+slash

                if (this_led & (1 << !autoshift_enabled)) {
                    rgb_matrix_set_color(0, 0xFF, 0x00, 0x00); // KC_ASTG
                } else {
                    rgb_matrix_set_color(0, 0xFF, 0xFF, 0x00);
                }

                break;
        }
    }

    if (this_led & (1 << USB_LED_CAPS_LOCK)) {
        rgb_matrix_set_color(40, 0xFF, 0xFF, 0xFF);
    }
}

void matrix_init_user(void)
{
    //user initialization
}

void matrix_scan_user(void)
{
    //user matrix
}

bool process_record_user(uint16_t keycode, keyrecord_t* record)
{
    static uint32_t key_timer;

    switch (keycode) {
        case REBOOT:
            if (record->event.pressed) {
                key_timer = timer_read32();
            } else {
                if (timer_elapsed32(key_timer) >= 500) {
                    rgb_matrix_enable_noeeprom();
                    rgb_matrix_mode_noeeprom(1);
                    rgb_matrix_sethsv_noeeprom(11, 11, 11);
                    wait_ms(150);
                    reset_keyboard();
                } else {
                    register_code(KC_RCTL);
                    tap_code(KC_B);
                    unregister_code(KC_RCTL);
                }
            }

            return false;

        case MAS_CRM:
            if (record->event.pressed) {
                rgb_matrix_sethsv(32, 160, 255);
            }

            return false;

        case MAS_PRP:
            if (record->event.pressed) {
                rgb_matrix_sethsv(192, 112, 255);
            }

            return false;

        case MAS_RED:
            if (record->event.pressed) {
                rgb_matrix_sethsv(0, 255, 255);
            }

            return false;

        case MAS_GRN:
            if (record->event.pressed) {
                rgb_matrix_sethsv(88, 255, 255);
            }

            return false;

        case MAS_BLU:
            if (record->event.pressed) {
                rgb_matrix_sethsv(168, 255, 255);
            }

            return false;

        case MAS_CYN:
            if (record->event.pressed) {
                rgb_matrix_sethsv(128, 255, 255);
            }

            return false;

        case MAS_MGT:
            if (record->event.pressed) {
                rgb_matrix_sethsv(216, 255, 255);
            }

            return false;

        case MAS_YEL:
            if (record->event.pressed) {
                rgb_matrix_sethsv(40, 255, 255);
            }

            return false;

        case MAS_KEY:
            if (record->event.pressed) {
                rgb_matrix_sethsv(0, 0, 0);
            }

            return false;

        case MAS_WHT:
            if (record->event.pressed) {
                rgb_matrix_sethsv(128, 0, 255);
            }

            return false;

        default:
            return true;
    }
}
