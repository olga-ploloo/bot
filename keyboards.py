from aiogram.types import ReplyKeyboardMarkup, KeyboardButton, InlineKeyboardButton, InlineKeyboardMarkup

import config, content
import content

lang1 = KeyboardButton('English')
lang2 = KeyboardButton('Русский')
lang_keyboard = ReplyKeyboardMarkup(resize_keyboard=True, one_time_keyboard=True).add(lang1).add(lang2)


def get_style_keyboard() -> InlineKeyboardMarkup:
    keyboard = InlineKeyboardMarkup(row_width=1)
    for style in content.styles:
        keyboard.add(InlineKeyboardButton(style[0], callback_data=style[1]))
    return keyboard


def set_movie_data(data) -> InlineKeyboardMarkup:
    result = InlineKeyboardMarkup()
    for movie in data:
        result.add(InlineKeyboardButton(
            text=movie[0],
            url=config.domen + movie[1])
        )
    result.add(InlineKeyboardButton(
        text='⬅️ ' + content.text['back_ru'],
        callback_data='back')
    )
    return result
