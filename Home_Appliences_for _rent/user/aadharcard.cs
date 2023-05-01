using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Home_Appliences_for__rent.user
{
    public class aadharcard
    {
        static int[,] d = new int[,]

        {
         {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
         {1, 2, 3, 4, 0, 6, 7, 8, 9, 5},
         {2, 3, 4, 0, 1, 7, 8, 9, 5, 6},
         {3, 4, 0, 1, 2, 8, 9, 5, 6, 7},
         {4, 0, 1, 2, 3, 9, 5, 6, 7, 8},
         {5, 9, 8, 7, 6, 0, 4, 3, 2, 1},
         {6, 5, 9, 8, 7, 1, 0, 4, 3, 2},
         {7, 6, 5, 9, 8, 2, 1, 0, 4, 3},
         {8, 7, 6, 5, 9, 3, 2, 1, 0, 4},
         {9, 8, 7, 6, 5, 4, 3, 2, 1, 0}
        };
        static int[,] p = new int[,]
         {
         {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
         {1, 5, 7, 6, 2, 8, 3, 0, 9, 4},
         {5, 8, 0, 3, 7, 9, 6, 1, 4, 2},
         {8, 9, 1, 6, 0, 4, 3, 5, 2, 7},
         {9, 4, 5, 3, 1, 2, 6, 8, 7, 0},
         {4, 2, 8, 6, 5, 7, 3, 9, 0, 1},
         {2, 7, 9, 3, 8, 0, 6, 4, 1, 5},
         {7, 0, 4, 6, 9, 1, 3, 2, 5, 8}
         };

        static int[] inv = { 0, 4, 3, 2, 1, 5, 6, 7, 8, 9 };

        public static bool validateVerhoeff(string num)
        {
            int c = 0; int[] myArray = StringToReversedIntArray(num);
            for (int i = 0; i < myArray.Length; i++)
            {
                c = d[c, p[(i % 8), myArray[i]]];
            }
            return c == 0;

        }
        private static int[] StringToReversedIntArray(string num)
        {
            int[] myArray = new int[num.Length];
            for (int i = 0; i < num.Length; i++)
            {
                myArray[i] = int.Parse(num.Substring(i, 1));
            }
            Array.Reverse(myArray); return myArray;
        }
    }
}