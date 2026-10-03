using System;

namespace ThaoLuanWeb
{
    [Serializable]
    public class Product
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public string Category { get; set; }

        public Product()
        {
        }
        public Product(int id, string name, decimal price, string category)
        {
            ProductID = id;
            ProductName = name;
            Price = price;
            Category = category;
        }
    }
}