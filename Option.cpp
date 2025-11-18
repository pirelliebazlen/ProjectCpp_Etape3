#include "Option.h"
#include <cstring>
#include <limits>

//*****************************************************************************************
//************************  Constructeurs *************************************************
//*****************************************************************************************
namespace carconfig {
Option::Option()
{
	#ifdef DEBUG
		cout<< ">> Contructeur par defaut  <<" << endl;
	#endif

	setCode("");
	setLabel("");
	setPrice(0.0);
}
Option::Option(string c, string l, float p)
{
	#ifdef DEBUG
		cout<<">> Constructeur d'initialisation <<"<<endl;
	#endif

	setCode(c);
	setLabel(l);
	setPrice(p);

}
Option::Option(const Option &o)
{
	#ifdef DEBUG
		cout <<">> Constructeur de copie <<"<<endl;
	#endif

	setCode(o.getCode());
	setLabel(o.getLabel());
	setPrice(o.getPrice());

}

//*****************************************************************************************
//************************  Destructeurs *************************************************
//*****************************************************************************************

Option::~Option()
{
	#ifdef DEBUG
		cout<< ">> Destructeur d'option << " << endl;
	#endif
	
}

//*****************************************************************************************
//************************ Setters  *************************************************
//*****************************************************************************************

void Option::setCode( string c)
{
	code=c;
}

void Option::setLabel(string l)
{
	label=l;
}

void Option::setPrice(float p)
{
	if(p < 0.0) return;
	price = p;
}

//*****************************************************************************************
//************************  Getters *******************************************************
//*****************************************************************************************

string Option::getCode() const
{
	return code;
}
string Option::getLabel() const
{
	return label;
}
float Option::getPrice() const
{
	return price;
}

void Option::display() const
{
	
	if(code!="")
		cout << "Code : " << code << endl;
	else
		cout << "pas de code"<< endl;

	
	if(label!="")
		cout << "Label : " << label << endl;
	else
		cout << "pas de label"<< endl;
	
	cout << "Prix : " << price << endl;
}

istream& operator>>(istream& s, Option& op)
{
	string code;
	string label;
	float price;


	
	cout << "entrez le code: ";
	getline(s, code, '\n');
	cout << "entrez le label: ";
	getline(s, label, '\n');
	
	do
	{
		cout<<"entrez le prix: " ;
		s >> price;
	}while (price < 0);

	op.setCode(code);
	op.setLabel(label);
	op.setPrice(price);
	return s;
}
ostream& operator<<(ostream& s, const Option& op)
{
	s << "Code : " << op.getCode()<<endl << "Label : " << op.getLabel() << endl << "Prix : " << op.getPrice() << endl;

	return s;
}

Option Option::operator--(int)
{
	Option temp(*this);

	this->price -= 50;

	return temp;
}
Option& Option::operator--()
{
	this->price-=50;

	return *this;
}
}