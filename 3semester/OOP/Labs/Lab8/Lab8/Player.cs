using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace Lab8
{
    internal class Player
    {
        public string name;
        private double health;
        private double attackPower;
        private double healPower;
        private double armor;
        public bool isAlive;

        private double Health { get { return health; } }
        private double AttackPower { get { return attackPower; } }
        private double HealPower { get { return healPower; } }
        private double Armor { get { return armor; } }

        public Player(string name, double attackPower, double healPower, double armor)
        {
            this.name = name;
            this.health = 100;
            if (attackPower > 100)
                throw new ArgumentException();
            this.attackPower = attackPower;
            if (healPower > 100)
                throw new ArgumentException();
            this.healPower = healPower;
            if (armor > 50)
                throw new ArgumentException();
            this.armor = armor;
            isAlive = true;
        }

        public void onAttack(Player sender, Player reciever)
        {
            if (reciever == this)
            {
                if(!isAlive)
                {
                    Console.WriteLine("There is no point to attack him as he is dead!\n");
                    return;
                }
                this.health -= (sender.AttackPower - this.armor);
                this.armor -= this.armor * (sender.attackPower / 100);
                if (this.armor < 0)
                    this.armor = 0;
                if (this.health <= 0)
                {
                    this.health = 0;
                    isAlive = false;
                }
            }
        }

        public void onHeal(Player sender, Player reciever)
        {
            if (reciever == this)
            {
                if (health == 0)
                {
                    Console.WriteLine("There is no use to heal dead player!\n");
                    return;
                }
                this.health += sender.HealPower;
                if (this.health > 100)
                    this.health = 100;
            }
        }

        public string getInfo()
        {
            return "Name: " + name + "\nHealth: " + health + "\nAttack power: " + attackPower + "\nHeal power: " + 
                healPower + "\nArmor: " + armor + "\nIsAlive: " + isAlive + "\n";
        }
    }
}
