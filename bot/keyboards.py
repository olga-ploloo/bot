import os
from aiogram.types import InlineKeyboardButton, InlineKeyboardMarkup
import content
from dotenv import load_dotenv

load_dotenv()


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
            url=os.getenv('domen') + movie[1])
        )
    result.add(InlineKeyboardButton(
        text='⬅️ ' + content.text['back_ru'],
        callback_data='back')
    )
    return result
