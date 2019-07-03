from flask import Flask, render_template, request, url_for, redirect, session
from flask_mysqldb import MySQL

import sys


app=Flask(__name__)

app.secret_key="wdjiwjdiwjd"

app.config['MYSQL_USER'] = 'root'

app.config['MYSQL_DB'] = 'datenbank_eshop'
app.config['MYSQL_HOST'] = 'localhost'


mysql = MySQL(app)
@app.route("/")
def eShop():
    return redirect(url_for('login',))

@app.route("/home",methods=['GET','POST'])
def Home():
    return render_template('home.html')

@app.route("/checkout",methods=['GET','POST'])
def Warenkorb():
    return("")

@app.route("/shop",methods=['GET','POST'])
def Waren():
    return render_template('shop.html')

@app.route("/login",methods=['GET','POST'])
def login():
    message=''
    if request.method=='POST':
        session['uname']=request.form['username']
        session['pword']=request.form['password']
        cursor = mysql.connection.cursor()
        cursor.execute('''SELECT passwort FROM Kunden where username like"'''+session.get('uname')+'''";''')
        logindata=cursor.fetchone()
        mysql.connection.commit()
        cursor.close
        
        if logindata is not None:
            for password in logindata:
                
                
                if password==session['pword']:
                    loggedIn="true"
                    
                    return redirect(url_for('Waren'))
    return render_template('Login.html',message=message)



if __name__ == "__main__":
   app.run(debug=True)
