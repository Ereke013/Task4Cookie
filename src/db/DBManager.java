package db;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/news?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean addPublication(Publication publication) {
        int rows = 0;
        try {

            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO publications(id, name, description, rating)" +
                            " VALUES (NULL ,?,?,?)");

            statement.setString(1, publication.getName());
            statement.setString(2, publication.getDescription());
            statement.setDouble(3,publication.getRating());

            rows = statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rows > 0;
    }

    public static boolean addLanguage(Languages language) {
        int rows = 0;
        try {

            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO languages(id, name, code) " +
                            "VALUES (NULL ,?,?)");

            statement.setString(1, language.getName());
            statement.setString(2, language.getCode());

            rows = statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rows > 0;
    }

    public static boolean addNews(News news) {
        int rows = 0;
        try {

            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO news(id, title, short_content, content, post_date, picture_url, language_id,publication_id)" +
                            " VALUES (NULL ,?,?,?,?,?,?,?)");

            statement.setString(1, news.getTitle());
            statement.setString(2, news.getShort_content());
            statement.setString(3,news.getContent());
            statement.setTimestamp(4, news.getPost_date());
            statement.setString(5,news.getPicture_url());
            statement.setLong(6,news.getLanguage().getId());
            statement.setLong(7,news.getPublication().getId());

            rows = statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rows > 0;
    }

    public static ArrayList<Publication> getAllPublication() {
        ArrayList<Publication> publications = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT id, name, description,rating" +
                            " FROM publications");

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                publications.add(new Publication(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("description"),
                        resultSet.getDouble("rating")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return publications;
    }

    public static ArrayList<Languages> getAllLanguages() {
        ArrayList<Languages> languages = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT id, name, code" +
                            " FROM languages");

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                languages.add(new Languages(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("code")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return languages;
    }

    public static ArrayList<News> getAllNews() {
        ArrayList<News> newsList = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT n.id, n.title, n.short_content, n.content, n.post_date, n.picture_url, n.language_id, " +
                            " l.name, l.code, n.publication_id, p.name, p.description, p.rating" +
                            " FROM news n, languages l, publications p" +
                            " where n.language_id = l.id and n.publication_id = p.id");

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                newsList.add(new News(
                        resultSet.getLong(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getTimestamp(5),
                        resultSet.getString(6),
                        new Languages(
                            resultSet.getLong(7),
                        resultSet.getString(8),
                        resultSet.getString(9)
                        ),
                        new Publication(
                                resultSet.getLong(10),
                                resultSet.getString(11),
                                resultSet.getString(12),
                                resultSet.getDouble(13)
                        )
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return newsList;
    }
    public static Languages getLanguageById(Long id){
        Languages language=null;
        try {
            PreparedStatement statement=connection.prepareStatement("select * from languages where id=?");
            statement.setLong(1,id);
            ResultSet set=statement.executeQuery();
            while (set.next()){
                language=new Languages(
                        set.getLong(1),
                        set.getString(2),
                        set.getString(3)

                );
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return language;
    }
    public static Publication getPublicationById(Long id){
        Publication publication=null;
        try {
            PreparedStatement statement=connection.prepareStatement("select * from publications where id=?");
            statement.setLong(1,id);
            ResultSet set=statement.executeQuery();
            while (set.next()){
                publication=new Publication(
                        set.getLong(1),
                        set.getString(2),
                        set.getString(3),
                        set.getDouble(4)

                );
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return publication;
    }
    public static News getNewsById(Long id){
        News news=null;
        try {
            PreparedStatement statement=connection.prepareStatement("select n.id, n.title, n.short_content, n.content, n.post_date, n.picture_url, l.name, p.name as newsName,p.description, p.rating " +
                    " from news n" +
                    " inner join languages l on n.language_id=l.id " +
                    " inner join publications p on n.publication_id=p.id " +
                    " where n.id=?");
            statement.setLong(1,id);
            ResultSet set=statement.executeQuery();
            while (set.next()){
                news=new News(
                        set.getLong(1),
                        set.getString(2),
                        set.getString(3),
                        set.getString(4),
                        set.getTimestamp(5),
                        set.getString(6),
                        new Languages(
                                set.getString(7)

                        ),
                        new Publication(
                                set.getString(8),
                                set.getString(9),
                                set.getDouble(10)
                        )
                );
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return news;
    }

    public static boolean editLanguage(Languages language){
        int rows = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE languages SET name = ?, code = ? WHERE id = ?");
            statement.setString(1,language.getName());
            statement.setString(2,language.getCode());
            statement.setLong(3,language.getId());


            rows = statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rows > 0;
    }
    public static boolean editPublication(Publication publication){

        int rows = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE publications SET name = ?, description = ?, rating = ? WHERE id = ?");
            statement.setString(1,publication.getName());
            statement.setString(2,publication.getDescription());
            statement.setDouble(3,publication.getRating());
            statement.setLong(4,publication.getId());


            rows = statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rows > 0;
    }
    public static boolean editNews(News news){
        int rows = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE news SET null,?,?,?,?,?,?,? WHERE id = ?");
            statement.setString(1,news.getTitle());
            statement.setString(2,news.getShort_content());
            statement.setString(3,news.getContent());
            statement.setTimestamp(4,news.getPost_date());
            statement.setString(5,news.getPicture_url());
            statement.setLong(6,news.getLanguage().getId());
            statement.setLong(7,news.getPublication().getId());
            statement.setLong(8,news.getId());


            rows = statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rows > 0;
    }

    public static boolean deleteLanguage(Long id){
        int rows = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM language WHERE id = ?");

            statement.setLong(1, id);

            rows = statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows > 0;
    }

    public static boolean deleteNews(Long id){
        int rows = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM news WHERE id = ?");

            statement.setLong(1, id);

            rows = statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows > 0;
    }

    public static boolean deletePublication(Long id){
        int rows = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM publications WHERE id = ?");

            statement.setLong(1, id);

            rows = statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows > 0;
    }

    public static ArrayList<News> getAllNewsByPubl(Long id){
        ArrayList<News> newsList = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT n.id, n.title, n.short_content, n.content, n.post_date, n.picture_url, n.language_id, " +
                            " l.name, l.code, n.publication_id, p.name, p.description, p.rating" +
                            " FROM news n, languages l, publications p" +
                            " where n.language_id = l.id and n.publication_id = p.id and p.name=?");

            statement.setLong(1,id);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                newsList.add(new News(
                        resultSet.getLong(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getTimestamp(5),
                        resultSet.getString(6),
                        new Languages(
                                resultSet.getLong(7),
                                resultSet.getString(8),
                                resultSet.getString(9)
                        ),
                        new Publication(
                                resultSet.getLong(10),
                                resultSet.getString(11),
                                resultSet.getString(12),
                                resultSet.getDouble(13)
                        )
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return newsList;
    }
}
