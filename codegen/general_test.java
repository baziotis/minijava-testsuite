//Do not expect good code it's only a test
class Main
{
    public static void main(String[] args)
    {
        A a;
        B b;
        D d;
        boolean tr;
        int[] i_arr;
        boolean [] b_arr;
        int i;
        int j;
        int z;
        a=new A();
        b=new B();
        d=new D();
        {
            {
                {
                    {
                        {
                            System.out.println(a.Init());
                        }
                    }
                }
            }
        }
        System.out.println(a.Print());
        b_arr=(a.getBoolean_array());
        i=0;
        tr=(((true&&true)&&((!(false))&&(!(false))))&&(100<1000));
        if(((true&&tr)&&((!(false))&&(!(false)))))
        {
            if(((true&&tr)&&((!(false))&&(!(false)))))
            {
                if(((true&&tr)&&((!(false))&&(!(false)))))
                {
                    if(((true&&tr)&&((!(false))&&(!(false)))))
                    {
                        if(((tr&&tr)&&((!(false))&&(!(false)))))
                        {
                            System.out.println(12345678);
                        }
                        else
                        {
                            System.out.println(8888888);
                        }
                    }
                    else
                    {
                        System.out.println(8888888);
                    }
                }
                else
                {
                    System.out.println(8888888);
                }
            }
            else
            {
                System.out.println(8888888);
            }
        }
        else
        {
            System.out.println(8888888);
        }
        while(i<4)
        {
            j=0;
            while(j<8)
            {
                z=0;
                while(z<2)
                {
                    System.out.println(((i+j)+z));
                    z=z+1;
                }
                j=j+1;
            }
            i=i+1;
        }
        i=0;
        while ((i<(b_arr.length)))
        {
            if(b_arr[i])
            {
                b_arr[i]=false;
                System.out.println(0);
            }
            else
            {
                b_arr[i]=true;
                System.out.println(1);
            }
            if(((a.getBoolean_array())[i]))
            {
                System.out.println(1);
            }
            else
            {
                System.out.println(0);
            }
            System.out.println(55555);
            i=i+1;
        }
        System.out.println(b.InitB());
        System.out.println(b.PrintB());
        System.out.println(d.Init());
        System.out.println(d.Print());
        System.out.println(((d.getT()).Print()));
        b_arr=new boolean[5];
        b_arr[0]=true;
        b_arr[((((1+1)-1)*1)+1)]=true;
        b_arr[4]=true;
        i_arr = new int[1];
        System.out.println((d.setBoolean_array(b_arr)));
        System.out.println((d.setBoolean_array(b_arr)));
        System.out.println((d.setInt_array(i_arr)));
        System.out.println((d.setB_i_array(i_arr)));
        System.out.println(d.Print());
        System.out.println(a.argcheck(((((((123)*125)-58)+154)+(a.getInt_item()))+1), (((!(false))&&true)&&(1<((124)+((0-82))))), (a.getInt_array()), (b.getBoolean_array()), a));
    }
}
class A
{
    int int_item;
    boolean boolean_item;
    int[] int_array;
    boolean[] boolean_array;
    public int Init()
    {
        int i;
        int temp;
        boolean flag;
        int_item=128;
        boolean_item=true;
        int_array=new int[(((1)*1)+9)];
        boolean_array=new boolean[8];
        i=0;
        temp=100;
        flag=true;
        while ((i<(int_array.length)))
        {
            if((!(!((true)&&(!(false)))&&(((int_array.length)<(((int_array.length)+2)-1)))))&&flag)//if(flag)
            {
                int_array[i]=i;
                flag=(!((true)&&(!(false))));//false
            }
            else
            {
                int_array[i]=(((((i*(((((15+15)+10)*2)+21)-1))*temp)+temp))-(temp));//i*100*100
                flag=(!(!((true)&&(!(false)))));//true
            }
            System.out.println(i);
            i=i+1;
        }
        i=0;
        flag=true;
        while ((i<(boolean_array.length)))
        {
            boolean_array[i]=flag;
            if(flag)//if(flag)
            {
                flag=(!((true)&&(!(false))));//false
            }
            else
            {
                flag=(!(!((true)&&(!(false)))));//true
            }
            System.out.println(i);
            i=i+1;
        }
        return 1024;
    }
    public int Print()
    {
        int i;
        System.out.println(int_item);
        if(boolean_item)
        {
            System.out.println(1111);
        }
        else
        {
            System.out.println(1001);
        }
        i=0;
        while ((i<(int_array.length)))
        {
            System.out.println((int_array[i]));
            i=i+1;
        }
        i=0;
        while ((i<((this.getBoolean_array()).length)))
        {
            if(((this.getBoolean_array())[i]))
            {
                System.out.println(111111);
            }
            else
            {
                System.out.println(100001);
            }
            i=i+1;
        }
        return 1048576;
    }
    public int getInt_item()
    {
        return int_item;
    }
    public int setInt_item(int i_item)
    {
        int_item=i_item;
        return int_item;
    }
    public boolean isBoolean_item()
    {
        return boolean_item;
    }
    public int setBoolean_item(boolean b_item)
    {
        int res;
        boolean_item=b_item;
        if(boolean_item)
        {
            res=1111;
        }
        else
        {
            res=1100;
        }
        return res;
    }
    public int[] getInt_array()
    {
        return int_array;
    }
    public int setInt_array(int[] i_array)
    {
        int_array=i_array;
        return (int_array.length);
    }
    public int setInt_array_item(int index, int item)
    {
        int_array[index]=item;
        return 1;
    }
    public boolean[] getBoolean_array()
    {
        return boolean_array;
    }
    public int setBoolean_array(boolean[] b_array)
    {
        boolean_array=b_array;
        return (boolean_array.length);
    }
    public int setBoolean_array_item(int index, boolean item)
    {
        boolean_array[index]=item;
        return 1;
    }
    public int argcheck(int i,boolean b,int [] i_arr,boolean [] b_arr, A a)
    {
        int sum;
        int j;
        j=0;
        sum=i;
        sum=sum+(a.getInt_item());
        if(b)
        {
            sum=sum+(1024576);
        }
        else
        {
            sum=sum-(1024576);
        }
        j=0;
        while (j<(i_arr.length))
        {
            sum=sum+(i_arr[j]);
            j=j+1;
        }
        j=0;
        while (j<(b_arr.length))
        {
            if(b_arr[j])
            {
                sum=sum+5;
            }
            else
            {
                sum=sum*(2);
            }
            j=j+1;
        }
        return sum;
    }
}
class B extends A
{
    int b_int;
    boolean b_boolean;
    int[] b_i_array;
    boolean[] b_b_array;
    public int InitB()
    {
        int i;
        int temp;
        boolean flag;
        System.out.println((this.Init()));
        b_int=((((154)*878)+214)-1477);
        b_boolean=true;
        b_i_array=new int[21];
        b_b_array=new boolean[9];
        i=0;
        temp=100;
        flag=true;
        while ((i<(b_i_array.length)))
        {
            if((!(!((true)&&(!(false)))&&(((b_i_array.length)<11))))&&flag)//if(flag)
            {
                b_i_array[i]=i;
                flag=(!((true)&&(!(false))));//false
            }
            else
            {
                b_i_array[i]=(((((i*(((((15+15)+10)*2)+21)-1))*temp)+temp))-(temp));//i*100*100
                flag=(!(!((true)&&(!(false)))));//true
            }
            System.out.println(i);
            i=i+1;
        }
        i=0;
        flag=true;
        while ((i<(b_b_array.length)))
        {
            b_b_array[i]=flag;
            if(flag)//if(flag)
            {
                flag=(!((true)&&(!(false))));//false
            }
            else
            {
                flag=(!(!((true)&&(!(false)))));//true
            }
            System.out.println(i);
            i=i+1;
        }
        return 8192;
    }
    public int PrintB()
    {
        int i;
        System.out.println((this.Print()));
        System.out.println(b_int);
        if(b_boolean)
        {
            System.out.println(1111);
        }
        else
        {
            System.out.println(1001);
        }
        i=0;
        while ((i<((this.getB_i_array()).length)))
        {
            System.out.println((((this.getB_i_array()))[i]));
            i=i+1;
        }
        i=0;
        while ((i<((this.getB_b_array()).length)))
        {
            if(((this.getB_b_array())[i]))
            {
                System.out.println(111111);
            }
            else
            {
                System.out.println(100001);
            }
            i=i+1;
        }
        return 2097152;
    }
    public int getB_int()
    {
        return b_int;
    }
    public boolean isB_boolean()
    {
        return b_boolean;
    }
    public int[] getB_i_array()
    {
        return b_i_array;
    }
    public boolean[] getB_b_array()
    {
        return b_b_array;
    }
    public int setB_i_array(int[] i)
    {
        b_i_array=i;
        return 4;
    }
    public int setB_b_array(boolean[] b)
    {
        b_b_array=b;
        return 3;
    }
    public int setB_int(int b)
    {
        b_int=b;
        return 2;
    }
    public int setB_boolean(boolean b)
    {
        b_boolean=b;
        return 1;
    }
    
    public int setB_i_array_item(int index, int item)
    {
        b_i_array[index]=item;
        return 1;
    }
    public int setB_b_array_item(int index, boolean item)
    {
        b_b_array[index]=item;
        return 1;
    }
}
class C extends B
{
    Test t;
    public Test getT()
    {
        return t;
    }
    public int setT(Test t1)
    {
        t=t1;
        return 0;
    }
    
    public int Init()
    {
        int i;
        int temp;
        boolean flag;
        System.out.println(this.setT(new Test2()));
        System.out.println(((this.getT()).Init()));
        int_item=128;
        boolean_item=true;
        int_array=new int[10];
        boolean_array=new boolean[8];
        i=0;
        temp=100;
        flag=true;
        while ((i<(int_array.length)))
        {
            if((!(!((true)&&(!(false)))&&(((int_array.length)<11))))&&flag)//if(flag)
            {
                int_array[i]=i;
                flag=(!((true)&&(!(false))));//false
            }
            else
            {
                int_array[i]=(((((i*(((((15+15)+10)*2)+21)-1))*temp)+temp))-(temp));//i*100*100
                flag=(!(!((true)&&(!(false)))));//true
            }
            System.out.println(i);
            i=i+1;
        }
        i=0;
        flag=true;
        while ((i<(boolean_array.length)))
        {
            boolean_array[i]=flag;
            if(flag)//if(flag)
            {
                flag=(!((true)&&(!(false))));//false
            }
            else
            {
                flag=(!(!((true)&&(!(false)))));//true
            }
            System.out.println(i);
            i=i+1;
        }
        b_int=256;
        b_boolean=true;
        b_i_array=new int[21];
        b_b_array=new boolean[9];
        i=0;
        temp=100;
        flag=true;
        while ((i<(b_i_array.length)))
        {
            if((!(!((true)&&(!(false)))&&(((b_i_array.length)<11))))&&flag)//if(flag)
            {
                b_i_array[i]=i;
                flag=(!((true)&&(!(false))));//false
            }
            else
            {
                b_i_array[i]=(((((i*(((((15+15)+10)*2)+21)-1))*temp)+temp))-(temp));//i*100*100
                flag=(!(!((true)&&(!(false)))));//true
            }
            System.out.println(i);
            i=i+1;
        }
        i=0;
        flag=true;
        while ((i<(b_b_array.length)))
        {
            b_b_array[i]=flag;
            if(flag)//if(flag)
            {
                flag=(!((true)&&(!(false))));//false
            }
            else
            {
                flag=(!(!((true)&&(!(false)))));//true
            }
            System.out.println(i);
            i=i+1;
        }
        return 1024;
    }
    public int Print()
    {
        int i;
        System.out.println(this.getInt_item());
        if(this.isBoolean_item())
        {
            System.out.println(1111);
        }
        else
        {
            System.out.println(1001);
        }
        i=0;
        while ((i<((this.getInt_array()).length)))
        {
            System.out.println(((this.getInt_array())[i]));
            i=i+1;
        }
        i=0;
        while ((i<((this.getBoolean_array()).length)))
        {
            if(((this.getBoolean_array())[i]))
            {
                System.out.println(111111);
            }
            else
            {
                System.out.println(100001);
            }
            i=i+1;
        }
        System.out.println(this.getB_int());
        if(this.isB_boolean())
        {
            System.out.println(1111);
        }
        else
        {
            System.out.println(1001);
        }
        i=0;
        while ((i<((this.getB_i_array()).length)))
        {
            System.out.println((((this.getB_i_array()))[i]));
            i=i+1;
        }
        i=0;
        while ((i<((this.getB_b_array()).length)))
        {
            if(((this.getB_b_array())[i]))
            {
                System.out.println(111111);
            }
            else
            {
                System.out.println(100001);
            }
            i=i+1;
        }
        System.out.println(((this.getT()).Print()));
        return 1048576;
    }
}
class D extends C
{
}

class Test
{
    int Test;
    public int Init()
    {
        System.out.println(this.setTest(1428));
        return 1;
    }
    public int getTest()
    {
        return Test;
    }
    public int setTest(int test)
    {
        Test=test;
        return Test;
    }
    public int Print()
    {
        System.out.println(this.getTest());
        return Test;
    }
}

class Test2 extends Test
{
    int[] Test_array;
    public int Init()
    {
        int i;
        System.out.println(this.setTest(12567));
        System.out.println(this.setTest_array((new int[12])));
        i=((this.getTest_array()).length);
        while ((0<i))
        {
            Test_array[(i-1)]=i;
            i=i-1;
        }
        return 1;
    }
    public int[] getTest_array()
    {
        return Test_array;
    }
    public int setTest_array(int[] array)
    {
        Test_array=array;
        return 0;
    }
    public int setTest_array_item(int index, int item)
    {
        Test_array[index]=item;
        return 1;
    }
    public int Print()
    {
        int i;
        System.out.println(this.getTest());
        i=0;
        while ((i<((this.getTest_array()).length)))
        {
            System.out.println(((this.getTest_array())[i]));
            i=i+1;
        }
        i=0;
        return 1048576;
    }
}
