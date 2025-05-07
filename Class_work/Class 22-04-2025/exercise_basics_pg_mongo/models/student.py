"""
This module has a definition of the Student model.

Author: Andres Felipe Salazar Malagon <anfsalazarm@udistrital.edu.co>
"""

from pydantic import BaseModel

class Student(BaseModel):
    """This class represents a Student nodel."""

    code: int
    name: str
    email: str
    phone: str
    address: str
    career: str
