#include <iostream>
#include <string>
#include <vector>
#include <list>
#include <climits>
#include <Windows.h>

using namespace std;

struct Product
{
    string name;
    int cost;
    int weight;
};

vector<Product> products;

void addNewItem();


int maximum(int a, int b){return ((a > b) ? a : b);};

int CalculateHighestBackpackPrice(vector<Product> products, int numberOfElements, int backpackCapacity)
{
    int** backpack = new int* [numberOfElements + 1];

    for (unsigned int i = 0; i <= numberOfElements; i++)
    {
        backpack[i] = new int[backpackCapacity + 1];
        for (unsigned int j = 0; j <= backpackCapacity; j++)
        {
            if (i == 0 || j == 0)
                backpack[i][j] = 0;
            else if (products[i - 1].weight <= j)
                //цена текущего товара + цена товара(ов) на предыдущей строке в ячейке текущей вместимости - веса товара
                backpack[i][j] = maximum((products[i - 1].cost + backpack[i - 1][j - products[i - 1].weight]), backpack[i - 1][j]);
            else
                backpack[i][j] = backpack[i - 1][j];
        }
    }


    int i = numberOfElements;
    int j = backpackCapacity;

    cout << endl;

    while (i > 0 && j >= 0)
    {
        if (backpack[i][j] != backpack[i - 1][j])
        {
            cout << products[i - 1].name << " - " << products[i - 1].cost << " - " << products[i - 1].weight << endl;
            j -= products[i - 1].weight;
        }
        i--;
    }
    cout << endl;
    return backpack[numberOfElements][backpackCapacity];
}

int main(){

    int W;

    while (true)
    {
        cout << "Input backpack capacity N: ";
        cin >> W;
        if (cin.get() != (int)'\n')
        {
            cout << "\nIncorrect input, go again" << endl;
            cin.clear();
            cin.ignore(32767, '\n');
            continue;
        }
        else if (W <= 0)
        {
            cout << "\nIncorrect input go again" << endl;
            cin.clear();
            continue;
        }
        else
            break;
    }


    while (true)
    {
        int option;
        cout << "Type: " << endl;
        cout << "1 to input new product" << endl;
        cout << "whatewer to finish products input" << endl;
        cin >> option;
        if (cin.get() != (int)'\n')
        {
            cout << "\nIncorrect input go again" << endl;
            cin.clear();
            cin.ignore(32767, '\n');
            continue;
        }
        else if (option <= 0)
        {
            cout << "\nIncorrect input go again" << endl;
            cin.clear();
            continue;
        }
        else if (option == 1)
        {
            addNewItem();
        }
        else if (products.size() == 0)
        {
            cout << "\nInput one product at least" << endl;
            cin.clear();
            continue;
        }
        else
            break;
    }

    //products = { {"Pr1", 30, 6}, {"Pr2", 14, 3},{"Pr3", 16, 4}, {"Pr4", 9, 2}};

    int n = products.size();
    cout << "Price of the items in the backpack: " << CalculateHighestBackpackPrice(products, n, W);

    return 0;
}


void addNewItem() {
    string name;
    int cost = 0, weight = 0;
    cout << "Name: ";
    cin >> name;
    while (true)
    {
        cout << "\nPrice: ";
        cin >> cost;

        if (cin.get() != (int)'\n')
        {
            cout << "\nIncorrect input go again" << endl;
            cin.clear();
            cin.ignore(32767, '\n');
            continue;
        }
        else if (cost <= 0)
        {
            cout << "\nIncorrect input go again" << endl;
            cin.clear();
            continue;
        }
        else
            break;
    }
    while (true)
    {
        cout << "\nWeight: ";
        cin >> weight;

        if (cin.get() != (int)'\n')
        {
            cout << "\nIncorrect input go again" << endl;
            cin.clear();
            cin.ignore(32767, '\n');
            continue;
        }
        else if (weight <= 0)
        {
            cout << "\nIncorrect input go again" << endl;
            cin.clear();
            continue;
        }
        else
            break;

    }
    products.push_back({ name, cost, weight });
}