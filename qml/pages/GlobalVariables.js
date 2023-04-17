var funct;
var rows;
var columns;
var rows2;
var columns2;
var matrix = [];
var matrix2 = [];
var matrixRes = []

function initialization(row, column){
    rows = row;
    columns = column;
    for(var i = 0; i < rows; i++)
    {
        matrix[i] = [];
        for(var j = 0; j < columns; j++)
        {
            matrix[i][j] = 0;
        }
    }
}

function initialization2(row, column, row2, column2){
    rows = row;
    columns = column;
    rows2 = row2;
    columns2 = column2;
    for(var i = 0; i < rows; i++)
    {
        matrix[i] = [];
        for(var j = 0; j < columns; j++)
        {
            matrix[i][j] = 0;
        }
    }
    for(i = 0; i < rows2; i++)
    {
        matrix2[i] = [];
        for(j = 0; j < columns2; j++)
        {
            matrix2[i][j] = 0;
        }
    }
}

function multMatrix(){
    for(var i = 0; i<rows; i++){
        matrixRes[i] = [];
        for(var j = 0; j<rows; j++){
            matrixRes[i][j] = 0;
            for(var k = 0; k<columns; k++){
                matrixRes[i][j] += matrix[i][k]*matrix2[k][j];
            }
        }
    }
}

function sumMatrix()
{
    for (var i = 0; i < rows; i++)
     { matrixRes[i] = [];
       for (var j = 0; j < columns; j++) matrixRes[i][j] = matrix[i][j]+matrix2[i][j];
     }
}

function transpose() {
    for(var i = 0; i < columns; i++)
    {
        matrixRes[i] = [];
        for(var j = 0; j < rows; j++)
        {
            matrixRes[i][j] = 0;
        }
    }
    for(i = 0; i < rows; i++)
    {
        for(j = 0; j < columns; j++)
        {
            matrixRes[j][i] = matrix[i][j];
        }
    }
}

function determinant()
{
    var n = matrix.length, subM = [], detM = 0;

    if (n===1) return matrix[0][0];
    if (n===2) return (matrix[0][0]*matrix[1][1]-matrix[0][1]*matrix[1][0]);
    if (n===3)
       { return ((matrix[0][0]*matrix[1][1]*matrix[2][2]+matrix[0][1]*matrix[1][2]*matrix[2][0]+matrix[0][2]*matrix[1][0]*matrix[2][1])
                 -(matrix[0][0]*matrix[1][2]*matrix[2][1]+matrix[0][1]*matrix[1][0]*matrix[2][2]+matrix[0][2]*matrix[1][1]*matrix[2][0]));
       }

    for (var i=0; i<n; i++)
        { for (var h=0; h<n-1; h++) subM[h]=[];
          for (var a=1; a<n; a++)
              { for (var b=0; b<n; b++)
                    { if (b<i)       subM[a-1][ b ] = A[ a ][ b ];
                      else if (b>i)  subM[a-1][b-1] = A[ a ][ b ];
                    }
              }
          var sign = (i%2==0) ? 1 : -1;
          detM += sign * matrix[0][i] * determinant(subM);
        }

    return detM;
}

function matrixRank()
{
    var m = matrix.length, n = matrix[0].length, k = (m < n ? m : n), r = 1, rank = 0;
    while (r <= k)
     { var B = [];
       for (var i = 0; i < r; i++) B[i] = [];
       for (var a = 0; a < m-r+1; a++)
        { for (var b = 0; b < n-r+1; b++)
           { for (var c = 0; c < r; c++)
              { for (var d = 0; d < r; d++) B[c][d] = matrix[a+c][b+d]; }
             if (determinant() !== 0) rank = r;
           }
        }
       r++;
     }
    return rank;
}


