using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab8
{
    internal class Game
    {
        private List<Player> players = new List<Player>();

        public delegate void AttackHandler(Player sender, Player reciever);
        public delegate void HealHandler(Player sender, Player reciever);

        public event AttackHandler? attackHeandler;
        public event HealHandler? healHandler;

        public void Attack(Player sender, Player reciever)
        {
            if(!players.Contains(sender) || !players.Contains(reciever))
            {
                Console.WriteLine("Only added to game players can be involved");
                return;
            }    
            if (sender == null || reciever == null)
                throw new NullReferenceException();
            attackHeandler?.Invoke(sender, reciever);
        }

        public void Heal(Player sender, Player reciever)
        {
            if (!players.Contains(sender) || !players.Contains(reciever))
            {
                Console.WriteLine("Only added to game players can be involved");
                return;
            }
            if (sender == null || reciever == null)
                throw new NullReferenceException();
            healHandler?.Invoke(sender, reciever);  
        }

        public void AddNewPlayer(Player player)
        {
            if (players.Contains(player))
                Console.WriteLine($"Player {player.name} had already been added to the game");
            players.Add(player);
        }

        public void RemovePlayer(Player player)
        {
            players.Remove(player);
        }

        public void showPlayersInfo()
        {
            foreach (Player player in players)
            {
                Console.WriteLine(player.getInfo());
            }
        }


    }
}
