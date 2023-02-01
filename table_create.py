import pyodbc

conn = pyodbc.connect('Driver={MySQL};'
                        'Server=localhost'
                        'Database=mysql'
                        'Trusted_Connection=yes;')

cursor = conn.cursor()

cursor.execute('''
CREATE TABLE one_table_to_rule_them_all (
    total_visitors int
    total_button_presses int
    )
'''
)

conn.commit()  