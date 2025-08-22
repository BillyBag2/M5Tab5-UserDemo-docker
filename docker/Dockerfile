
# https://github.com/espressif/esp-idf
# https://hub.docker.com/r/espressif/idf
# https://docs.espressif.com/projects/esp-idf/en/stable/esp32/api-guides/tools/idf-docker-image.html

FROM espressif/idf:release-v5.4

RUN mkdir -p /demo
WORKDIR /demo
RUN git clone -b V0.1 https://github.com/m5stack/M5Tab5-UserDemo.git
WORKDIR /demo/M5Tab5-UserDemo
RUN python ./fetch_repos.py
WORKDIR /demo/M5Tab5-UserDemo/platforms/tab5

SHELL ["/bin/bash","-lc"]
# Auto-source for non-login shells opened later
RUN echo 'source /opt/esp/idf/export.sh > /dev/null 2>&1' >> /etc/profile.d/esp-idf.sh
# Keep Espressif’s entrypoint
ENTRYPOINT ["/opt/esp/entrypoint.sh"]
CMD ["/bin/bash"]

RUN idf.py build
WORKDIR /demo/M5Tab5-UserDemo/platforms/tab5/build
RUN esptool.py --chip esp32p4 merge_bin -o merged-tab5.bin @flash_args
