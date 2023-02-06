import sqlite3

def fetch_guestbook_entries():
    conn = sqlite3.connect('database.db')
    cursor = conn.cursor()

    query = 'SELECT * FROM visitors;'
    cursor.execute(query)
    entries = cursor.fetchall()
    return entries
