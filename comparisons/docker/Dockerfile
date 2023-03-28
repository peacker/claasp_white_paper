FROM claasp
RUN pip install cython sympy bidict cffi wurlitzer pysmt
RUN pysmt-install --msat --confirm-agreement
RUN mkdir -p /home/sage/docker_claasp_white_paper_experiments
WORKDIR "/"
RUN cd / && git clone https://github.com/ranea/CASCADA.git
RUN echo '\
from distutils.core import setup \n\
setup( \n\
    name="CASCADA", \n\
    version="", \n\
    packages=["cascada", "cascada.smt", "cascada.smt.tests", "cascada.linear", "cascada.linear.tests", \n\
              "cascada.algebraic", "cascada.algebraic.tests", "cascada.bitvector", "cascada.bitvector.tests", \n\
              "cascada.primitives", "cascada.primitives.tests", "cascada.differential", "cascada.differential.tests", \n\
              "cascada.abstractproperty", "cascada.abstractproperty.tests"], \n\
    url="https://github.com/ranea/CASCADA", \n\
    license="", \n\
    author="Adrian Ranea", \n\
    author_email="adrian.ranea@kuleuven.be", \n\
    description="" \
)' > /CASCADA/setup.py
RUN sudo apt update && sudo apt install -y ruby-full && apt-get install -y task-spooler && apt-get install -y python3-matplotlib
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN export PATH=$PATH:$HOME/.cargo/env && cd / && git clone https://gitlab.limos.fr/iia_lulibral/tagada.git && cd tagada && git checkout 1.0 && cd rust && /root/.cargo/bin/cargo build --release && cd /tagada && gem install bundler #&& bundle install
RUN export PATH=$PATH:$HOME/.cargo/env && cd / && git clone https://gitlab.limos.fr/frdelobe/tagada_abstractor.git && cd tagada_abstractor && /root/.cargo/bin/cargo build --release
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan gitlab.limos.fr >> ~/.ssh/known_hosts #&& cd /tagada && bundle install
RUN sed -i 's/git\@/https:\/\//' /tagada/Gemfile
RUN sed -i 's/:iia_lorouque/\/iia_lorouque/' /tagada/Gemfile
RUN export GIT_SSL_NO_VERIFY=1 && cd /tagada && bundle install
RUN export GIT_SSL_NO_VERIFY=1 && cd / && git clone https://gitlab.limos.fr/iia_lulibral/experiment-env.git
RUN pysmt-install --btor --confirm-agreement
RUN cd /tagada && pip3 install --pre -r requirements.txt
#RUN --mount=type=ssh ssh-add -L && bundle install


#RUN export GIT_SSL_NO_VERIFY=1 && cd / && git clone https://gitlab.limos.fr/frdelobe/tagada_abstractor.git
#RUN cd / && cd tagada_abstractor
#RUN cd / && cargo build --release



RUN gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN cd /CASCADA && python3.10 setup.py install
RUN apt install -y cm-super
RUN apt install -y vim && apt install -y dvipng

RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:rael-gc/rvm
RUN apt-get update
RUN apt-get install -y rvm

## Installing Matplotlib
#RUN wget http://www.qhull.org/download/qhull-2020-src-8.0.2.tgz \
#    && tar -xf rel-3.0.0.tar.gz \
#    && rm rel-3.0.0.tar.gz
#
#RUN cd kissat-rel-3.0.0/ \
#    && ./configure \
#    && cd build/ \
#    && make

ENV GUROBI_HOME="/gurobi/gurobi1000/linux64/"
ENV PATH="$GUROBI_HOME/bin:$PATH"
ENV GRB_LICENSE_FILE="/gurobi/gurobi.lic"
ENV LD_LIBRARY_PATH="/gurobi/gurobi1000/linux64/lib:$LD_LIBRARY_PATH"

WORKDIR "/home/sage/docker_claasp_white_paper_experiments"
CMD ["/bin/bash"]
