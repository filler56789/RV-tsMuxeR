BUILD=

ifeq ($(MAKECMDGOALS),debug) 
    BUILD=
endif 
ifeq ($(MAKECMDGOALS),release) 
    BUILD=-Os
endif 

DIRS=./app
CC=g++

ifdef OS
   DEFINES  = -DWIN32 -DLIBMEDIATION_API=  -DDISABLE_LOG_SUPPORT
   TARGET   = ./app/tsMuxeR.exe

      INCPATH  = -I./libmediation -I./freetype2-10-0/include
      LDFLAGS  = -lpthread -lwinmm -lgdi32 -lgdiplus -static
      CFLAGS   = -c -fpic -fexceptions -fpermissive
      LFLAGS   = 

   SOURCES= ./muxer/aac.cpp ./muxer/aacStreamReader.cpp ./muxer/AbstractDemuxer.cpp ./muxer/abstractMuxer.cpp ./muxer/ac3Codec.cpp ./muxer/ac3StreamReader.cpp \
./muxer/avCodecs.cpp ./muxer/base64.cpp ./muxer/bitStream.cpp ./muxer/blurayHelper.cpp ./muxer/bufferedFileReader.cpp ./muxer/bufferedFileWriter.cpp \
./muxer/bufferedReader.cpp ./muxer/bufferedReaderManager.cpp  ./muxer/convertUTF.cpp ./muxer/crc.cpp ./muxer/dtsStreamReader.cpp ./muxer/vc1StreamReader.cpp \
./muxer/dvbSubStreamReader.cpp ./muxer/h264StreamReader.cpp ./muxer/ioContextDemuxer.cpp ./muxer/iso_writer.cpp ./muxer/vod_common.cpp \
./muxer/lpcmStreamReader.cpp ./muxer/main.cpp ./muxer/matroskaDemuxer.cpp ./muxer/matroskaParser.cpp ./muxer/metaDemuxer.cpp ./muxer/hevcStreamReader.cpp ./muxer/hevc.cpp \
./muxer/movDemuxer.cpp ./muxer/mp3Codec.cpp ./muxer/mpeg2StreamReader.cpp ./muxer/mpegAudioStreamReader.cpp ./muxer/mpegStreamReader.cpp ./muxer/mpegVideo.cpp \
./muxer/muxerManager.cpp ./muxer/nalUnits.cpp ./muxer/pesPacket.cpp ./muxer/programStreamDemuxer.cpp ./muxer/psgStreamReader.cpp ./muxer/wave.cpp \
./muxer/simplePacketizerReader.cpp ./muxer/singleFileMuxer.cpp ./muxer/srtStreamReader.cpp ./muxer/stdafx.cpp ./muxer/textSubtitles.cpp ./muxer/textSubtitlesRender.cpp \
./muxer/osdep/textSubtitlesRenderWin32.cpp  ./muxer/tsDemuxer.cpp ./muxer/tsMuxer.cpp ./muxer/tsPacket.cpp ./muxer/utf8Converter.cpp ./muxer/vc1Parser.cpp ./muxer/combinedH264Demuxer.cpp

else
   DEFINES  = -DLINUX -DLIBMEDIATION_API=  -DDISABLE_LOG_SUPPORT
   TARGET   = ./app/tsMuxeR
     INCPATH  = -I./libmediation -I./freetype2-10-0/include
	 LDFLAGS  = -lpthread -lrt -static
	 CFLAGS   = -c -fpic -fexceptions -fpermissive
	 LFLAGS   =
   
   SOURCES= ./muxer/aac.cpp ./muxer/aacStreamReader.cpp ./muxer/AbstractDemuxer.cpp ./muxer/abstractMuxer.cpp ./muxer/ac3Codec.cpp ./muxer/ac3StreamReader.cpp \
./muxer/avCodecs.cpp ./muxer/base64.cpp ./muxer/bitStream.cpp ./muxer/blurayHelper.cpp ./muxer/bufferedFileReader.cpp ./muxer/bufferedFileWriter.cpp \
./muxer/bufferedReader.cpp ./muxer/bufferedReaderManager.cpp  ./muxer/convertUTF.cpp ./muxer/crc.cpp ./muxer/dtsStreamReader.cpp ./muxer/vc1StreamReader.cpp \
./muxer/dvbSubStreamReader.cpp ./muxer/h264StreamReader.cpp ./muxer/ioContextDemuxer.cpp ./muxer/iso_writer.cpp ./muxer/vod_common.cpp \
./muxer/lpcmStreamReader.cpp ./muxer/main.cpp ./muxer/matroskaDemuxer.cpp ./muxer/matroskaParser.cpp ./muxer/metaDemuxer.cpp ./muxer/hevcStreamReader.cpp ./muxer/hevc.cpp \
./muxer/movDemuxer.cpp ./muxer/mp3Codec.cpp ./muxer/mpeg2StreamReader.cpp ./muxer/mpegAudioStreamReader.cpp ./muxer/mpegStreamReader.cpp ./muxer/mpegVideo.cpp \
./muxer/muxerManager.cpp ./muxer/nalUnits.cpp ./muxer/pesPacket.cpp ./muxer/programStreamDemuxer.cpp ./muxer/psgStreamReader.cpp ./muxer/wave.cpp \
./muxer/simplePacketizerReader.cpp ./muxer/singleFileMuxer.cpp ./muxer/srtStreamReader.cpp ./muxer/stdafx.cpp ./muxer/textSubtitles.cpp ./muxer/textSubtitlesRender.cpp \
./muxer/osdep/textSubtitlesRenderFT.cpp  ./muxer/tsDemuxer.cpp ./muxer/tsMuxer.cpp ./muxer/tsPacket.cpp ./muxer/utf8Converter.cpp ./muxer/vc1Parser.cpp ./muxer/combinedH264Demuxer.cpp
endif

STATIC_LIBS = ./libmediation/libmediationl.a ./freetype2-10-0/objs/.libs/libfreetype.a ./zlib1-2-11/zlib/libzlibstatic.a

OBJECTS=$(SOURCES:.cpp=.o)

$(shell mkdir -p $(DIRS))

all: $(SOURCES) $(TARGET)
.PHONY : debug release 
debug: all 
release: all

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) $(STATIC_LIBS) $(LDFLAGS) -o $@
        
.cpp.o: 
	$(CC) $(DEFINES) $(BUILD) $(LFLAGS) $(CFLAGS)  $(INCPATH) $(BUILD) $? -o $@

clean:
	rm -f $(OBJECTS)
	rm -f ./tsMuxeR*
	rm -f $(TARGET)
	
install:
	echo "TSMUXER DOES NOT NEED TO BE INSTALLED!"