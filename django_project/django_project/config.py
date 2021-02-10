import environ


# making env
env = environ.Env()

# reading .env
env.read_env()

# getting variables from env
DEBUG = env('DEBUG', default=True)
SECRET_KEY = env('SECRET_KEY', default='NEED SECRET KEY')
