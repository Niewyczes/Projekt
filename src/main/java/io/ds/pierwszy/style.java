import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class Main extends Application {
    @Override
    public void start(Stage primaryStage) {
        VBox root = new VBox(15);
        root.setPadding(new Insets(30));
        root.setStyle("-fx-background-color: #103d1b;");

        Text title = new Text("Project Hub");
        title.setStyle("-fx-font-size: 28px; -fx-fill: #81c784;");

        // Example buttons for connecting to other projects
        Button project1 = new Button("Project 1");
        Button project2 = new Button("Project 2");
        Button project3 = new Button("Project 3");

        // Style the buttons
        String buttonStyle = "-fx-background-radius: 8; -fx-text-fill: white; " +
                "-fx-font-size: 18px; -fx-pref-width: 220px; " +
                "-fx-background-color: linear-gradient(#43a047, #81c784);";
        project1.setStyle(buttonStyle);
        project2.setStyle(buttonStyle);
        project3.setStyle(buttonStyle);

        root.getChildren().addAll(title, project1, project2, project3);

        Scene scene = new Scene(root, 350, 300);
        primaryStage.setTitle("Green Project Hub");
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
