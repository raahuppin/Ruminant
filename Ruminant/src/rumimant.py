from flask import Flask, render_template, request, url_for, redirect, session
from flask_mysqldb import MySQL
app=Flask(__name__)


mysql = MySQL(app)
@app.route("/")
def eShop():
    return redirect(url_for('home',))
@app.route("/home",methods=['GET','POST'])
def Home():
    return render_template('')
@app.route("/checkout",methods=['GET','POST'])
def Warenkorb():
    return("")
@app.route("/shop",methods=['GET','POST'])
def Waren():
    return("")
@app.route("/login",methods=['GET','POST'])
def login():
    if request.method=='POST':
        session['uname']=request.form['username']
        session['pword']=request.form['password']
        cursor = mysql.connection.cursor()
        cursor.execute(’’’SELECT username,password FROM Login’’’)
        logindata=cursor.fetchall()
        mysql.connection.commit()
        cursor.close
        if logindata(1)==session.get('uname') and logindata(2)==session.get('pword'):
            loggedIn=true;
            return redirect(url_for('Waren',))
    return render_template('Login.html',message=message)


if __name__ == "__main__":
   app.run()
