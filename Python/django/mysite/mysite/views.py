# -*- coding: utf-8 -*-

from django.views.generic.base import TemplateView

#--- TemplateView

# TemplateView 제네릭뷰를 상속받아 사용하며, 필수적으로 template_name 클래스 변수를 오버라이딩으로 지정해줘야 한다.
class HomeView(TemplateView):
    # mysite 프로젝트의 첫 화면을 보여주기 위한 템플릿 파일을 home.html로 지정하였다.
    # 템플릿 파일이 위치하는 디렉토리는 settings.py 파일의 TEMPLATE_DIRS 항목으로 지정되어 있다.
    template_name = "home.html"