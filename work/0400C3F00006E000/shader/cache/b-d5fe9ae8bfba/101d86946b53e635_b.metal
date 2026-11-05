#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_63 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_48 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_67 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2944 = false;
    bool _634 = false;
    bool _498 = false;
    bool _324 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3261 = as_type<float>(_134);
        out.gl_Position.z = _3261;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3316 = as_type<float>(_160);
        out.gl_Position.z = _3316;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _148;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _196 = _190;
    float _214;
    if (!_192)
    {
        float _198 = in.m_57.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        _214 = _172;
    }
    _216 = false;
    float _218 = _214;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _218 + _220;
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    bool _240 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _242 = isnan(_218);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -_234;
    float _254 = _252 + 1.0;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    float _260 = 1.0 / _238;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = _250 * _254;
    float _266 = -_250;
    float _268 = _266 + 1.0;
    float _270 = _222 * _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _284 = _276 * _264;
    float _286 = fma(_280, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = _282 * _264;
    float _290 = _286 * _264;
    float _292 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _294 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _290);
    float _296 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _298 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].x, _292);
    float _300 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].y, _294);
    float _302 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].z, _296);
    bool _304 = !_262;
    float _322;
    if (!_304)
    {
        float _306 = in.m_57.x;
        float _308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _310 = _306 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _314 = _312 * _308;
        float _316 = floor(_314);
        float _318 = -_316;
        float _320 = _314 + _318;
        _322 = _320;
        _324 = true;
    }
    else
    {
        _322 = _172;
    }
    _324 = false;
    float _326 = _322;
    float _328 = in.m_59.x;
    float _330 = in.m_59.y;
    float _332 = in.m_59.z;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _336 = _326 + _334;
    bool _338 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _340 = isnan(_326);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _358 = 1.0 / _352;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = 1.0 / _356;
    float _364 = _300 * _330;
    float _366 = _302 * _332;
    bool _368 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _370 = isnan(_326);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -_348;
    float _382 = _380 + 1.0;
    float _384 = _336 * _358;
    bool _386 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _388 = isnan(_326);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _400 = _326 + _398;
    float _402 = _378 * _382;
    float _404 = -_378;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _416;
    float _420 = _396 * _406;
    float _422 = fma(_410, _384, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _424 = fma(_414, _384, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _426 = fma(_418, _384, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _428 = _400 * _362;
    float _430 = _422 * _420;
    float _432 = _424 * _420;
    float _434 = _426 * _420;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _444 = -_396;
    float _446 = _444 + 1.0;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _452 = fma(_438, _428, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _454 = fma(_442, _428, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _456 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].x, _430);
    float _458 = fma(_450, _428, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _460 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].y, _432);
    float _462 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].z, _434);
    float _464 = fma(_452, _402, _456);
    float _466 = _298 * _328;
    float _468 = fma(_454, _402, _460);
    float _470 = fma(_458, _402, _462);
    float _472 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].x, _464);
    float _474 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].y, _468);
    float _476 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].z, _470);
    bool _478 = !_360;
    float _496;
    if (!_478)
    {
        float _480 = in.m_57.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        _496 = _172;
    }
    _498 = false;
    float _500 = _496;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _504 = _500 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _510 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _512 = isnan(_500);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _528 = isnan(_500);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _538;
    bool _542 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _544 = isnan(_500);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = 1.0 / _508;
    float _556 = -_520;
    float _558 = _556 + 1.0;
    bool _560 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _562 = 1.0 / _524;
    float _564 = _540 * _554;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _570 = -_552;
    float _572 = _570 + 1.0;
    float _574 = fma(_564, _504, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _576 = _536 * _558;
    float _578 = -_536;
    float _580 = _578 + 1.0;
    float _582 = _520 * _572;
    float _584 = _568 * _562;
    float _586 = _574 * _576;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _590 = _500 + _588;
    float _592 = _472 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _594 = _476 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _596 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _598 = fma(_584, _590, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _600 = _474 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _602 = fma(_598, _582, _596);
    float _604 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[117].x, _602);
    float _610 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _604;
    out.m_61.y = _606;
    out.m_61.z = _610;
    out.m_61.w = _612;
    bool _614 = !_560;
    float _632;
    if (!_614)
    {
        float _616 = in.m_57.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        _632 = _172;
    }
    _634 = false;
    float _636 = _632;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _640 = _636 + _638;
    bool _642 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _644 = isnan(_636);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _654;
    bool _658 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _660 = isnan(_636);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -_652;
    float _672 = _670 + 1.0;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _674;
    float _678 = 1.0 / _656;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _682 = _668 * _672;
    float _684 = -_668;
    float _686 = _684 + 1.0;
    float _688 = _640 * _678;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _690;
    float _694 = fma(_676, _688, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _696;
    float _700 = fma(_692, _688, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _702 = _694 * _682;
    float _704 = fma(_698, _688, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _706 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].x, _702);
    float _708 = _704 * _682;
    float _710 = _700 * _682;
    float _712 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].x, _706);
    float _714 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].y, _708);
    float _716 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].z, _710);
    float _718 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].y, _714);
    float _720 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].z, _716);
    bool _722 = !_680;
    if (!_722)
    {
        float _724 = in.m_57.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _194 = _738;
    }
    float _740 = _194;
    float _742 = in.m_57.z;
    float _744 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _746 = log2(_744);
    float _748 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _750 = in.m_57.x;
    float _752 = in.m_57.y;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _756 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _758 = int(_756);
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _764 = 1.0 + _762;
    float _766 = 1.0 / _764;
    float _768 = _742 * 2.0;
    float _770 = _750 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _772 = _750 * 2.0;
    float _774 = floor(_768);
    float _776 = _752 * 2.0;
    float _778 = -_754;
    float _780 = fma(_770, 2.0, _778);
    float _782 = _746 * _116;
    float _784 = _752 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _786 = _752 + _750;
    float _788 = -_116;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[76].x, _780);
    float _792 = floor(_772);
    float _794 = fma(_784, -2.0, _760);
    float _796 = _786 + (-1.0);
    float _798 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _794);
    float _800 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _802 = _774 >= 0.0;
    bool _804 = isnan(_774);
    bool _806 = _802 || _804;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    float _812 = exp2(_782);
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _816 = _814 != 0;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _820 = _818 != 0;
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _824 = _822 != 0;
    int _826 = _810 ? 0 : 1;
    bool _828 = _792 > 0.0;
    float _830 = floor(_776);
    bool _832 = !_820;
    int _834 = _832 ? 0 : 1;
    bool _836 = _774 > 0.0;
    bool _838 = _792 >= 0.0;
    bool _840 = isnan(_792);
    bool _842 = _838 || _840;
    bool _844 = isnan(0.0);
    bool _846 = _842 || _844;
    int _848 = ~_826;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = -_812;
    float _856 = _854 + 1.0;
    bool _858 = !_816;
    int _860 = _858 ? 0 : 1;
    bool _862 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _864 = isnan(0.0);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _870 = _866 || _868;
    float _872 = float(_758);
    bool _874 = !_824;
    int _876 = _874 ? 0 : 1;
    float _878 = in.m_63.x;
    float _880 = in.m_63.y;
    float _882 = in.m_63.z;
    int _884 = _852;
    if (!_836)
    {
        int _886 = ~_826;
        int _888 = _886 + 1;
        _884 = _888;
    }
    int _890 = _884;
    float _892 = 1.0 / _872;
    bool _894 = _830 > 0.0;
    bool _896 = _830 >= 0.0;
    bool _898 = isnan(_830);
    bool _900 = _896 || _898;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    float _906 = _870 ? _856 : 0.0;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _920 = _918 != 0;
    float _922 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _924 = int(_922);
    float _926 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[78].w, _908);
    int _928 = _846 ? 0 : 1;
    bool _930 = !_912;
    int _932 = _930 ? 0 : 1;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _936 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _938 = isnan(1.0);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _944 = _940 || _942;
    float _946 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _926);
    int _948 = abs(_932);
    float _950 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[78].z, _934);
    float _952 = float(_890);
    float _954 = _892 * _116;
    float _956 = float(_948);
    float _958 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _950);
    bool _960 = !_916;
    int _962 = _960 ? 0 : 1;
    float _964 = float(_924);
    float _966 = _956 * _952;
    int _968 = ~_928;
    int _970 = _968 + 1;
    int _972 = _970 + 1;
    float _974 = _750 + (-0.5);
    int _976 = _972;
    if (!_828)
    {
        int _978 = ~_928;
        int _980 = _978 + 1;
        _976 = _980;
    }
    int _982 = _976;
    float _984 = _964 * _116;
    if (_944)
    {
        float _986 = _906 * _766;
        _126 = _986;
    }
    float _988 = _126;
    int _990 = abs(_962);
    float _992 = _966 * (-2.0);
    int _994 = _904 ? 0 : 1;
    float _996 = fma(_992, _878, _878);
    float _998 = float(_982);
    float _1000 = fma(_800, _992, _800);
    float _1002 = float(_990);
    float _1004 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[196].x, _996);
    bool _1006 = !_920;
    int _1008 = _1006 ? 0 : 1;
    int _1010 = ~_994;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    float _1016 = _1002 * _998;
    int _1018 = _1014;
    if (!_894)
    {
        int _1020 = ~_994;
        int _1022 = _1020 + 1;
        _1018 = _1022;
    }
    int _1024 = _1018;
    float _1026 = _752 + _742;
    int _1028 = abs(_1008);
    float _1030 = fma(_1000, _988, _1004);
    float _1032 = _1026 + (-1.0);
    float _1034 = float(_1024);
    float _1036 = _1016 * (-2.0);
    float _1038 = float(_1028);
    float _1040 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1042 = _742 + _750;
    float _1044 = fma(_1036, _880, _880);
    float _1046 = _1038 * _1034;
    float _1048 = _752 + (-0.5);
    float _1050 = _1042 + (-1.0);
    float _1052 = fma(_1040, _1036, _1040);
    float _1054 = _742 + (-0.5);
    float _1056 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1044);
    float _1058 = _1046 * (-2.0);
    float _1060 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1062 = _1030 * 0.15915493667125701904296875;
    float _1064 = fma(_1052, _988, _1056);
    float _1066 = fma(_1058, _882, _882);
    float _1068 = in.m_65.x;
    float _1070 = in.m_65.y;
    float _1072 = in.m_65.z;
    float _1074 = fma(_1060, _1058, _1060);
    float _1076 = _1064 * 0.15915493667125701904296875;
    float _1078 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1066);
    float _1080 = _1062 * 6.283185482025146484375;
    float _1082 = cos(_1080);
    float _1084 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1086 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1088 = fma(_1074, _988, _1078);
    float _1090 = in.m_46.x;
    float _1092 = in.m_46.y;
    float _1094 = in.m_46.z;
    float _1096 = _1088 * 0.15915493667125701904296875;
    float _1098 = _1076 * 6.283185482025146484375;
    float _1100 = sin(_1098);
    float _1102 = _1076 * 6.283185482025146484375;
    float _1104 = cos(_1102);
    float _1106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1072);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1068);
    float _1110 = _1062 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = _1086 * _1106;
    float _1116 = _748 * _1108;
    float _1118 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1120 = _1096 * 6.283185482025146484375;
    float _1122 = cos(_1120);
    float _1124 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1070);
    float _1126 = _1082 * _1104;
    float _1128 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1118);
    float _1130 = _1084 * _1124;
    float _1132 = _1082 * _1100;
    float _1134 = _1096 * 6.283185482025146484375;
    float _1136 = sin(_1134);
    float _1138 = _1112 * _1100;
    float _1140 = _1112 * _1104;
    float _1142 = _1082 * _1122;
    float _1144 = _1112 * _1122;
    float _1146 = _1104 * _1122;
    float _1148 = _1100 * _1122;
    float _1150 = _1142 * _1130;
    float _1152 = _1144 * _1130;
    float _1154 = fma(_1136, _1126, _1138);
    float _1156 = -_1132;
    float _1158 = fma(_1136, _1140, _1156);
    float _1160 = -_1140;
    float _1162 = fma(_1136, _1132, _1160);
    float _1164 = -_1130;
    float _1166 = _1136 * _1164;
    float _1168 = fma(_1154, _1116, _1150);
    float _1170 = fma(_1136, _1138, _1126);
    float _1172 = fma(_1158, _1116, _1152);
    float _1174 = fma(_1146, _1116, _1166);
    float _1176 = fma(_1162, _1114, _1168);
    float _1178 = fma(_1094, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1128);
    float _1180 = fma(_1148, _1114, _1174);
    float _1182 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1184 = fma(_1170, _1114, _1172);
    float _1186 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1188 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1190 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1182);
    float _1192 = _1178 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1194 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1186);
    float _1196 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1188);
    float _1198 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1190);
    float _1200 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1202 = fma(_1094, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1194);
    float _1204 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1196);
    float _1206 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1208 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1200);
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1214 = _1192 + _1206;
    float _1216 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1218 = fma(_1094, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1208);
    float _1220 = _1210 + _1212;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1224 = _1214 + _1222;
    float _1226 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1216);
    float _1228 = _1218 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1232 = _1220 + _1230;
    float _1234 = _1224 * _1224;
    float _1236 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1226);
    float _1238 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1240 = fma(_1232, _1232, _1234);
    float _1242 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1244 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1238);
    float _1246 = sqrt(_1240);
    float _1248 = _1228 + _1242;
    float _1250 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1244);
    bool _1252 = _1246 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = _1244;
    float _1256 = _1176;
    float _1258 = _1242;
    float _1260 = _1248;
    float _1262 = _1228;
    if (!_1252)
    {
        _1254 = _1220;
    }
    float _1264 = _1254;
    float _1266 = _1264;
    if (!_1252)
    {
        _1256 = _1214;
    }
    float _1268 = _1256;
    float _1270 = _1268;
    if (!_1252)
    {
        _1258 = _1248;
    }
    float _1272 = _1258;
    bool _1274 = !_1252;
    float _1276 = _1272;
    if (!_1274)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1282 = _1246 + _1280;
        float _1284 = rsqrt(_1240);
        float _1286 = _1282 * _1278;
        float _1288 = _1248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1290 = _1286 * 0.15915493667125701904296875;
        float _1292 = _1290 * 6.283185482025146484375;
        float _1294 = cos(_1292);
        float _1296 = _1290 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        float _1300 = _1294 + (-1.0);
        float _1302 = fma(_1298, _1288, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1304 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1306 = _1284 * _1302;
        float _1308 = fma(_1248, _1294, _1304);
        float _1310 = fma(_1232, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1312 = fma(_1224, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1276 = _1308;
        _1266 = _1310;
        _1270 = _1312;
    }
    float _1314 = _1276;
    float _1316 = _1266;
    float _1318 = _1270;
    float _1320 = -_1228;
    float _1322 = _1320 + _1314;
    float _1324 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1326 = -_1210;
    float _1328 = _1326 + _1316;
    float _1330 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1332 = _1322 * _1322;
    float _1334 = -_1192;
    float _1336 = _1334 + _1318;
    float _1338 = 1.0 / _1324;
    float _1340 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1330);
    float _1342 = fma(_1328, _1328, _1332);
    float _1344 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1340);
    float _1346 = fma(_1336, _1336, _1342);
    bool _1348 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1350 = isnan(0.5);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1356 = _1352 || _1354;
    float _1358 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1360 = sqrt(_1346);
    bool _1362 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1364 = isnan(0.5);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1370 = _1366 || _1368;
    float _1372 = _1358 + _1324;
    float _1374 = _1372 * _1338;
    float _1376 = _1374 * 0.5;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1380 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1378);
    bool _1382 = _1360 > 0.0;
    float _1384 = 1.0 / _1380;
    float _1386 = _1338;
    float _1388 = _1360;
    float _1390 = _1316;
    float _1392 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1394 = _1314;
    float _1396 = _1318;
    if (!_1382)
    {
        _1386 = _1314;
    }
    float _1398 = _1386;
    float _1400 = _1398;
    if (!_1382)
    {
        _1388 = _1318;
    }
    float _1402 = _1388;
    bool _1404 = !_1382;
    float _1406 = _1402;
    if (!_1404)
    {
        float _1408 = _188 * _188;
        float _1410 = fma(_186, _186, _1408);
        float _1412 = fma(_190, _190, _1410);
        float _1414 = rsqrt(_1346);
        float _1416 = sqrt(_1412);
        float _1418 = _1328 * _1414;
        float _1420 = _1322 * _1414;
        float _1422 = _1336 * _1414;
        bool _1424 = _1416 > 0.0;
        float _1426 = _1416;
        float _1428 = _1414;
        _1392 = _1412;
        _1260 = _1418;
        if (!_1424)
        {
            _1426 = _1314;
        }
        float _1430 = _1426;
        _1400 = _1430;
        if (!_1424)
        {
            _1428 = _1318;
        }
        float _1432 = _1428;
        bool _1434 = !_1424;
        _1406 = _1432;
        if (!_1434)
        {
            float _1436 = rsqrt(_1412);
            float _1438 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1440 = _188 * _1436;
            float _1442 = _186 * _1436;
            float _1444 = _1420 * _1440;
            float _1446 = _190 * _1436;
            float _1448 = fma(_1418, _1442, _1444);
            float _1450 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1452 = fma(_1422, _1446, _1448);
            float _1454 = _1452 * _1450;
            float _1456 = fma(_186, _1454, _1316);
            float _1458 = fma(_188, _1454, _1314);
            float _1460 = fma(_190, _1454, _1318);
            _1390 = _1456;
            _1400 = _1458;
            _1406 = _1460;
            _1392 = _1436;
        }
    }
    float _1462 = _1390;
    float _1464 = _1400;
    float _1466 = _1406;
    float _1468 = _1392;
    float _1470 = _1260;
    float _1472 = _1466;
    float _1474 = _1470;
    if (_1370)
    {
        _1394 = 1.0;
    }
    float _1476 = _1394;
    float _1478 = _1476;
    if (_1356)
    {
        _1396 = _1462;
    }
    float _1480 = _1396;
    float _1482 = _1480;
    if (_1356)
    {
        _196 = _1464;
    }
    float _1484 = _196;
    float _1486 = _1484;
    if (!_1356)
    {
        float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1490 = _1228 + _1488;
        float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1494 = _1210 + _1492;
        float _1496 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1498 = -_1228;
        float _1500 = _1498 + _1464;
        float _1502 = _1490 * _1490;
        float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1506 = _1192 + _1504;
        float _1508 = -_1210;
        float _1510 = _1508 + _1462;
        float _1512 = -_1192;
        float _1514 = _1512 + _1466;
        float _1516 = fma(_1494, _1494, _1502);
        float _1518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1520 = fma(_1506, _1506, _1516);
        float _1522 = sqrt(_1520);
        float _1524 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1526 = precise::min(_1522, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1528 = _1526 * _1518;
        float _1530 = _1524 * _1528;
        float _1532 = fma(_1500, _1530, _1228);
        float _1534 = fma(_1510, _1530, _1210);
        float _1536 = fma(_1514, _1530, _1192);
        _1486 = _1532;
        _1482 = _1534;
        _1472 = _1536;
    }
    float _1538 = _1486;
    float _1540 = _1482;
    float _1542 = _1472;
    if (_1370)
    {
        _1262 = 1.0;
    }
    float _1544 = _1262;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1548 = _1384 * _1546;
    float _1550 = _1544;
    if (!_1370)
    {
        float _1552 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1554 = _1552 * 0.15915493667125701904296875;
        float _1556 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1558 = _1554 * 6.283185482025146484375;
        float _1560 = cos(_1558);
        float _1562 = _1556 * 0.15915493667125701904296875;
        float _1564 = _1554 * 6.283185482025146484375;
        float _1566 = sin(_1564);
        float _1568 = 1.0 / _1560;
        float _1570 = _1562 * 6.283185482025146484375;
        float _1572 = cos(_1570);
        float _1574 = _1566 * _1568;
        float _1576 = _1562 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = _1572 * _1574;
        float _1582 = 1.0 / _1580;
        float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1586 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1584;
        float _1588 = 1.0 / _1586;
        float _1590 = _1578 * _1582;
        float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1594 = fma(_1548, _1590, _1592);
        float _1596 = _1594 * _1588;
        float _1598 = precise::clamp(_1596, 0.0, 1.0);
        _1478 = _1598;
    }
    float _1600 = _1478;
    if (!_1370)
    {
        float _1602 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1604 = _1602 * 0.15915493667125701904296875;
        float _1606 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1608 = _1604 * 6.283185482025146484375;
        float _1610 = cos(_1608);
        float _1612 = _1606 * 0.15915493667125701904296875;
        float _1614 = _1604 * 6.283185482025146484375;
        float _1616 = sin(_1614);
        float _1618 = 1.0 / _1610;
        float _1620 = _1612 * 6.283185482025146484375;
        float _1622 = cos(_1620);
        float _1624 = _1616 * _1618;
        float _1626 = _1612 * 6.283185482025146484375;
        float _1628 = sin(_1626);
        float _1630 = _1622 * _1624;
        float _1632 = 1.0 / _1630;
        float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1636 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1634;
        float _1638 = 1.0 / _1636;
        float _1640 = _1628 * _1632;
        float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1644 = fma(_1548, _1640, _1642);
        float _1646 = _1644 * _1638;
        float _1648 = precise::clamp(_1646, 0.0, 1.0);
        float _1650 = -_1648;
        float _1652 = _1650 + 1.0;
        _1550 = _1652;
    }
    float _1654 = _1550;
    float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1658 = _1538 + _1656;
    float _1660 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1662 = _1540 + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1666 = _1542 + _1664;
    float _1668 = _1658 * _1658;
    float _1670 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1672 = fma(_1662, _1662, _1668);
    float _1674 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1676 = fma(_1210, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1678 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1680 = fma(_1666, _1666, _1672);
    float _1682 = precise::max(0.0, _1674);
    float _1684 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1678);
    float _1686 = rsqrt(_1680);
    float _1688 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1670);
    float _1690 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1684);
    float _1692 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1694 = sqrt(_1680);
    float _1696 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1698 = _1662 * _1696;
    float _1700 = _1666 * _1696;
    float _1702 = -_1696;
    float _1704 = -_1682;
    float _1706 = fma(_1658, _1702, _1704);
    float _1708 = _1698 * _1698;
    float _1710 = _1700 * _1700;
    float _1712 = _1708 + _1710;
    float _1714 = sqrt(_1712);
    bool _1716 = _1714 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1720 = _1714 + _1718;
    float _1722 = _1468;
    float _1724 = _1682;
    float _1726 = _1712;
    float _1728 = _1720;
    float _1730 = _1658;
    float _1732 = _1698;
    float _1734 = _1700;
    float _1736 = _1708;
    float _1738 = _1710;
    if (_1716)
    {
        float _1740 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1722 = _1740;
    }
    float _1742 = _1722;
    if (_1716)
    {
        float _1744 = _1706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1724 = _1744;
    }
    float _1746 = _1724;
    if (_1716)
    {
        float _1748 = rsqrt(_1712);
        _1726 = _1748;
    }
    float _1750 = _1726;
    if (_1716)
    {
        float _1752 = _1720 * _1742;
        _1728 = _1752;
    }
    float _1754 = _1728;
    if (_1716)
    {
        float _1756 = _1754 * 0.15915493667125701904296875;
        _1474 = _1756;
    }
    float _1758 = _1474;
    float _1760 = _1742;
    float _1762 = _1758;
    if (_1716)
    {
        float _1764 = _1758 * 6.283185482025146484375;
        float _1766 = sin(_1764);
        _1760 = _1766;
    }
    float _1768 = _1760;
    float _1770 = _1754;
    if (_1716)
    {
        float _1772 = _1758 * 6.283185482025146484375;
        float _1774 = cos(_1772);
        _1770 = _1774;
    }
    float _1776 = _1770;
    float _1778 = _1768;
    if (_1716)
    {
        float _1780 = fma(_1768, _1746, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1730 = _1780;
    }
    float _1782 = _1730;
    float _1784 = floor(_1676);
    float _1786 = _1782;
    if (_1716)
    {
        float _1788 = _1750 * _1782;
        _1762 = _1788;
    }
    float _1790 = _1762;
    if (!_1716)
    {
        _1786 = _1706;
    }
    float _1792 = _1786;
    float _1794 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1796 = _1792;
    if (_1716)
    {
        float _1798 = _1776 + (-1.0);
        _1778 = _1798;
    }
    float _1800 = _1778;
    float _1802 = _1800;
    if (_1716)
    {
        float _1804 = _1698 * _1790;
        _1732 = _1804;
    }
    float _1806 = _1732;
    if (_1716)
    {
        float _1808 = _1700 * _1790;
        _1734 = _1808;
    }
    float _1810 = _1734;
    if (_1716)
    {
        float _1812 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1802 = _1812;
    }
    float _1814 = _1802;
    if (_1716)
    {
        float _1816 = _1806 * _1806;
        _1736 = _1816;
    }
    float _1818 = _1736;
    if (_1716)
    {
        float _1820 = _1810 * _1810;
        _1738 = _1820;
    }
    float _1822 = _1738;
    if (_1716)
    {
        float _1824 = fma(_1706, _1776, _1814);
        _1796 = _1824;
    }
    float _1826 = _1796;
    float _1828 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1830 = fma(_1826, _1826, _1818);
    float _1832 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1828);
    float _1834 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1794);
    float _1836 = _1830 + _1822;
    float _1838 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1832);
    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1842 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1840);
    float _1844 = precise::clamp(_1842, 0.0, 1.0);
    float _1846 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1834);
    float _1848 = rsqrt(_1836);
    float _1850 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1852 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1854 = -_1844;
    float _1856 = _1854 + 1.0;
    float _1858 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1860 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1862 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1688);
    float _1864 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1866 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1868 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1860);
    float _1870 = abs(_1856);
    float _1872 = log2(_1870);
    float _1874 = -_1864;
    float _1876 = fma(_1874, _1850, 1.0);
    float _1878 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1880 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1868);
    float _1882 = -_1784;
    float _1884 = _1676 + _1882;
    float _1886 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1888 = _1848 * _1806;
    float _1890 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1880);
    float _1892 = _1848 * _1826;
    float _1894 = _1848 * _1810;
    float _1896 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1898 = floor(_1866);
    float _1900 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1902 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1886);
    float _1904 = -_1896;
    float _1906 = fma(_1892, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1904);
    float _1908 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1910 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1902);
    float _1912 = -_1894;
    float _1914 = fma(_1912, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1906);
    float _1916 = log2(_1876);
    float _1918 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1910);
    float _1920 = fma(_1914, -0.5, 0.5);
    float _1922 = fma(_1914, 0.5, 0.5);
    float _1924 = exp2(_1908);
    float _1926 = -_1898;
    float _1928 = _1866 + _1926;
    float _1930 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1900);
    float _1932 = fma(_1922, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1934 = _1892 + 1.0;
    float _1936 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1930);
    float _1938 = fma(_1922, _1932, -0.212114393711090087890625);
    float _1940 = 1.0 / _1890;
    float _1942 = _1916 * 0.693147182464599609375;
    float _1944 = fma(_1922, _1938, 1.570728778839111328125);
    float _1946 = sqrt(_1920);
    float _1948 = -_1892;
    float _1950 = fma(_1924, _1934, _1948);
    float _1952 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1936);
    float _1954 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1956 = _1952 * _1940;
    float _1958 = _1918 * _1940;
    float _1960 = _1946 * 0.636619746685028076171875;
    float _1962 = fma(_1956, 0.5, 0.5);
    float _1964 = fma(_1958, -0.5, 0.5);
    float _1966 = -_1944;
    float _1968 = fma(_1960, _1966, 1.0);
    float _1970 = fma(_1950, 0.5, 0.5);
    float2 _6173 = float2(_1884, _1928);
    float _1972 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6173, float2(0.0), isnan(_6173)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6173, float2(0.0), isnan(_6173)), level(0.0)).x;
    float3 _6184 = float3(_1962, _1964, _1954);
    float _1974 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6184, float3(0.0), isnan(_6184)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6184, float3(0.0), isnan(_6184)), level(0.0)).x;
    float3 _6195 = float3(_1962, _1964, _1954);
    float4 _1977 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6195, float3(0.0), isnan(_6195)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6195, float3(0.0), isnan(_6195)), level(0.0)).xyzw;
    float _1979 = _1977.x;
    float _1981 = _1977.y;
    float _1983 = _1977.z;
    float _1985 = _1977.w;
    float2 _6211 = float2(_1968, _1970);
    float3 _1989 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6211, float2(0.0), isnan(_6211)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6211, float2(0.0), isnan(_6211)), level(0.0)).xyz;
    float _1991 = _1989.x;
    float _1993 = _1989.y;
    float _1995 = _1989.z;
    float _1997 = float(uint(_924));
    float _1999 = trunc(_954);
    int _2001 = int(_1999);
    float _2003 = _984 * _168;
    bool _2005 = _924 == 0;
    float _2007 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2009 = ~_924;
    int _2011 = _2009 + 1;
    int _2013 = _924 + (-1);
    float _2015 = 1.0 / _1997;
    int _2017 = abs(_834);
    int _2019 = abs(_876);
    float _2021 = float(uint(_2001));
    float _2023 = trunc(_2003);
    int _2025 = int(_2023);
    int _2027 = as_type<int>(_2015) + (-2);
    float _2029 = exp2(_2007);
    float _2031 = as_type<float>(_2027) * _2021;
    float _2033 = trunc(_2031);
    float _2035 = precise::max(_2033, 0.0);
    uint _2038 = uint(_2035);
    float _2040 = -_2029;
    float _2042 = _2040 + 1.0;
    int _2044 = _2011 * int(_2038);
    int _2046 = _2044 + _2001;
    float _2048 = float(uint(_2046));
    float _2050 = as_type<float>(_2027) * _2048;
    int _2052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2054 = _2052 != 0;
    float _2056 = trunc(_2050);
    float _2058 = precise::max(_2056, 0.0);
    uint _2060 = uint(_2058);
    int _2062 = ~_924;
    int _2064 = _2062 + 1;
    bool _2066 = !_2054;
    float _2068 = _2066 ? 7.345489978790283203125 : 1.0;
    float _2070 = _2068 * _750;
    float _2072 = floor(_2070);
    int _2074 = int(_2038) + int(_2060);
    float _2076 = float(_2001);
    int _2078 = _2064 * _2074;
    int _2080 = _2078 + _2001;
    bool _2082 = _2076 >= _964;
    bool _2084 = isnan(_2076);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan(_964);
    bool _2090 = _2086 || _2088;
    float _2092 = float(_2090);
    bool _2094 = uint(_2080) >= uint(_924);
    float _2096 = trunc(_2092);
    int _2098 = int(_2096);
    float _2100 = -_2072;
    float _2102 = _2070 + _2100;
    float _2104 = _2102 * _964;
    bool _2106 = !_2094;
    int _2108 = _2106 ? 0 : (-1);
    float _2110 = trunc(_2104);
    int _2112 = int(_2110);
    int _2114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2116 = _2114 != 0;
    int _2118 = ~_2074;
    int _2120 = _2118 + _2108;
    int _2122 = _2120 + 1;
    int _2124 = ~_2098;
    int _2126 = _2124 + 1;
    int _2128 = _2126 + 1;
    int _2130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2132 = _2130 != 0;
    int _2134 = _924 * _2122;
    int _2136 = _2134 + _2001;
    bool _2138 = !_2116;
    int _2140 = _2138 ? 0 : 1;
    int _2142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2144 = _2142 != 0;
    bool _2146 = !_2005;
    int _2148 = _2146 ? _2136 : (-1);
    int _2150 = abs(_2140);
    bool _2152 = !_2144;
    int _2154 = _2152 ? 0 : 1;
    int _2156 = _2148 * _2128;
    int _2158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2160 = _2158 != 0;
    int _2162 = _2112 * _2150;
    int _2164 = _2162 + _2001;
    int _2166 = abs(_2154);
    int _2168 = _2098 * _2013;
    int _2170 = _2168 + _2156;
    int _2172 = abs(_860);
    float _2174 = in.m_67.y;
    int _2176 = ~_924;
    int _2178 = _2176 + 1;
    int _2180 = _2170 * _2017;
    float _2182 = as_type<float>(_2017);
    if (_2132)
    {
        float _2184 = in.m_57.x;
        _2182 = _2184;
    }
    float _2186 = _2182;
    bool _2188 = _752 > 0.5;
    int _2190 = _2025 * _2172;
    int _2192 = _2190 + _2180;
    int _2194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2196 = _2194 != 0;
    float _2198 = in.m_67.x;
    float _2200 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2200;
    int _2204 = _2164 * _2019;
    int _2206 = _2204 + _2192;
    bool _2208 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2210 = isnan(_740);
    bool _2212 = _2208 || _2210;
    bool _2214 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2216 = _2212 || _2214;
    float _2218 = float(_2216);
    int _2220 = _2112 * _2166;
    int _2222 = _2220 + _2206;
    float _2224 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2226 = _2224 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2228 = float(uint(_2222));
    float _2230 = 1.0 / _2226;
    float _2232 = as_type<float>(_2027) * _2228;
    float _2234 = -_2174;
    float _2236 = _2234 + 1.0;
    float _2238 = trunc(_2232);
    float _2240 = precise::max(_2238, 0.0);
    uint _2242 = uint(_2240);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _2244 = _2174;
    float _2246 = _2202;
    if (_2160)
    {
        float _2248 = _2188 ? _2236 : _2174;
        _2244 = _2248;
    }
    float _2250 = _2244;
    bool _2252 = _2186 > 0.5;
    bool _2254 = _2252 && _2132;
    float _2256 = _2186;
    if (_2132)
    {
        _2256 = _2198;
    }
    float _2258 = _2256;
    float _2260 = _2202 * _2230;
    float _2262 = _2258;
    if (!_2132)
    {
        _2246 = _2198;
    }
    float _2264 = _2246;
    float _2266 = float(uint(_2164));
    float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2270 = _740 + _2268;
    bool _2272 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2274 = isnan(_740);
    bool _2276 = _2272 || _2274;
    bool _2278 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2280 = _2276 || _2278;
    float _2282 = float(_2280);
    int _2284 = _2178 * int(_2242);
    int _2286 = _2284 + _2222;
    float _2288 = -_2218;
    float _2290 = _2288 + 1.0;
    float _2292 = as_type<float>(_2027) * _2266;
    float _2294 = fma(_2260, _2270, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2296 = _2264;
    if (_2254)
    {
        float _2298 = -_2258;
        float _2300 = _2298 + 1.0;
        _2262 = _2300;
    }
    float _2302 = _2262;
    float _2304 = float(uint(_2286));
    float _2306 = _2282 * _2290;
    float _2308 = -_2282;
    float _2310 = _2308 + 1.0;
    float _2312 = trunc(_2292);
    float _2314 = precise::max(_2312, 0.0);
    uint _2316 = uint(_2314);
    float _2318 = in.m_71.x;
    float _2320 = in.m_71.y;
    float _2322 = in.m_71.z;
    float _2324 = as_type<float>(_2027) * _2304;
    float _2326 = _2294 * _2306;
    int _2328 = ~_924;
    int _2330 = _2328 + 1;
    if (_2132)
    {
        _2296 = _2302;
    }
    float _2332 = _2296;
    float _2334 = fma(_2250, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2336 = trunc(_2324);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    bool _2342 = _1070 != 0.0;
    bool _2344 = isnan(_1070);
    bool _2346 = _2342 || _2344;
    bool _2348 = isnan(0.0);
    bool _2350 = _2346 || _2348;
    float _2352 = fma(_2310, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2326);
    float _2354 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2356 = -_798;
    float _2358 = fma(_946, _2334, _2356);
    bool _2360 = _1068 == 0.0;
    bool _2362 = !_2350;
    bool _2364 = _2360 && _2362;
    float _2366 = fma(_958, _2354, _790);
    float _2368 = abs(_1548);
    float _2370 = log2(_2368);
    bool _2372 = _1072 == 0.0;
    bool _2374 = _2372 && _2364;
    int _2376 = int(_2242) + int(_2340);
    int _2378 = ~_924;
    int _2380 = _2378 + 1;
    float _2382 = _2320;
    float _2384 = _2318;
    float _2386 = _2322;
    if (!_2374)
    {
        float _2388 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2320);
        _2382 = _2388;
    }
    float _2390 = _2382;
    int _2392 = _2330 * int(_2316);
    int _2394 = _2392 + _2164;
    float _2396 = _2358 + 0.5;
    if (!_2374)
    {
        float _2398 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2318);
        _2384 = _2398;
    }
    float _2400 = _2384;
    float _2402 = _2366 + 0.5;
    if (!_2374)
    {
        float _2404 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2322);
        _2386 = _2404;
    }
    float _2406 = _2386;
    float _2408 = float(uint(_2394));
    int _2410 = _2380 * _2376;
    int _2412 = _2410 + _2222;
    float _2414 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2352);
    float _2416 = _718 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_73.x = _2402;
    out.m_73.y = _2396;
    float _2418 = as_type<float>(_2027) * _2408;
    bool _2420 = uint(_2412) >= uint(_924);
    float _2422 = _712 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2424 = _720 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2426 = ~_924;
    int _2428 = _2426 + 1;
    float _2430 = _2416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2432 = !_2420;
    int _2434 = _2432 ? 0 : (-1);
    float _2436 = trunc(_2418);
    float _2438 = precise::max(_2436, 0.0);
    uint _2440 = uint(_2438);
    float _2442 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2444 = _2424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2446 = ~_2376;
    int _2448 = _2446 + _2434;
    int _2450 = _2448 + 1;
    float _2452 = _2414 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2454 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2456 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2458 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2460 = _924 * _2450;
    int _2462 = _2460 + _2222;
    out.m_75.x = _2442;
    out.m_75.y = _2430;
    out.m_75.z = _2444;
    out.m_75.w = _2452;
    float _2464 = -_1136;
    float _2466 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2456);
    float _2468 = exp2(_2454);
    float _2470 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2472 = !_2005;
    int _2474 = _2472 ? _2462 : (-1);
    float _2476 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2470);
    int _2478 = _2474 >> 31;
    int _2480 = int(_2316) + int(_2440);
    float _2482 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2484 = _2478 & 3;
    float _2486 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2488 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2490 = _2428 * _2480;
    int _2492 = _2490 + _2164;
    int _2494 = _2474 + _2484;
    float _2496 = -_1136;
    float _2498 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2482);
    float _2500 = -_1136;
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2486);
    float _2504 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2506 = _2494 >> 2;
    float _2508 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2498);
    bool _2510 = uint(_2492) >= uint(_924);
    float _2512 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2466);
    int _2514 = _2506 << 4;
    int _2516 = _2514 + 368;
    float _2518 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2502);
    float _2520 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2458);
    float _2522 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _2524 = uint(int(uint(_2516) >> uint(2)));
    uint _2526 = uint(int(uint(int(_2524)) >> uint(2)));
    int _2528 = int(_2524) & 3;
    float _2530 = (*spvDescriptorSet0.vp_c9)._m0[int(_2526)][_2528];
    int _2532 = int(_2524) + 1;
    uint _2534 = uint(int(uint(_2532) >> uint(2)));
    int _2536 = _2532 & 3;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[int(_2534)][_2536];
    float _2540 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2542 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2504);
    float _2544 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2522);
    float _2546 = _2508 * _2390;
    float _2548 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2550 = precise::clamp(_2548, 0.0, 1.0);
    float _2552 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2488);
    float _2554 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2540);
    int _2556 = _2516 + 8;
    uint _2558 = uint(int(uint(_2556) >> uint(2)));
    uint _2560 = uint(int(uint(int(_2558)) >> uint(2)));
    int _2562 = int(_2558) & 3;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[int(_2560)][_2562];
    int _2566 = int(_2558) + 1;
    uint _2568 = uint(int(uint(_2566) >> uint(2)));
    int _2570 = _2566 & 3;
    float _2572 = (*spvDescriptorSet0.vp_c9)._m0[int(_2568)][_2570];
    int _2574 = _2474 & 3;
    bool _2576 = _2574 != 0;
    float _2578 = _2512 * _2390;
    float _2580 = _2518 * _2390;
    float _2582 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2520);
    bool _2584 = uint(_2574) > 1u;
    float _2586 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2542);
    int _2588 = _2474 & 3;
    bool _2590 = _2588 != 0;
    float _2592 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2544);
    float _2594 = fma(_2550, -2.0, 3.0);
    float _2596 = _2550 * _2550;
    int _2598 = _2590 ? 0 : 1;
    float _2600 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2552);
    bool _2602 = _2574 != 3;
    float _2604 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2554);
    float _2606 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2476);
    float _2608 = _2596 * _2594;
    bool _2610 = !_2510;
    int _2612 = _2610 ? 0 : (-1);
    float _2614 = fma(_2582, _2400, _2546);
    bool _2616 = uint(_2574) >= 2u;
    float _2618 = fma(_2592, _2400, _2580);
    int _2620 = ~_2598;
    int _2622 = _2620 + 1;
    int _2624 = _2622 + 1;
    float _2626 = -_1972;
    float _2628 = _2626 + 1.0;
    int _2630 = _2624;
    if (!_2584)
    {
        int _2632 = ~_2598;
        int _2634 = _2632 + 1;
        _2630 = _2634;
    }
    int _2636 = _2630;
    float _2638 = fma(_2586, _2400, _2578);
    int _2640 = _2616 ? 0 : 1;
    int _2642 = abs(_2636);
    float _2644 = fma(_2604, _2406, _2638);
    bool _2646 = !_2576;
    int _2648 = _2646 ? 0 : 1;
    int _2650 = ~_2640;
    int _2652 = _2650 + 1;
    int _2654 = _2652 + 1;
    bool _2656 = _2574 != 3;
    int _2658 = _2654;
    if (_2602)
    {
        int _2660 = ~_2640;
        int _2662 = _2660 + 1;
        _2658 = _2662;
    }
    int _2664 = _2658;
    int _2666 = ~_2480;
    int _2668 = _2666 + _2612;
    int _2670 = _2668 + 1;
    bool _2672 = !_2656;
    int _2674 = _2672 ? 0 : (-1);
    int _2676 = abs(_2648);
    int _2678 = _924 * _2670;
    int _2680 = _2678 + _2164;
    int _2682 = abs(_2664);
    int _2684 = ~_2642;
    int _2686 = _2684 + 1;
    int _2688 = _2686 + 1;
    bool _2690 = !_2196;
    int _2692 = _2690 ? 0 : 1;
    int _2694 = abs(_2674);
    int _2696 = _2688 * as_type<int>(_2538);
    int _2698 = ~_2676;
    int _2700 = _2698 + 1;
    int _2702 = _2700 + 1;
    int _2704 = abs(_2692);
    int _2706 = _2702 * as_type<int>(_2530);
    int _2708 = _2706 + _2696;
    int _2710 = ~_2682;
    int _2712 = _2710 + 1;
    int _2714 = _2712 + 1;
    int _2716 = ~_2694;
    int _2718 = _2716 + 1;
    int _2720 = _2718 + 1;
    int _2722 = _2714 * as_type<int>(_2564);
    int _2724 = _2722 + _2708;
    float _2726 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2728 = !_2005;
    int _2730 = _2728 ? _2680 : (-1);
    int _2732 = _2720 * as_type<int>(_2572);
    int _2734 = _2732 + _2724;
    float _2736 = -_2608;
    float _2738 = _2736 + 1.0;
    float _2740 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2726);
    bool _2742 = _1548 <= 8000.0;
    bool _2744 = isnan(_1548);
    bool _2746 = _2742 || _2744;
    bool _2748 = isnan(8000.0);
    bool _2750 = _2746 || _2748;
    float _2752 = float(_2750);
    float _2754 = fma(_2738, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2608);
    float _2756 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2740);
    float _2758 = in.m_77.x;
    int _2760 = ~_2704;
    int _2762 = _2760 + 1;
    int _2764 = _2762 + 1;
    float _2766 = _2752 * _2754;
    float _2768 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2756);
    int _2770 = _2734 * _2764;
    float _2772 = _2768 + _1890;
    float _2774 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2776 = _2730 * _2704;
    int _2778 = _2776 + _2770;
    float _2780 = _2772 * 0.5;
    float _2782 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2784 = _2628 * _2774;
    float _2786 = precise::clamp(_2784, 0.0, 1.0);
    float _2788 = fma(_2600, _2406, _2614);
    float _2790 = fma(_2606, _2406, _2618);
    float _2792 = _2782 * _1974;
    float _2794 = -_2786;
    float _2796 = fma(_2794, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_79.z = _2780;
    out.m_79.w = _1890;
    bool _2798 = _1694 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2800 = isnan(_1694);
    bool _2802 = _2798 || _2800;
    bool _2804 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2806 = _2802 || _2804;
    float _2808 = _1985 * _2792;
    float _2810 = _1995 * _2792;
    float _2812 = -_2782;
    float _2814 = _2812 + 1.0;
    out.gl_Position.x = _1952;
    out.gl_Position.y = _1918;
    out.gl_Position.z = _2768;
    out.gl_Position.w = _1890;
    float _2816 = _2796 * _2758;
    float _2818 = fma(_1991, _2808, _1979);
    float _2820 = fma(_1993, _2808, _1981);
    float _2822 = _1985 * _2814;
    float _2824 = _2816 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2826 = fma(_1985, _2810, _1983);
    out.m_81.x = _2788;
    out.m_81.y = _2644;
    out.m_81.z = _2790;
    float _2828 = float(_2778);
    float _2830 = _1600 * _1654;
    float _2832 = _2780;
    float _2834 = _2810;
    float _2836 = _2782;
    float _2838 = _2814;
    float _2840 = _2830;
    float _2842 = _2828;
    if (!_2806)
    {
        _2832 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2844 = _2832;
    out.m_83.x = _2824;
    float _2846 = _2844;
    float _2848 = _2844;
    if (!_2806)
    {
        _2834 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2850 = _2834;
    float _2852 = _2830 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2854 = _2850;
    float _2856 = _2850;
    if (!_2806)
    {
        _2836 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2858 = _2836;
    out.m_85.x = _2818;
    out.m_85.y = _2820;
    out.m_85.z = _2826;
    out.m_85.w = _2822;
    float _2860 = _2858;
    float _2862 = _2858;
    if (!_2806)
    {
        _2838 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2864 = _2838;
    float _2866 = _2864;
    float _2868 = _2864;
    if (!_2806)
    {
        _2840 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2870 = _2840;
    out.m_87.x = _2828;
    float _2872 = _2870;
    float _2874 = _2870;
    if (!_2806)
    {
        _2842 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2876 = _2842;
    bool _2878 = !_2806;
    float _2880 = _2876;
    float _2882 = _2876;
    if (!_2878)
    {
        bool _2884 = _1694 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2886 = isnan(_1694);
        bool _2888 = _2884 || _2886;
        bool _2890 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2892 = _2888 || _2890;
        if (!_2892)
        {
            float _2894 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2896 = _1694 + _2894;
            float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2900 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2898;
            float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2904 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2906 = 1.0 / _2900;
            float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2912 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2920 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2924 = _2896 * _2906;
            float _2926 = precise::clamp(_2924, 0.0, 1.0);
            float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2932 = fma(_2926, _2904, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2934 = fma(_2926, _2930, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2936 = fma(_2926, _2910, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2938 = fma(_2926, _2914, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2940 = fma(_2926, _2918, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2942 = fma(_2926, _2922, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2882 = _2936;
            _2868 = _2940;
            _2848 = _2932;
            _2862 = _2938;
            _2856 = _2934;
            _2874 = _2942;
            _2944 = true;
        }
        else
        {
            bool _2946 = _1694 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2948 = isnan(_1694);
            bool _2950 = _2946 || _2948;
            bool _2952 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2954 = _2950 || _2952;
            if (!_2954)
            {
                _2846 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2956 = _2846;
            _2848 = _2956;
            if (!_2954)
            {
                _2880 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2958 = _2880;
            _2882 = _2958;
            if (!_2954)
            {
                _2854 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2960 = _2854;
            _2856 = _2960;
            if (!_2954)
            {
                _2860 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2962 = _2860;
            _2862 = _2962;
            if (!_2954)
            {
                _2866 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2964 = _2866;
            _2868 = _2964;
            if (!_2954)
            {
                _2872 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2966 = _2872;
            bool _2968 = !_2954;
            _2874 = _2966;
            if (!_2968)
            {
                bool _2970 = _1694 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2972 = isnan(_1694);
                bool _2974 = _2970 || _2972;
                bool _2976 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2978 = _2974 || _2976;
                if (!_2978)
                {
                    float _2980 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2982 = _1694 + _2980;
                    float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2986 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2984;
                    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2990 = _2988 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2992 = 1.0 / _2986;
                    float _2994 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2996 = _2994 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2998 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3000 = _2998 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3002 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3004 = _3002 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3008 = _3006 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3010 = _2982 * _2992;
                    float _3012 = precise::clamp(_3010, 0.0, 1.0);
                    float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3018 = fma(_3012, _2990, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3020 = fma(_3012, _3016, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3022 = fma(_3012, _2996, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3024 = fma(_3012, _3000, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3026 = fma(_3012, _3004, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3028 = fma(_3012, _3008, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2882 = _3022;
                    _2868 = _3026;
                    _2848 = _3018;
                    _2862 = _3024;
                    _2856 = _3020;
                    _2874 = _3028;
                    _2944 = true;
                }
                else
                {
                    _2882 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2868 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2848 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2862 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2856 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2874 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2944 = false;
    float _3030 = _2882;
    float _3032 = _2868;
    float _3034 = _2848;
    float _3036 = _2862;
    float _3038 = _2856;
    float _3040 = _2874;
    float _3042 = fma(_2644, -0.5, 0.5);
    float _3044 = precise::clamp(_3042, 0.0, 1.0);
    float _3046 = -_3030;
    float _3048 = _3046 + _3032;
    float _3050 = _2852 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3052 = -_3034;
    float _3054 = _3052 + _3036;
    out.m_89.x = 0.0;
    float _3056 = fma(_3044, _3048, _3030);
    float _3058 = fma(_3044, _3054, _3034);
    out.m_53.x = _3050;
    float _3060 = -_3038;
    float _3062 = _3060 + _3040;
    float _3064 = _3056 * 0.586610972881317138671875;
    bool _3066 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3068 = fma(_3044, _3062, _3038);
    float _3070 = fma(_3058, 0.298911988735198974609375, _3064);
    bool _3072 = _1600 > 0.0;
    bool _3074 = isnan(_1600);
    bool _3076 = _3072 || _3074;
    bool _3078 = isnan(0.0);
    bool _3080 = _3076 || _3078;
    float _3082 = fma(_3068, 0.114477999508380889892578125, _3070);
    bool _3084 = _1654 <= 0.0;
    bool _3086 = !_3080;
    bool _3088 = _3084 || _3086;
    float _3090 = -_3082;
    float _3092 = _3058 + _3090;
    float _3094 = -_3082;
    float _3096 = _3056 + _3094;
    float _3098 = -_3082;
    float _3100 = _3068 + _3098;
    float _3102 = fma(_3092, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3082);
    float _3104 = fma(_3096, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3082);
    float _3106 = fma(_3100, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3082);
    bool _3108 = !_3066;
    if (!_3108)
    {
        float _3110 = -_1538;
        float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3114 = -_1540;
        float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3118 = -_1542;
        float _3120 = _3118 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3122 = _3112 * _3112;
        float _3124 = fma(_3116, _3116, _3122);
        float _3126 = fma(_3120, _3120, _3124);
        float _3128 = sqrt(_3126);
        float _3130 = rsqrt(_3126);
        float _3132 = -_3128;
        float _3134 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3136 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3138 = precise::clamp(_3136, 0.0, 1.0);
        float _3140 = _3116 * _3130;
        float _3142 = _3112 * _3130;
        float _3144 = abs(_3138);
        float _3146 = log2(_3144);
        float _3148 = _3120 * _3130;
        float _3150 = _3140 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3152 = _2644 * _3142;
        float _3154 = -_3142;
        float _3156 = -_3150;
        float _3158 = fma(_3154, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3156);
        float _3160 = fma(_2788, _3140, _3152);
        float _3162 = -_3148;
        float _3164 = fma(_3162, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3158);
        float _3166 = fma(_2790, _3148, _3160);
        float _3168 = precise::clamp(_3166, 0.0, 1.0);
        float _3170 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3172 = _3164 + _3170;
        float _3174 = _3146 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3176 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3178 = precise::clamp(_3176, 0.0, 1.0);
        float _3180 = exp2(_3174);
        float _3182 = _3180 * _3178;
        float _3184 = _3168 * _3182;
        float _3186 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3188 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3190 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3186;
        out.m_89.y = _3188;
        out.m_89.z = _3190;
    }
    out.m_91.x = _3102;
    out.m_91.y = _3104;
    out.m_91.z = _3106;
    if (!_3088)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3192 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3192;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2944 = false;
    bool _634 = false;
    bool _498 = false;
    bool _324 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3261 = as_type<float>(_134);
        out.gl_Position.z = _3261;
    }
    if (!_120)
    {
        return out;
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3316 = as_type<float>(_160);
        out.gl_Position.z = _3316;
    }
    if (_154)
    {
        return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _148;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _196 = _190;
    float _214;
    if (!_192)
    {
        float _198 = in.m_57.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        _214 = _172;
    }
    _216 = false;
    float _218 = _214;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _218 + _220;
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    bool _240 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _242 = isnan(_218);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -_234;
    float _254 = _252 + 1.0;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    float _260 = 1.0 / _238;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = _250 * _254;
    float _266 = -_250;
    float _268 = _266 + 1.0;
    float _270 = _222 * _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _284 = _276 * _264;
    float _286 = fma(_280, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = _282 * _264;
    float _290 = _286 * _264;
    float _292 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _294 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _290);
    float _296 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _298 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].x, _292);
    float _300 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].y, _294);
    float _302 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].z, _296);
    bool _304 = !_262;
    float _322;
    if (!_304)
    {
        float _306 = in.m_57.x;
        float _308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _310 = _306 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _314 = _312 * _308;
        float _316 = floor(_314);
        float _318 = -_316;
        float _320 = _314 + _318;
        _322 = _320;
        _324 = true;
    }
    else
    {
        _322 = _172;
    }
    _324 = false;
    float _326 = _322;
    float _328 = in.m_59.x;
    float _330 = in.m_59.y;
    float _332 = in.m_59.z;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _336 = _326 + _334;
    bool _338 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _340 = isnan(_326);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _358 = 1.0 / _352;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = 1.0 / _356;
    float _364 = _300 * _330;
    float _366 = _302 * _332;
    bool _368 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _370 = isnan(_326);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -_348;
    float _382 = _380 + 1.0;
    float _384 = _336 * _358;
    bool _386 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _388 = isnan(_326);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _400 = _326 + _398;
    float _402 = _378 * _382;
    float _404 = -_378;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _416;
    float _420 = _396 * _406;
    float _422 = fma(_410, _384, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _424 = fma(_414, _384, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _426 = fma(_418, _384, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _428 = _400 * _362;
    float _430 = _422 * _420;
    float _432 = _424 * _420;
    float _434 = _426 * _420;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _444 = -_396;
    float _446 = _444 + 1.0;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _452 = fma(_438, _428, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _454 = fma(_442, _428, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _456 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].x, _430);
    float _458 = fma(_450, _428, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _460 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].y, _432);
    float _462 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].z, _434);
    float _464 = fma(_452, _402, _456);
    float _466 = _298 * _328;
    float _468 = fma(_454, _402, _460);
    float _470 = fma(_458, _402, _462);
    float _472 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].x, _464);
    float _474 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].y, _468);
    float _476 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].z, _470);
    bool _478 = !_360;
    float _496;
    if (!_478)
    {
        float _480 = in.m_57.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        _496 = _172;
    }
    _498 = false;
    float _500 = _496;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _504 = _500 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _510 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _512 = isnan(_500);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _528 = isnan(_500);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _538;
    bool _542 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _544 = isnan(_500);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = 1.0 / _508;
    float _556 = -_520;
    float _558 = _556 + 1.0;
    bool _560 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _562 = 1.0 / _524;
    float _564 = _540 * _554;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _570 = -_552;
    float _572 = _570 + 1.0;
    float _574 = fma(_564, _504, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _576 = _536 * _558;
    float _578 = -_536;
    float _580 = _578 + 1.0;
    float _582 = _520 * _572;
    float _584 = _568 * _562;
    float _586 = _574 * _576;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _590 = _500 + _588;
    float _592 = _472 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _594 = _476 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _596 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _598 = fma(_584, _590, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _600 = _474 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _602 = fma(_598, _582, _596);
    float _604 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[117].x, _602);
    float _610 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _604;
    out.m_61.y = _606;
    out.m_61.z = _610;
    out.m_61.w = _612;
    bool _614 = !_560;
    float _632;
    if (!_614)
    {
        float _616 = in.m_57.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        _632 = _172;
    }
    _634 = false;
    float _636 = _632;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _640 = _636 + _638;
    bool _642 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _644 = isnan(_636);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _654;
    bool _658 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _660 = isnan(_636);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -_652;
    float _672 = _670 + 1.0;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _674;
    float _678 = 1.0 / _656;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _682 = _668 * _672;
    float _684 = -_668;
    float _686 = _684 + 1.0;
    float _688 = _640 * _678;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _690;
    float _694 = fma(_676, _688, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _696;
    float _700 = fma(_692, _688, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _702 = _694 * _682;
    float _704 = fma(_698, _688, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _706 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].x, _702);
    float _708 = _704 * _682;
    float _710 = _700 * _682;
    float _712 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].x, _706);
    float _714 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].y, _708);
    float _716 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].z, _710);
    float _718 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].y, _714);
    float _720 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].z, _716);
    bool _722 = !_680;
    if (!_722)
    {
        float _724 = in.m_57.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _194 = _738;
    }
    float _740 = _194;
    float _742 = in.m_57.z;
    float _744 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _746 = log2(_744);
    float _748 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _750 = in.m_57.x;
    float _752 = in.m_57.y;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _756 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _758 = int(_756);
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _764 = 1.0 + _762;
    float _766 = 1.0 / _764;
    float _768 = _742 * 2.0;
    float _770 = _750 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _772 = _750 * 2.0;
    float _774 = floor(_768);
    float _776 = _752 * 2.0;
    float _778 = -_754;
    float _780 = fma(_770, 2.0, _778);
    float _782 = _746 * _116;
    float _784 = _752 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _786 = _752 + _750;
    float _788 = -_116;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[76].x, _780);
    float _792 = floor(_772);
    float _794 = fma(_784, -2.0, _760);
    float _796 = _786 + (-1.0);
    float _798 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _794);
    float _800 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _802 = _774 >= 0.0;
    bool _804 = isnan(_774);
    bool _806 = _802 || _804;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    float _812 = exp2(_782);
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _816 = _814 != 0;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _820 = _818 != 0;
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _824 = _822 != 0;
    int _826 = _810 ? 0 : 1;
    bool _828 = _792 > 0.0;
    float _830 = floor(_776);
    bool _832 = !_820;
    int _834 = _832 ? 0 : 1;
    bool _836 = _774 > 0.0;
    bool _838 = _792 >= 0.0;
    bool _840 = isnan(_792);
    bool _842 = _838 || _840;
    bool _844 = isnan(0.0);
    bool _846 = _842 || _844;
    int _848 = ~_826;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = -_812;
    float _856 = _854 + 1.0;
    bool _858 = !_816;
    int _860 = _858 ? 0 : 1;
    bool _862 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _864 = isnan(0.0);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _870 = _866 || _868;
    float _872 = float(_758);
    bool _874 = !_824;
    int _876 = _874 ? 0 : 1;
    float _878 = in.m_63.x;
    float _880 = in.m_63.y;
    float _882 = in.m_63.z;
    int _884 = _852;
    if (!_836)
    {
        int _886 = ~_826;
        int _888 = _886 + 1;
        _884 = _888;
    }
    int _890 = _884;
    float _892 = 1.0 / _872;
    bool _894 = _830 > 0.0;
    bool _896 = _830 >= 0.0;
    bool _898 = isnan(_830);
    bool _900 = _896 || _898;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    float _906 = _870 ? _856 : 0.0;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _920 = _918 != 0;
    float _922 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _924 = int(_922);
    float _926 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[78].w, _908);
    int _928 = _846 ? 0 : 1;
    bool _930 = !_912;
    int _932 = _930 ? 0 : 1;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _936 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _938 = isnan(1.0);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _944 = _940 || _942;
    float _946 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _926);
    int _948 = abs(_932);
    float _950 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[78].z, _934);
    float _952 = float(_890);
    float _954 = _892 * _116;
    float _956 = float(_948);
    float _958 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _950);
    bool _960 = !_916;
    int _962 = _960 ? 0 : 1;
    float _964 = float(_924);
    float _966 = _956 * _952;
    int _968 = ~_928;
    int _970 = _968 + 1;
    int _972 = _970 + 1;
    float _974 = _750 + (-0.5);
    int _976 = _972;
    if (!_828)
    {
        int _978 = ~_928;
        int _980 = _978 + 1;
        _976 = _980;
    }
    int _982 = _976;
    float _984 = _964 * _116;
    if (_944)
    {
        float _986 = _906 * _766;
        _126 = _986;
    }
    float _988 = _126;
    int _990 = abs(_962);
    float _992 = _966 * (-2.0);
    int _994 = _904 ? 0 : 1;
    float _996 = fma(_992, _878, _878);
    float _998 = float(_982);
    float _1000 = fma(_800, _992, _800);
    float _1002 = float(_990);
    float _1004 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[196].x, _996);
    bool _1006 = !_920;
    int _1008 = _1006 ? 0 : 1;
    int _1010 = ~_994;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    float _1016 = _1002 * _998;
    int _1018 = _1014;
    if (!_894)
    {
        int _1020 = ~_994;
        int _1022 = _1020 + 1;
        _1018 = _1022;
    }
    int _1024 = _1018;
    float _1026 = _752 + _742;
    int _1028 = abs(_1008);
    float _1030 = fma(_1000, _988, _1004);
    float _1032 = _1026 + (-1.0);
    float _1034 = float(_1024);
    float _1036 = _1016 * (-2.0);
    float _1038 = float(_1028);
    float _1040 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1042 = _742 + _750;
    float _1044 = fma(_1036, _880, _880);
    float _1046 = _1038 * _1034;
    float _1048 = _752 + (-0.5);
    float _1050 = _1042 + (-1.0);
    float _1052 = fma(_1040, _1036, _1040);
    float _1054 = _742 + (-0.5);
    float _1056 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1044);
    float _1058 = _1046 * (-2.0);
    float _1060 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1062 = _1030 * 0.15915493667125701904296875;
    float _1064 = fma(_1052, _988, _1056);
    float _1066 = fma(_1058, _882, _882);
    float _1068 = in.m_65.x;
    float _1070 = in.m_65.y;
    float _1072 = in.m_65.z;
    float _1074 = fma(_1060, _1058, _1060);
    float _1076 = _1064 * 0.15915493667125701904296875;
    float _1078 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1066);
    float _1080 = _1062 * 6.283185482025146484375;
    float _1082 = cos(_1080);
    float _1084 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1086 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1088 = fma(_1074, _988, _1078);
    float _1090 = in.m_46.x;
    float _1092 = in.m_46.y;
    float _1094 = in.m_46.z;
    float _1096 = _1088 * 0.15915493667125701904296875;
    float _1098 = _1076 * 6.283185482025146484375;
    float _1100 = sin(_1098);
    float _1102 = _1076 * 6.283185482025146484375;
    float _1104 = cos(_1102);
    float _1106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1072);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1068);
    float _1110 = _1062 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = _1086 * _1106;
    float _1116 = _748 * _1108;
    float _1118 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1120 = _1096 * 6.283185482025146484375;
    float _1122 = cos(_1120);
    float _1124 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1070);
    float _1126 = _1082 * _1104;
    float _1128 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1118);
    float _1130 = _1084 * _1124;
    float _1132 = _1082 * _1100;
    float _1134 = _1096 * 6.283185482025146484375;
    float _1136 = sin(_1134);
    float _1138 = _1112 * _1100;
    float _1140 = _1112 * _1104;
    float _1142 = _1082 * _1122;
    float _1144 = _1112 * _1122;
    float _1146 = _1104 * _1122;
    float _1148 = _1100 * _1122;
    float _1150 = _1142 * _1130;
    float _1152 = _1144 * _1130;
    float _1154 = fma(_1136, _1126, _1138);
    float _1156 = -_1132;
    float _1158 = fma(_1136, _1140, _1156);
    float _1160 = -_1140;
    float _1162 = fma(_1136, _1132, _1160);
    float _1164 = -_1130;
    float _1166 = _1136 * _1164;
    float _1168 = fma(_1154, _1116, _1150);
    float _1170 = fma(_1136, _1138, _1126);
    float _1172 = fma(_1158, _1116, _1152);
    float _1174 = fma(_1146, _1116, _1166);
    float _1176 = fma(_1162, _1114, _1168);
    float _1178 = fma(_1094, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1128);
    float _1180 = fma(_1148, _1114, _1174);
    float _1182 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1184 = fma(_1170, _1114, _1172);
    float _1186 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1188 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1190 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1182);
    float _1192 = _1178 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1194 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1186);
    float _1196 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1188);
    float _1198 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1190);
    float _1200 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1202 = fma(_1094, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1194);
    float _1204 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1196);
    float _1206 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1208 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1200);
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1214 = _1192 + _1206;
    float _1216 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1218 = fma(_1094, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1208);
    float _1220 = _1210 + _1212;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1224 = _1214 + _1222;
    float _1226 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1216);
    float _1228 = _1218 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1232 = _1220 + _1230;
    float _1234 = _1224 * _1224;
    float _1236 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1226);
    float _1238 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1240 = fma(_1232, _1232, _1234);
    float _1242 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1244 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1238);
    float _1246 = sqrt(_1240);
    float _1248 = _1228 + _1242;
    float _1250 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1244);
    bool _1252 = _1246 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = _1244;
    float _1256 = _1176;
    float _1258 = _1242;
    float _1260 = _1248;
    float _1262 = _1228;
    if (!_1252)
    {
        _1254 = _1220;
    }
    float _1264 = _1254;
    float _1266 = _1264;
    if (!_1252)
    {
        _1256 = _1214;
    }
    float _1268 = _1256;
    float _1270 = _1268;
    if (!_1252)
    {
        _1258 = _1248;
    }
    float _1272 = _1258;
    bool _1274 = !_1252;
    float _1276 = _1272;
    if (!_1274)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1282 = _1246 + _1280;
        float _1284 = rsqrt(_1240);
        float _1286 = _1282 * _1278;
        float _1288 = _1248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1290 = _1286 * 0.15915493667125701904296875;
        float _1292 = _1290 * 6.283185482025146484375;
        float _1294 = cos(_1292);
        float _1296 = _1290 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        float _1300 = _1294 + (-1.0);
        float _1302 = fma(_1298, _1288, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1304 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1306 = _1284 * _1302;
        float _1308 = fma(_1248, _1294, _1304);
        float _1310 = fma(_1232, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1312 = fma(_1224, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1276 = _1308;
        _1266 = _1310;
        _1270 = _1312;
    }
    float _1314 = _1276;
    float _1316 = _1266;
    float _1318 = _1270;
    float _1320 = -_1228;
    float _1322 = _1320 + _1314;
    float _1324 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1326 = -_1210;
    float _1328 = _1326 + _1316;
    float _1330 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1332 = _1322 * _1322;
    float _1334 = -_1192;
    float _1336 = _1334 + _1318;
    float _1338 = 1.0 / _1324;
    float _1340 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1330);
    float _1342 = fma(_1328, _1328, _1332);
    float _1344 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1340);
    float _1346 = fma(_1336, _1336, _1342);
    bool _1348 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1350 = isnan(0.5);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1356 = _1352 || _1354;
    float _1358 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1360 = sqrt(_1346);
    bool _1362 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1364 = isnan(0.5);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1370 = _1366 || _1368;
    float _1372 = _1358 + _1324;
    float _1374 = _1372 * _1338;
    float _1376 = _1374 * 0.5;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1380 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1378);
    bool _1382 = _1360 > 0.0;
    float _1384 = 1.0 / _1380;
    float _1386 = _1338;
    float _1388 = _1360;
    float _1390 = _1316;
    float _1392 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1394 = _1314;
    float _1396 = _1318;
    if (!_1382)
    {
        _1386 = _1314;
    }
    float _1398 = _1386;
    float _1400 = _1398;
    if (!_1382)
    {
        _1388 = _1318;
    }
    float _1402 = _1388;
    bool _1404 = !_1382;
    float _1406 = _1402;
    if (!_1404)
    {
        float _1408 = _188 * _188;
        float _1410 = fma(_186, _186, _1408);
        float _1412 = fma(_190, _190, _1410);
        float _1414 = rsqrt(_1346);
        float _1416 = sqrt(_1412);
        float _1418 = _1328 * _1414;
        float _1420 = _1322 * _1414;
        float _1422 = _1336 * _1414;
        bool _1424 = _1416 > 0.0;
        float _1426 = _1416;
        float _1428 = _1414;
        _1392 = _1412;
        _1260 = _1418;
        if (!_1424)
        {
            _1426 = _1314;
        }
        float _1430 = _1426;
        _1400 = _1430;
        if (!_1424)
        {
            _1428 = _1318;
        }
        float _1432 = _1428;
        bool _1434 = !_1424;
        _1406 = _1432;
        if (!_1434)
        {
            float _1436 = rsqrt(_1412);
            float _1438 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1440 = _188 * _1436;
            float _1442 = _186 * _1436;
            float _1444 = _1420 * _1440;
            float _1446 = _190 * _1436;
            float _1448 = fma(_1418, _1442, _1444);
            float _1450 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1452 = fma(_1422, _1446, _1448);
            float _1454 = _1452 * _1450;
            float _1456 = fma(_186, _1454, _1316);
            float _1458 = fma(_188, _1454, _1314);
            float _1460 = fma(_190, _1454, _1318);
            _1390 = _1456;
            _1400 = _1458;
            _1406 = _1460;
            _1392 = _1436;
        }
    }
    float _1462 = _1390;
    float _1464 = _1400;
    float _1466 = _1406;
    float _1468 = _1392;
    float _1470 = _1260;
    float _1472 = _1466;
    float _1474 = _1470;
    if (_1370)
    {
        _1394 = 1.0;
    }
    float _1476 = _1394;
    float _1478 = _1476;
    if (_1356)
    {
        _1396 = _1462;
    }
    float _1480 = _1396;
    float _1482 = _1480;
    if (_1356)
    {
        _196 = _1464;
    }
    float _1484 = _196;
    float _1486 = _1484;
    if (!_1356)
    {
        float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1490 = _1228 + _1488;
        float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1494 = _1210 + _1492;
        float _1496 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1498 = -_1228;
        float _1500 = _1498 + _1464;
        float _1502 = _1490 * _1490;
        float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1506 = _1192 + _1504;
        float _1508 = -_1210;
        float _1510 = _1508 + _1462;
        float _1512 = -_1192;
        float _1514 = _1512 + _1466;
        float _1516 = fma(_1494, _1494, _1502);
        float _1518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1520 = fma(_1506, _1506, _1516);
        float _1522 = sqrt(_1520);
        float _1524 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1526 = precise::min(_1522, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1528 = _1526 * _1518;
        float _1530 = _1524 * _1528;
        float _1532 = fma(_1500, _1530, _1228);
        float _1534 = fma(_1510, _1530, _1210);
        float _1536 = fma(_1514, _1530, _1192);
        _1486 = _1532;
        _1482 = _1534;
        _1472 = _1536;
    }
    float _1538 = _1486;
    float _1540 = _1482;
    float _1542 = _1472;
    if (_1370)
    {
        _1262 = 1.0;
    }
    float _1544 = _1262;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1548 = _1384 * _1546;
    float _1550 = _1544;
    if (!_1370)
    {
        float _1552 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1554 = _1552 * 0.15915493667125701904296875;
        float _1556 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1558 = _1554 * 6.283185482025146484375;
        float _1560 = cos(_1558);
        float _1562 = _1556 * 0.15915493667125701904296875;
        float _1564 = _1554 * 6.283185482025146484375;
        float _1566 = sin(_1564);
        float _1568 = 1.0 / _1560;
        float _1570 = _1562 * 6.283185482025146484375;
        float _1572 = cos(_1570);
        float _1574 = _1566 * _1568;
        float _1576 = _1562 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = _1572 * _1574;
        float _1582 = 1.0 / _1580;
        float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1586 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1584;
        float _1588 = 1.0 / _1586;
        float _1590 = _1578 * _1582;
        float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1594 = fma(_1548, _1590, _1592);
        float _1596 = _1594 * _1588;
        float _1598 = precise::clamp(_1596, 0.0, 1.0);
        _1478 = _1598;
    }
    float _1600 = _1478;
    if (!_1370)
    {
        float _1602 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1604 = _1602 * 0.15915493667125701904296875;
        float _1606 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1608 = _1604 * 6.283185482025146484375;
        float _1610 = cos(_1608);
        float _1612 = _1606 * 0.15915493667125701904296875;
        float _1614 = _1604 * 6.283185482025146484375;
        float _1616 = sin(_1614);
        float _1618 = 1.0 / _1610;
        float _1620 = _1612 * 6.283185482025146484375;
        float _1622 = cos(_1620);
        float _1624 = _1616 * _1618;
        float _1626 = _1612 * 6.283185482025146484375;
        float _1628 = sin(_1626);
        float _1630 = _1622 * _1624;
        float _1632 = 1.0 / _1630;
        float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1636 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1634;
        float _1638 = 1.0 / _1636;
        float _1640 = _1628 * _1632;
        float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1644 = fma(_1548, _1640, _1642);
        float _1646 = _1644 * _1638;
        float _1648 = precise::clamp(_1646, 0.0, 1.0);
        float _1650 = -_1648;
        float _1652 = _1650 + 1.0;
        _1550 = _1652;
    }
    float _1654 = _1550;
    float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1658 = _1538 + _1656;
    float _1660 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1662 = _1540 + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1666 = _1542 + _1664;
    float _1668 = _1658 * _1658;
    float _1670 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1672 = fma(_1662, _1662, _1668);
    float _1674 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1676 = fma(_1210, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1678 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1680 = fma(_1666, _1666, _1672);
    float _1682 = precise::max(0.0, _1674);
    float _1684 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1678);
    float _1686 = rsqrt(_1680);
    float _1688 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1670);
    float _1690 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1684);
    float _1692 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1694 = sqrt(_1680);
    float _1696 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1698 = _1662 * _1696;
    float _1700 = _1666 * _1696;
    float _1702 = -_1696;
    float _1704 = -_1682;
    float _1706 = fma(_1658, _1702, _1704);
    float _1708 = _1698 * _1698;
    float _1710 = _1700 * _1700;
    float _1712 = _1708 + _1710;
    float _1714 = sqrt(_1712);
    bool _1716 = _1714 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1720 = _1714 + _1718;
    float _1722 = _1468;
    float _1724 = _1682;
    float _1726 = _1712;
    float _1728 = _1720;
    float _1730 = _1658;
    float _1732 = _1698;
    float _1734 = _1700;
    float _1736 = _1708;
    float _1738 = _1710;
    if (_1716)
    {
        float _1740 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1722 = _1740;
    }
    float _1742 = _1722;
    if (_1716)
    {
        float _1744 = _1706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1724 = _1744;
    }
    float _1746 = _1724;
    if (_1716)
    {
        float _1748 = rsqrt(_1712);
        _1726 = _1748;
    }
    float _1750 = _1726;
    if (_1716)
    {
        float _1752 = _1720 * _1742;
        _1728 = _1752;
    }
    float _1754 = _1728;
    if (_1716)
    {
        float _1756 = _1754 * 0.15915493667125701904296875;
        _1474 = _1756;
    }
    float _1758 = _1474;
    float _1760 = _1742;
    float _1762 = _1758;
    if (_1716)
    {
        float _1764 = _1758 * 6.283185482025146484375;
        float _1766 = sin(_1764);
        _1760 = _1766;
    }
    float _1768 = _1760;
    float _1770 = _1754;
    if (_1716)
    {
        float _1772 = _1758 * 6.283185482025146484375;
        float _1774 = cos(_1772);
        _1770 = _1774;
    }
    float _1776 = _1770;
    float _1778 = _1768;
    if (_1716)
    {
        float _1780 = fma(_1768, _1746, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1730 = _1780;
    }
    float _1782 = _1730;
    float _1784 = floor(_1676);
    float _1786 = _1782;
    if (_1716)
    {
        float _1788 = _1750 * _1782;
        _1762 = _1788;
    }
    float _1790 = _1762;
    if (!_1716)
    {
        _1786 = _1706;
    }
    float _1792 = _1786;
    float _1794 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1796 = _1792;
    if (_1716)
    {
        float _1798 = _1776 + (-1.0);
        _1778 = _1798;
    }
    float _1800 = _1778;
    float _1802 = _1800;
    if (_1716)
    {
        float _1804 = _1698 * _1790;
        _1732 = _1804;
    }
    float _1806 = _1732;
    if (_1716)
    {
        float _1808 = _1700 * _1790;
        _1734 = _1808;
    }
    float _1810 = _1734;
    if (_1716)
    {
        float _1812 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1802 = _1812;
    }
    float _1814 = _1802;
    if (_1716)
    {
        float _1816 = _1806 * _1806;
        _1736 = _1816;
    }
    float _1818 = _1736;
    if (_1716)
    {
        float _1820 = _1810 * _1810;
        _1738 = _1820;
    }
    float _1822 = _1738;
    if (_1716)
    {
        float _1824 = fma(_1706, _1776, _1814);
        _1796 = _1824;
    }
    float _1826 = _1796;
    float _1828 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1830 = fma(_1826, _1826, _1818);
    float _1832 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1828);
    float _1834 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1794);
    float _1836 = _1830 + _1822;
    float _1838 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1832);
    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1842 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1840);
    float _1844 = precise::clamp(_1842, 0.0, 1.0);
    float _1846 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1834);
    float _1848 = rsqrt(_1836);
    float _1850 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1852 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1854 = -_1844;
    float _1856 = _1854 + 1.0;
    float _1858 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1860 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1862 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1688);
    float _1864 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1866 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1868 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1860);
    float _1870 = abs(_1856);
    float _1872 = log2(_1870);
    float _1874 = -_1864;
    float _1876 = fma(_1874, _1850, 1.0);
    float _1878 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1880 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1868);
    float _1882 = -_1784;
    float _1884 = _1676 + _1882;
    float _1886 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1888 = _1848 * _1806;
    float _1890 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1880);
    float _1892 = _1848 * _1826;
    float _1894 = _1848 * _1810;
    float _1896 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1898 = floor(_1866);
    float _1900 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1902 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1886);
    float _1904 = -_1896;
    float _1906 = fma(_1892, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1904);
    float _1908 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1910 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1902);
    float _1912 = -_1894;
    float _1914 = fma(_1912, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1906);
    float _1916 = log2(_1876);
    float _1918 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1910);
    float _1920 = fma(_1914, -0.5, 0.5);
    float _1922 = fma(_1914, 0.5, 0.5);
    float _1924 = exp2(_1908);
    float _1926 = -_1898;
    float _1928 = _1866 + _1926;
    float _1930 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1900);
    float _1932 = fma(_1922, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1934 = _1892 + 1.0;
    float _1936 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1930);
    float _1938 = fma(_1922, _1932, -0.212114393711090087890625);
    float _1940 = 1.0 / _1890;
    float _1942 = _1916 * 0.693147182464599609375;
    float _1944 = fma(_1922, _1938, 1.570728778839111328125);
    float _1946 = sqrt(_1920);
    float _1948 = -_1892;
    float _1950 = fma(_1924, _1934, _1948);
    float _1952 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1936);
    float _1954 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1956 = _1952 * _1940;
    float _1958 = _1918 * _1940;
    float _1960 = _1946 * 0.636619746685028076171875;
    float _1962 = fma(_1956, 0.5, 0.5);
    float _1964 = fma(_1958, -0.5, 0.5);
    float _1966 = -_1944;
    float _1968 = fma(_1960, _1966, 1.0);
    float _1970 = fma(_1950, 0.5, 0.5);
    float2 _6173 = float2(_1884, _1928);
    float _1972 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6173, float2(0.0), isnan(_6173)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6173, float2(0.0), isnan(_6173)), level(0.0)).x;
    float3 _6184 = float3(_1962, _1964, _1954);
    float _1974 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6184, float3(0.0), isnan(_6184)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6184, float3(0.0), isnan(_6184)), level(0.0)).x;
    float3 _6195 = float3(_1962, _1964, _1954);
    float4 _1977 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6195, float3(0.0), isnan(_6195)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6195, float3(0.0), isnan(_6195)), level(0.0)).xyzw;
    float _1979 = _1977.x;
    float _1981 = _1977.y;
    float _1983 = _1977.z;
    float _1985 = _1977.w;
    float2 _6211 = float2(_1968, _1970);
    float3 _1989 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6211, float2(0.0), isnan(_6211)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6211, float2(0.0), isnan(_6211)), level(0.0)).xyz;
    float _1991 = _1989.x;
    float _1993 = _1989.y;
    float _1995 = _1989.z;
    float _1997 = float(uint(_924));
    float _1999 = trunc(_954);
    int _2001 = int(_1999);
    float _2003 = _984 * _168;
    bool _2005 = _924 == 0;
    float _2007 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2009 = ~_924;
    int _2011 = _2009 + 1;
    int _2013 = _924 + (-1);
    float _2015 = 1.0 / _1997;
    int _2017 = abs(_834);
    int _2019 = abs(_876);
    float _2021 = float(uint(_2001));
    float _2023 = trunc(_2003);
    int _2025 = int(_2023);
    int _2027 = as_type<int>(_2015) + (-2);
    float _2029 = exp2(_2007);
    float _2031 = as_type<float>(_2027) * _2021;
    float _2033 = trunc(_2031);
    float _2035 = precise::max(_2033, 0.0);
    uint _2038 = uint(_2035);
    float _2040 = -_2029;
    float _2042 = _2040 + 1.0;
    int _2044 = _2011 * int(_2038);
    int _2046 = _2044 + _2001;
    float _2048 = float(uint(_2046));
    float _2050 = as_type<float>(_2027) * _2048;
    int _2052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2054 = _2052 != 0;
    float _2056 = trunc(_2050);
    float _2058 = precise::max(_2056, 0.0);
    uint _2060 = uint(_2058);
    int _2062 = ~_924;
    int _2064 = _2062 + 1;
    bool _2066 = !_2054;
    float _2068 = _2066 ? 7.345489978790283203125 : 1.0;
    float _2070 = _2068 * _750;
    float _2072 = floor(_2070);
    int _2074 = int(_2038) + int(_2060);
    float _2076 = float(_2001);
    int _2078 = _2064 * _2074;
    int _2080 = _2078 + _2001;
    bool _2082 = _2076 >= _964;
    bool _2084 = isnan(_2076);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan(_964);
    bool _2090 = _2086 || _2088;
    float _2092 = float(_2090);
    bool _2094 = uint(_2080) >= uint(_924);
    float _2096 = trunc(_2092);
    int _2098 = int(_2096);
    float _2100 = -_2072;
    float _2102 = _2070 + _2100;
    float _2104 = _2102 * _964;
    bool _2106 = !_2094;
    int _2108 = _2106 ? 0 : (-1);
    float _2110 = trunc(_2104);
    int _2112 = int(_2110);
    int _2114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2116 = _2114 != 0;
    int _2118 = ~_2074;
    int _2120 = _2118 + _2108;
    int _2122 = _2120 + 1;
    int _2124 = ~_2098;
    int _2126 = _2124 + 1;
    int _2128 = _2126 + 1;
    int _2130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2132 = _2130 != 0;
    int _2134 = _924 * _2122;
    int _2136 = _2134 + _2001;
    bool _2138 = !_2116;
    int _2140 = _2138 ? 0 : 1;
    int _2142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2144 = _2142 != 0;
    bool _2146 = !_2005;
    int _2148 = _2146 ? _2136 : (-1);
    int _2150 = abs(_2140);
    bool _2152 = !_2144;
    int _2154 = _2152 ? 0 : 1;
    int _2156 = _2148 * _2128;
    int _2158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2160 = _2158 != 0;
    int _2162 = _2112 * _2150;
    int _2164 = _2162 + _2001;
    int _2166 = abs(_2154);
    int _2168 = _2098 * _2013;
    int _2170 = _2168 + _2156;
    int _2172 = abs(_860);
    float _2174 = in.m_67.y;
    int _2176 = ~_924;
    int _2178 = _2176 + 1;
    int _2180 = _2170 * _2017;
    float _2182 = as_type<float>(_2017);
    if (_2132)
    {
        float _2184 = in.m_57.x;
        _2182 = _2184;
    }
    float _2186 = _2182;
    bool _2188 = _752 > 0.5;
    int _2190 = _2025 * _2172;
    int _2192 = _2190 + _2180;
    int _2194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2196 = _2194 != 0;
    float _2198 = in.m_67.x;
    float _2200 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2200;
    int _2204 = _2164 * _2019;
    int _2206 = _2204 + _2192;
    bool _2208 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2210 = isnan(_740);
    bool _2212 = _2208 || _2210;
    bool _2214 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2216 = _2212 || _2214;
    float _2218 = float(_2216);
    int _2220 = _2112 * _2166;
    int _2222 = _2220 + _2206;
    float _2224 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2226 = _2224 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2228 = float(uint(_2222));
    float _2230 = 1.0 / _2226;
    float _2232 = as_type<float>(_2027) * _2228;
    float _2234 = -_2174;
    float _2236 = _2234 + 1.0;
    float _2238 = trunc(_2232);
    float _2240 = precise::max(_2238, 0.0);
    uint _2242 = uint(_2240);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _2244 = _2174;
    float _2246 = _2202;
    if (_2160)
    {
        float _2248 = _2188 ? _2236 : _2174;
        _2244 = _2248;
    }
    float _2250 = _2244;
    bool _2252 = _2186 > 0.5;
    bool _2254 = _2252 && _2132;
    float _2256 = _2186;
    if (_2132)
    {
        _2256 = _2198;
    }
    float _2258 = _2256;
    float _2260 = _2202 * _2230;
    float _2262 = _2258;
    if (!_2132)
    {
        _2246 = _2198;
    }
    float _2264 = _2246;
    float _2266 = float(uint(_2164));
    float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2270 = _740 + _2268;
    bool _2272 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2274 = isnan(_740);
    bool _2276 = _2272 || _2274;
    bool _2278 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2280 = _2276 || _2278;
    float _2282 = float(_2280);
    int _2284 = _2178 * int(_2242);
    int _2286 = _2284 + _2222;
    float _2288 = -_2218;
    float _2290 = _2288 + 1.0;
    float _2292 = as_type<float>(_2027) * _2266;
    float _2294 = fma(_2260, _2270, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2296 = _2264;
    if (_2254)
    {
        float _2298 = -_2258;
        float _2300 = _2298 + 1.0;
        _2262 = _2300;
    }
    float _2302 = _2262;
    float _2304 = float(uint(_2286));
    float _2306 = _2282 * _2290;
    float _2308 = -_2282;
    float _2310 = _2308 + 1.0;
    float _2312 = trunc(_2292);
    float _2314 = precise::max(_2312, 0.0);
    uint _2316 = uint(_2314);
    float _2318 = in.m_71.x;
    float _2320 = in.m_71.y;
    float _2322 = in.m_71.z;
    float _2324 = as_type<float>(_2027) * _2304;
    float _2326 = _2294 * _2306;
    int _2328 = ~_924;
    int _2330 = _2328 + 1;
    if (_2132)
    {
        _2296 = _2302;
    }
    float _2332 = _2296;
    float _2334 = fma(_2250, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2336 = trunc(_2324);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    bool _2342 = _1070 != 0.0;
    bool _2344 = isnan(_1070);
    bool _2346 = _2342 || _2344;
    bool _2348 = isnan(0.0);
    bool _2350 = _2346 || _2348;
    float _2352 = fma(_2310, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2326);
    float _2354 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2356 = -_798;
    float _2358 = fma(_946, _2334, _2356);
    bool _2360 = _1068 == 0.0;
    bool _2362 = !_2350;
    bool _2364 = _2360 && _2362;
    float _2366 = fma(_958, _2354, _790);
    float _2368 = abs(_1548);
    float _2370 = log2(_2368);
    bool _2372 = _1072 == 0.0;
    bool _2374 = _2372 && _2364;
    int _2376 = int(_2242) + int(_2340);
    int _2378 = ~_924;
    int _2380 = _2378 + 1;
    float _2382 = _2320;
    float _2384 = _2318;
    float _2386 = _2322;
    if (!_2374)
    {
        float _2388 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2320);
        _2382 = _2388;
    }
    float _2390 = _2382;
    int _2392 = _2330 * int(_2316);
    int _2394 = _2392 + _2164;
    float _2396 = _2358 + 0.5;
    if (!_2374)
    {
        float _2398 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2318);
        _2384 = _2398;
    }
    float _2400 = _2384;
    float _2402 = _2366 + 0.5;
    if (!_2374)
    {
        float _2404 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2322);
        _2386 = _2404;
    }
    float _2406 = _2386;
    float _2408 = float(uint(_2394));
    int _2410 = _2380 * _2376;
    int _2412 = _2410 + _2222;
    float _2414 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2352);
    float _2416 = _718 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_73.x = _2402;
    out.m_73.y = _2396;
    float _2418 = as_type<float>(_2027) * _2408;
    bool _2420 = uint(_2412) >= uint(_924);
    float _2422 = _712 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2424 = _720 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2426 = ~_924;
    int _2428 = _2426 + 1;
    float _2430 = _2416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2432 = !_2420;
    int _2434 = _2432 ? 0 : (-1);
    float _2436 = trunc(_2418);
    float _2438 = precise::max(_2436, 0.0);
    uint _2440 = uint(_2438);
    float _2442 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2444 = _2424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2446 = ~_2376;
    int _2448 = _2446 + _2434;
    int _2450 = _2448 + 1;
    float _2452 = _2414 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2454 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2456 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2458 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2460 = _924 * _2450;
    int _2462 = _2460 + _2222;
    out.m_75.x = _2442;
    out.m_75.y = _2430;
    out.m_75.z = _2444;
    out.m_75.w = _2452;
    float _2464 = -_1136;
    float _2466 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2456);
    float _2468 = exp2(_2454);
    float _2470 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2472 = !_2005;
    int _2474 = _2472 ? _2462 : (-1);
    float _2476 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2470);
    int _2478 = _2474 >> 31;
    int _2480 = int(_2316) + int(_2440);
    float _2482 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2484 = _2478 & 3;
    float _2486 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2488 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2490 = _2428 * _2480;
    int _2492 = _2490 + _2164;
    int _2494 = _2474 + _2484;
    float _2496 = -_1136;
    float _2498 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2482);
    float _2500 = -_1136;
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2486);
    float _2504 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2506 = _2494 >> 2;
    float _2508 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2498);
    bool _2510 = uint(_2492) >= uint(_924);
    float _2512 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2466);
    int _2514 = _2506 << 4;
    int _2516 = _2514 + 368;
    float _2518 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2502);
    float _2520 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2458);
    float _2522 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _2524 = uint(int(uint(_2516) >> uint(2)));
    uint _2526 = uint(int(uint(int(_2524)) >> uint(2)));
    int _2528 = int(_2524) & 3;
    float _2530 = (*spvDescriptorSet0.vp_c9)._m0[int(_2526)][_2528];
    int _2532 = int(_2524) + 1;
    uint _2534 = uint(int(uint(_2532) >> uint(2)));
    int _2536 = _2532 & 3;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[int(_2534)][_2536];
    float _2540 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2542 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2504);
    float _2544 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2522);
    float _2546 = _2508 * _2390;
    float _2548 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2550 = precise::clamp(_2548, 0.0, 1.0);
    float _2552 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2488);
    float _2554 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2540);
    int _2556 = _2516 + 8;
    uint _2558 = uint(int(uint(_2556) >> uint(2)));
    uint _2560 = uint(int(uint(int(_2558)) >> uint(2)));
    int _2562 = int(_2558) & 3;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[int(_2560)][_2562];
    int _2566 = int(_2558) + 1;
    uint _2568 = uint(int(uint(_2566) >> uint(2)));
    int _2570 = _2566 & 3;
    float _2572 = (*spvDescriptorSet0.vp_c9)._m0[int(_2568)][_2570];
    int _2574 = _2474 & 3;
    bool _2576 = _2574 != 0;
    float _2578 = _2512 * _2390;
    float _2580 = _2518 * _2390;
    float _2582 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2520);
    bool _2584 = uint(_2574) > 1u;
    float _2586 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2542);
    int _2588 = _2474 & 3;
    bool _2590 = _2588 != 0;
    float _2592 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2544);
    float _2594 = fma(_2550, -2.0, 3.0);
    float _2596 = _2550 * _2550;
    int _2598 = _2590 ? 0 : 1;
    float _2600 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2552);
    bool _2602 = _2574 != 3;
    float _2604 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2554);
    float _2606 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2476);
    float _2608 = _2596 * _2594;
    bool _2610 = !_2510;
    int _2612 = _2610 ? 0 : (-1);
    float _2614 = fma(_2582, _2400, _2546);
    bool _2616 = uint(_2574) >= 2u;
    float _2618 = fma(_2592, _2400, _2580);
    int _2620 = ~_2598;
    int _2622 = _2620 + 1;
    int _2624 = _2622 + 1;
    float _2626 = -_1972;
    float _2628 = _2626 + 1.0;
    int _2630 = _2624;
    if (!_2584)
    {
        int _2632 = ~_2598;
        int _2634 = _2632 + 1;
        _2630 = _2634;
    }
    int _2636 = _2630;
    float _2638 = fma(_2586, _2400, _2578);
    int _2640 = _2616 ? 0 : 1;
    int _2642 = abs(_2636);
    float _2644 = fma(_2604, _2406, _2638);
    bool _2646 = !_2576;
    int _2648 = _2646 ? 0 : 1;
    int _2650 = ~_2640;
    int _2652 = _2650 + 1;
    int _2654 = _2652 + 1;
    bool _2656 = _2574 != 3;
    int _2658 = _2654;
    if (_2602)
    {
        int _2660 = ~_2640;
        int _2662 = _2660 + 1;
        _2658 = _2662;
    }
    int _2664 = _2658;
    int _2666 = ~_2480;
    int _2668 = _2666 + _2612;
    int _2670 = _2668 + 1;
    bool _2672 = !_2656;
    int _2674 = _2672 ? 0 : (-1);
    int _2676 = abs(_2648);
    int _2678 = _924 * _2670;
    int _2680 = _2678 + _2164;
    int _2682 = abs(_2664);
    int _2684 = ~_2642;
    int _2686 = _2684 + 1;
    int _2688 = _2686 + 1;
    bool _2690 = !_2196;
    int _2692 = _2690 ? 0 : 1;
    int _2694 = abs(_2674);
    int _2696 = _2688 * as_type<int>(_2538);
    int _2698 = ~_2676;
    int _2700 = _2698 + 1;
    int _2702 = _2700 + 1;
    int _2704 = abs(_2692);
    int _2706 = _2702 * as_type<int>(_2530);
    int _2708 = _2706 + _2696;
    int _2710 = ~_2682;
    int _2712 = _2710 + 1;
    int _2714 = _2712 + 1;
    int _2716 = ~_2694;
    int _2718 = _2716 + 1;
    int _2720 = _2718 + 1;
    int _2722 = _2714 * as_type<int>(_2564);
    int _2724 = _2722 + _2708;
    float _2726 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2728 = !_2005;
    int _2730 = _2728 ? _2680 : (-1);
    int _2732 = _2720 * as_type<int>(_2572);
    int _2734 = _2732 + _2724;
    float _2736 = -_2608;
    float _2738 = _2736 + 1.0;
    float _2740 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2726);
    bool _2742 = _1548 <= 8000.0;
    bool _2744 = isnan(_1548);
    bool _2746 = _2742 || _2744;
    bool _2748 = isnan(8000.0);
    bool _2750 = _2746 || _2748;
    float _2752 = float(_2750);
    float _2754 = fma(_2738, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2608);
    float _2756 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2740);
    float _2758 = in.m_77.x;
    int _2760 = ~_2704;
    int _2762 = _2760 + 1;
    int _2764 = _2762 + 1;
    float _2766 = _2752 * _2754;
    float _2768 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2756);
    int _2770 = _2734 * _2764;
    float _2772 = _2768 + _1890;
    float _2774 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2776 = _2730 * _2704;
    int _2778 = _2776 + _2770;
    float _2780 = _2772 * 0.5;
    float _2782 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2784 = _2628 * _2774;
    float _2786 = precise::clamp(_2784, 0.0, 1.0);
    float _2788 = fma(_2600, _2406, _2614);
    float _2790 = fma(_2606, _2406, _2618);
    float _2792 = _2782 * _1974;
    float _2794 = -_2786;
    float _2796 = fma(_2794, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_79.z = _2780;
    out.m_79.w = _1890;
    bool _2798 = _1694 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2800 = isnan(_1694);
    bool _2802 = _2798 || _2800;
    bool _2804 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2806 = _2802 || _2804;
    float _2808 = _1985 * _2792;
    float _2810 = _1995 * _2792;
    float _2812 = -_2782;
    float _2814 = _2812 + 1.0;
    out.gl_Position.x = _1952;
    out.gl_Position.y = _1918;
    out.gl_Position.z = _2768;
    out.gl_Position.w = _1890;
    float _2816 = _2796 * _2758;
    float _2818 = fma(_1991, _2808, _1979);
    float _2820 = fma(_1993, _2808, _1981);
    float _2822 = _1985 * _2814;
    float _2824 = _2816 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2826 = fma(_1985, _2810, _1983);
    out.m_81.x = _2788;
    out.m_81.y = _2644;
    out.m_81.z = _2790;
    float _2828 = float(_2778);
    float _2830 = _1600 * _1654;
    float _2832 = _2780;
    float _2834 = _2810;
    float _2836 = _2782;
    float _2838 = _2814;
    float _2840 = _2830;
    float _2842 = _2828;
    if (!_2806)
    {
        _2832 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2844 = _2832;
    out.m_83.x = _2824;
    float _2846 = _2844;
    float _2848 = _2844;
    if (!_2806)
    {
        _2834 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2850 = _2834;
    float _2852 = _2830 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2854 = _2850;
    float _2856 = _2850;
    if (!_2806)
    {
        _2836 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2858 = _2836;
    out.m_85.x = _2818;
    out.m_85.y = _2820;
    out.m_85.z = _2826;
    out.m_85.w = _2822;
    float _2860 = _2858;
    float _2862 = _2858;
    if (!_2806)
    {
        _2838 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2864 = _2838;
    float _2866 = _2864;
    float _2868 = _2864;
    if (!_2806)
    {
        _2840 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2870 = _2840;
    out.m_87.x = _2828;
    float _2872 = _2870;
    float _2874 = _2870;
    if (!_2806)
    {
        _2842 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2876 = _2842;
    bool _2878 = !_2806;
    float _2880 = _2876;
    float _2882 = _2876;
    if (!_2878)
    {
        bool _2884 = _1694 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2886 = isnan(_1694);
        bool _2888 = _2884 || _2886;
        bool _2890 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2892 = _2888 || _2890;
        if (!_2892)
        {
            float _2894 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2896 = _1694 + _2894;
            float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2900 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2898;
            float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2904 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2906 = 1.0 / _2900;
            float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2912 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2920 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2924 = _2896 * _2906;
            float _2926 = precise::clamp(_2924, 0.0, 1.0);
            float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2932 = fma(_2926, _2904, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2934 = fma(_2926, _2930, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2936 = fma(_2926, _2910, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2938 = fma(_2926, _2914, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2940 = fma(_2926, _2918, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2942 = fma(_2926, _2922, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2882 = _2936;
            _2868 = _2940;
            _2848 = _2932;
            _2862 = _2938;
            _2856 = _2934;
            _2874 = _2942;
            _2944 = true;
        }
        else
        {
            bool _2946 = _1694 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2948 = isnan(_1694);
            bool _2950 = _2946 || _2948;
            bool _2952 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2954 = _2950 || _2952;
            if (!_2954)
            {
                _2846 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2956 = _2846;
            _2848 = _2956;
            if (!_2954)
            {
                _2880 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2958 = _2880;
            _2882 = _2958;
            if (!_2954)
            {
                _2854 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2960 = _2854;
            _2856 = _2960;
            if (!_2954)
            {
                _2860 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2962 = _2860;
            _2862 = _2962;
            if (!_2954)
            {
                _2866 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2964 = _2866;
            _2868 = _2964;
            if (!_2954)
            {
                _2872 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2966 = _2872;
            bool _2968 = !_2954;
            _2874 = _2966;
            if (!_2968)
            {
                bool _2970 = _1694 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2972 = isnan(_1694);
                bool _2974 = _2970 || _2972;
                bool _2976 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2978 = _2974 || _2976;
                if (!_2978)
                {
                    float _2980 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2982 = _1694 + _2980;
                    float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2986 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2984;
                    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2990 = _2988 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2992 = 1.0 / _2986;
                    float _2994 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2996 = _2994 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2998 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3000 = _2998 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3002 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3004 = _3002 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3008 = _3006 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3010 = _2982 * _2992;
                    float _3012 = precise::clamp(_3010, 0.0, 1.0);
                    float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3018 = fma(_3012, _2990, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3020 = fma(_3012, _3016, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3022 = fma(_3012, _2996, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3024 = fma(_3012, _3000, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3026 = fma(_3012, _3004, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3028 = fma(_3012, _3008, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2882 = _3022;
                    _2868 = _3026;
                    _2848 = _3018;
                    _2862 = _3024;
                    _2856 = _3020;
                    _2874 = _3028;
                    _2944 = true;
                }
                else
                {
                    _2882 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2868 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2848 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2862 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2856 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2874 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2944 = false;
    float _3030 = _2882;
    float _3032 = _2868;
    float _3034 = _2848;
    float _3036 = _2862;
    float _3038 = _2856;
    float _3040 = _2874;
    float _3042 = fma(_2644, -0.5, 0.5);
    float _3044 = precise::clamp(_3042, 0.0, 1.0);
    float _3046 = -_3030;
    float _3048 = _3046 + _3032;
    float _3050 = _2852 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3052 = -_3034;
    float _3054 = _3052 + _3036;
    out.m_89.x = 0.0;
    float _3056 = fma(_3044, _3048, _3030);
    float _3058 = fma(_3044, _3054, _3034);
    out.m_53.x = _3050;
    float _3060 = -_3038;
    float _3062 = _3060 + _3040;
    float _3064 = _3056 * 0.586610972881317138671875;
    bool _3066 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3068 = fma(_3044, _3062, _3038);
    float _3070 = fma(_3058, 0.298911988735198974609375, _3064);
    bool _3072 = _1600 > 0.0;
    bool _3074 = isnan(_1600);
    bool _3076 = _3072 || _3074;
    bool _3078 = isnan(0.0);
    bool _3080 = _3076 || _3078;
    float _3082 = fma(_3068, 0.114477999508380889892578125, _3070);
    bool _3084 = _1654 <= 0.0;
    bool _3086 = !_3080;
    bool _3088 = _3084 || _3086;
    float _3090 = -_3082;
    float _3092 = _3058 + _3090;
    float _3094 = -_3082;
    float _3096 = _3056 + _3094;
    float _3098 = -_3082;
    float _3100 = _3068 + _3098;
    float _3102 = fma(_3092, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3082);
    float _3104 = fma(_3096, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3082);
    float _3106 = fma(_3100, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3082);
    bool _3108 = !_3066;
    if (!_3108)
    {
        float _3110 = -_1538;
        float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3114 = -_1540;
        float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3118 = -_1542;
        float _3120 = _3118 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3122 = _3112 * _3112;
        float _3124 = fma(_3116, _3116, _3122);
        float _3126 = fma(_3120, _3120, _3124);
        float _3128 = sqrt(_3126);
        float _3130 = rsqrt(_3126);
        float _3132 = -_3128;
        float _3134 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3136 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3138 = precise::clamp(_3136, 0.0, 1.0);
        float _3140 = _3116 * _3130;
        float _3142 = _3112 * _3130;
        float _3144 = abs(_3138);
        float _3146 = log2(_3144);
        float _3148 = _3120 * _3130;
        float _3150 = _3140 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3152 = _2644 * _3142;
        float _3154 = -_3142;
        float _3156 = -_3150;
        float _3158 = fma(_3154, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3156);
        float _3160 = fma(_2788, _3140, _3152);
        float _3162 = -_3148;
        float _3164 = fma(_3162, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3158);
        float _3166 = fma(_2790, _3148, _3160);
        float _3168 = precise::clamp(_3166, 0.0, 1.0);
        float _3170 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3172 = _3164 + _3170;
        float _3174 = _3146 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3176 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3178 = precise::clamp(_3176, 0.0, 1.0);
        float _3180 = exp2(_3174);
        float _3182 = _3180 * _3178;
        float _3184 = _3168 * _3182;
        float _3186 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3188 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3190 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3186;
        out.m_89.y = _3188;
        out.m_89.z = _3190;
    }
    out.m_91.x = _3102;
    out.m_91.y = _3104;
    out.m_91.z = _3106;
    if (!_3088)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3192 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3192;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2944 = false;
    bool _634 = false;
    bool _498 = false;
    bool _324 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3261 = as_type<float>(_134);
        out.gl_Position.z = _3261;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3316 = as_type<float>(_160);
        out.gl_Position.z = _3316;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _148;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _196 = _190;
    float _214;
    if (!_192)
    {
        float _198 = in.m_57.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        _214 = _172;
    }
    _216 = false;
    float _218 = _214;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _218 + _220;
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    bool _240 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _242 = isnan(_218);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -_234;
    float _254 = _252 + 1.0;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    float _260 = 1.0 / _238;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = _250 * _254;
    float _266 = -_250;
    float _268 = _266 + 1.0;
    float _270 = _222 * _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _284 = _276 * _264;
    float _286 = fma(_280, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = _282 * _264;
    float _290 = _286 * _264;
    float _292 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _294 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _290);
    float _296 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _298 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].x, _292);
    float _300 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].y, _294);
    float _302 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].z, _296);
    bool _304 = !_262;
    float _322;
    if (!_304)
    {
        float _306 = in.m_57.x;
        float _308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _310 = _306 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _314 = _312 * _308;
        float _316 = floor(_314);
        float _318 = -_316;
        float _320 = _314 + _318;
        _322 = _320;
        _324 = true;
    }
    else
    {
        _322 = _172;
    }
    _324 = false;
    float _326 = _322;
    float _328 = in.m_59.x;
    float _330 = in.m_59.y;
    float _332 = in.m_59.z;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _336 = _326 + _334;
    bool _338 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _340 = isnan(_326);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _358 = 1.0 / _352;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = 1.0 / _356;
    float _364 = _300 * _330;
    float _366 = _302 * _332;
    bool _368 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _370 = isnan(_326);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -_348;
    float _382 = _380 + 1.0;
    float _384 = _336 * _358;
    bool _386 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _388 = isnan(_326);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _400 = _326 + _398;
    float _402 = _378 * _382;
    float _404 = -_378;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _416;
    float _420 = _396 * _406;
    float _422 = fma(_410, _384, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _424 = fma(_414, _384, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _426 = fma(_418, _384, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _428 = _400 * _362;
    float _430 = _422 * _420;
    float _432 = _424 * _420;
    float _434 = _426 * _420;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _444 = -_396;
    float _446 = _444 + 1.0;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _452 = fma(_438, _428, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _454 = fma(_442, _428, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _456 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].x, _430);
    float _458 = fma(_450, _428, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _460 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].y, _432);
    float _462 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].z, _434);
    float _464 = fma(_452, _402, _456);
    float _466 = _298 * _328;
    float _468 = fma(_454, _402, _460);
    float _470 = fma(_458, _402, _462);
    float _472 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].x, _464);
    float _474 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].y, _468);
    float _476 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[109].z, _470);
    bool _478 = !_360;
    float _496;
    if (!_478)
    {
        float _480 = in.m_57.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        _496 = _172;
    }
    _498 = false;
    float _500 = _496;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _504 = _500 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _510 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _512 = isnan(_500);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _528 = isnan(_500);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _538;
    bool _542 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _544 = isnan(_500);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = 1.0 / _508;
    float _556 = -_520;
    float _558 = _556 + 1.0;
    bool _560 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _562 = 1.0 / _524;
    float _564 = _540 * _554;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _570 = -_552;
    float _572 = _570 + 1.0;
    float _574 = fma(_564, _504, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _576 = _536 * _558;
    float _578 = -_536;
    float _580 = _578 + 1.0;
    float _582 = _520 * _572;
    float _584 = _568 * _562;
    float _586 = _574 * _576;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _590 = _500 + _588;
    float _592 = _472 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _594 = _476 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _596 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _598 = fma(_584, _590, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _600 = _474 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _602 = fma(_598, _582, _596);
    float _604 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[117].x, _602);
    float _610 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _604;
    out.m_61.y = _606;
    out.m_61.z = _610;
    out.m_61.w = _612;
    bool _614 = !_560;
    float _632;
    if (!_614)
    {
        float _616 = in.m_57.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        _632 = _172;
    }
    _634 = false;
    float _636 = _632;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _640 = _636 + _638;
    bool _642 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _644 = isnan(_636);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _654;
    bool _658 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _660 = isnan(_636);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -_652;
    float _672 = _670 + 1.0;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _674;
    float _678 = 1.0 / _656;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _682 = _668 * _672;
    float _684 = -_668;
    float _686 = _684 + 1.0;
    float _688 = _640 * _678;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _690;
    float _694 = fma(_676, _688, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _696;
    float _700 = fma(_692, _688, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _702 = _694 * _682;
    float _704 = fma(_698, _688, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _706 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].x, _702);
    float _708 = _704 * _682;
    float _710 = _700 * _682;
    float _712 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].x, _706);
    float _714 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].y, _708);
    float _716 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[123].z, _710);
    float _718 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].y, _714);
    float _720 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[124].z, _716);
    bool _722 = !_680;
    if (!_722)
    {
        float _724 = in.m_57.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _194 = _738;
    }
    float _740 = _194;
    float _742 = in.m_57.z;
    float _744 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _746 = log2(_744);
    float _748 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _750 = in.m_57.x;
    float _752 = in.m_57.y;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _756 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _758 = int(_756);
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _764 = 1.0 + _762;
    float _766 = 1.0 / _764;
    float _768 = _742 * 2.0;
    float _770 = _750 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _772 = _750 * 2.0;
    float _774 = floor(_768);
    float _776 = _752 * 2.0;
    float _778 = -_754;
    float _780 = fma(_770, 2.0, _778);
    float _782 = _746 * _116;
    float _784 = _752 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _786 = _752 + _750;
    float _788 = -_116;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[76].x, _780);
    float _792 = floor(_772);
    float _794 = fma(_784, -2.0, _760);
    float _796 = _786 + (-1.0);
    float _798 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _794);
    float _800 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _802 = _774 >= 0.0;
    bool _804 = isnan(_774);
    bool _806 = _802 || _804;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    float _812 = exp2(_782);
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _816 = _814 != 0;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _820 = _818 != 0;
    int _822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _824 = _822 != 0;
    int _826 = _810 ? 0 : 1;
    bool _828 = _792 > 0.0;
    float _830 = floor(_776);
    bool _832 = !_820;
    int _834 = _832 ? 0 : 1;
    bool _836 = _774 > 0.0;
    bool _838 = _792 >= 0.0;
    bool _840 = isnan(_792);
    bool _842 = _838 || _840;
    bool _844 = isnan(0.0);
    bool _846 = _842 || _844;
    int _848 = ~_826;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = -_812;
    float _856 = _854 + 1.0;
    bool _858 = !_816;
    int _860 = _858 ? 0 : 1;
    bool _862 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _864 = isnan(0.0);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _870 = _866 || _868;
    float _872 = float(_758);
    bool _874 = !_824;
    int _876 = _874 ? 0 : 1;
    float _878 = in.m_63.x;
    float _880 = in.m_63.y;
    float _882 = in.m_63.z;
    int _884 = _852;
    if (!_836)
    {
        int _886 = ~_826;
        int _888 = _886 + 1;
        _884 = _888;
    }
    int _890 = _884;
    float _892 = 1.0 / _872;
    bool _894 = _830 > 0.0;
    bool _896 = _830 >= 0.0;
    bool _898 = isnan(_830);
    bool _900 = _896 || _898;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    float _906 = _870 ? _856 : 0.0;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _920 = _918 != 0;
    float _922 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _924 = int(_922);
    float _926 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[78].w, _908);
    int _928 = _846 ? 0 : 1;
    bool _930 = !_912;
    int _932 = _930 ? 0 : 1;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _936 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _938 = isnan(1.0);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _944 = _940 || _942;
    float _946 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _926);
    int _948 = abs(_932);
    float _950 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[78].z, _934);
    float _952 = float(_890);
    float _954 = _892 * _116;
    float _956 = float(_948);
    float _958 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _950);
    bool _960 = !_916;
    int _962 = _960 ? 0 : 1;
    float _964 = float(_924);
    float _966 = _956 * _952;
    int _968 = ~_928;
    int _970 = _968 + 1;
    int _972 = _970 + 1;
    float _974 = _750 + (-0.5);
    int _976 = _972;
    if (!_828)
    {
        int _978 = ~_928;
        int _980 = _978 + 1;
        _976 = _980;
    }
    int _982 = _976;
    float _984 = _964 * _116;
    if (_944)
    {
        float _986 = _906 * _766;
        _126 = _986;
    }
    float _988 = _126;
    int _990 = abs(_962);
    float _992 = _966 * (-2.0);
    int _994 = _904 ? 0 : 1;
    float _996 = fma(_992, _878, _878);
    float _998 = float(_982);
    float _1000 = fma(_800, _992, _800);
    float _1002 = float(_990);
    float _1004 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[196].x, _996);
    bool _1006 = !_920;
    int _1008 = _1006 ? 0 : 1;
    int _1010 = ~_994;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    float _1016 = _1002 * _998;
    int _1018 = _1014;
    if (!_894)
    {
        int _1020 = ~_994;
        int _1022 = _1020 + 1;
        _1018 = _1022;
    }
    int _1024 = _1018;
    float _1026 = _752 + _742;
    int _1028 = abs(_1008);
    float _1030 = fma(_1000, _988, _1004);
    float _1032 = _1026 + (-1.0);
    float _1034 = float(_1024);
    float _1036 = _1016 * (-2.0);
    float _1038 = float(_1028);
    float _1040 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1042 = _742 + _750;
    float _1044 = fma(_1036, _880, _880);
    float _1046 = _1038 * _1034;
    float _1048 = _752 + (-0.5);
    float _1050 = _1042 + (-1.0);
    float _1052 = fma(_1040, _1036, _1040);
    float _1054 = _742 + (-0.5);
    float _1056 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1044);
    float _1058 = _1046 * (-2.0);
    float _1060 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1062 = _1030 * 0.15915493667125701904296875;
    float _1064 = fma(_1052, _988, _1056);
    float _1066 = fma(_1058, _882, _882);
    float _1068 = in.m_65.x;
    float _1070 = in.m_65.y;
    float _1072 = in.m_65.z;
    float _1074 = fma(_1060, _1058, _1060);
    float _1076 = _1064 * 0.15915493667125701904296875;
    float _1078 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1066);
    float _1080 = _1062 * 6.283185482025146484375;
    float _1082 = cos(_1080);
    float _1084 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1086 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1088 = fma(_1074, _988, _1078);
    float _1090 = in.m_46.x;
    float _1092 = in.m_46.y;
    float _1094 = in.m_46.z;
    float _1096 = _1088 * 0.15915493667125701904296875;
    float _1098 = _1076 * 6.283185482025146484375;
    float _1100 = sin(_1098);
    float _1102 = _1076 * 6.283185482025146484375;
    float _1104 = cos(_1102);
    float _1106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1072);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1068);
    float _1110 = _1062 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = _1086 * _1106;
    float _1116 = _748 * _1108;
    float _1118 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1120 = _1096 * 6.283185482025146484375;
    float _1122 = cos(_1120);
    float _1124 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1070);
    float _1126 = _1082 * _1104;
    float _1128 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1118);
    float _1130 = _1084 * _1124;
    float _1132 = _1082 * _1100;
    float _1134 = _1096 * 6.283185482025146484375;
    float _1136 = sin(_1134);
    float _1138 = _1112 * _1100;
    float _1140 = _1112 * _1104;
    float _1142 = _1082 * _1122;
    float _1144 = _1112 * _1122;
    float _1146 = _1104 * _1122;
    float _1148 = _1100 * _1122;
    float _1150 = _1142 * _1130;
    float _1152 = _1144 * _1130;
    float _1154 = fma(_1136, _1126, _1138);
    float _1156 = -_1132;
    float _1158 = fma(_1136, _1140, _1156);
    float _1160 = -_1140;
    float _1162 = fma(_1136, _1132, _1160);
    float _1164 = -_1130;
    float _1166 = _1136 * _1164;
    float _1168 = fma(_1154, _1116, _1150);
    float _1170 = fma(_1136, _1138, _1126);
    float _1172 = fma(_1158, _1116, _1152);
    float _1174 = fma(_1146, _1116, _1166);
    float _1176 = fma(_1162, _1114, _1168);
    float _1178 = fma(_1094, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1128);
    float _1180 = fma(_1148, _1114, _1174);
    float _1182 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1184 = fma(_1170, _1114, _1172);
    float _1186 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1188 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1190 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1182);
    float _1192 = _1178 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1194 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1186);
    float _1196 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1188);
    float _1198 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1190);
    float _1200 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1202 = fma(_1094, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1194);
    float _1204 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1196);
    float _1206 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1208 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1200);
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1214 = _1192 + _1206;
    float _1216 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1218 = fma(_1094, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1208);
    float _1220 = _1210 + _1212;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1224 = _1214 + _1222;
    float _1226 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1216);
    float _1228 = _1218 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1232 = _1220 + _1230;
    float _1234 = _1224 * _1224;
    float _1236 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1226);
    float _1238 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1240 = fma(_1232, _1232, _1234);
    float _1242 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1244 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1238);
    float _1246 = sqrt(_1240);
    float _1248 = _1228 + _1242;
    float _1250 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1244);
    bool _1252 = _1246 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = _1244;
    float _1256 = _1176;
    float _1258 = _1242;
    float _1260 = _1248;
    float _1262 = _1228;
    if (!_1252)
    {
        _1254 = _1220;
    }
    float _1264 = _1254;
    float _1266 = _1264;
    if (!_1252)
    {
        _1256 = _1214;
    }
    float _1268 = _1256;
    float _1270 = _1268;
    if (!_1252)
    {
        _1258 = _1248;
    }
    float _1272 = _1258;
    bool _1274 = !_1252;
    float _1276 = _1272;
    if (!_1274)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1282 = _1246 + _1280;
        float _1284 = rsqrt(_1240);
        float _1286 = _1282 * _1278;
        float _1288 = _1248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1290 = _1286 * 0.15915493667125701904296875;
        float _1292 = _1290 * 6.283185482025146484375;
        float _1294 = cos(_1292);
        float _1296 = _1290 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        float _1300 = _1294 + (-1.0);
        float _1302 = fma(_1298, _1288, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1304 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1306 = _1284 * _1302;
        float _1308 = fma(_1248, _1294, _1304);
        float _1310 = fma(_1232, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1312 = fma(_1224, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1276 = _1308;
        _1266 = _1310;
        _1270 = _1312;
    }
    float _1314 = _1276;
    float _1316 = _1266;
    float _1318 = _1270;
    float _1320 = -_1228;
    float _1322 = _1320 + _1314;
    float _1324 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1326 = -_1210;
    float _1328 = _1326 + _1316;
    float _1330 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1332 = _1322 * _1322;
    float _1334 = -_1192;
    float _1336 = _1334 + _1318;
    float _1338 = 1.0 / _1324;
    float _1340 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1330);
    float _1342 = fma(_1328, _1328, _1332);
    float _1344 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1340);
    float _1346 = fma(_1336, _1336, _1342);
    bool _1348 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1350 = isnan(0.5);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1356 = _1352 || _1354;
    float _1358 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1360 = sqrt(_1346);
    bool _1362 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1364 = isnan(0.5);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1370 = _1366 || _1368;
    float _1372 = _1358 + _1324;
    float _1374 = _1372 * _1338;
    float _1376 = _1374 * 0.5;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1380 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1378);
    bool _1382 = _1360 > 0.0;
    float _1384 = 1.0 / _1380;
    float _1386 = _1338;
    float _1388 = _1360;
    float _1390 = _1316;
    float _1392 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1394 = _1314;
    float _1396 = _1318;
    if (!_1382)
    {
        _1386 = _1314;
    }
    float _1398 = _1386;
    float _1400 = _1398;
    if (!_1382)
    {
        _1388 = _1318;
    }
    float _1402 = _1388;
    bool _1404 = !_1382;
    float _1406 = _1402;
    if (!_1404)
    {
        float _1408 = _188 * _188;
        float _1410 = fma(_186, _186, _1408);
        float _1412 = fma(_190, _190, _1410);
        float _1414 = rsqrt(_1346);
        float _1416 = sqrt(_1412);
        float _1418 = _1328 * _1414;
        float _1420 = _1322 * _1414;
        float _1422 = _1336 * _1414;
        bool _1424 = _1416 > 0.0;
        float _1426 = _1416;
        float _1428 = _1414;
        _1392 = _1412;
        _1260 = _1418;
        if (!_1424)
        {
            _1426 = _1314;
        }
        float _1430 = _1426;
        _1400 = _1430;
        if (!_1424)
        {
            _1428 = _1318;
        }
        float _1432 = _1428;
        bool _1434 = !_1424;
        _1406 = _1432;
        if (!_1434)
        {
            float _1436 = rsqrt(_1412);
            float _1438 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1440 = _188 * _1436;
            float _1442 = _186 * _1436;
            float _1444 = _1420 * _1440;
            float _1446 = _190 * _1436;
            float _1448 = fma(_1418, _1442, _1444);
            float _1450 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1452 = fma(_1422, _1446, _1448);
            float _1454 = _1452 * _1450;
            float _1456 = fma(_186, _1454, _1316);
            float _1458 = fma(_188, _1454, _1314);
            float _1460 = fma(_190, _1454, _1318);
            _1390 = _1456;
            _1400 = _1458;
            _1406 = _1460;
            _1392 = _1436;
        }
    }
    float _1462 = _1390;
    float _1464 = _1400;
    float _1466 = _1406;
    float _1468 = _1392;
    float _1470 = _1260;
    float _1472 = _1466;
    float _1474 = _1470;
    if (_1370)
    {
        _1394 = 1.0;
    }
    float _1476 = _1394;
    float _1478 = _1476;
    if (_1356)
    {
        _1396 = _1462;
    }
    float _1480 = _1396;
    float _1482 = _1480;
    if (_1356)
    {
        _196 = _1464;
    }
    float _1484 = _196;
    float _1486 = _1484;
    if (!_1356)
    {
        float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1490 = _1228 + _1488;
        float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1494 = _1210 + _1492;
        float _1496 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1498 = -_1228;
        float _1500 = _1498 + _1464;
        float _1502 = _1490 * _1490;
        float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1506 = _1192 + _1504;
        float _1508 = -_1210;
        float _1510 = _1508 + _1462;
        float _1512 = -_1192;
        float _1514 = _1512 + _1466;
        float _1516 = fma(_1494, _1494, _1502);
        float _1518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1520 = fma(_1506, _1506, _1516);
        float _1522 = sqrt(_1520);
        float _1524 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1526 = precise::min(_1522, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1528 = _1526 * _1518;
        float _1530 = _1524 * _1528;
        float _1532 = fma(_1500, _1530, _1228);
        float _1534 = fma(_1510, _1530, _1210);
        float _1536 = fma(_1514, _1530, _1192);
        _1486 = _1532;
        _1482 = _1534;
        _1472 = _1536;
    }
    float _1538 = _1486;
    float _1540 = _1482;
    float _1542 = _1472;
    if (_1370)
    {
        _1262 = 1.0;
    }
    float _1544 = _1262;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1548 = _1384 * _1546;
    float _1550 = _1544;
    if (!_1370)
    {
        float _1552 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1554 = _1552 * 0.15915493667125701904296875;
        float _1556 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1558 = _1554 * 6.283185482025146484375;
        float _1560 = cos(_1558);
        float _1562 = _1556 * 0.15915493667125701904296875;
        float _1564 = _1554 * 6.283185482025146484375;
        float _1566 = sin(_1564);
        float _1568 = 1.0 / _1560;
        float _1570 = _1562 * 6.283185482025146484375;
        float _1572 = cos(_1570);
        float _1574 = _1566 * _1568;
        float _1576 = _1562 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = _1572 * _1574;
        float _1582 = 1.0 / _1580;
        float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1586 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1584;
        float _1588 = 1.0 / _1586;
        float _1590 = _1578 * _1582;
        float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1594 = fma(_1548, _1590, _1592);
        float _1596 = _1594 * _1588;
        float _1598 = precise::clamp(_1596, 0.0, 1.0);
        _1478 = _1598;
    }
    float _1600 = _1478;
    if (!_1370)
    {
        float _1602 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1604 = _1602 * 0.15915493667125701904296875;
        float _1606 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1608 = _1604 * 6.283185482025146484375;
        float _1610 = cos(_1608);
        float _1612 = _1606 * 0.15915493667125701904296875;
        float _1614 = _1604 * 6.283185482025146484375;
        float _1616 = sin(_1614);
        float _1618 = 1.0 / _1610;
        float _1620 = _1612 * 6.283185482025146484375;
        float _1622 = cos(_1620);
        float _1624 = _1616 * _1618;
        float _1626 = _1612 * 6.283185482025146484375;
        float _1628 = sin(_1626);
        float _1630 = _1622 * _1624;
        float _1632 = 1.0 / _1630;
        float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1636 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1634;
        float _1638 = 1.0 / _1636;
        float _1640 = _1628 * _1632;
        float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1644 = fma(_1548, _1640, _1642);
        float _1646 = _1644 * _1638;
        float _1648 = precise::clamp(_1646, 0.0, 1.0);
        float _1650 = -_1648;
        float _1652 = _1650 + 1.0;
        _1550 = _1652;
    }
    float _1654 = _1550;
    float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1658 = _1538 + _1656;
    float _1660 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1662 = _1540 + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1666 = _1542 + _1664;
    float _1668 = _1658 * _1658;
    float _1670 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1672 = fma(_1662, _1662, _1668);
    float _1674 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1676 = fma(_1210, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1678 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1680 = fma(_1666, _1666, _1672);
    float _1682 = precise::max(0.0, _1674);
    float _1684 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1678);
    float _1686 = rsqrt(_1680);
    float _1688 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1670);
    float _1690 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1684);
    float _1692 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1694 = sqrt(_1680);
    float _1696 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1698 = _1662 * _1696;
    float _1700 = _1666 * _1696;
    float _1702 = -_1696;
    float _1704 = -_1682;
    float _1706 = fma(_1658, _1702, _1704);
    float _1708 = _1698 * _1698;
    float _1710 = _1700 * _1700;
    float _1712 = _1708 + _1710;
    float _1714 = sqrt(_1712);
    bool _1716 = _1714 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1720 = _1714 + _1718;
    float _1722 = _1468;
    float _1724 = _1682;
    float _1726 = _1712;
    float _1728 = _1720;
    float _1730 = _1658;
    float _1732 = _1698;
    float _1734 = _1700;
    float _1736 = _1708;
    float _1738 = _1710;
    if (_1716)
    {
        float _1740 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1722 = _1740;
    }
    float _1742 = _1722;
    if (_1716)
    {
        float _1744 = _1706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1724 = _1744;
    }
    float _1746 = _1724;
    if (_1716)
    {
        float _1748 = rsqrt(_1712);
        _1726 = _1748;
    }
    float _1750 = _1726;
    if (_1716)
    {
        float _1752 = _1720 * _1742;
        _1728 = _1752;
    }
    float _1754 = _1728;
    if (_1716)
    {
        float _1756 = _1754 * 0.15915493667125701904296875;
        _1474 = _1756;
    }
    float _1758 = _1474;
    float _1760 = _1742;
    float _1762 = _1758;
    if (_1716)
    {
        float _1764 = _1758 * 6.283185482025146484375;
        float _1766 = sin(_1764);
        _1760 = _1766;
    }
    float _1768 = _1760;
    float _1770 = _1754;
    if (_1716)
    {
        float _1772 = _1758 * 6.283185482025146484375;
        float _1774 = cos(_1772);
        _1770 = _1774;
    }
    float _1776 = _1770;
    float _1778 = _1768;
    if (_1716)
    {
        float _1780 = fma(_1768, _1746, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1730 = _1780;
    }
    float _1782 = _1730;
    float _1784 = floor(_1676);
    float _1786 = _1782;
    if (_1716)
    {
        float _1788 = _1750 * _1782;
        _1762 = _1788;
    }
    float _1790 = _1762;
    if (!_1716)
    {
        _1786 = _1706;
    }
    float _1792 = _1786;
    float _1794 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1796 = _1792;
    if (_1716)
    {
        float _1798 = _1776 + (-1.0);
        _1778 = _1798;
    }
    float _1800 = _1778;
    float _1802 = _1800;
    if (_1716)
    {
        float _1804 = _1698 * _1790;
        _1732 = _1804;
    }
    float _1806 = _1732;
    if (_1716)
    {
        float _1808 = _1700 * _1790;
        _1734 = _1808;
    }
    float _1810 = _1734;
    if (_1716)
    {
        float _1812 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1802 = _1812;
    }
    float _1814 = _1802;
    if (_1716)
    {
        float _1816 = _1806 * _1806;
        _1736 = _1816;
    }
    float _1818 = _1736;
    if (_1716)
    {
        float _1820 = _1810 * _1810;
        _1738 = _1820;
    }
    float _1822 = _1738;
    if (_1716)
    {
        float _1824 = fma(_1706, _1776, _1814);
        _1796 = _1824;
    }
    float _1826 = _1796;
    float _1828 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1830 = fma(_1826, _1826, _1818);
    float _1832 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1828);
    float _1834 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1794);
    float _1836 = _1830 + _1822;
    float _1838 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1832);
    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1842 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1840);
    float _1844 = precise::clamp(_1842, 0.0, 1.0);
    float _1846 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1834);
    float _1848 = rsqrt(_1836);
    float _1850 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1852 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1854 = -_1844;
    float _1856 = _1854 + 1.0;
    float _1858 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1860 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1862 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1688);
    float _1864 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1866 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1868 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1860);
    float _1870 = abs(_1856);
    float _1872 = log2(_1870);
    float _1874 = -_1864;
    float _1876 = fma(_1874, _1850, 1.0);
    float _1878 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1880 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1868);
    float _1882 = -_1784;
    float _1884 = _1676 + _1882;
    float _1886 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1888 = _1848 * _1806;
    float _1890 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1880);
    float _1892 = _1848 * _1826;
    float _1894 = _1848 * _1810;
    float _1896 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1898 = floor(_1866);
    float _1900 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1902 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1886);
    float _1904 = -_1896;
    float _1906 = fma(_1892, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1904);
    float _1908 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1910 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1902);
    float _1912 = -_1894;
    float _1914 = fma(_1912, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1906);
    float _1916 = log2(_1876);
    float _1918 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1910);
    float _1920 = fma(_1914, -0.5, 0.5);
    float _1922 = fma(_1914, 0.5, 0.5);
    float _1924 = exp2(_1908);
    float _1926 = -_1898;
    float _1928 = _1866 + _1926;
    float _1930 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1900);
    float _1932 = fma(_1922, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1934 = _1892 + 1.0;
    float _1936 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1930);
    float _1938 = fma(_1922, _1932, -0.212114393711090087890625);
    float _1940 = 1.0 / _1890;
    float _1942 = _1916 * 0.693147182464599609375;
    float _1944 = fma(_1922, _1938, 1.570728778839111328125);
    float _1946 = sqrt(_1920);
    float _1948 = -_1892;
    float _1950 = fma(_1924, _1934, _1948);
    float _1952 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1936);
    float _1954 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1956 = _1952 * _1940;
    float _1958 = _1918 * _1940;
    float _1960 = _1946 * 0.636619746685028076171875;
    float _1962 = fma(_1956, 0.5, 0.5);
    float _1964 = fma(_1958, -0.5, 0.5);
    float _1966 = -_1944;
    float _1968 = fma(_1960, _1966, 1.0);
    float _1970 = fma(_1950, 0.5, 0.5);
    float2 _6173 = float2(_1884, _1928);
    float _1972 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6173, float2(0.0), isnan(_6173)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6173, float2(0.0), isnan(_6173)), level(0.0)).x;
    float3 _6184 = float3(_1962, _1964, _1954);
    float _1974 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6184, float3(0.0), isnan(_6184)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6184, float3(0.0), isnan(_6184)), level(0.0)).x;
    float3 _6195 = float3(_1962, _1964, _1954);
    float4 _1977 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6195, float3(0.0), isnan(_6195)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6195, float3(0.0), isnan(_6195)), level(0.0)).xyzw;
    float _1979 = _1977.x;
    float _1981 = _1977.y;
    float _1983 = _1977.z;
    float _1985 = _1977.w;
    float2 _6211 = float2(_1968, _1970);
    float3 _1989 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6211, float2(0.0), isnan(_6211)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6211, float2(0.0), isnan(_6211)), level(0.0)).xyz;
    float _1991 = _1989.x;
    float _1993 = _1989.y;
    float _1995 = _1989.z;
    float _1997 = float(uint(_924));
    float _1999 = trunc(_954);
    int _2001 = int(_1999);
    float _2003 = _984 * _168;
    bool _2005 = _924 == 0;
    float _2007 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2009 = ~_924;
    int _2011 = _2009 + 1;
    int _2013 = _924 + (-1);
    float _2015 = 1.0 / _1997;
    int _2017 = abs(_834);
    int _2019 = abs(_876);
    float _2021 = float(uint(_2001));
    float _2023 = trunc(_2003);
    int _2025 = int(_2023);
    int _2027 = as_type<int>(_2015) + (-2);
    float _2029 = exp2(_2007);
    float _2031 = as_type<float>(_2027) * _2021;
    float _2033 = trunc(_2031);
    float _2035 = precise::max(_2033, 0.0);
    uint _2038 = uint(_2035);
    float _2040 = -_2029;
    float _2042 = _2040 + 1.0;
    int _2044 = _2011 * int(_2038);
    int _2046 = _2044 + _2001;
    float _2048 = float(uint(_2046));
    float _2050 = as_type<float>(_2027) * _2048;
    int _2052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2054 = _2052 != 0;
    float _2056 = trunc(_2050);
    float _2058 = precise::max(_2056, 0.0);
    uint _2060 = uint(_2058);
    int _2062 = ~_924;
    int _2064 = _2062 + 1;
    bool _2066 = !_2054;
    float _2068 = _2066 ? 7.345489978790283203125 : 1.0;
    float _2070 = _2068 * _750;
    float _2072 = floor(_2070);
    int _2074 = int(_2038) + int(_2060);
    float _2076 = float(_2001);
    int _2078 = _2064 * _2074;
    int _2080 = _2078 + _2001;
    bool _2082 = _2076 >= _964;
    bool _2084 = isnan(_2076);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan(_964);
    bool _2090 = _2086 || _2088;
    float _2092 = float(_2090);
    bool _2094 = uint(_2080) >= uint(_924);
    float _2096 = trunc(_2092);
    int _2098 = int(_2096);
    float _2100 = -_2072;
    float _2102 = _2070 + _2100;
    float _2104 = _2102 * _964;
    bool _2106 = !_2094;
    int _2108 = _2106 ? 0 : (-1);
    float _2110 = trunc(_2104);
    int _2112 = int(_2110);
    int _2114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2116 = _2114 != 0;
    int _2118 = ~_2074;
    int _2120 = _2118 + _2108;
    int _2122 = _2120 + 1;
    int _2124 = ~_2098;
    int _2126 = _2124 + 1;
    int _2128 = _2126 + 1;
    int _2130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2132 = _2130 != 0;
    int _2134 = _924 * _2122;
    int _2136 = _2134 + _2001;
    bool _2138 = !_2116;
    int _2140 = _2138 ? 0 : 1;
    int _2142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2144 = _2142 != 0;
    bool _2146 = !_2005;
    int _2148 = _2146 ? _2136 : (-1);
    int _2150 = abs(_2140);
    bool _2152 = !_2144;
    int _2154 = _2152 ? 0 : 1;
    int _2156 = _2148 * _2128;
    int _2158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2160 = _2158 != 0;
    int _2162 = _2112 * _2150;
    int _2164 = _2162 + _2001;
    int _2166 = abs(_2154);
    int _2168 = _2098 * _2013;
    int _2170 = _2168 + _2156;
    int _2172 = abs(_860);
    float _2174 = in.m_67.y;
    int _2176 = ~_924;
    int _2178 = _2176 + 1;
    int _2180 = _2170 * _2017;
    float _2182 = as_type<float>(_2017);
    if (_2132)
    {
        float _2184 = in.m_57.x;
        _2182 = _2184;
    }
    float _2186 = _2182;
    bool _2188 = _752 > 0.5;
    int _2190 = _2025 * _2172;
    int _2192 = _2190 + _2180;
    int _2194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2196 = _2194 != 0;
    float _2198 = in.m_67.x;
    float _2200 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2200;
    int _2204 = _2164 * _2019;
    int _2206 = _2204 + _2192;
    bool _2208 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2210 = isnan(_740);
    bool _2212 = _2208 || _2210;
    bool _2214 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2216 = _2212 || _2214;
    float _2218 = float(_2216);
    int _2220 = _2112 * _2166;
    int _2222 = _2220 + _2206;
    float _2224 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2226 = _2224 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2228 = float(uint(_2222));
    float _2230 = 1.0 / _2226;
    float _2232 = as_type<float>(_2027) * _2228;
    float _2234 = -_2174;
    float _2236 = _2234 + 1.0;
    float _2238 = trunc(_2232);
    float _2240 = precise::max(_2238, 0.0);
    uint _2242 = uint(_2240);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _2244 = _2174;
    float _2246 = _2202;
    if (_2160)
    {
        float _2248 = _2188 ? _2236 : _2174;
        _2244 = _2248;
    }
    float _2250 = _2244;
    bool _2252 = _2186 > 0.5;
    bool _2254 = _2252 && _2132;
    float _2256 = _2186;
    if (_2132)
    {
        _2256 = _2198;
    }
    float _2258 = _2256;
    float _2260 = _2202 * _2230;
    float _2262 = _2258;
    if (!_2132)
    {
        _2246 = _2198;
    }
    float _2264 = _2246;
    float _2266 = float(uint(_2164));
    float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2270 = _740 + _2268;
    bool _2272 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2274 = isnan(_740);
    bool _2276 = _2272 || _2274;
    bool _2278 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2280 = _2276 || _2278;
    float _2282 = float(_2280);
    int _2284 = _2178 * int(_2242);
    int _2286 = _2284 + _2222;
    float _2288 = -_2218;
    float _2290 = _2288 + 1.0;
    float _2292 = as_type<float>(_2027) * _2266;
    float _2294 = fma(_2260, _2270, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2296 = _2264;
    if (_2254)
    {
        float _2298 = -_2258;
        float _2300 = _2298 + 1.0;
        _2262 = _2300;
    }
    float _2302 = _2262;
    float _2304 = float(uint(_2286));
    float _2306 = _2282 * _2290;
    float _2308 = -_2282;
    float _2310 = _2308 + 1.0;
    float _2312 = trunc(_2292);
    float _2314 = precise::max(_2312, 0.0);
    uint _2316 = uint(_2314);
    float _2318 = in.m_71.x;
    float _2320 = in.m_71.y;
    float _2322 = in.m_71.z;
    float _2324 = as_type<float>(_2027) * _2304;
    float _2326 = _2294 * _2306;
    int _2328 = ~_924;
    int _2330 = _2328 + 1;
    if (_2132)
    {
        _2296 = _2302;
    }
    float _2332 = _2296;
    float _2334 = fma(_2250, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2336 = trunc(_2324);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    bool _2342 = _1070 != 0.0;
    bool _2344 = isnan(_1070);
    bool _2346 = _2342 || _2344;
    bool _2348 = isnan(0.0);
    bool _2350 = _2346 || _2348;
    float _2352 = fma(_2310, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2326);
    float _2354 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2356 = -_798;
    float _2358 = fma(_946, _2334, _2356);
    bool _2360 = _1068 == 0.0;
    bool _2362 = !_2350;
    bool _2364 = _2360 && _2362;
    float _2366 = fma(_958, _2354, _790);
    float _2368 = abs(_1548);
    float _2370 = log2(_2368);
    bool _2372 = _1072 == 0.0;
    bool _2374 = _2372 && _2364;
    int _2376 = int(_2242) + int(_2340);
    int _2378 = ~_924;
    int _2380 = _2378 + 1;
    float _2382 = _2320;
    float _2384 = _2318;
    float _2386 = _2322;
    if (!_2374)
    {
        float _2388 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2320);
        _2382 = _2388;
    }
    float _2390 = _2382;
    int _2392 = _2330 * int(_2316);
    int _2394 = _2392 + _2164;
    float _2396 = _2358 + 0.5;
    if (!_2374)
    {
        float _2398 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2318);
        _2384 = _2398;
    }
    float _2400 = _2384;
    float _2402 = _2366 + 0.5;
    if (!_2374)
    {
        float _2404 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2322);
        _2386 = _2404;
    }
    float _2406 = _2386;
    float _2408 = float(uint(_2394));
    int _2410 = _2380 * _2376;
    int _2412 = _2410 + _2222;
    float _2414 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2352);
    float _2416 = _718 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_73.x = _2402;
    out.m_73.y = _2396;
    float _2418 = as_type<float>(_2027) * _2408;
    bool _2420 = uint(_2412) >= uint(_924);
    float _2422 = _712 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2424 = _720 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2426 = ~_924;
    int _2428 = _2426 + 1;
    float _2430 = _2416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2432 = !_2420;
    int _2434 = _2432 ? 0 : (-1);
    float _2436 = trunc(_2418);
    float _2438 = precise::max(_2436, 0.0);
    uint _2440 = uint(_2438);
    float _2442 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2444 = _2424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2446 = ~_2376;
    int _2448 = _2446 + _2434;
    int _2450 = _2448 + 1;
    float _2452 = _2414 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2454 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2456 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2458 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2460 = _924 * _2450;
    int _2462 = _2460 + _2222;
    out.m_75.x = _2442;
    out.m_75.y = _2430;
    out.m_75.z = _2444;
    out.m_75.w = _2452;
    float _2464 = -_1136;
    float _2466 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2456);
    float _2468 = exp2(_2454);
    float _2470 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2472 = !_2005;
    int _2474 = _2472 ? _2462 : (-1);
    float _2476 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2470);
    int _2478 = _2474 >> 31;
    int _2480 = int(_2316) + int(_2440);
    float _2482 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2484 = _2478 & 3;
    float _2486 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2488 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2490 = _2428 * _2480;
    int _2492 = _2490 + _2164;
    int _2494 = _2474 + _2484;
    float _2496 = -_1136;
    float _2498 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2482);
    float _2500 = -_1136;
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2486);
    float _2504 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2506 = _2494 >> 2;
    float _2508 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2498);
    bool _2510 = uint(_2492) >= uint(_924);
    float _2512 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2466);
    int _2514 = _2506 << 4;
    int _2516 = _2514 + 368;
    float _2518 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2502);
    float _2520 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2458);
    float _2522 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _2524 = uint(int(uint(_2516) >> uint(2)));
    uint _2526 = uint(int(uint(int(_2524)) >> uint(2)));
    int _2528 = int(_2524) & 3;
    float _2530 = (*spvDescriptorSet0.vp_c9)._m0[int(_2526)][_2528];
    int _2532 = int(_2524) + 1;
    uint _2534 = uint(int(uint(_2532) >> uint(2)));
    int _2536 = _2532 & 3;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[int(_2534)][_2536];
    float _2540 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2542 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2504);
    float _2544 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2522);
    float _2546 = _2508 * _2390;
    float _2548 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2550 = precise::clamp(_2548, 0.0, 1.0);
    float _2552 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2488);
    float _2554 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2540);
    int _2556 = _2516 + 8;
    uint _2558 = uint(int(uint(_2556) >> uint(2)));
    uint _2560 = uint(int(uint(int(_2558)) >> uint(2)));
    int _2562 = int(_2558) & 3;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[int(_2560)][_2562];
    int _2566 = int(_2558) + 1;
    uint _2568 = uint(int(uint(_2566) >> uint(2)));
    int _2570 = _2566 & 3;
    float _2572 = (*spvDescriptorSet0.vp_c9)._m0[int(_2568)][_2570];
    int _2574 = _2474 & 3;
    bool _2576 = _2574 != 0;
    float _2578 = _2512 * _2390;
    float _2580 = _2518 * _2390;
    float _2582 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2520);
    bool _2584 = uint(_2574) > 1u;
    float _2586 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2542);
    int _2588 = _2474 & 3;
    bool _2590 = _2588 != 0;
    float _2592 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2544);
    float _2594 = fma(_2550, -2.0, 3.0);
    float _2596 = _2550 * _2550;
    int _2598 = _2590 ? 0 : 1;
    float _2600 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2552);
    bool _2602 = _2574 != 3;
    float _2604 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2554);
    float _2606 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2476);
    float _2608 = _2596 * _2594;
    bool _2610 = !_2510;
    int _2612 = _2610 ? 0 : (-1);
    float _2614 = fma(_2582, _2400, _2546);
    bool _2616 = uint(_2574) >= 2u;
    float _2618 = fma(_2592, _2400, _2580);
    int _2620 = ~_2598;
    int _2622 = _2620 + 1;
    int _2624 = _2622 + 1;
    float _2626 = -_1972;
    float _2628 = _2626 + 1.0;
    int _2630 = _2624;
    if (!_2584)
    {
        int _2632 = ~_2598;
        int _2634 = _2632 + 1;
        _2630 = _2634;
    }
    int _2636 = _2630;
    float _2638 = fma(_2586, _2400, _2578);
    int _2640 = _2616 ? 0 : 1;
    int _2642 = abs(_2636);
    float _2644 = fma(_2604, _2406, _2638);
    bool _2646 = !_2576;
    int _2648 = _2646 ? 0 : 1;
    int _2650 = ~_2640;
    int _2652 = _2650 + 1;
    int _2654 = _2652 + 1;
    bool _2656 = _2574 != 3;
    int _2658 = _2654;
    if (_2602)
    {
        int _2660 = ~_2640;
        int _2662 = _2660 + 1;
        _2658 = _2662;
    }
    int _2664 = _2658;
    int _2666 = ~_2480;
    int _2668 = _2666 + _2612;
    int _2670 = _2668 + 1;
    bool _2672 = !_2656;
    int _2674 = _2672 ? 0 : (-1);
    int _2676 = abs(_2648);
    int _2678 = _924 * _2670;
    int _2680 = _2678 + _2164;
    int _2682 = abs(_2664);
    int _2684 = ~_2642;
    int _2686 = _2684 + 1;
    int _2688 = _2686 + 1;
    bool _2690 = !_2196;
    int _2692 = _2690 ? 0 : 1;
    int _2694 = abs(_2674);
    int _2696 = _2688 * as_type<int>(_2538);
    int _2698 = ~_2676;
    int _2700 = _2698 + 1;
    int _2702 = _2700 + 1;
    int _2704 = abs(_2692);
    int _2706 = _2702 * as_type<int>(_2530);
    int _2708 = _2706 + _2696;
    int _2710 = ~_2682;
    int _2712 = _2710 + 1;
    int _2714 = _2712 + 1;
    int _2716 = ~_2694;
    int _2718 = _2716 + 1;
    int _2720 = _2718 + 1;
    int _2722 = _2714 * as_type<int>(_2564);
    int _2724 = _2722 + _2708;
    float _2726 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2728 = !_2005;
    int _2730 = _2728 ? _2680 : (-1);
    int _2732 = _2720 * as_type<int>(_2572);
    int _2734 = _2732 + _2724;
    float _2736 = -_2608;
    float _2738 = _2736 + 1.0;
    float _2740 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2726);
    bool _2742 = _1548 <= 8000.0;
    bool _2744 = isnan(_1548);
    bool _2746 = _2742 || _2744;
    bool _2748 = isnan(8000.0);
    bool _2750 = _2746 || _2748;
    float _2752 = float(_2750);
    float _2754 = fma(_2738, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2608);
    float _2756 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2740);
    float _2758 = in.m_77.x;
    int _2760 = ~_2704;
    int _2762 = _2760 + 1;
    int _2764 = _2762 + 1;
    float _2766 = _2752 * _2754;
    float _2768 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2756);
    int _2770 = _2734 * _2764;
    float _2772 = _2768 + _1890;
    float _2774 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2776 = _2730 * _2704;
    int _2778 = _2776 + _2770;
    float _2780 = _2772 * 0.5;
    float _2782 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2784 = _2628 * _2774;
    float _2786 = precise::clamp(_2784, 0.0, 1.0);
    float _2788 = fma(_2600, _2406, _2614);
    float _2790 = fma(_2606, _2406, _2618);
    float _2792 = _2782 * _1974;
    float _2794 = -_2786;
    float _2796 = fma(_2794, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_79.z = _2780;
    out.m_79.w = _1890;
    bool _2798 = _1694 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2800 = isnan(_1694);
    bool _2802 = _2798 || _2800;
    bool _2804 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2806 = _2802 || _2804;
    float _2808 = _1985 * _2792;
    float _2810 = _1995 * _2792;
    float _2812 = -_2782;
    float _2814 = _2812 + 1.0;
    out.gl_Position.x = _1952;
    out.gl_Position.y = _1918;
    out.gl_Position.z = _2768;
    out.gl_Position.w = _1890;
    float _2816 = _2796 * _2758;
    float _2818 = fma(_1991, _2808, _1979);
    float _2820 = fma(_1993, _2808, _1981);
    float _2822 = _1985 * _2814;
    float _2824 = _2816 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2826 = fma(_1985, _2810, _1983);
    out.m_81.x = _2788;
    out.m_81.y = _2644;
    out.m_81.z = _2790;
    float _2828 = float(_2778);
    float _2830 = _1600 * _1654;
    float _2832 = _2780;
    float _2834 = _2810;
    float _2836 = _2782;
    float _2838 = _2814;
    float _2840 = _2830;
    float _2842 = _2828;
    if (!_2806)
    {
        _2832 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2844 = _2832;
    out.m_83.x = _2824;
    float _2846 = _2844;
    float _2848 = _2844;
    if (!_2806)
    {
        _2834 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2850 = _2834;
    float _2852 = _2830 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2854 = _2850;
    float _2856 = _2850;
    if (!_2806)
    {
        _2836 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2858 = _2836;
    out.m_85.x = _2818;
    out.m_85.y = _2820;
    out.m_85.z = _2826;
    out.m_85.w = _2822;
    float _2860 = _2858;
    float _2862 = _2858;
    if (!_2806)
    {
        _2838 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2864 = _2838;
    float _2866 = _2864;
    float _2868 = _2864;
    if (!_2806)
    {
        _2840 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2870 = _2840;
    out.m_87.x = _2828;
    float _2872 = _2870;
    float _2874 = _2870;
    if (!_2806)
    {
        _2842 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2876 = _2842;
    bool _2878 = !_2806;
    float _2880 = _2876;
    float _2882 = _2876;
    if (!_2878)
    {
        bool _2884 = _1694 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2886 = isnan(_1694);
        bool _2888 = _2884 || _2886;
        bool _2890 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2892 = _2888 || _2890;
        if (!_2892)
        {
            float _2894 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2896 = _1694 + _2894;
            float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2900 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2898;
            float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2904 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2906 = 1.0 / _2900;
            float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2912 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2920 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2924 = _2896 * _2906;
            float _2926 = precise::clamp(_2924, 0.0, 1.0);
            float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2932 = fma(_2926, _2904, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2934 = fma(_2926, _2930, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2936 = fma(_2926, _2910, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2938 = fma(_2926, _2914, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2940 = fma(_2926, _2918, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2942 = fma(_2926, _2922, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2882 = _2936;
            _2868 = _2940;
            _2848 = _2932;
            _2862 = _2938;
            _2856 = _2934;
            _2874 = _2942;
            _2944 = true;
        }
        else
        {
            bool _2946 = _1694 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2948 = isnan(_1694);
            bool _2950 = _2946 || _2948;
            bool _2952 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2954 = _2950 || _2952;
            if (!_2954)
            {
                _2846 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2956 = _2846;
            _2848 = _2956;
            if (!_2954)
            {
                _2880 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2958 = _2880;
            _2882 = _2958;
            if (!_2954)
            {
                _2854 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2960 = _2854;
            _2856 = _2960;
            if (!_2954)
            {
                _2860 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2962 = _2860;
            _2862 = _2962;
            if (!_2954)
            {
                _2866 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2964 = _2866;
            _2868 = _2964;
            if (!_2954)
            {
                _2872 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2966 = _2872;
            bool _2968 = !_2954;
            _2874 = _2966;
            if (!_2968)
            {
                bool _2970 = _1694 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2972 = isnan(_1694);
                bool _2974 = _2970 || _2972;
                bool _2976 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2978 = _2974 || _2976;
                if (!_2978)
                {
                    float _2980 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2982 = _1694 + _2980;
                    float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2986 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2984;
                    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2990 = _2988 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2992 = 1.0 / _2986;
                    float _2994 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2996 = _2994 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2998 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3000 = _2998 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3002 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3004 = _3002 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3008 = _3006 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3010 = _2982 * _2992;
                    float _3012 = precise::clamp(_3010, 0.0, 1.0);
                    float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3018 = fma(_3012, _2990, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3020 = fma(_3012, _3016, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3022 = fma(_3012, _2996, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3024 = fma(_3012, _3000, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3026 = fma(_3012, _3004, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3028 = fma(_3012, _3008, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2882 = _3022;
                    _2868 = _3026;
                    _2848 = _3018;
                    _2862 = _3024;
                    _2856 = _3020;
                    _2874 = _3028;
                    _2944 = true;
                }
                else
                {
                    _2882 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2868 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2848 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2862 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2856 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2874 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2944 = false;
    float _3030 = _2882;
    float _3032 = _2868;
    float _3034 = _2848;
    float _3036 = _2862;
    float _3038 = _2856;
    float _3040 = _2874;
    float _3042 = fma(_2644, -0.5, 0.5);
    float _3044 = precise::clamp(_3042, 0.0, 1.0);
    float _3046 = -_3030;
    float _3048 = _3046 + _3032;
    float _3050 = _2852 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3052 = -_3034;
    float _3054 = _3052 + _3036;
    out.m_89.x = 0.0;
    float _3056 = fma(_3044, _3048, _3030);
    float _3058 = fma(_3044, _3054, _3034);
    out.m_53.x = _3050;
    float _3060 = -_3038;
    float _3062 = _3060 + _3040;
    float _3064 = _3056 * 0.586610972881317138671875;
    bool _3066 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3068 = fma(_3044, _3062, _3038);
    float _3070 = fma(_3058, 0.298911988735198974609375, _3064);
    bool _3072 = _1600 > 0.0;
    bool _3074 = isnan(_1600);
    bool _3076 = _3072 || _3074;
    bool _3078 = isnan(0.0);
    bool _3080 = _3076 || _3078;
    float _3082 = fma(_3068, 0.114477999508380889892578125, _3070);
    bool _3084 = _1654 <= 0.0;
    bool _3086 = !_3080;
    bool _3088 = _3084 || _3086;
    float _3090 = -_3082;
    float _3092 = _3058 + _3090;
    float _3094 = -_3082;
    float _3096 = _3056 + _3094;
    float _3098 = -_3082;
    float _3100 = _3068 + _3098;
    float _3102 = fma(_3092, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3082);
    float _3104 = fma(_3096, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3082);
    float _3106 = fma(_3100, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3082);
    bool _3108 = !_3066;
    if (!_3108)
    {
        float _3110 = -_1538;
        float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3114 = -_1540;
        float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3118 = -_1542;
        float _3120 = _3118 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3122 = _3112 * _3112;
        float _3124 = fma(_3116, _3116, _3122);
        float _3126 = fma(_3120, _3120, _3124);
        float _3128 = sqrt(_3126);
        float _3130 = rsqrt(_3126);
        float _3132 = -_3128;
        float _3134 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3136 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3138 = precise::clamp(_3136, 0.0, 1.0);
        float _3140 = _3116 * _3130;
        float _3142 = _3112 * _3130;
        float _3144 = abs(_3138);
        float _3146 = log2(_3144);
        float _3148 = _3120 * _3130;
        float _3150 = _3140 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3152 = _2644 * _3142;
        float _3154 = -_3142;
        float _3156 = -_3150;
        float _3158 = fma(_3154, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3156);
        float _3160 = fma(_2788, _3140, _3152);
        float _3162 = -_3148;
        float _3164 = fma(_3162, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3158);
        float _3166 = fma(_2790, _3148, _3160);
        float _3168 = precise::clamp(_3166, 0.0, 1.0);
        float _3170 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3172 = _3164 + _3170;
        float _3174 = _3146 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3176 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3178 = precise::clamp(_3176, 0.0, 1.0);
        float _3180 = exp2(_3174);
        float _3182 = _3180 * _3178;
        float _3184 = _3168 * _3182;
        float _3186 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3188 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3190 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3186;
        out.m_89.y = _3188;
        out.m_89.z = _3190;
    }
    out.m_91.x = _3102;
    out.m_91.y = _3104;
    out.m_91.z = _3106;
    if (!_3088)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3192 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3192;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

