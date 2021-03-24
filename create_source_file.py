import csv
import numpy
import threading
import pandas as pd
from imdb import IMDb

# create an instance of the IMDb class
ia = IMDb()
lock = threading.Semaphore(50)
number_of_movies = 500
file_size = 3500
movies_data = []


def get_movie_info(movie_id):
    print(f'Getting movie id {movie_id}')
    movie = ia.get_movie(movie_id)
    movies_data.append([movie.data.get('original title'), movie.data.get('rating'),
                        movie.data.get('directors') if movie.data.get('directors') is None else
                        movie.data.get('directors')[0].data.get('name')])
    print(f'Finished getting movie {movie_id}')
    lock.release()


def main():
    ids = numpy.random.randint(low=1, high=number_of_movies, size=file_size)
    filename = 'source.csv'
    thread_pool = []
    for movie_id in ids:
        thread = threading.Thread(target=get_movie_info, args=(movie_id,))
        thread_pool.append(thread)
        thread.start()
        lock.acquire()
    for thread in thread_pool:
        thread.join()
    print('Finished getting info')
    df = pd.DataFrame(movies_data, columns=['Title', 'Rating', 'Main Director'])
    print(df.duplicated() == True)
    df.to_csv(path_or_buf=filename, sep=';', header=True, index=False, encoding='UTF-8')


if __name__ == '__main__':
    main()
