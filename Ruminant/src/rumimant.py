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
    
        
    i=1
    j=1
    k=1
    
    namelist={}
    ratinglist={}
    price={}
    usernames={}
    prodcursor = mysql.connection.cursor()
    ratingcursor = mysql.connection.cursor()
    pricecursor = mysql.connection.cursor()
    idcursor = mysql.connection.cursor()
    prodcursor.execute('''SELECT Name FROM Produkte ''')
    ratingcursor.execute('''SELECT Bewertung FROM Produkte ''')
    pricecursor.execute('''SELECT Preis FROM Produkte ''')
    
    
    
    products=prodcursor.fetchall()
    ratings=ratingcursor.fetchall()
    prices=pricecursor.fetchall()
    
    for prod in products:
        
        namelist[i]=prod
        
        
        i=i+1
    for rat in ratings:
        ratinglist[j]=rat
        j=j+1
    for pric in prices:
        price[k]=pric
        k=k+1
    mysql.connection.commit()
    prodcursor.close
    ratingcursor.close
    pricecursor.close
    return render_template('home.html',names=namelist,ratings=ratinglist, prices=prices)

@app.route("/checkout",methods=['GET','POST'])
def Warenkorb():
    return(render_template('Check-out_seite.html'))

@app.route("/shop",methods=['GET','POST'])
def Waren():
    i=1
    j=1
    k=1
    namelist={}
    ratinglist={}
    price={}
    prodcursor = mysql.connection.cursor()
    ratingcursor = mysql.connection.cursor()
    pricecursor = mysql.connection.cursor()
    prodcursor.execute('''SELECT Name FROM Produkte ''')
    ratingcursor.execute('''SELECT Bewertung FROM Produkte ''')
    pricecursor.execute('''SELECT Preis FROM Produkte ''')
    products=prodcursor.fetchall()
    ratings=ratingcursor.fetchall()
    prices=pricecursor.fetchall()
    print(products,sys.stdout.flush())
    print(prices,sys.stdout.flush())
    print(ratings,sys.stdout.flush())
    print(prices,sys.stdout.flush())
    for prod in products:
        
        namelist[i]=prod
        
        
        i=i+1
    for rat in ratings:
        ratinglist[j]=rat
        j=j+1
    for pric in prices:
        price[k]=pric
        k=k+1
    mysql.connection.commit()
    prodcursor.close
    ratingcursor.close
    pricecursor.close
    return render_template('shop.html',names=namelist,ratings=ratinglist, prices=prices)
@app.route("/login",methods=['GET','POST'])
def login():
    message=''
    if request.method=='POST':
        session['uname']=request.form['username']
        session['pword']=request.form['password']
        pwcursor = mysql.connection.cursor()
        pwcursor.execute('''SELECT passwort FROM Kunden where username like"'''+session.get('uname')+'''";''')
        logindata=pwcursor.fetchone()
        mysql.connection.commit()
        pwcursor.close
        
        if logindata is not None:
            for password in logindata:
                
                
                if password==session['pword']:
                    pidcursor = mysql.connection.cursor()
                    pidcursor.execute('''SELECT idKunden FROM Kunden where username like"'''+session.get('uname')+'''";''')
                    id=pidcursor.fetchone()
                    loggedIn=id
                    mysql.connection.commit()
                    pidcursor.close
                    
                    return redirect(url_for('Waren'))
    return render_template('Login.html',message=message)



if __name__ == "__main__":
   app.run(debug=True)
