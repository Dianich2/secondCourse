using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4_5
{
    internal class GiftController
    {
        Gift gift;

        public GiftController(Gift gift)
        {
            this.gift = gift;
        }

        public double CountPrice()
        {
            double price = 0;
            foreach(Product item in gift.getList())
            {
                price += item.Price;
            }
            return price;
        }

        public Product GetLowestWeightItem()
        {
            Product lowestItem = gift.get();
            foreach(Product item in gift.getList())
            {
                if (item.Weight < lowestItem.Weight)
                    lowestItem = item.getCopy();
            }
            return lowestItem;
        }

        public void sortGift()
        {
            List<Product> products = gift.getList();
            products.Sort((x, y) => x.Weight.CompareTo(y.Weight));
        }
    }
}
