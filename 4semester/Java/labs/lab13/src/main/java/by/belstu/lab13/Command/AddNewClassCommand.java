package by.belstu.lab13.Command;


import by.belstu.lab13.Exceptions.IncorrectDataException;
import by.belstu.lab13.Exceptions.ServiceException;
import by.belstu.lab13.Models.UniversityClass;
import by.belstu.lab13.services.UniversityClassService;
import by.belstu.lab13.util.Page;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Optional;

import static by.belstu.lab13.Command.AuthConstants.ERROR_MESSAGE;
import static by.belstu.lab13.Command.AuthConstants.ERROR_MESSAGE_TEXT;

public class AddNewClassCommand implements Command {
    @Override
    public CommandResult execute(HttpServletRequest request, HttpServletResponse response)
            throws ServiceException, IncorrectDataException, ServletException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");

        UniversityClassService classService = new UniversityClassService();
        System.out.println(request.getContextPath());
        //int classId = request.getParameter('');
        Optional<String> newName = Optional.ofNullable(request.getParameter("name"));
        Optional<String> newDay = Optional.ofNullable(request.getParameter("day"));
        Optional<String> newHours = Optional.ofNullable(request.getParameter("hours"));
        if (isEmpty(newName.get()) || isEmpty(newDay.get()) || isEmpty(newHours.get())) {
            System.out.println("missing parameter for new person in addition mode");
            request.setAttribute(ERROR_MESSAGE, ERROR_MESSAGE_TEXT);
        } else {
            UniversityClass newClass = new UniversityClass(1, newName.get(), newDay.get(), newHours.get());
            classService.save(newClass);
        }
        List<UniversityClass> clients = classService.findAll();
        if (!clients.isEmpty()) {
            request.setAttribute("classes", clients);
        }
        return new CommandResult(Page.WELCOME_PAGE.getPage(), false);
    }

    private boolean isEmpty(String s) {
        return s == null || s.length() == 0;
    }
}

