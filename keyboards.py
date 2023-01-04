from aiogram import Bot, Dispatcher, executor, types
from aiogram.types import ReplyKeyboardMarkup, KeyboardButton, InlineKeyboardButton, InlineKeyboardMarkup

import config
from content import styles

lang1 = KeyboardButton('English')
lang2 = KeyboardButton('Русский')
lang_keyboard = ReplyKeyboardMarkup(resize_keyboard=True, one_time_keyboard=True).add(lang1).add(lang2)

style_keyboard = InlineKeyboardMarkup(row_width=1)
for style in styles:
    style_keyboard.add(InlineKeyboardButton(style[0], callback_data=style[1]))


def set_movie_data(data):
    choice = InlineKeyboardMarkup()
    for movie in data:
        # print(movie)
        choice.add(InlineKeyboardButton(text=movie[0], url= config.domen + movie[1]))
    choice.add(InlineKeyboardButton(
        text=' К списку категорий',
        callback_data='back')
    )
    return choice
