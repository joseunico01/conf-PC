#importante es instaar pip install flask-wtf
from wtforms import Form
from wtforms import StringField, TextAreaField
from wtforms.fields import EmailField

class CommentForm(Form):
    username=StringField('username')
    email=EmailField('Correo Electronico')
    comment= TextAreaField('Comentario')
