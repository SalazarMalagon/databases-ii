"""This is a module for connecting to a MongoDB database using pymongo.

Author: Andres Felipe Salazar Malagon
"""

from abc import ABC, abstractmethod

class DBConnection(ABC):
    """Abstract base class for database connections."""
        
    @abstractmethod    
    def connect(self):
        """Establish a connection to the database."""
        pass