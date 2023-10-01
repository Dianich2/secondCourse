using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab8
{
    internal class Program
    {
        public static void Main(string[] args)
        {
            Game game = new Game();

            game.attackHeandler += (sender, reciever) => Console.WriteLine($"Player {sender.name} attacks {reciever.name}\n");
            game.healHandler += (sender, reciever) => Console.WriteLine($"Player {sender.name} heals {reciever.name}\n");

            Player player1 = new Player("player1", 20, 5, 30);
            game.attackHeandler += player1.onAttack;
            game.healHandler += player1.onHeal;

            Player player2 = new Player("player2", 25, 15, 12);
            game.attackHeandler += player2.onAttack;
            game.healHandler += player2.onHeal;

            Player player3 = new Player("player3", 30, 10, 7);
            game.attackHeandler += player3.onAttack;
            game.healHandler += player3.onHeal;

            
            game.AddNewPlayer(player1);
            game.AddNewPlayer(player2);
            game.AddNewPlayer(player3);

            game.showPlayersInfo();

            game.Attack(player1, player2);
            game.Attack(player3, player1);
            game.Attack(player2, player1);
            game.Attack(player1, player1);
            game.Attack(player2, player3);
            game.Attack(player1, player3);
            game.Attack(player2, player3);
            game.Attack(player2, player3);
            game.Attack(player2, player3);
            game.Attack(player2, player3);
            game.Attack(player2, player3);
            game.Heal(player3, player3);


            game.showPlayersInfo();




            Func<string, string> test1;
            Action<string> test2;
            Func<string, string> test3;
            Func<string, string> test4;
            Func<string, string> test5;

            test1 = str1 =>
            {
                char[] signs = { '.', ',', '!', '?', '-', ':' };
                for (int i = 0; i < str1.Length; i++)
                {
                    if (signs.Contains(str1[i]))
                        str1 = str1.Remove(i, 1);
                }
                Console.WriteLine(str1);
                return str1;
            };

            test2 = delegate (string str2)
            {
                str2 += "World";
                Console.WriteLine(str2);
            };

            test3 = str3 =>
            {
                str3 = str3.Replace(" ", string.Empty);
                Console.WriteLine(str3);
                return str3;
            };

            test4 = str4 =>
            {
                str4 = str4.ToUpper();
                Console.WriteLine(str4);
                return str4;
            };

            test5 = str5 =>
            {
                str5 = str5.ToLower();
                Console.WriteLine(str5);
                return str5;
            };

            string str = "Hel?lo! World";
            Console.WriteLine("Stirng in the beginnign: " + str);
            Console.WriteLine("String at the finish: ");
            string s1, s2, s3;
            s1 = StringWork.RemoveS(str, test1);
            StringWork.AddToString(s1, test2);
            s2 = StringWork.RemoveSpaces(s1, test3);
            s3 = StringWork.Upper(s2, test4);
            StringWork.Lower(s3, test5);
        }

    }
}
