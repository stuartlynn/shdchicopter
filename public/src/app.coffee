$ ->
  alert("running")
  _RATIO = 0.5
  dronestream = new NodecopterStream(document.getElementById("oculus-stream"))
  $videoBuffer = $('#oculus-stream canvas')
  videoBuffer = $videoBuffer[0]
  # videoCtx = video.getContext '2d' # not working as it's experimental-webgl
  $video1 = $videoBuffer.clone().appendTo('#oculus-left').attr('id', 'oculus-stream-left')
  $video2 = $videoBuffer.clone().appendTo('#oculus-right').attr('id', 'oculus-stream-right')
  video1 = $video1[0]
  video1Ctx = video1.getContext '2d'
  video2 = $video2[0]
  video2Ctx = video2.getContext '2d'
  
  processFrame = ->
    requestAnimationFrame(processFrame)
    
    # copy video to buffer for read/write on 2d context
    video1.width = video1.width
    video1Ctx.drawImage(videoBuffer, 0, 0, videoBuffer.width, videoBuffer.height)
    video2.width = video2.width
    video2Ctx.drawImage(videoBuffer, 0, 0, videoBuffer.width, videoBuffer.height)
    
  processFrame()
