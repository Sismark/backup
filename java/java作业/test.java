package test;
import java.util.Arrays;
import java.util.Scanner;
public class test {
	public static void main(String[] args) {
		Scanner scanner=new Scanner(System.in);
		int[][] Chess=new int[3][3];
		int line,row,other;
		//��������
		System.out.println("��������: ");
		for(int i=0;i<3;i++) {
			for(int j=0;j<3;j++) {
				Chess[i][j]=scanner.nextInt();
			}
		}
		
		line=Line(Chess);//����
		row=Row(Chess);//����
		other=Other(Chess);//��������

		if(line==0||row==0||other==0) System.out.println("ʤ��Ϊ:O");
		else {
			if(line==1||row==1||other==1) System.out.println("ʤ��Ϊ:X");
			else System.out.println("���˻�ʤ");
		}
	}
	
	static int Line(int[][] a){
		if(a[0][0]==a[0][1]&&a[0][1]==a[0][2]) return a[0][0];
		if(a[1][0]==a[1][1]&&a[1][1]==a[1][2]) return a[1][0];
		if(a[2][0]==a[2][1]&&a[2][1]==a[2][2]) return a[2][0];
		return 2;
	}
	
	static int Row(int[][] a){
		if(a[0][0]==a[1][0]&&a[1][0]==a[2][0]) return a[0][0];
		if(a[0][1]==a[1][1]&&a[1][1]==a[2][1]) return a[0][1];
		if(a[0][2]==a[1][2]&&a[1][2]==a[2][2]) return a[0][2];
		return 2;
	}
	
	static int Other(int[][] a){
		if(a[0][0]==a[1][1]&&a[1][1]==a[2][2]) return a[0][0];
		if(a[0][2]==a[1][1]&&a[1][1]==a[2][0]) return a[0][2];
		return 2;
	}
	
}
