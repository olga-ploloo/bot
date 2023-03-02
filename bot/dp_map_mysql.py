import mysql_connection
import mysql.connector as connector

try:
    # get a connection from the pool
    connection = mysql_connection.get_connection_from_pool()
    if connection:
        print(connection)
        # cursor = connection.cursor()
        # query = "SELECT * FROM my_table;"
        # cursor.execute(query)
        # # fetch the results and print them
        # results = cursor.fetchall()
        # for result in results:
        #     print(result)
except connector.Error as error:
    # print an error message if there's an error with the connection or query
    print(f"Failed to execute query: {error}")
finally:
    # release the connection back to the pool when finished
    if "connection" in locals():
        mysql_connection.release_connection_to_pool(connection)