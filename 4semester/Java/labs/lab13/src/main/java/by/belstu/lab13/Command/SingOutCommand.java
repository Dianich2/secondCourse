package by.belstu.lab13.Command;

import by.belstu.lab13.Exceptions.IncorrectDataException;
import by.belstu.lab13.Exceptions.ServiceException;
import by.belstu.lab13.util.Page;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class SingOutCommand implements Command {
    @Override
    public CommandResult execute(HttpServletRequest request, HttpServletResponse response) throws ServiceException,
            IncorrectDataException {
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("NAME");
        System.out.println("user was above: name:" + username);
        session.removeAttribute("NAME");
        return new CommandResult(Page.LOGIN_PAGE.getPage(), false);
    }

}
