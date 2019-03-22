import web

db_host = 'localhost'
db_name = 'ferreteria_eis'
db_user = 'steph'
db_pw = 'steph.2019'

db = web.database(
    dbn='mysql',
    host=db_host,
    db=db_name,
    user=db_user,
    pw=db_pw
    )