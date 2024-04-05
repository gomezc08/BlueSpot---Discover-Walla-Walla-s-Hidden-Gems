from DBConnector import DBConnector

class Manager (DBConnector):
    """
    Focuses on handling operations within the system.

    
    """
    def __init__(self):
        super().__init__()
    
    def user_sign_up(self,username, email, fname, lname):
        self.open_connection()
        # insert into database.
        try:
            
            query = ("INSERT INTO User" "(Username, Email, FirstName, LastName)" "VALUES(%s, %s, %s, %s)")
            query_data = (username, email, fname, lname)
            self.cursor.execute(query, query_data)
            self.cnx.commit()
        
        except Exception as e:
            print(f"Error!!: {e}")

        finally:
            self.close_connection()
        
    def user_log_in():
        pass
    
    def upload_photo():
        pass
    
    def comment():
        pass
    
    def rate():
        pass
    
    def tags():
        pass

def main():
    m = Manager()
    m.user_sign_up("shahad", "shah.gmail.com", "shaha", "dehoti")
    
    
main()
    
    
    
    
    
    