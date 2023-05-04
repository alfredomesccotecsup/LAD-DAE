from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect


# importamos la clase View
from django.views import View
from .models import *
from .forms import *

# Create your views here.


class AlumnoView(View):

    def get(self, request):
        listaAlumnos = TblAlumno.objects.all()
        formAlumno = AlumnoForm()
        context = {
            'alumnos': listaAlumnos,
            'formAlumno': formAlumno
        }
        return render(request, 'index.html', context)

    def post(self, request):
        if 'eliminar' in request.POST:
            alumno_id = request.POST.get('eliminar')
            alumno = TblAlumno.objects.get(alumno_id=alumno_id)
            alumno.delete()
            return redirect('web:index')
        else:
            formAlumno = AlumnoForm(request.POST)
            if formAlumno.is_valid():
                formAlumno.save()
                return redirect('web:index')
        return HttpResponseRedirect('web:index')


class ProfesorView(View):

    def get(self, request):
        listaProfesores = TblProfesor.objects.all()
        formProfesor = ProfesorForm()
        context = {
            'profesores': listaProfesores,
            'formProfesor': formProfesor
        }
        return render(request, 'profesores.html', context)

    def post(self, request):
        if 'eliminar' in request.POST:
            profesor_id = request.POST.get('eliminar')
            profesor = TblProfesor.objects.get(profesor_id=profesor_id)
            profesor.delete()
            return redirect('web:profesores')
        else:
            formProfesor = ProfesorForm(request.POST)
            if formProfesor.is_valid():
                formProfesor.save()
                return redirect('web:profesores')
        return HttpResponseRedirect('web:profesores')