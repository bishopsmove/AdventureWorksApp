using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using Adventureworks.Domain5;

namespace Adventureworks.WebMVC4.Models
{ 
    public class ShoppingCartItemRepository : IShoppingCartItemRepository
    {
        AdventureWorksEntitiesContainer context = new AdventureWorksEntitiesContainer();

        public IQueryable<ShoppingCartItem> All
        {
            get { return context.ShoppingCartItems; }
        }

        public IQueryable<ShoppingCartItem> AllIncluding(params Expression<Func<ShoppingCartItem, object>>[] includeProperties)
        {
            IQueryable<ShoppingCartItem> query = context.ShoppingCartItems;
            foreach (var includeProperty in includeProperties) {
                query = query.Include(includeProperty);
            }
            return query;
        }

        public ShoppingCartItem Find(int id)
        {
            return context.ShoppingCartItems.Find(id);
        }

        public void AddToCart(string shoppingCartID, int productID, int quantity)
        {
            ShoppingCartItem myItem =
                (from c in context.ShoppingCartItems
                 where c.ShoppingCartID == shoppingCartID && c.ProductID == productID
                 select c).FirstOrDefault();
            if (myItem == null)
            {
                var cartadd = new ShoppingCartItem
                {
                    ShoppingCartID = shoppingCartID,
                    Quantity = quantity,
                    ProductID = productID,
                    DateCreated = DateTime.Now,
                    ModifiedDate = DateTime.Now
                };
                context.ShoppingCartItems.Add(cartadd);
            }
            else
            {
                myItem.Quantity += quantity;
            }

            context.SaveChanges();
        }

        public void InsertOrUpdate(ShoppingCartItem shoppingcartitem)
        {
            if (shoppingcartitem.ShoppingCartItemID == default(int)) {
                // New entity
                shoppingcartitem.DateCreated = DateTime.Now;
                shoppingcartitem.ModifiedDate = DateTime.Now;
                context.ShoppingCartItems.Add(shoppingcartitem);
            } else {
                // Existing entity
                shoppingcartitem.ModifiedDate = DateTime.Now;
                
            }
            Save();
        }

        public void Delete(int id)
        {
            var shoppingcartitem = context.ShoppingCartItems.Find(id);
            context.ShoppingCartItems.Remove(shoppingcartitem);
        }

        public IQueryable<ShoppingCartItem> FindByCartID(string shoppingCartID)
        {
            var cartItems = from cart in context.ShoppingCartItems
                            where cart.ShoppingCartID == shoppingCartID
                            select cart;

            return cartItems;
        }


        public decimal GetTotal(string shoppingCartID)
        {
            decimal? total =
                (from cartItems in context.ShoppingCartItems
                 where cartItems.ShoppingCartID == shoppingCartID
                 select (int?)cartItems.Quantity * cartItems.Product.ListPrice)
                .Sum();

            return total ?? decimal.Zero;
        }


       

        public int GetCount(string shoppingCartID)
        {
            int? count = (from cartItems in context.ShoppingCartItems
                          where cartItems.ShoppingCartID == shoppingCartID
                          select (int?)cartItems.Quantity).Sum();

            return count ?? 0;
        }

        public void Save()
        {
            context.SaveChanges();
        }

        public void Dispose() 
        {
            context.Dispose();
        }
    }

    public interface IShoppingCartItemRepository : IDisposable
    {
        IQueryable<ShoppingCartItem> All { get; }
        IQueryable<ShoppingCartItem> AllIncluding(params Expression<Func<ShoppingCartItem, object>>[] includeProperties);
        ShoppingCartItem Find(int id);
        void AddToCart(string shoppingCartID, int productID, int quantity);
        void InsertOrUpdate(ShoppingCartItem shoppingcartitem);
        void Delete(int id);
        IQueryable<ShoppingCartItem> FindByCartID(string shoppingCartID);
        decimal GetTotal(string shoppingCartID);
        int GetCount(string shoppingCartID);
        void Save();
    }
}