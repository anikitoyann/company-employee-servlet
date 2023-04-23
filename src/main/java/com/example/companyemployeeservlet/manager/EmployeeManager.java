package com.example.companyemployeeservlet.manager;


import com.example.companyemployeeservlet.db.DBConnectionProvider;
import com.example.companyemployeeservlet.model.Employee;

import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmployeeManager {
    private Connection connection = DBConnectionProvider.getInstance().getConnection();
    private CompanyManager companyManager=new CompanyManager();

    public void save(Employee employee) {
        try (Statement statement = connection.createStatement()) {
            String sql = "INSERT INTO employee(name,surname,email,company_id) VALUES('%s','%s','%s','%d')";
            statement.executeUpdate(String.format(sql, employee.getName(), employee.getSurname(), employee.getEmail(), employee.getCompany().getId()),Statement.RETURN_GENERATED_KEYS);
            ResultSet generatedKeys = statement.getGeneratedKeys();
            if(generatedKeys.next()){
                employee.setId(generatedKeys.getInt(1));
            }
            System.out.println("employee inserted into DB");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Employee> getAll() {
        List<Employee> employees = new ArrayList<>();
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery("SELECT * from employee");
            while (resultSet.next()) {
                employees.add(getEmployeeFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }


    public Employee getById(int id) {
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery("SELECT * from employee where id=" + id);
            if (resultSet.next()) {
                return getEmployeeFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public List<Employee> getAllByCompanyId(int companyId) {
        List<Employee> employees = new ArrayList<>();
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery("SELECT * from employee where company_id=" + companyId);
            while (resultSet.next()) {
                employees.add(getEmployeeFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }

    public void removeById(int employeeID) {
        String sql = "DELETE FROM employee where id=" + employeeID;
        try (Statement statement = connection.createStatement()) {
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Employee getEmployeeFromResultSet(ResultSet resultSet) throws SQLException, SQLException {
        Employee employee = new Employee();
        employee.setId(resultSet.getInt("id"));
        employee.setName(resultSet.getString("name"));
        employee.setSurname(resultSet.getNString("surname"));
        employee.setEmail(resultSet.getNString("email"));
      int companyId =resultSet.getInt("company_id");
      employee.setCompany(companyManager.getById(companyId));
        return employee;
    }
    public void update(Employee employee) {
        String sql = "UPDATE employee SET name='%s',surname='%s',email='%s' WHERE id=%d";
        try (Statement statement = connection.createStatement()) {
            statement.executeUpdate(String.format(sql, employee.getName(), employee.getSurname(), employee.getEmail(),employee.getId()));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
