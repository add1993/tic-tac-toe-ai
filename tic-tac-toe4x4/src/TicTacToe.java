import java.awt.* ; 
import java.awt.event.* ; 
import java.io.* ; 
import java.net.* ;
import javax.swing.* ; 
import javax.swing.border.* ; 
import java.util.concurrent.TimeUnit;

public class TicTacToe extends JFrame 
                       implements ActionListener {
   JButton b11,b21,b31,
           b12,b22,b32,
           b13,b23,b33 ;
   JButton buttons[][];

   JButton reset;

   boolean myturn ; 
   BufferedReader br ; 
   BufferedWriter bw ;
   Thread connection ; 
   Thread shows ;
   Connector connector;
   Process prologProcess ; 
   String prolog ; 
   String ttt ; 
   String port;
   JLabel jlblStatus;
   int n;
      
   /**
     *  Create a tic tac toe game, 
     *  prolog is the prolog command (e.g. "/opt/local/bin/swipl").
     *  ttt is the locator for ttt.pl (e.g. "/javalib/TicTacToe/ttt.pl").
     */
   public TicTacToe(String prolog, String ttt, String port) { 
      this.prolog = prolog ; 
      this.ttt = ttt ; 
      this.port = port;
      jlblStatus = new JLabel("X's turn to play");
      n = 6;
      buttons = new JButton[n][n];
      Font f = new Font("monospaced",Font.PLAIN,64) ;
      JPanel panel = new JPanel(new GridLayout(n, n, 0, 0)); 
      for (int i = 0; i < n; i++) {
    	  for (int j = 0; j < n; j++) {
    		  //int index = i*(n-1) + j;
	    	  buttons[i][j] = new JButton("") ;
	    	  buttons[i][j].setActionCommand("("+(i+1)+","+(j+1)+").");
	    	  buttons[i][j].setFont(f);
	    	  buttons[i][j].addActionListener(this) ;
	    	  panel.add(buttons[i][j]);
    	  }
      }

      // adding reset button set action command
      reset = new JButton("Reset");
      reset.setActionCommand("(-1,-1).");

      // adding action Listner to this panel
      reset.addActionListener(this);

      add(reset,BorderLayout.SOUTH);
      add(panel,BorderLayout.CENTER);
      add(jlblStatus, BorderLayout.NORTH);
      jlblStatus.setOpaque(true);
      jlblStatus.setBackground(Color.YELLOW);
      
      //this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE) ; 
      this.setTitle("Tic Tac Toe") ; 
      Border panelborder = BorderFactory.createLoweredBevelBorder() ; 
      panel.setBorder(panelborder) ; 
      this.getContentPane().add(panel) ; 
      this.setSize(600,600) ;
      this.setLocation(900,300) ; 
      this.myturn = true ; 

      connector = new Connector(Integer.valueOf(port)) ; 
      connector.start() ; 
      
      Socket sock ;
      try {
         sock = new Socket("127.0.0.1",Integer.valueOf(port)) ;
         br = new BufferedReader(new InputStreamReader(sock.getInputStream())) ; 
         bw = new BufferedWriter(new OutputStreamWriter(sock.getOutputStream())) ; 
      } catch(Exception x) { System.out.println(x) ; }

      connection = new Thread() {
         public void run() { 
            while(true) {
               try {
            	  //TimeUnit.MINUTES.sleep(8);
                  String s = br.readLine() ;
		  // check for the string value input
                  if (s == null) continue;
                  System.out.println("Move from prolog");
                  System.out.println(s); 
                  computer_move(s) ; 
               } catch(Exception xx) { System.out.println(xx) ; }
            }  
         }
      } ;
      connection.start() ;

      shows = new Thread() { 
         public void run() { 
            setVisible(true) ;
         }
      } ;
      EventQueue.invokeLater(shows);
      
      // Start the prolog player

      try { 
         prologProcess = 
           Runtime.getRuntime().exec(prolog + " -f " + ttt) ; 
      } catch(Exception xx) {System.out.println(xx) ; }

      // On closing, kill the prolog process first and then exit
      this.addWindowListener(new WindowAdapter() { 
         public void windowClosing(WindowEvent w) { 
            if (prologProcess != null) prologProcess.destroy() ;
            System.exit(0) ; 
         }
      }) ; 

   } 

//       /opt/local/bin/swipl   /javalib/TicTacToe/ttt.pl
   public static void main(String[] args) { 
      String prolog = "C:\\Program Files\\swipl\\bin\\swipl.exe" ;
      String ttt = "C:\\Users\\nxf49698\\Desktop\\AI\\tic-tac-toe-java\\tic-tac-toe4\\src\\ttt.pl" ;
	  String port = "54321";
      boolean noargs = true ; 
      try { 
         prolog = args[0] ;
         ttt = args[1] ;
		 port = args[2];
         noargs = false ; 
      } 
      catch (Exception xx) {
         System.out.println("usage: java TicTactoe  <where prolog>  <where ttt>") ; 
      }
      if (noargs) { 
         Object[] message = new Object[6] ; 
         message[0] = new Label("  prolog command") ;
         message[1] = new JTextField(prolog) ; 
         message[2] = new Label("  where ttt.pl ") ;
         message[3] = new JTextField(ttt) ; 
	 message[4] = new Label(" port number");
	 message[5] = new JTextField(port);
         try { 
            int I = JOptionPane.showConfirmDialog(null,message,"Where are Prolog and ttt.pl and port ? ",JOptionPane.OK_CANCEL_OPTION) ;  
            if (I == 2 | I == 1) System.exit(0) ;
            System.out.println(I) ; 
            new TicTacToe(((JTextField)message[1]).getText().trim(),((JTextField)message[3]).getText().trim(),((JTextField)message[5]).getText().trim()) ; 
         } catch(Exception yy) {} 
      }
      else
         new TicTacToe(prolog,ttt,port) ; 
   }




   void computer_move(String s) { // " x ## y '
      String[] c = s.split(",") ; 
      int x = Integer.parseInt(c[0].trim()), 
          y = Integer.parseInt(c[1].trim()) ; 
      System.out.println(x+","+y) ;
      if (x < 0 || y < 0) {
    	  System.out.println("Reset ack : "+x+","+y) ;
    	  myturn = true ;
    	  return;
      }
       
      buttons[x-1][y-1].setText("O");
      /*
      if (x == 1) {
         if (y == 1) b11.setText("O") ; 
         else if (y == 2) b12.setText("O") ; 
         else if (y == 3) b13.setText("O") ; 
      }
      else if (x == 2) {
         if (y == 1) b21.setText("O") ;
         else if (y == 2) b22.setText("O") ; 
         else if (y == 3) b23.setText("O") ; 
      }
      else if (x == 3) { 
         if (y == 1) b31.setText("O") ;
         else if (y == 2) b32.setText("O") ; 
         else if (y == 3) b33.setText("O") ; 
      }*/
      if (winner()) {
    	  System.out.println("Game ended");
    	  myturn = true;
    	  //connection.stop() ;
      } else  {
    	  myturn = true ;
      }
   }

   /**
     * Java player
     */
   public void resetGame() {
	   for (int i = 0; i < n; i++) {
		   for (int j = 0; j < n; j++) {
			   buttons[i][j].setText("");
		   }
	   }
	   /*
	   if (prologProcess != null) prologProcess.destroy() ;
      try { 
          prologProcess = 
            Runtime.getRuntime().exec(this.prolog + " -f " + this.ttt) ; 
       } catch(Exception xx) {System.out.println(xx) ; }*/

   }
   
   public void actionPerformed(ActionEvent act) {
	  String s = ((JButton)act.getSource()).getText() ;
	  System.out.println(s);
	  if (s.equals("Reset")) {
		  System.out.println("Resetting game");
		  this.resetGame();
		  //connector.destroy();
		  /*connection.destroy();
		  if (prologProcess != null) prologProcess.destroy() ;
		  
		  connector = new Connector(Integer.valueOf("12345")) ; 
	      connector.start() ; 
	      
	      Socket sock ;
	      try {
	         sock = new Socket("127.0.0.1",Integer.valueOf("12345")) ;
	         br = new BufferedReader(new InputStreamReader(sock.getInputStream())) ; 
	         bw = new BufferedWriter(new OutputStreamWriter(sock.getOutputStream())) ; 
	      } catch(Exception x) { System.out.println(x) ; }

	      connection = new Thread() {
	         public void run() { 
	            while(true) {
	               try {
	                  String s = br.readLine() ;
			  // check for the string value input
	                  System.out.println("Move from prolog");
	                  System.out.println(s); 
	                  computer_move(s) ; 
	               } catch(Exception xx) { System.out.println(xx) ; }
	            }  
	         }
	      } ;
	      connection.start() ;

	      // Start the prolog player

	      try { 
	         prologProcess = 
	           Runtime.getRuntime().exec(prolog + " -f " + ttt) ; 
	      } catch(Exception xx) {System.out.println(xx) ; }*/
 
		  try { 
			  System.out.println("Reset : "+act.getActionCommand());
	         bw.write(act.getActionCommand()+"\n") ; 
	         bw.flush() ;  
	      } catch(Exception xx) { System.out.println(xx) ; }
		  myturn = true;
		  
	  } else {
	      if (!myturn) return ; // otherwise 
	      
	      
	      if (!s.equals("")) return  ; 
	      ((JButton)(act.getSource())).setText("X") ; 
	      
	      try { 
	    	 System.out.println("Sending cmd "+ act.getActionCommand());
	         bw.write(act.getActionCommand() + "\n") ; 
	         bw.flush() ;  
	      } catch(Exception xx) { System.out.println(xx) ; } 
	      myturn = false ; 
	      if (winner()) {
	    	  System.out.println("Game ended");
	    	  //connection.stop() ;
	      }
	  }
   }

   /**
     *  Do we have a winner?
     */
   boolean winner() { 
	  for (int i = 0; i < n; i++) {
		  if (line(buttons[i][0], buttons[i][1], buttons[i][2]) || 
				  line(buttons[0][i], buttons[1][i], buttons[2][i])) {
			  return true;
		  }
	  }
	  
	  if (line(buttons[0][0], buttons[1][1], buttons[2][2]) ||
			  line(buttons[0][2], buttons[1][1], buttons[2][0])) {
		  return true;
	  }
	  return false;
      /*return  line(b11,b21,b31) ||
         line(b12,b22,b32) ||
         line(b13,b23,b33) ||
         line(b11,b12,b13) ||
         line(b21,b22,b23) ||
         line(b31,b32,b33) ||
         line(b11,b22,b33) ||
         line(b13,b22,b31)  ;*/
   }

   /**
     *  Are three buttons marked with same player? 
     *  If, so color the line and return true.
     */
   boolean line(JButton b, JButton c, JButton d) {        
      if (!b.getText().equals("") &&b.getText().equals(c.getText()) &&
                c.getText().equals(d.getText()))  {
         if (b.getText().equals("O")) { 
            b.setBackground(Color.red) ;
            c.setBackground(Color.red) ;
            d.setBackground(Color.red) ; 
         } 
         else { 
            b.setBackground(Color.green) ;
            c.setBackground(Color.green) ;
            d.setBackground(Color.green) ; 
         }
         return true ;  
      } else return false;
   }

}
  
/*
If Java player closes GUI, then Prolog process is terminated.
Java process monitors "win" status of both players, signals a win,
and closes the connector and prolog player.
Prolog justs plays given position.
Write all of this up; it is interesting.
*/

