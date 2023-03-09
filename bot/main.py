import os

import keyboards
from aiogram import Bot, Dispatcher, executor, types
from aiogram.contrib.fsm_storage.memory import MemoryStorage
from content import text
import logging
import logging.handlers
from db_map import get_movies
from dotenv import load_dotenv

load_dotenv()

logger = logging.getLogger('bot')
logger.setLevel(logging.INFO)
format = '%(asctime)s :: %(name)s:%(lineno)s :: %(levelname)s - %(message)s'
handler = logging.handlers.RotatingFileHandler('movie_bot.log', maxBytes=2000, backupCount=2)
handler.setFormatter(logging.Formatter(format))
logger.addHandler(handler)

proxy_url = 'http://proxy.server:3128'
bot = Bot(
    token=os.getenv('TOKEN'),
    # proxy=proxy_url
)
dp = Dispatcher(
    bot=bot,
    storage=MemoryStorage()
)



@dp.message_handler(commands=['start'])
async def welcome(message: types.Message) -> None:
    await message.answer(
        text['start_ru'],
        reply_markup=keyboards.get_style_keyboard()
    )


@dp.message_handler(commands=['help'])
async def help(message: types.Message) -> None:
    await message.answer(
        text['help_ru'],
    )


@dp.callback_query_handler(text='back')
async def back_button_handler(callback: types.CallbackQuery) -> None:
    await callback.message.answer(
        text=text['start_ru'],
        reply_markup=keyboards.get_style_keyboard()
    )


@dp.callback_query_handler()
async def process_callback_button(callback: types.CallbackQuery) -> None:
    movies = get_movies(callback.data)
    if movies:
        await callback.message.answer(
            text=text['result_ru'],
            reply_markup=keyboards.set_movie_data(movies)
        )


if __name__ == '__main__':
    logger.info('Start Server')
    executor.start_polling(
        dispatcher=dp,
        skip_updates=True
    )
