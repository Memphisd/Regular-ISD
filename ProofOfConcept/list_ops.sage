import hashlib
import numpy
from sage.misc.search import search



#####################################################################################

def create_hash_table(c):
    
    num_elements = len(c);

    hash_list = vector(ZZ,num_elements);
    indexes_list = vector(range(num_elements));
    
    #Instantiate hash function
    for i in range(num_elements):
        m = hashlib.md5()
#        m.update(str(c[i]))
        m.update(str(c[i]).encode('utf-8'))
        x = m.hexdigest();
        hash_list[i] = ZZ('0x'+x);
    
    #Sort list and indexes accordingly
    sorting_pos = numpy.argsort(hash_list);
    P = Permutation(sorting_pos+1);
    hash_list = P.action(hash_list);
    indexes_list = P.action(indexes_list);
    
    return hash_list, indexes_list

        
#####################################################################################        


def colliding_indexes(a,b):

    a_list, a_indexes = create_hash_table(a);
    b_list, b_indexes =create_hash_table(b);

    n = len(a);

    collisions =  [];

    for j in range(len(b_list)):
        x = b_list[j];
        ok,pos = search(a_list,x);
        if ok:
            
            matching_pos = [pos];

            #search forward
            if pos < (n-1):
                i = pos+1;
                while (a_list[i] == x)&(i<n):
                    matching_pos.append(i);
                    i = i+1;
                    if i == n:
                        break;

            
            #search backword
            if pos>0:
                i = pos-1;
                while (a_list[i] == x)&(i>=0):
                    matching_pos.append(i);
                    i = i-1;
                    if i<0:
                        break;
                    

            for ell in matching_pos:
                collisions.append([a_indexes[ell],b_indexes[j]])
    
    return collisions;

#####################################################################################        



def colliding_elements(a,b):

    a_list, a_indexes = create_hash_table(a);
    b_list, b_indexes =create_hash_table(b);

    n = len(a);

    colliding_pos =  [];

    for j in range(len(b_list)):
        x = b_list[j];
        ok,pos = search(a_list,x);
        
        if ok:
            colliding_pos.append(pos)
    
    #remove duplicates    
    collisions = [];
    for i in uniq(colliding_pos):
        collisions.append(a[a_indexes[i]]);
    
    return collisions;

#####################################################################################


def uniq_list(a,b):

    a_list, a_indexes = create_hash_table(a);
    
    n = len(a);
    
    new_a = [];
    new_b = [];
    
    i = 0;
    
    while(i<n):
        this_val = a_list[i];
        pos = a_indexes[i];
        new_a.append(a[pos]);
        new_b.append(b[pos]);
        flag_duplicate = 1;
        while (i<n)&flag_duplicate:
            i+=1;
            if i <n:
                if (this_val!=a_list[i]):
                    flag_duplicate = 0;
        
    return new_a, new_b;

#####################################################################################  
