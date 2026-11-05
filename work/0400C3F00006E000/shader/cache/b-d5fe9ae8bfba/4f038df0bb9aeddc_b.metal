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
    float4 m_75 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_48 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_65 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2814 = false;
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
    float _124 = _107;
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
        float _3130 = as_type<float>(_134);
        out.gl_Position.z = _3130;
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
        float _3185 = as_type<float>(_160);
        out.gl_Position.z = _3185;
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
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _218 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _238 = _236 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _240 = 1.0 / _226;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _242;
    bool _246 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _248 = isnan(_218);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    bool _258 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _260 = isnan(_218);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = 1.0 / _234;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = _218 + _272;
    float _276 = 1.0 / _230;
    float _278 = _274 * _240;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _218 + _280;
    bool _284 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _286 = isnan(_218);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _296;
    float _300 = 1.0 / _238;
    float _302 = _282 * _270;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _306 = _218 + _304;
    bool _308 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _310 = isnan(_218);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_294;
    float _322 = _320 + 1.0;
    float _324 = fma(_298, _278, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _328 = 1.0 / _244;
    float _330 = _222 * _276;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _334 = _218 + _332;
    bool _336 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = isnan(_218);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = _306 * _300;
    float _350 = -_318;
    float _352 = _350 + 1.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _358;
    float _362 = _294 * _352;
    float _364 = _256 * _322;
    bool _366 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _368 = isnan(_218);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = _334 * _328;
    float _380 = -_346;
    float _382 = _380 + 1.0;
    float _384 = -_256;
    float _386 = _384 + 1.0;
    float _388 = fma(_356, _278, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = fma(_360, _278, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _392 = _268 * _382;
    float _394 = -_268;
    float _396 = _394 + 1.0;
    float _398 = _346 * _386;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = _376 * _396;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = -_376;
    float _416 = _414 + 1.0;
    float _418 = fma(_402, _330, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = _388 * _408;
    float _422 = fma(_406, _330, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_412, _330, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _390 * _408;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _432;
    float _436 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _438 = _324 * _408;
    float _440 = fma(_430, _302, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _442 = fma(_434, _302, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _448 = fma(_418, _392, _436);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _460 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _426);
    float _462 = fma(_446, _348, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _464 = fma(_440, _398, _448);
    float _466 = fma(_452, _302, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_458, _348, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _470 = fma(_422, _392, _454);
    float _472 = fma(_424, _392, _460);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _478 = fma(_466, _398, _470);
    float _480 = fma(_442, _398, _472);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _486;
    float _490 = fma(_476, _348, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _492;
    float _496 = fma(_484, _378, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _498 = fma(_488, _378, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _500 = fma(_462, _364, _464);
    float _502 = fma(_494, _378, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _504 = fma(_468, _364, _478);
    float _506 = fma(_490, _364, _480);
    float _508 = fma(_496, _362, _500);
    float _510 = fma(_498, _362, _504);
    float _512 = fma(_502, _362, _506);
    float _514 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[148].x, _508);
    float _516 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[148].y, _510);
    float _518 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[148].z, _512);
    bool _520 = !_326;
    if (!_520)
    {
        float _522 = in.m_57.x;
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _526 = _522 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _194 = _536;
    }
    float _538 = _194;
    float _540 = in.m_57.z;
    float _542 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _544 = log2(_542);
    float _546 = in.m_57.x;
    float _548 = in.m_57.y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _552 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _554 = int(_552);
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _558 = _544 * _116;
    float _560 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _562 = int(_560);
    float _564 = _540 * 2.0;
    float _566 = _546 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _568 = _548 * 2.0;
    float _570 = floor(_564);
    float _572 = _546 * 2.0;
    float _574 = -_550;
    float _576 = fma(_566, 2.0, _574);
    float _578 = _548 + _546;
    float _580 = _548 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _582 = _548 + _540;
    float _584 = float(_562);
    float _586 = _578 + (-1.0);
    float _588 = exp2(_558);
    float _590 = fma(_580, -2.0, _556);
    float _592 = _582 + (-1.0);
    float _594 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _596 = _584 * _116;
    float _598 = -_116;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[76].x, _576);
    bool _602 = _570 >= 0.0;
    bool _604 = isnan(_570);
    bool _606 = _602 || _604;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    float _612 = floor(_572);
    float _614 = float(_554);
    float _616 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _628 = _626 != 0;
    float _630 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _590);
    float _632 = floor(_568);
    bool _634 = !_624;
    int _636 = _634 ? 0 : 1;
    bool _638 = _570 > 0.0;
    float _640 = -_588;
    float _642 = _640 + 1.0;
    int _644 = _610 ? 0 : 1;
    float _646 = in.m_59.x;
    float _648 = in.m_59.y;
    float _650 = in.m_59.z;
    bool _652 = !_620;
    int _654 = _652 ? 0 : 1;
    float _656 = 1.0 / _614;
    bool _658 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _666 = _662 || _664;
    bool _668 = _612 > 0.0;
    bool _670 = _612 >= 0.0;
    bool _672 = isnan(_612);
    bool _674 = _670 || _672;
    bool _676 = isnan(0.0);
    bool _678 = _674 || _676;
    int _680 = ~_644;
    int _682 = _680 + 1;
    int _684 = _682 + 1;
    bool _686 = _632 > 0.0;
    bool _688 = _632 >= 0.0;
    bool _690 = isnan(_632);
    bool _692 = _688 || _690;
    bool _694 = isnan(0.0);
    bool _696 = _692 || _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _700 = 1.0 + _698;
    int _702 = _684;
    if (!_638)
    {
        int _704 = ~_644;
        int _706 = _704 + 1;
        _702 = _706;
    }
    int _708 = _702;
    float _710 = 1.0 / _700;
    bool _712 = !_628;
    int _714 = _712 ? 0 : 1;
    float _716 = _656 * _116;
    float _718 = _666 ? _642 : 0.0;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _724 = _722 != 0;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _728 = _726 != 0;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _732 = _730 != 0;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _736 = _678 ? 0 : 1;
    float _738 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[78].z, _720);
    float _740 = float(_708);
    float _742 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[78].w, _734);
    bool _744 = !_724;
    int _746 = _744 ? 0 : 1;
    float _748 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _738);
    bool _750 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _752 = isnan(1.0);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _758 = _754 || _756;
    float _760 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _742);
    int _762 = abs(_746);
    bool _764 = !_728;
    int _766 = _764 ? 0 : 1;
    int _768 = ~_736;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    float _774 = float(_762);
    int _776 = abs(_766);
    int _778 = _772;
    if (_758)
    {
        float _780 = _718 * _710;
        _126 = _780;
    }
    float _782 = _126;
    if (!_668)
    {
        int _784 = ~_736;
        int _786 = _784 + 1;
        _778 = _786;
    }
    int _788 = _778;
    float _790 = _774 * _740;
    float _792 = float(_776);
    float _794 = _546 + (-0.5);
    int _796 = _696 ? 0 : 1;
    float _798 = _790 * (-2.0);
    float _800 = float(_788);
    float _802 = fma(_798, _646, _646);
    float _804 = fma(_594, _798, _594);
    float _806 = _792 * _800;
    bool _808 = !_732;
    int _810 = _808 ? 0 : 1;
    float _812 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[196].x, _802);
    int _814 = ~_796;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    float _820 = _806 * (-2.0);
    int _822 = _818;
    if (!_686)
    {
        int _824 = ~_796;
        int _826 = _824 + 1;
        _822 = _826;
    }
    int _828 = _822;
    float _830 = fma(_804, _782, _812);
    int _832 = abs(_810);
    float _834 = _548 + (-0.5);
    float _836 = float(_828);
    float _838 = fma(_820, _648, _648);
    float _840 = float(_832);
    float _842 = fma(_616, _820, _616);
    float _844 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[196].y, _838);
    float _846 = _540 + _546;
    float _848 = _840 * _836;
    float _850 = _540 + (-0.5);
    float _852 = fma(_842, _782, _844);
    float _854 = _846 + (-1.0);
    float _856 = _848 * (-2.0);
    float _858 = in.m_61.x;
    float _860 = in.m_61.y;
    float _862 = in.m_61.z;
    float _864 = _830 * 0.15915493667125701904296875;
    float _866 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _868 = fma(_856, _650, _650);
    float _870 = in.m_63.x;
    float _872 = in.m_63.y;
    float _874 = in.m_63.z;
    float _876 = _852 * 0.15915493667125701904296875;
    float _878 = fma(_866, _856, _866);
    float _880 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[196].z, _868);
    float _882 = _864 * 6.283185482025146484375;
    float _884 = cos(_882);
    float _886 = fma(_878, _782, _880);
    float _888 = _886 * 0.15915493667125701904296875;
    float _890 = _876 * 6.283185482025146484375;
    float _892 = sin(_890);
    float _894 = _876 * 6.283185482025146484375;
    float _896 = cos(_894);
    float _898 = _516 * _860;
    float _900 = _518 * _862;
    float _902 = _514 * _858;
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _872);
    float _906 = in.m_46.x;
    float _908 = in.m_46.y;
    float _910 = in.m_46.z;
    float _912 = _898 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _914 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _870);
    float _916 = _864 * 6.283185482025146484375;
    float _918 = sin(_916);
    float _920 = _902 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _874);
    float _924 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _926 = _912 * _904;
    float _928 = _920 * _914;
    float _930 = _884 * _892;
    float _932 = _888 * 6.283185482025146484375;
    float _934 = cos(_932);
    float _936 = _884 * _896;
    float _938 = _924 * _922;
    float _940 = _888 * 6.283185482025146484375;
    float _942 = sin(_940);
    float _944 = _918 * _892;
    float _946 = _918 * _896;
    float _948 = _884 * _934;
    float _950 = _896 * _934;
    float _952 = _918 * _934;
    float _954 = _892 * _934;
    float _956 = _948 * _926;
    float _958 = _952 * _926;
    float _960 = fma(_942, _936, _944);
    float _962 = -_930;
    float _964 = fma(_942, _946, _962);
    float _966 = -_926;
    float _968 = _942 * _966;
    float _970 = -_946;
    float _972 = fma(_942, _930, _970);
    float _974 = fma(_960, _928, _956);
    float _976 = fma(_942, _944, _936);
    float _978 = fma(_950, _928, _968);
    float _980 = fma(_964, _928, _958);
    float _982 = fma(_972, _938, _974);
    float _984 = _908 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _986 = fma(_954, _938, _978);
    float _988 = _908 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _992 = fma(_976, _938, _980);
    float _994 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[6].x, _984);
    float _996 = _982 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[26].x, _990);
    float _1000 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[4].x, _988);
    float _1002 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[6].z, _994);
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[24].x, _996);
    float _1006 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[26].z, _998);
    float _1008 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1000);
    float _1010 = _1002 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1012 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1004);
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1016 = _1008 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1018 = _908 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1020 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1022 = _1010 + _1014;
    float _1024 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1018);
    float _1026 = _1016 + _1020;
    float _1028 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1030 = _1022 + _1028;
    float _1032 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1024);
    float _1034 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1036 = _1026 + _1034;
    float _1038 = _1030 * _1030;
    float _1040 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1042 = fma(_1036, _1036, _1038);
    float _1044 = _982 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1046 = sqrt(_1042);
    float _1048 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1044);
    float _1050 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1052 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1048);
    float _1054 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1050);
    float _1056 = _1052 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1058 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1054);
    float _1060 = _1040 + _1056;
    bool _1062 = _1046 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1064 = _1052;
    float _1066 = _1054;
    float _1068 = _1056;
    float _1070 = _1042;
    float _1072 = _1046;
    float _1074 = _1040;
    float _1076 = _1016;
    if (!_1062)
    {
        _1064 = _1026;
    }
    float _1078 = _1064;
    float _1080 = _1078;
    if (!_1062)
    {
        _1066 = _1022;
    }
    float _1082 = _1066;
    float _1084 = _1082;
    if (!_1062)
    {
        _1068 = _1060;
    }
    float _1086 = _1068;
    bool _1088 = !_1062;
    float _1090 = _1086;
    if (!_1088)
    {
        float _1092 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1096 = _1046 + _1094;
        float _1098 = rsqrt(_1042);
        float _1100 = _1096 * _1092;
        float _1102 = _1060 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1104 = _1100 * 0.15915493667125701904296875;
        float _1106 = _1104 * 6.283185482025146484375;
        float _1108 = cos(_1106);
        float _1110 = _1104 * 6.283185482025146484375;
        float _1112 = sin(_1110);
        float _1114 = _1108 + (-1.0);
        float _1116 = fma(_1112, _1102, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1118 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = _1098 * _1116;
        float _1122 = fma(_1060, _1108, _1118);
        float _1124 = fma(_1036, _1120, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1126 = fma(_1030, _1120, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1090 = _1122;
        _1080 = _1124;
        _1084 = _1126;
        _1070 = _1098;
    }
    float _1128 = _1090;
    float _1130 = _1080;
    float _1132 = _1084;
    float _1134 = _1070;
    float _1136 = -_1040;
    float _1138 = _1136 + _1128;
    float _1140 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1142 = -_1016;
    float _1144 = _1142 + _1130;
    float _1146 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1148 = _1138 * _1138;
    float _1150 = -_1010;
    float _1152 = _1150 + _1132;
    float _1154 = 1.0 / _1140;
    float _1156 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1146);
    float _1158 = fma(_1144, _1144, _1148);
    float _1160 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1156);
    float _1162 = fma(_1152, _1152, _1158);
    bool _1164 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1166 = isnan(0.5);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1172 = _1168 || _1170;
    float _1174 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1176 = sqrt(_1162);
    bool _1178 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1180 = isnan(0.5);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1186 = _1182 || _1184;
    float _1188 = _1174 + _1140;
    float _1190 = _1188 * _1154;
    float _1192 = _1190 * 0.5;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1196 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1194);
    bool _1198 = _1176 > 0.0;
    float _1200 = 1.0 / _1196;
    float _1202 = _1134;
    float _1204 = _1176;
    float _1206 = _1130;
    float _1208 = _1128;
    float _1210 = _1132;
    float _1212 = _1162;
    if (!_1198)
    {
        _1202 = _1128;
    }
    float _1214 = _1202;
    float _1216 = _1214;
    float _1218 = _1214;
    if (!_1198)
    {
        _1204 = _1132;
    }
    float _1220 = _1204;
    bool _1222 = !_1198;
    float _1224 = _1220;
    float _1226 = 0.0;
    if (!_1222)
    {
        float _1228 = _188 * _188;
        float _1230 = fma(_186, _186, _1228);
        float _1232 = rsqrt(_1162);
        float _1234 = fma(_190, _190, _1230);
        float _1236 = sqrt(_1234);
        float _1238 = _1144 * _1232;
        float _1240 = _1138 * _1232;
        float _1242 = _1152 * _1232;
        bool _1244 = _1236 > 0.0;
        float _1246 = _1236;
        _1226 = _1238;
        _1072 = _1234;
        if (!_1244)
        {
            _1216 = _1128;
        }
        float _1248 = _1216;
        _1218 = _1248;
        if (!_1244)
        {
            _1246 = _1132;
        }
        float _1250 = _1246;
        bool _1252 = !_1244;
        _1224 = _1250;
        if (!_1252)
        {
            float _1254 = rsqrt(_1234);
            float _1256 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1258 = _188 * _1254;
            float _1260 = _186 * _1254;
            float _1262 = _1240 * _1258;
            float _1264 = _190 * _1254;
            float _1266 = fma(_1238, _1260, _1262);
            float _1268 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1270 = fma(_1242, _1264, _1266);
            float _1272 = _1270 * _1268;
            float _1274 = fma(_186, _1272, _1130);
            float _1276 = fma(_188, _1272, _1128);
            float _1278 = fma(_190, _1272, _1132);
            _1206 = _1274;
            _1218 = _1276;
            _1224 = _1278;
            _1072 = _1254;
        }
    }
    float _1280 = _1206;
    float _1282 = _1218;
    float _1284 = _1224;
    float _1286 = _1226;
    float _1288 = _1072;
    float _1290 = _1284;
    float _1292 = _1286;
    if (_1186)
    {
        _1208 = 1.0;
    }
    float _1294 = _1208;
    float _1296 = _1294;
    if (_1172)
    {
        _1210 = _1280;
    }
    float _1298 = _1210;
    float _1300 = _1298;
    if (_1172)
    {
        _196 = _1282;
    }
    float _1302 = _196;
    float _1304 = _1302;
    if (!_1172)
    {
        float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1308 = _1040 + _1306;
        float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1312 = _1016 + _1310;
        float _1314 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1316 = -_1040;
        float _1318 = _1316 + _1282;
        float _1320 = _1308 * _1308;
        float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1324 = _1010 + _1322;
        float _1326 = -_1010;
        float _1328 = _1326 + _1284;
        float _1330 = fma(_1312, _1312, _1320);
        float _1332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1334 = fma(_1324, _1324, _1330);
        float _1336 = sqrt(_1334);
        float _1338 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1340 = precise::min(_1336, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1342 = _1340 * _1332;
        float _1344 = _1338 * _1342;
        float _1346 = -_1016;
        float _1348 = _1346 + _1280;
        float _1350 = fma(_1318, _1344, _1040);
        float _1352 = fma(_1348, _1344, _1016);
        float _1354 = fma(_1328, _1344, _1010);
        _1304 = _1350;
        _1300 = _1352;
        _1290 = _1354;
    }
    float _1356 = _1304;
    float _1358 = _1300;
    float _1360 = _1290;
    if (_1186)
    {
        _1074 = 1.0;
    }
    float _1362 = _1074;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1366 = _1200 * _1364;
    float _1368 = _1362;
    if (!_1186)
    {
        float _1370 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1372 = _1370 * 0.15915493667125701904296875;
        float _1374 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1378 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1376;
        float _1380 = _1372 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        float _1384 = _1374 * 0.15915493667125701904296875;
        float _1386 = _1372 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        float _1390 = 1.0 / _1382;
        float _1392 = _1384 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        float _1396 = _1388 * _1390;
        float _1398 = _1384 * 6.283185482025146484375;
        float _1400 = sin(_1398);
        float _1402 = _1394 * _1396;
        float _1404 = 1.0 / _1378;
        float _1406 = 1.0 / _1402;
        float _1408 = _1400 * _1406;
        float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1412 = fma(_1366, _1408, _1410);
        float _1414 = _1412 * _1404;
        float _1416 = precise::clamp(_1414, 0.0, 1.0);
        _1296 = _1416;
    }
    float _1418 = _1296;
    if (!_1186)
    {
        float _1420 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1422 = _1420 * 0.15915493667125701904296875;
        float _1424 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1426 = _1422 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1424 * 0.15915493667125701904296875;
        float _1432 = _1422 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = 1.0 / _1428;
        float _1438 = _1430 * 6.283185482025146484375;
        float _1440 = cos(_1438);
        float _1442 = _1434 * _1436;
        float _1444 = _1430 * 6.283185482025146484375;
        float _1446 = sin(_1444);
        float _1448 = _1440 * _1442;
        float _1450 = 1.0 / _1448;
        float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1454 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1452;
        float _1456 = 1.0 / _1454;
        float _1458 = _1446 * _1450;
        float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1462 = fma(_1366, _1458, _1460);
        float _1464 = _1462 * _1456;
        float _1466 = precise::clamp(_1464, 0.0, 1.0);
        float _1468 = -_1466;
        float _1470 = _1468 + 1.0;
        _1368 = _1470;
    }
    float _1472 = _1368;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1476 = _1356 + _1474;
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1480 = _1358 + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1484 = _1360 + _1482;
    float _1486 = _1476 * _1476;
    float _1488 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1490 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1492 = fma(_1480, _1480, _1486);
    float _1494 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1488);
    float _1496 = fma(_1484, _1484, _1492);
    float _1498 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1494);
    float _1500 = rsqrt(_1496);
    float _1502 = sqrt(_1496);
    float _1504 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1506 = _1480 * _1504;
    float _1508 = _1484 * _1504;
    float _1510 = _1506 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 + _1512;
    float _1516 = sqrt(_1514);
    bool _1518 = _1516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1516 + _1520;
    float _1524 = _1492;
    float _1526 = _1514;
    float _1528 = _1522;
    float _1530 = _1506;
    float _1532 = _1508;
    float _1534 = _1510;
    float _1536 = _1512;
    if (_1518)
    {
        float _1538 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1524 = _1538;
    }
    float _1540 = _1524;
    if (_1518)
    {
        float _1542 = rsqrt(_1514);
        _1526 = _1542;
    }
    float _1544 = _1526;
    if (_1518)
    {
        float _1546 = _1522 * _1540;
        _1528 = _1546;
    }
    float _1548 = _1528;
    if (_1518)
    {
        float _1550 = _1548 * 0.15915493667125701904296875;
        _1292 = _1550;
    }
    float _1552 = _1292;
    float _1554 = _1540;
    if (_1518)
    {
        float _1556 = _1552 * 6.283185482025146484375;
        float _1558 = sin(_1556);
        _1554 = _1558;
    }
    float _1560 = _1554;
    float _1562 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1564 = precise::max(0.0, _1562);
    float _1566 = _1288;
    if (_1518)
    {
        float _1568 = _1552 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        _1566 = _1570;
    }
    float _1572 = _1566;
    float _1574 = -_1504;
    float _1576 = -_1564;
    float _1578 = fma(_1476, _1574, _1576);
    if (_1518)
    {
        float _1580 = _1578 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1212 = _1580;
    }
    float _1582 = _1212;
    float _1584 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1586 = _1582;
    float _1588 = _1560;
    if (_1518)
    {
        float _1590 = fma(_1560, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1586 = _1590;
    }
    float _1592 = _1586;
    float _1594 = _1592;
    if (!_1518)
    {
        _1588 = _1578;
    }
    float _1596 = _1588;
    float _1598 = floor(_1584);
    float _1600 = _1596;
    if (_1518)
    {
        float _1602 = _1572 + (-1.0);
        _1076 = _1602;
    }
    float _1604 = _1076;
    float _1606 = _1604;
    if (_1518)
    {
        float _1608 = _1544 * _1592;
        _1594 = _1608;
    }
    float _1610 = _1594;
    float _1612 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1518)
    {
        float _1614 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1606 = _1614;
    }
    float _1616 = _1606;
    if (_1518)
    {
        float _1618 = _1506 * _1610;
        _1530 = _1618;
    }
    float _1620 = _1530;
    if (_1518)
    {
        float _1622 = _1508 * _1610;
        _1532 = _1622;
    }
    float _1624 = _1532;
    float _1626 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1612);
    if (_1518)
    {
        float _1628 = fma(_1578, _1572, _1616);
        _1600 = _1628;
    }
    float _1630 = _1600;
    if (_1518)
    {
        float _1632 = _1620 * _1620;
        _1534 = _1632;
    }
    float _1634 = _1534;
    if (_1518)
    {
        float _1636 = _1624 * _1624;
        _1536 = _1636;
    }
    float _1638 = _1536;
    float _1640 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1626);
    float _1642 = fma(_1630, _1630, _1634);
    float _1644 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1646 = -_1598;
    float _1648 = _1584 + _1646;
    float _1650 = _1642 + _1638;
    float _1652 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1654 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1656 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1654);
    float _1658 = precise::clamp(_1656, 0.0, 1.0);
    float _1660 = fma(_1010, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1662 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1664 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1652);
    float _1666 = rsqrt(_1650);
    float _1668 = -_1658;
    float _1670 = _1668 + 1.0;
    float _1672 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1490);
    float _1674 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1664);
    float _1676 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1678 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1680 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1672);
    float _1682 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1684 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1686 = abs(_1670);
    float _1688 = log2(_1686);
    float _1690 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1692 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1694 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1684);
    float _1696 = -_1690;
    float _1698 = fma(_1696, _1662, 1.0);
    float _1700 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1702 = _1666 * _1620;
    float _1704 = _1666 * _1630;
    float _1706 = floor(_1660);
    float _1708 = _1666 * _1624;
    float _1710 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1712 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1694);
    float _1714 = -_1710;
    float _1716 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1714);
    float _1718 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1720 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1712);
    float _1722 = log2(_1698);
    float _1724 = -_1708;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1716);
    float _1728 = fma(_1726, -0.5, 0.5);
    float _1730 = fma(_1726, 0.5, 0.5);
    float _1732 = -_1706;
    float _1734 = _1660 + _1732;
    float _1736 = exp2(_1718);
    float _1738 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1678);
    float _1740 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1692);
    float _1742 = _1704 + 1.0;
    float _1744 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1738);
    float _1746 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1740);
    float _1748 = 1.0 / _1720;
    float _1750 = fma(_1730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1752 = _1722 * 0.693147182464599609375;
    float _1754 = fma(_1730, _1750, -0.212114393711090087890625);
    float _1756 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1758 = sqrt(_1728);
    float _1760 = -_1704;
    float _1762 = fma(_1736, _1742, _1760);
    float _1764 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1744);
    float _1766 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1746);
    float _1768 = fma(_1730, _1754, 1.570728778839111328125);
    float _1770 = fma(_1762, 0.5, 0.5);
    float _1772 = _1764 * _1748;
    float _1774 = _1766 * _1748;
    float _1776 = fma(_1772, 0.5, 0.5);
    float _1778 = fma(_1774, -0.5, 0.5);
    float _1780 = _1758 * 0.636619746685028076171875;
    float2 _5734 = float2(_1648, _1734);
    float _1782 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5734, float2(0.0), isnan(_5734)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5734, float2(0.0), isnan(_5734)), level(0.0)).x;
    float _1784 = -_1768;
    float _1786 = fma(_1780, _1784, 1.0);
    float3 _5750 = float3(_1776, _1778, _1756);
    float _1788 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5750, float3(0.0), isnan(_5750)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5750, float3(0.0), isnan(_5750)), level(0.0)).x;
    float3 _5761 = float3(_1776, _1778, _1756);
    float4 _1791 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5761, float3(0.0), isnan(_5761)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5761, float3(0.0), isnan(_5761)), level(0.0)).xyzw;
    float _1793 = _1791.x;
    float _1795 = _1791.y;
    float _1797 = _1791.z;
    float _1799 = _1791.w;
    float2 _5777 = float2(_1786, _1770);
    float3 _1803 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5777, float2(0.0), isnan(_5777)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5777, float2(0.0), isnan(_5777)), level(0.0)).xyz;
    float _1805 = _1803.x;
    float _1807 = _1803.y;
    float _1809 = _1803.z;
    float _1811 = float(uint(_562));
    float _1813 = trunc(_716);
    int _1815 = int(_1813);
    int _1817 = ~_562;
    int _1819 = _1817 + 1;
    float _1821 = _596 * _168;
    bool _1823 = _562 == 0;
    int _1825 = abs(_636);
    int _1827 = abs(_654);
    float _1829 = 1.0 / _1811;
    float _1831 = float(uint(_1815));
    float _1833 = trunc(_1821);
    int _1835 = int(_1833);
    int _1837 = as_type<int>(_1829) + (-2);
    float _1839 = as_type<float>(_1837) * _1831;
    int _1841 = ~_562;
    int _1843 = _1841 + 1;
    float _1845 = trunc(_1839);
    float _1847 = precise::max(_1845, 0.0);
    uint _1850 = uint(_1847);
    int _1852 = _1819 * int(_1850);
    int _1854 = _1852 + _1815;
    float _1856 = float(uint(_1854));
    float _1858 = as_type<float>(_1837) * _1856;
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1862 = _1860 != 0;
    float _1864 = trunc(_1858);
    float _1866 = precise::max(_1864, 0.0);
    uint _1868 = uint(_1866);
    bool _1870 = !_1862;
    float _1872 = _1870 ? 7.345489978790283203125 : 1.0;
    float _1874 = _1872 * _546;
    float _1876 = float(_1815);
    float _1878 = floor(_1874);
    bool _1880 = _1876 >= _584;
    bool _1882 = isnan(_1876);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan(_584);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    int _1892 = int(_1850) + int(_1868);
    float _1894 = trunc(_1890);
    int _1896 = int(_1894);
    int _1898 = _1843 * _1892;
    int _1900 = _1898 + _1815;
    bool _1902 = uint(_1900) >= uint(_562);
    float _1904 = -_1878;
    float _1906 = _1874 + _1904;
    bool _1908 = !_1902;
    int _1910 = _1908 ? 0 : (-1);
    int _1912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1914 = _1912 != 0;
    int _1916 = ~_1892;
    int _1918 = _1916 + _1910;
    int _1920 = _1918 + 1;
    float _1922 = _1906 * _584;
    int _1924 = ~_1896;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    bool _1930 = !_1914;
    int _1932 = _1930 ? 0 : 1;
    int _1934 = _562 * _1920;
    int _1936 = _1934 + _1815;
    int _1938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1940 = _1938 != 0;
    float _1942 = trunc(_1922);
    int _1944 = int(_1942);
    int _1946 = abs(_1932);
    bool _1948 = !_1823;
    int _1950 = _1948 ? _1936 : (-1);
    int _1952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1954 = _1952 != 0;
    int _1956 = _1950 * _1928;
    int _1958 = _562 + (-1);
    float _1960 = in.m_65.y;
    int _1962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1964 = _1962 != 0;
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1968 = _1966 != 0;
    int _1970 = _1896 * _1958;
    int _1972 = _1970 + _1956;
    int _1974 = _1972 * _1825;
    int _1976 = _1944 * _1946;
    int _1978 = _1976 + _1815;
    int _1980 = _1835 * _1827;
    int _1982 = _1980 + _1974;
    int _1984 = abs(_714);
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1988 = _1986 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1990 = !_1940;
    int _1992 = _1990 ? 0 : 1;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _1994 = _548 > 0.5;
    int _1996 = abs(_1992);
    int _1998 = _1978 * _1984;
    int _2000 = _1998 + _1982;
    float _2002 = 1.0 / _1988;
    float _2004 = -_1960;
    float _2006 = _2004 + 1.0;
    int _2008 = ~_562;
    int _2010 = _2008 + 1;
    int _2012 = _1944 * _1996;
    int _2014 = _2012 + _2000;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2018 = _2016 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2020 = as_type<float>(_1996);
    float _2022 = _1960;
    if (_1954)
    {
        float _2024 = in.m_57.x;
        _2020 = _2024;
    }
    float _2026 = _2020;
    if (_1964)
    {
        float _2028 = _1994 ? _2006 : _1960;
        _2022 = _2028;
    }
    float _2030 = _2022;
    float _2032 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2032;
    float _2036 = float(uint(_2014));
    float _2038 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2040 = _2038 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2042 = 1.0 / _2018;
    float _2044 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2046 = as_type<float>(_1837) * _2036;
    float _2048 = _2034 * _2002;
    float _2050 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2052 = -_630;
    float _2054 = fma(_760, _2044, _2052);
    float _2056 = trunc(_2046);
    float _2058 = precise::max(_2056, 0.0);
    uint _2060 = uint(_2058);
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2068 = in.m_65.x;
    float _2070 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2072 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2074 = _2040 * _2042;
    float _2076 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2078 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2080 = isnan(_538);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2086 = _2082 || _2084;
    float _2088 = float(_2086);
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2092 = _538 + _2090;
    bool _2094 = _2026 > 0.5;
    bool _2096 = _2094 && _1954;
    out.m_69.x = _2076;
    out.m_69.y = _2070;
    out.m_69.z = _2072;
    out.m_69.w = _2064;
    bool _2098 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2100 = isnan(_538);
    bool _2102 = _2098 || _2100;
    bool _2104 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2106 = _2102 || _2104;
    float _2108 = float(_2106);
    float _2110 = fma(_2048, _2092, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _2112 = _2010 * int(_2060);
    int _2114 = _2112 + _2014;
    float _2116 = in.m_71.x;
    float _2118 = in.m_71.y;
    float _2120 = in.m_71.z;
    bool _2122 = _872 != 0.0;
    bool _2124 = isnan(_872);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan(0.0);
    bool _2130 = _2126 || _2128;
    float _2132 = float(uint(_1978));
    float _2134 = float(uint(_2114));
    bool _2136 = _870 == 0.0;
    bool _2138 = !_2130;
    bool _2140 = _2136 && _2138;
    float _2142 = as_type<float>(_1837) * _2132;
    bool _2144 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2146 = isnan(_538);
    bool _2148 = _2144 || _2146;
    bool _2150 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2152 = _2148 || _2150;
    float _2154 = float(_2152);
    float _2156 = as_type<float>(_1837) * _2134;
    float _2158 = -_2088;
    float _2160 = _2158 + 1.0;
    float _2162 = _2092;
    float _2164 = _2068;
    if (_1954)
    {
        _2162 = _2068;
    }
    float _2166 = _2162;
    float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2170 = _538 + _2168;
    bool _2172 = _874 == 0.0;
    bool _2174 = _2172 && _2140;
    float _2176 = _2108 * _2160;
    float _2178 = trunc(_2156);
    float _2180 = precise::max(_2178, 0.0);
    uint _2182 = uint(_2180);
    float _2184 = -_2108;
    float _2186 = _2184 + 1.0;
    float _2188 = _2166;
    if (_2096)
    {
        float _2190 = -_2166;
        float _2192 = _2190 + 1.0;
        _2188 = _2192;
    }
    float _2194 = _2188;
    float _2196 = fma(_2074, _2170, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _2198 = ~_562;
    int _2200 = _2198 + 1;
    float _2202 = _2154 * _2186;
    float _2204 = -_2154;
    float _2206 = _2204 + 1.0;
    if (_1954)
    {
        _2164 = _2194;
    }
    float _2208 = _2164;
    float _2210 = trunc(_2142);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    int _2216 = ~_562;
    int _2218 = _2216 + 1;
    float _2220 = _2110 * _2202;
    float _2222 = _2118;
    float _2224 = _2116;
    float _2226 = _2120;
    if (!_2174)
    {
        float _2228 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2118);
        _2222 = _2228;
    }
    float _2230 = _2222;
    if (!_2174)
    {
        float _2232 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2116);
        _2224 = _2232;
    }
    float _2234 = _2224;
    float _2236 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2238 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2220);
    int _2240 = int(_2060) + int(_2182);
    if (!_2174)
    {
        float _2242 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2120);
        _2226 = _2242;
    }
    float _2244 = _2226;
    float _2246 = fma(_748, _2236, _600);
    float _2248 = fma(_2196, _2176, _2238);
    int _2250 = _2200 * _2240;
    int _2252 = _2250 + _2014;
    float _2254 = abs(_1366);
    float _2256 = log2(_2254);
    int _2258 = _2218 * int(_2214);
    int _2260 = _2258 + _1978;
    float _2262 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2248);
    bool _2264 = uint(_2252) >= uint(_562);
    float _2266 = _948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2268 = _2262 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2270 = float(uint(_2260));
    float _2272 = _972 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2274 = !_2264;
    int _2276 = _2274 ? 0 : (-1);
    float _2278 = _972 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2280 = as_type<float>(_1837) * _2270;
    int _2282 = ~_2240;
    int _2284 = _2282 + _2276;
    int _2286 = _2284 + 1;
    float _2288 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2292 = _2246 + 0.5;
    float _2294 = _2054 + 0.5;
    float _2296 = trunc(_2280);
    float _2298 = precise::max(_2296, 0.0);
    uint _2300 = uint(_2298);
    int _2302 = _562 * _2286;
    int _2304 = _2302 + _2014;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2308 = _2288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _2292;
    out.m_73.y = _2294;
    float _2310 = _2290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2312 = !_1823;
    int _2314 = _2312 ? _2304 : (-1);
    float _2316 = _2306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2318 = ~_562;
    int _2320 = _2318 + 1;
    float _2322 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2324 = _948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2326 = _948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_75.x = _2316;
    out.m_75.y = _2308;
    out.m_75.z = _2310;
    out.m_75.w = _2268;
    float _2328 = exp2(_2322);
    int _2330 = _2314 >> 31;
    float _2332 = _972 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2334 = int(_2214) + int(_2300);
    float _2336 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    int _2338 = _2330 & 3;
    float _2340 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2332);
    int _2342 = _2320 * _2334;
    int _2344 = _2342 + _1978;
    float _2346 = -_942;
    float _2348 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2266);
    float _2350 = _960 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2352 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2278);
    int _2354 = _2314 & 3;
    bool _2356 = _2354 != 0;
    float _2358 = -_942;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2324);
    int _2362 = _2314 + _2338;
    float _2364 = _960 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2366 = uint(_2344) >= uint(_562);
    float _2368 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2360);
    int _2370 = _2362 >> 2;
    float _2372 = _960 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2374 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2364);
    float _2376 = -_942;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2326);
    int _2380 = _2370 << 4;
    int _2382 = _2380 + 368;
    float _2384 = fma(_2328, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2386 = precise::clamp(_2384, 0.0, 1.0);
    float _2388 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2348);
    float _2390 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2378);
    uint _2392 = uint(int(uint(_2382) >> uint(2)));
    uint _2394 = uint(int(uint(int(_2392)) >> uint(2)));
    int _2396 = int(_2392) & 3;
    float _2398 = (*spvDescriptorSet0.vp_c9)._m0[int(_2394)][_2396];
    int _2400 = int(_2392) + 1;
    uint _2402 = uint(int(uint(_2400) >> uint(2)));
    int _2404 = _2400 & 3;
    float _2406 = (*spvDescriptorSet0.vp_c9)._m0[int(_2402)][_2404];
    float _2408 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2350);
    float _2410 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2372);
    float _2412 = _2388 * _2230;
    float _2414 = _2368 * _2230;
    float _2416 = _2390 * _2230;
    float _2418 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2374);
    float _2420 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2408);
    int _2422 = _2382 + 8;
    uint _2424 = uint(int(uint(_2422) >> uint(2)));
    uint _2426 = uint(int(uint(int(_2424)) >> uint(2)));
    int _2428 = int(_2424) & 3;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[int(_2426)][_2428];
    int _2432 = int(_2424) + 1;
    uint _2434 = uint(int(uint(_2432) >> uint(2)));
    int _2436 = _2432 & 3;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[int(_2434)][_2436];
    float _2440 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2410);
    int _2442 = _2314 & 3;
    bool _2444 = _2442 != 0;
    float _2446 = fma(_2420, _2234, _2414);
    int _2448 = _2356 ? 0 : 1;
    float _2450 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2340);
    bool _2452 = uint(_2442) > 1u;
    float _2454 = fma(_2440, _2234, _2416);
    bool _2456 = _2442 != 3;
    float _2458 = fma(_2450, _2244, _2446);
    float _2460 = in.m_77.x;
    bool _2462 = !_2366;
    int _2464 = _2462 ? 0 : (-1);
    float _2466 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2336);
    bool _2468 = uint(_2442) >= 2u;
    float _2470 = fma(_2386, -2.0, 3.0);
    int _2472 = ~_2448;
    int _2474 = _2472 + 1;
    int _2476 = _2474 + 1;
    float _2478 = _2386 * _2386;
    int _2480 = ~_2334;
    int _2482 = _2480 + _2464;
    int _2484 = _2482 + 1;
    float _2486 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2352);
    int _2488 = _2476;
    if (!_2452)
    {
        int _2490 = ~_2448;
        int _2492 = _2490 + 1;
        _2488 = _2492;
    }
    int _2494 = _2488;
    float _2496 = fma(_2418, _2234, _2412);
    bool _2498 = !_2444;
    int _2500 = _2498 ? 0 : 1;
    float _2502 = _2478 * _2470;
    int _2504 = _2468 ? 0 : 1;
    int _2506 = _562 * _2484;
    int _2508 = _2506 + _1978;
    bool _2510 = _2442 != 3;
    float _2512 = _1720 * 0.5;
    int _2514 = abs(_2494);
    float _2516 = -_1782;
    float _2518 = _2516 + 1.0;
    int _2520 = ~_2504;
    int _2522 = _2520 + 1;
    int _2524 = _2522 + 1;
    float _2526 = fma(_2466, _2244, _2496);
    bool _2528 = !_2510;
    int _2530 = _2528 ? 0 : (-1);
    float _2532 = fma(_2486, _2244, _2454);
    int _2534 = abs(_2500);
    int _2536 = _2524;
    if (_2456)
    {
        int _2538 = ~_2504;
        int _2540 = _2538 + 1;
        _2536 = _2540;
    }
    int _2542 = _2536;
    int _2544 = ~_2514;
    int _2546 = _2544 + 1;
    int _2548 = _2546 + 1;
    out.m_79.x = _2526;
    out.m_79.y = _2458;
    out.m_79.z = _2532;
    bool _2550 = !_1968;
    int _2552 = _2550 ? 0 : 1;
    int _2554 = abs(_2530);
    int _2556 = _2548 * as_type<int>(_2406);
    int _2558 = abs(_2542);
    int _2560 = ~_2534;
    int _2562 = _2560 + 1;
    int _2564 = _2562 + 1;
    int _2566 = abs(_2552);
    int _2568 = _2564 * as_type<int>(_2398);
    int _2570 = _2568 + _2556;
    int _2572 = ~_2558;
    int _2574 = _2572 + 1;
    int _2576 = _2574 + 1;
    int _2578 = ~_2554;
    int _2580 = _2578 + 1;
    int _2582 = _2580 + 1;
    int _2584 = _2576 * as_type<int>(_2430);
    int _2586 = _2584 + _2570;
    int _2588 = ~_2566;
    int _2590 = _2588 + 1;
    int _2592 = _2590 + 1;
    float _2594 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2596 = _2582 * as_type<int>(_2438);
    int _2598 = _2596 + _2586;
    float _2600 = -_2502;
    float _2602 = _2600 + 1.0;
    float _2604 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2594);
    bool _2606 = !_1823;
    int _2608 = _2606 ? _2508 : (-1);
    int _2610 = _2598 * _2592;
    float _2612 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2614 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2604);
    float _2616 = fma(_2602, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2502);
    int _2618 = _2608 * _2566;
    int _2620 = _2618 + _2610;
    float _2622 = fma(_1766, -0.5, _2512);
    float _2624 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2614);
    float _2626 = exp2(_2612);
    bool _2628 = _1366 <= 8000.0;
    bool _2630 = isnan(_1366);
    bool _2632 = _2628 || _2630;
    bool _2634 = isnan(8000.0);
    bool _2636 = _2632 || _2634;
    float _2638 = float(_2636);
    float _2640 = float(_2620);
    float _2642 = _2624 + _1720;
    float _2644 = _1764 + _1720;
    float _2646 = _2638 * _2616;
    float _2648 = _2642 * 0.5;
    float _2650 = _2644 * 0.5;
    float _2652 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1764;
    out.gl_Position.y = _1766;
    out.gl_Position.z = _2624;
    out.gl_Position.w = _1720;
    bool _2654 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2656 = isnan(_1502);
    bool _2658 = _2654 || _2656;
    bool _2660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2662 = _2658 || _2660;
    float _2664 = _2518 * _2652;
    float _2666 = precise::clamp(_2664, 0.0, 1.0);
    out.m_81.x = _2650;
    out.m_81.y = _2622;
    out.m_81.z = _2648;
    out.m_81.w = _1720;
    float _2668 = -_2626;
    float _2670 = _2668 + 1.0;
    float _2672 = -_2666;
    float _2674 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2640;
    float _2676 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2678 = _2674 * _2460;
    float _2680 = _2676 * _1788;
    float _2682 = _2640;
    float _2684 = _2650;
    if (!_2662)
    {
        _2682 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2686 = _2682;
    float _2688 = _1799 * _2680;
    float _2690 = _1809 * _2680;
    float _2692 = -_2676;
    float _2694 = _2692 + 1.0;
    float _2696 = _2678 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2698 = fma(_1805, _2688, _1793);
    float _2700 = fma(_1807, _2688, _1795);
    float _2702 = _1799 * _2694;
    float _2704 = fma(_1799, _2690, _1797);
    out.m_85.x = _2696;
    float _2706 = _1418 * _1472;
    float _2708 = _2688;
    float _2710 = _2690;
    float _2712 = _2694;
    float _2714 = _2706;
    float _2716 = _2686;
    float _2718 = _2686;
    if (!_2662)
    {
        _2684 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2720 = _2684;
    out.m_87.x = _2698;
    out.m_87.y = _2700;
    out.m_87.z = _2704;
    out.m_87.w = _2702;
    float _2722 = _2706 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2724 = _2720;
    float _2726 = _2720;
    if (!_2662)
    {
        _2708 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2728 = _2708;
    float _2730 = _2728;
    float _2732 = _2728;
    if (!_2662)
    {
        _2710 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2734 = _2710;
    float _2736 = _2734;
    float _2738 = _2734;
    if (!_2662)
    {
        _2712 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2740 = _2712;
    float _2742 = _2740;
    float _2744 = _2740;
    if (!_2662)
    {
        _2714 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2746 = _2714;
    bool _2748 = !_2662;
    float _2750 = _2746;
    float _2752 = _2746;
    if (!_2748)
    {
        bool _2754 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2756 = isnan(_1502);
        bool _2758 = _2754 || _2756;
        bool _2760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2762 = _2758 || _2760;
        if (!_2762)
        {
            float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2766 = _1502 + _2764;
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2770 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2768;
            float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2776 = 1.0 / _2770;
            float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2782 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2784 = _2782 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2794 = _2766 * _2776;
            float _2796 = precise::clamp(_2794, 0.0, 1.0);
            float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2802 = fma(_2796, _2774, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2804 = fma(_2796, _2800, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2806 = fma(_2796, _2780, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2808 = fma(_2796, _2784, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2810 = fma(_2796, _2788, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2812 = fma(_2796, _2792, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2732 = _2806;
            _2744 = _2810;
            _2726 = _2802;
            _2738 = _2808;
            _2718 = _2804;
            _2752 = _2812;
            _2814 = true;
        }
        else
        {
            bool _2816 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2818 = isnan(_1502);
            bool _2820 = _2816 || _2818;
            bool _2822 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2824 = _2820 || _2822;
            if (!_2824)
            {
                _2724 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2826 = _2724;
            _2726 = _2826;
            if (!_2824)
            {
                _2730 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2828 = _2730;
            _2732 = _2828;
            if (!_2824)
            {
                _2716 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2830 = _2716;
            _2718 = _2830;
            if (!_2824)
            {
                _2736 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2832 = _2736;
            _2738 = _2832;
            if (!_2824)
            {
                _2742 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2834 = _2742;
            _2744 = _2834;
            if (!_2824)
            {
                _2750 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2836 = _2750;
            bool _2838 = !_2824;
            _2752 = _2836;
            if (!_2838)
            {
                bool _2840 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2842 = isnan(_1502);
                bool _2844 = _2840 || _2842;
                bool _2846 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2848 = _2844 || _2846;
                if (!_2848)
                {
                    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2852 = _1502 + _2850;
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2856 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2854;
                    float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2862 = 1.0 / _2856;
                    float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2870 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2872 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2880 = _2852 * _2862;
                    float _2882 = precise::clamp(_2880, 0.0, 1.0);
                    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2886 = _2884 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2888 = fma(_2882, _2860, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2890 = fma(_2882, _2886, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2892 = fma(_2882, _2866, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2894 = fma(_2882, _2870, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2896 = fma(_2882, _2874, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2898 = fma(_2882, _2878, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2732 = _2892;
                    _2744 = _2896;
                    _2726 = _2888;
                    _2738 = _2894;
                    _2718 = _2890;
                    _2752 = _2898;
                    _2814 = true;
                }
                else
                {
                    _2732 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2744 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2726 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2738 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2718 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2752 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2814 = false;
    float _2900 = _2732;
    float _2902 = _2744;
    float _2904 = _2726;
    float _2906 = _2738;
    float _2908 = _2718;
    float _2910 = _2752;
    float _2912 = fma(_2458, -0.5, 0.5);
    float _2914 = precise::clamp(_2912, 0.0, 1.0);
    float _2916 = -_2900;
    float _2918 = _2916 + _2902;
    float _2920 = _2722 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2922 = -_2904;
    float _2924 = _2922 + _2906;
    out.m_89.x = 0.0;
    float _2926 = fma(_2914, _2918, _2900);
    float _2928 = fma(_2914, _2924, _2904);
    out.m_53.x = _2920;
    float _2930 = -_2908;
    float _2932 = _2930 + _2910;
    float _2934 = _2926 * 0.586610972881317138671875;
    bool _2936 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2938 = fma(_2914, _2932, _2908);
    float _2940 = fma(_2928, 0.298911988735198974609375, _2934);
    bool _2942 = _1418 > 0.0;
    bool _2944 = isnan(_1418);
    bool _2946 = _2942 || _2944;
    bool _2948 = isnan(0.0);
    bool _2950 = _2946 || _2948;
    float _2952 = fma(_2938, 0.114477999508380889892578125, _2940);
    bool _2954 = _1472 <= 0.0;
    bool _2956 = !_2950;
    bool _2958 = _2954 || _2956;
    float _2960 = -_2952;
    float _2962 = _2928 + _2960;
    float _2964 = -_2952;
    float _2966 = _2926 + _2964;
    float _2968 = -_2952;
    float _2970 = _2938 + _2968;
    float _2972 = fma(_2962, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2952);
    float _2974 = fma(_2966, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2952);
    float _2976 = fma(_2970, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2952);
    bool _2978 = !_2936;
    if (!_2978)
    {
        float _2980 = -_1356;
        float _2982 = _2980 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2984 = -_1358;
        float _2986 = _2984 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2988 = -_1360;
        float _2990 = _2988 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2992 = _2982 * _2982;
        float _2994 = fma(_2986, _2986, _2992);
        float _2996 = fma(_2990, _2990, _2994);
        float _2998 = sqrt(_2996);
        float _3000 = rsqrt(_2996);
        float _3002 = -_2998;
        float _3004 = _3002 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3006 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3008 = precise::clamp(_3006, 0.0, 1.0);
        float _3010 = _2986 * _3000;
        float _3012 = _2982 * _3000;
        float _3014 = abs(_3008);
        float _3016 = log2(_3014);
        float _3018 = _2990 * _3000;
        float _3020 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3022 = _2458 * _3012;
        float _3024 = -_3012;
        float _3026 = -_3020;
        float _3028 = fma(_3024, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3026);
        float _3030 = fma(_2526, _3010, _3022);
        float _3032 = -_3018;
        float _3034 = fma(_3032, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3028);
        float _3036 = fma(_2532, _3018, _3030);
        float _3038 = precise::clamp(_3036, 0.0, 1.0);
        float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3042 = _3034 + _3040;
        float _3044 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3046 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3048 = precise::clamp(_3046, 0.0, 1.0);
        float _3050 = exp2(_3044);
        float _3052 = _3050 * _3048;
        float _3054 = _3038 * _3052;
        float _3056 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3058 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3060 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3056;
        out.m_89.y = _3058;
        out.m_89.z = _3060;
    }
    out.m_91.x = _2972;
    out.m_91.y = _2974;
    out.m_91.z = _2976;
    if (!_2958)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3062 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3062;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2814 = false;
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
    float _124 = _107;
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
        float _3130 = as_type<float>(_134);
        out.gl_Position.z = _3130;
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
        float _3185 = as_type<float>(_160);
        out.gl_Position.z = _3185;
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
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _218 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _238 = _236 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _240 = 1.0 / _226;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _242;
    bool _246 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _248 = isnan(_218);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    bool _258 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _260 = isnan(_218);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = 1.0 / _234;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = _218 + _272;
    float _276 = 1.0 / _230;
    float _278 = _274 * _240;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _218 + _280;
    bool _284 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _286 = isnan(_218);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _296;
    float _300 = 1.0 / _238;
    float _302 = _282 * _270;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _306 = _218 + _304;
    bool _308 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _310 = isnan(_218);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_294;
    float _322 = _320 + 1.0;
    float _324 = fma(_298, _278, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _328 = 1.0 / _244;
    float _330 = _222 * _276;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _334 = _218 + _332;
    bool _336 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = isnan(_218);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = _306 * _300;
    float _350 = -_318;
    float _352 = _350 + 1.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _358;
    float _362 = _294 * _352;
    float _364 = _256 * _322;
    bool _366 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _368 = isnan(_218);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = _334 * _328;
    float _380 = -_346;
    float _382 = _380 + 1.0;
    float _384 = -_256;
    float _386 = _384 + 1.0;
    float _388 = fma(_356, _278, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = fma(_360, _278, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _392 = _268 * _382;
    float _394 = -_268;
    float _396 = _394 + 1.0;
    float _398 = _346 * _386;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = _376 * _396;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = -_376;
    float _416 = _414 + 1.0;
    float _418 = fma(_402, _330, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = _388 * _408;
    float _422 = fma(_406, _330, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_412, _330, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _390 * _408;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _432;
    float _436 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _438 = _324 * _408;
    float _440 = fma(_430, _302, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _442 = fma(_434, _302, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _448 = fma(_418, _392, _436);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _460 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _426);
    float _462 = fma(_446, _348, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _464 = fma(_440, _398, _448);
    float _466 = fma(_452, _302, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_458, _348, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _470 = fma(_422, _392, _454);
    float _472 = fma(_424, _392, _460);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _478 = fma(_466, _398, _470);
    float _480 = fma(_442, _398, _472);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _486;
    float _490 = fma(_476, _348, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _492;
    float _496 = fma(_484, _378, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _498 = fma(_488, _378, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _500 = fma(_462, _364, _464);
    float _502 = fma(_494, _378, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _504 = fma(_468, _364, _478);
    float _506 = fma(_490, _364, _480);
    float _508 = fma(_496, _362, _500);
    float _510 = fma(_498, _362, _504);
    float _512 = fma(_502, _362, _506);
    float _514 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[148].x, _508);
    float _516 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[148].y, _510);
    float _518 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[148].z, _512);
    bool _520 = !_326;
    if (!_520)
    {
        float _522 = in.m_57.x;
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _526 = _522 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _194 = _536;
    }
    float _538 = _194;
    float _540 = in.m_57.z;
    float _542 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _544 = log2(_542);
    float _546 = in.m_57.x;
    float _548 = in.m_57.y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _552 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _554 = int(_552);
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _558 = _544 * _116;
    float _560 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _562 = int(_560);
    float _564 = _540 * 2.0;
    float _566 = _546 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _568 = _548 * 2.0;
    float _570 = floor(_564);
    float _572 = _546 * 2.0;
    float _574 = -_550;
    float _576 = fma(_566, 2.0, _574);
    float _578 = _548 + _546;
    float _580 = _548 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _582 = _548 + _540;
    float _584 = float(_562);
    float _586 = _578 + (-1.0);
    float _588 = exp2(_558);
    float _590 = fma(_580, -2.0, _556);
    float _592 = _582 + (-1.0);
    float _594 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _596 = _584 * _116;
    float _598 = -_116;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[76].x, _576);
    bool _602 = _570 >= 0.0;
    bool _604 = isnan(_570);
    bool _606 = _602 || _604;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    float _612 = floor(_572);
    float _614 = float(_554);
    float _616 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _628 = _626 != 0;
    float _630 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _590);
    float _632 = floor(_568);
    bool _634 = !_624;
    int _636 = _634 ? 0 : 1;
    bool _638 = _570 > 0.0;
    float _640 = -_588;
    float _642 = _640 + 1.0;
    int _644 = _610 ? 0 : 1;
    float _646 = in.m_59.x;
    float _648 = in.m_59.y;
    float _650 = in.m_59.z;
    bool _652 = !_620;
    int _654 = _652 ? 0 : 1;
    float _656 = 1.0 / _614;
    bool _658 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _666 = _662 || _664;
    bool _668 = _612 > 0.0;
    bool _670 = _612 >= 0.0;
    bool _672 = isnan(_612);
    bool _674 = _670 || _672;
    bool _676 = isnan(0.0);
    bool _678 = _674 || _676;
    int _680 = ~_644;
    int _682 = _680 + 1;
    int _684 = _682 + 1;
    bool _686 = _632 > 0.0;
    bool _688 = _632 >= 0.0;
    bool _690 = isnan(_632);
    bool _692 = _688 || _690;
    bool _694 = isnan(0.0);
    bool _696 = _692 || _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _700 = 1.0 + _698;
    int _702 = _684;
    if (!_638)
    {
        int _704 = ~_644;
        int _706 = _704 + 1;
        _702 = _706;
    }
    int _708 = _702;
    float _710 = 1.0 / _700;
    bool _712 = !_628;
    int _714 = _712 ? 0 : 1;
    float _716 = _656 * _116;
    float _718 = _666 ? _642 : 0.0;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _724 = _722 != 0;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _728 = _726 != 0;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _732 = _730 != 0;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _736 = _678 ? 0 : 1;
    float _738 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[78].z, _720);
    float _740 = float(_708);
    float _742 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[78].w, _734);
    bool _744 = !_724;
    int _746 = _744 ? 0 : 1;
    float _748 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _738);
    bool _750 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _752 = isnan(1.0);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _758 = _754 || _756;
    float _760 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _742);
    int _762 = abs(_746);
    bool _764 = !_728;
    int _766 = _764 ? 0 : 1;
    int _768 = ~_736;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    float _774 = float(_762);
    int _776 = abs(_766);
    int _778 = _772;
    if (_758)
    {
        float _780 = _718 * _710;
        _126 = _780;
    }
    float _782 = _126;
    if (!_668)
    {
        int _784 = ~_736;
        int _786 = _784 + 1;
        _778 = _786;
    }
    int _788 = _778;
    float _790 = _774 * _740;
    float _792 = float(_776);
    float _794 = _546 + (-0.5);
    int _796 = _696 ? 0 : 1;
    float _798 = _790 * (-2.0);
    float _800 = float(_788);
    float _802 = fma(_798, _646, _646);
    float _804 = fma(_594, _798, _594);
    float _806 = _792 * _800;
    bool _808 = !_732;
    int _810 = _808 ? 0 : 1;
    float _812 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[196].x, _802);
    int _814 = ~_796;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    float _820 = _806 * (-2.0);
    int _822 = _818;
    if (!_686)
    {
        int _824 = ~_796;
        int _826 = _824 + 1;
        _822 = _826;
    }
    int _828 = _822;
    float _830 = fma(_804, _782, _812);
    int _832 = abs(_810);
    float _834 = _548 + (-0.5);
    float _836 = float(_828);
    float _838 = fma(_820, _648, _648);
    float _840 = float(_832);
    float _842 = fma(_616, _820, _616);
    float _844 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[196].y, _838);
    float _846 = _540 + _546;
    float _848 = _840 * _836;
    float _850 = _540 + (-0.5);
    float _852 = fma(_842, _782, _844);
    float _854 = _846 + (-1.0);
    float _856 = _848 * (-2.0);
    float _858 = in.m_61.x;
    float _860 = in.m_61.y;
    float _862 = in.m_61.z;
    float _864 = _830 * 0.15915493667125701904296875;
    float _866 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _868 = fma(_856, _650, _650);
    float _870 = in.m_63.x;
    float _872 = in.m_63.y;
    float _874 = in.m_63.z;
    float _876 = _852 * 0.15915493667125701904296875;
    float _878 = fma(_866, _856, _866);
    float _880 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[196].z, _868);
    float _882 = _864 * 6.283185482025146484375;
    float _884 = cos(_882);
    float _886 = fma(_878, _782, _880);
    float _888 = _886 * 0.15915493667125701904296875;
    float _890 = _876 * 6.283185482025146484375;
    float _892 = sin(_890);
    float _894 = _876 * 6.283185482025146484375;
    float _896 = cos(_894);
    float _898 = _516 * _860;
    float _900 = _518 * _862;
    float _902 = _514 * _858;
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _872);
    float _906 = in.m_46.x;
    float _908 = in.m_46.y;
    float _910 = in.m_46.z;
    float _912 = _898 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _914 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _870);
    float _916 = _864 * 6.283185482025146484375;
    float _918 = sin(_916);
    float _920 = _902 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _874);
    float _924 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _926 = _912 * _904;
    float _928 = _920 * _914;
    float _930 = _884 * _892;
    float _932 = _888 * 6.283185482025146484375;
    float _934 = cos(_932);
    float _936 = _884 * _896;
    float _938 = _924 * _922;
    float _940 = _888 * 6.283185482025146484375;
    float _942 = sin(_940);
    float _944 = _918 * _892;
    float _946 = _918 * _896;
    float _948 = _884 * _934;
    float _950 = _896 * _934;
    float _952 = _918 * _934;
    float _954 = _892 * _934;
    float _956 = _948 * _926;
    float _958 = _952 * _926;
    float _960 = fma(_942, _936, _944);
    float _962 = -_930;
    float _964 = fma(_942, _946, _962);
    float _966 = -_926;
    float _968 = _942 * _966;
    float _970 = -_946;
    float _972 = fma(_942, _930, _970);
    float _974 = fma(_960, _928, _956);
    float _976 = fma(_942, _944, _936);
    float _978 = fma(_950, _928, _968);
    float _980 = fma(_964, _928, _958);
    float _982 = fma(_972, _938, _974);
    float _984 = _908 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _986 = fma(_954, _938, _978);
    float _988 = _908 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _992 = fma(_976, _938, _980);
    float _994 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[6].x, _984);
    float _996 = _982 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[26].x, _990);
    float _1000 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[4].x, _988);
    float _1002 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[6].z, _994);
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[24].x, _996);
    float _1006 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[26].z, _998);
    float _1008 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1000);
    float _1010 = _1002 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1012 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1004);
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1016 = _1008 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1018 = _908 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1020 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1022 = _1010 + _1014;
    float _1024 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1018);
    float _1026 = _1016 + _1020;
    float _1028 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1030 = _1022 + _1028;
    float _1032 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1024);
    float _1034 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1036 = _1026 + _1034;
    float _1038 = _1030 * _1030;
    float _1040 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1042 = fma(_1036, _1036, _1038);
    float _1044 = _982 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1046 = sqrt(_1042);
    float _1048 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1044);
    float _1050 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1052 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1048);
    float _1054 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1050);
    float _1056 = _1052 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1058 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1054);
    float _1060 = _1040 + _1056;
    bool _1062 = _1046 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1064 = _1052;
    float _1066 = _1054;
    float _1068 = _1056;
    float _1070 = _1042;
    float _1072 = _1046;
    float _1074 = _1040;
    float _1076 = _1016;
    if (!_1062)
    {
        _1064 = _1026;
    }
    float _1078 = _1064;
    float _1080 = _1078;
    if (!_1062)
    {
        _1066 = _1022;
    }
    float _1082 = _1066;
    float _1084 = _1082;
    if (!_1062)
    {
        _1068 = _1060;
    }
    float _1086 = _1068;
    bool _1088 = !_1062;
    float _1090 = _1086;
    if (!_1088)
    {
        float _1092 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1096 = _1046 + _1094;
        float _1098 = rsqrt(_1042);
        float _1100 = _1096 * _1092;
        float _1102 = _1060 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1104 = _1100 * 0.15915493667125701904296875;
        float _1106 = _1104 * 6.283185482025146484375;
        float _1108 = cos(_1106);
        float _1110 = _1104 * 6.283185482025146484375;
        float _1112 = sin(_1110);
        float _1114 = _1108 + (-1.0);
        float _1116 = fma(_1112, _1102, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1118 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = _1098 * _1116;
        float _1122 = fma(_1060, _1108, _1118);
        float _1124 = fma(_1036, _1120, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1126 = fma(_1030, _1120, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1090 = _1122;
        _1080 = _1124;
        _1084 = _1126;
        _1070 = _1098;
    }
    float _1128 = _1090;
    float _1130 = _1080;
    float _1132 = _1084;
    float _1134 = _1070;
    float _1136 = -_1040;
    float _1138 = _1136 + _1128;
    float _1140 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1142 = -_1016;
    float _1144 = _1142 + _1130;
    float _1146 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1148 = _1138 * _1138;
    float _1150 = -_1010;
    float _1152 = _1150 + _1132;
    float _1154 = 1.0 / _1140;
    float _1156 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1146);
    float _1158 = fma(_1144, _1144, _1148);
    float _1160 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1156);
    float _1162 = fma(_1152, _1152, _1158);
    bool _1164 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1166 = isnan(0.5);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1172 = _1168 || _1170;
    float _1174 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1176 = sqrt(_1162);
    bool _1178 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1180 = isnan(0.5);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1186 = _1182 || _1184;
    float _1188 = _1174 + _1140;
    float _1190 = _1188 * _1154;
    float _1192 = _1190 * 0.5;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1196 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1194);
    bool _1198 = _1176 > 0.0;
    float _1200 = 1.0 / _1196;
    float _1202 = _1134;
    float _1204 = _1176;
    float _1206 = _1130;
    float _1208 = _1128;
    float _1210 = _1132;
    float _1212 = _1162;
    if (!_1198)
    {
        _1202 = _1128;
    }
    float _1214 = _1202;
    float _1216 = _1214;
    float _1218 = _1214;
    if (!_1198)
    {
        _1204 = _1132;
    }
    float _1220 = _1204;
    bool _1222 = !_1198;
    float _1224 = _1220;
    float _1226 = 0.0;
    if (!_1222)
    {
        float _1228 = _188 * _188;
        float _1230 = fma(_186, _186, _1228);
        float _1232 = rsqrt(_1162);
        float _1234 = fma(_190, _190, _1230);
        float _1236 = sqrt(_1234);
        float _1238 = _1144 * _1232;
        float _1240 = _1138 * _1232;
        float _1242 = _1152 * _1232;
        bool _1244 = _1236 > 0.0;
        float _1246 = _1236;
        _1226 = _1238;
        _1072 = _1234;
        if (!_1244)
        {
            _1216 = _1128;
        }
        float _1248 = _1216;
        _1218 = _1248;
        if (!_1244)
        {
            _1246 = _1132;
        }
        float _1250 = _1246;
        bool _1252 = !_1244;
        _1224 = _1250;
        if (!_1252)
        {
            float _1254 = rsqrt(_1234);
            float _1256 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1258 = _188 * _1254;
            float _1260 = _186 * _1254;
            float _1262 = _1240 * _1258;
            float _1264 = _190 * _1254;
            float _1266 = fma(_1238, _1260, _1262);
            float _1268 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1270 = fma(_1242, _1264, _1266);
            float _1272 = _1270 * _1268;
            float _1274 = fma(_186, _1272, _1130);
            float _1276 = fma(_188, _1272, _1128);
            float _1278 = fma(_190, _1272, _1132);
            _1206 = _1274;
            _1218 = _1276;
            _1224 = _1278;
            _1072 = _1254;
        }
    }
    float _1280 = _1206;
    float _1282 = _1218;
    float _1284 = _1224;
    float _1286 = _1226;
    float _1288 = _1072;
    float _1290 = _1284;
    float _1292 = _1286;
    if (_1186)
    {
        _1208 = 1.0;
    }
    float _1294 = _1208;
    float _1296 = _1294;
    if (_1172)
    {
        _1210 = _1280;
    }
    float _1298 = _1210;
    float _1300 = _1298;
    if (_1172)
    {
        _196 = _1282;
    }
    float _1302 = _196;
    float _1304 = _1302;
    if (!_1172)
    {
        float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1308 = _1040 + _1306;
        float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1312 = _1016 + _1310;
        float _1314 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1316 = -_1040;
        float _1318 = _1316 + _1282;
        float _1320 = _1308 * _1308;
        float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1324 = _1010 + _1322;
        float _1326 = -_1010;
        float _1328 = _1326 + _1284;
        float _1330 = fma(_1312, _1312, _1320);
        float _1332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1334 = fma(_1324, _1324, _1330);
        float _1336 = sqrt(_1334);
        float _1338 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1340 = precise::min(_1336, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1342 = _1340 * _1332;
        float _1344 = _1338 * _1342;
        float _1346 = -_1016;
        float _1348 = _1346 + _1280;
        float _1350 = fma(_1318, _1344, _1040);
        float _1352 = fma(_1348, _1344, _1016);
        float _1354 = fma(_1328, _1344, _1010);
        _1304 = _1350;
        _1300 = _1352;
        _1290 = _1354;
    }
    float _1356 = _1304;
    float _1358 = _1300;
    float _1360 = _1290;
    if (_1186)
    {
        _1074 = 1.0;
    }
    float _1362 = _1074;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1366 = _1200 * _1364;
    float _1368 = _1362;
    if (!_1186)
    {
        float _1370 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1372 = _1370 * 0.15915493667125701904296875;
        float _1374 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1378 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1376;
        float _1380 = _1372 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        float _1384 = _1374 * 0.15915493667125701904296875;
        float _1386 = _1372 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        float _1390 = 1.0 / _1382;
        float _1392 = _1384 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        float _1396 = _1388 * _1390;
        float _1398 = _1384 * 6.283185482025146484375;
        float _1400 = sin(_1398);
        float _1402 = _1394 * _1396;
        float _1404 = 1.0 / _1378;
        float _1406 = 1.0 / _1402;
        float _1408 = _1400 * _1406;
        float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1412 = fma(_1366, _1408, _1410);
        float _1414 = _1412 * _1404;
        float _1416 = precise::clamp(_1414, 0.0, 1.0);
        _1296 = _1416;
    }
    float _1418 = _1296;
    if (!_1186)
    {
        float _1420 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1422 = _1420 * 0.15915493667125701904296875;
        float _1424 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1426 = _1422 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1424 * 0.15915493667125701904296875;
        float _1432 = _1422 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = 1.0 / _1428;
        float _1438 = _1430 * 6.283185482025146484375;
        float _1440 = cos(_1438);
        float _1442 = _1434 * _1436;
        float _1444 = _1430 * 6.283185482025146484375;
        float _1446 = sin(_1444);
        float _1448 = _1440 * _1442;
        float _1450 = 1.0 / _1448;
        float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1454 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1452;
        float _1456 = 1.0 / _1454;
        float _1458 = _1446 * _1450;
        float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1462 = fma(_1366, _1458, _1460);
        float _1464 = _1462 * _1456;
        float _1466 = precise::clamp(_1464, 0.0, 1.0);
        float _1468 = -_1466;
        float _1470 = _1468 + 1.0;
        _1368 = _1470;
    }
    float _1472 = _1368;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1476 = _1356 + _1474;
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1480 = _1358 + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1484 = _1360 + _1482;
    float _1486 = _1476 * _1476;
    float _1488 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1490 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1492 = fma(_1480, _1480, _1486);
    float _1494 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1488);
    float _1496 = fma(_1484, _1484, _1492);
    float _1498 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1494);
    float _1500 = rsqrt(_1496);
    float _1502 = sqrt(_1496);
    float _1504 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1506 = _1480 * _1504;
    float _1508 = _1484 * _1504;
    float _1510 = _1506 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 + _1512;
    float _1516 = sqrt(_1514);
    bool _1518 = _1516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1516 + _1520;
    float _1524 = _1492;
    float _1526 = _1514;
    float _1528 = _1522;
    float _1530 = _1506;
    float _1532 = _1508;
    float _1534 = _1510;
    float _1536 = _1512;
    if (_1518)
    {
        float _1538 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1524 = _1538;
    }
    float _1540 = _1524;
    if (_1518)
    {
        float _1542 = rsqrt(_1514);
        _1526 = _1542;
    }
    float _1544 = _1526;
    if (_1518)
    {
        float _1546 = _1522 * _1540;
        _1528 = _1546;
    }
    float _1548 = _1528;
    if (_1518)
    {
        float _1550 = _1548 * 0.15915493667125701904296875;
        _1292 = _1550;
    }
    float _1552 = _1292;
    float _1554 = _1540;
    if (_1518)
    {
        float _1556 = _1552 * 6.283185482025146484375;
        float _1558 = sin(_1556);
        _1554 = _1558;
    }
    float _1560 = _1554;
    float _1562 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1564 = precise::max(0.0, _1562);
    float _1566 = _1288;
    if (_1518)
    {
        float _1568 = _1552 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        _1566 = _1570;
    }
    float _1572 = _1566;
    float _1574 = -_1504;
    float _1576 = -_1564;
    float _1578 = fma(_1476, _1574, _1576);
    if (_1518)
    {
        float _1580 = _1578 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1212 = _1580;
    }
    float _1582 = _1212;
    float _1584 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1586 = _1582;
    float _1588 = _1560;
    if (_1518)
    {
        float _1590 = fma(_1560, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1586 = _1590;
    }
    float _1592 = _1586;
    float _1594 = _1592;
    if (!_1518)
    {
        _1588 = _1578;
    }
    float _1596 = _1588;
    float _1598 = floor(_1584);
    float _1600 = _1596;
    if (_1518)
    {
        float _1602 = _1572 + (-1.0);
        _1076 = _1602;
    }
    float _1604 = _1076;
    float _1606 = _1604;
    if (_1518)
    {
        float _1608 = _1544 * _1592;
        _1594 = _1608;
    }
    float _1610 = _1594;
    float _1612 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1518)
    {
        float _1614 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1606 = _1614;
    }
    float _1616 = _1606;
    if (_1518)
    {
        float _1618 = _1506 * _1610;
        _1530 = _1618;
    }
    float _1620 = _1530;
    if (_1518)
    {
        float _1622 = _1508 * _1610;
        _1532 = _1622;
    }
    float _1624 = _1532;
    float _1626 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1612);
    if (_1518)
    {
        float _1628 = fma(_1578, _1572, _1616);
        _1600 = _1628;
    }
    float _1630 = _1600;
    if (_1518)
    {
        float _1632 = _1620 * _1620;
        _1534 = _1632;
    }
    float _1634 = _1534;
    if (_1518)
    {
        float _1636 = _1624 * _1624;
        _1536 = _1636;
    }
    float _1638 = _1536;
    float _1640 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1626);
    float _1642 = fma(_1630, _1630, _1634);
    float _1644 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1646 = -_1598;
    float _1648 = _1584 + _1646;
    float _1650 = _1642 + _1638;
    float _1652 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1654 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1656 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1654);
    float _1658 = precise::clamp(_1656, 0.0, 1.0);
    float _1660 = fma(_1010, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1662 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1664 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1652);
    float _1666 = rsqrt(_1650);
    float _1668 = -_1658;
    float _1670 = _1668 + 1.0;
    float _1672 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1490);
    float _1674 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1664);
    float _1676 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1678 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1680 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1672);
    float _1682 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1684 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1686 = abs(_1670);
    float _1688 = log2(_1686);
    float _1690 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1692 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1694 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1684);
    float _1696 = -_1690;
    float _1698 = fma(_1696, _1662, 1.0);
    float _1700 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1702 = _1666 * _1620;
    float _1704 = _1666 * _1630;
    float _1706 = floor(_1660);
    float _1708 = _1666 * _1624;
    float _1710 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1712 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1694);
    float _1714 = -_1710;
    float _1716 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1714);
    float _1718 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1720 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1712);
    float _1722 = log2(_1698);
    float _1724 = -_1708;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1716);
    float _1728 = fma(_1726, -0.5, 0.5);
    float _1730 = fma(_1726, 0.5, 0.5);
    float _1732 = -_1706;
    float _1734 = _1660 + _1732;
    float _1736 = exp2(_1718);
    float _1738 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1678);
    float _1740 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1692);
    float _1742 = _1704 + 1.0;
    float _1744 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1738);
    float _1746 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1740);
    float _1748 = 1.0 / _1720;
    float _1750 = fma(_1730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1752 = _1722 * 0.693147182464599609375;
    float _1754 = fma(_1730, _1750, -0.212114393711090087890625);
    float _1756 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1758 = sqrt(_1728);
    float _1760 = -_1704;
    float _1762 = fma(_1736, _1742, _1760);
    float _1764 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1744);
    float _1766 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1746);
    float _1768 = fma(_1730, _1754, 1.570728778839111328125);
    float _1770 = fma(_1762, 0.5, 0.5);
    float _1772 = _1764 * _1748;
    float _1774 = _1766 * _1748;
    float _1776 = fma(_1772, 0.5, 0.5);
    float _1778 = fma(_1774, -0.5, 0.5);
    float _1780 = _1758 * 0.636619746685028076171875;
    float2 _5734 = float2(_1648, _1734);
    float _1782 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5734, float2(0.0), isnan(_5734)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5734, float2(0.0), isnan(_5734)), level(0.0)).x;
    float _1784 = -_1768;
    float _1786 = fma(_1780, _1784, 1.0);
    float3 _5750 = float3(_1776, _1778, _1756);
    float _1788 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5750, float3(0.0), isnan(_5750)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5750, float3(0.0), isnan(_5750)), level(0.0)).x;
    float3 _5761 = float3(_1776, _1778, _1756);
    float4 _1791 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5761, float3(0.0), isnan(_5761)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5761, float3(0.0), isnan(_5761)), level(0.0)).xyzw;
    float _1793 = _1791.x;
    float _1795 = _1791.y;
    float _1797 = _1791.z;
    float _1799 = _1791.w;
    float2 _5777 = float2(_1786, _1770);
    float3 _1803 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5777, float2(0.0), isnan(_5777)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5777, float2(0.0), isnan(_5777)), level(0.0)).xyz;
    float _1805 = _1803.x;
    float _1807 = _1803.y;
    float _1809 = _1803.z;
    float _1811 = float(uint(_562));
    float _1813 = trunc(_716);
    int _1815 = int(_1813);
    int _1817 = ~_562;
    int _1819 = _1817 + 1;
    float _1821 = _596 * _168;
    bool _1823 = _562 == 0;
    int _1825 = abs(_636);
    int _1827 = abs(_654);
    float _1829 = 1.0 / _1811;
    float _1831 = float(uint(_1815));
    float _1833 = trunc(_1821);
    int _1835 = int(_1833);
    int _1837 = as_type<int>(_1829) + (-2);
    float _1839 = as_type<float>(_1837) * _1831;
    int _1841 = ~_562;
    int _1843 = _1841 + 1;
    float _1845 = trunc(_1839);
    float _1847 = precise::max(_1845, 0.0);
    uint _1850 = uint(_1847);
    int _1852 = _1819 * int(_1850);
    int _1854 = _1852 + _1815;
    float _1856 = float(uint(_1854));
    float _1858 = as_type<float>(_1837) * _1856;
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1862 = _1860 != 0;
    float _1864 = trunc(_1858);
    float _1866 = precise::max(_1864, 0.0);
    uint _1868 = uint(_1866);
    bool _1870 = !_1862;
    float _1872 = _1870 ? 7.345489978790283203125 : 1.0;
    float _1874 = _1872 * _546;
    float _1876 = float(_1815);
    float _1878 = floor(_1874);
    bool _1880 = _1876 >= _584;
    bool _1882 = isnan(_1876);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan(_584);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    int _1892 = int(_1850) + int(_1868);
    float _1894 = trunc(_1890);
    int _1896 = int(_1894);
    int _1898 = _1843 * _1892;
    int _1900 = _1898 + _1815;
    bool _1902 = uint(_1900) >= uint(_562);
    float _1904 = -_1878;
    float _1906 = _1874 + _1904;
    bool _1908 = !_1902;
    int _1910 = _1908 ? 0 : (-1);
    int _1912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1914 = _1912 != 0;
    int _1916 = ~_1892;
    int _1918 = _1916 + _1910;
    int _1920 = _1918 + 1;
    float _1922 = _1906 * _584;
    int _1924 = ~_1896;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    bool _1930 = !_1914;
    int _1932 = _1930 ? 0 : 1;
    int _1934 = _562 * _1920;
    int _1936 = _1934 + _1815;
    int _1938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1940 = _1938 != 0;
    float _1942 = trunc(_1922);
    int _1944 = int(_1942);
    int _1946 = abs(_1932);
    bool _1948 = !_1823;
    int _1950 = _1948 ? _1936 : (-1);
    int _1952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1954 = _1952 != 0;
    int _1956 = _1950 * _1928;
    int _1958 = _562 + (-1);
    float _1960 = in.m_65.y;
    int _1962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1964 = _1962 != 0;
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1968 = _1966 != 0;
    int _1970 = _1896 * _1958;
    int _1972 = _1970 + _1956;
    int _1974 = _1972 * _1825;
    int _1976 = _1944 * _1946;
    int _1978 = _1976 + _1815;
    int _1980 = _1835 * _1827;
    int _1982 = _1980 + _1974;
    int _1984 = abs(_714);
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1988 = _1986 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1990 = !_1940;
    int _1992 = _1990 ? 0 : 1;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _1994 = _548 > 0.5;
    int _1996 = abs(_1992);
    int _1998 = _1978 * _1984;
    int _2000 = _1998 + _1982;
    float _2002 = 1.0 / _1988;
    float _2004 = -_1960;
    float _2006 = _2004 + 1.0;
    int _2008 = ~_562;
    int _2010 = _2008 + 1;
    int _2012 = _1944 * _1996;
    int _2014 = _2012 + _2000;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2018 = _2016 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2020 = as_type<float>(_1996);
    float _2022 = _1960;
    if (_1954)
    {
        float _2024 = in.m_57.x;
        _2020 = _2024;
    }
    float _2026 = _2020;
    if (_1964)
    {
        float _2028 = _1994 ? _2006 : _1960;
        _2022 = _2028;
    }
    float _2030 = _2022;
    float _2032 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2032;
    float _2036 = float(uint(_2014));
    float _2038 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2040 = _2038 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2042 = 1.0 / _2018;
    float _2044 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2046 = as_type<float>(_1837) * _2036;
    float _2048 = _2034 * _2002;
    float _2050 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2052 = -_630;
    float _2054 = fma(_760, _2044, _2052);
    float _2056 = trunc(_2046);
    float _2058 = precise::max(_2056, 0.0);
    uint _2060 = uint(_2058);
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2068 = in.m_65.x;
    float _2070 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2072 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2074 = _2040 * _2042;
    float _2076 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2078 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2080 = isnan(_538);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2086 = _2082 || _2084;
    float _2088 = float(_2086);
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2092 = _538 + _2090;
    bool _2094 = _2026 > 0.5;
    bool _2096 = _2094 && _1954;
    out.m_69.x = _2076;
    out.m_69.y = _2070;
    out.m_69.z = _2072;
    out.m_69.w = _2064;
    bool _2098 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2100 = isnan(_538);
    bool _2102 = _2098 || _2100;
    bool _2104 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2106 = _2102 || _2104;
    float _2108 = float(_2106);
    float _2110 = fma(_2048, _2092, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _2112 = _2010 * int(_2060);
    int _2114 = _2112 + _2014;
    float _2116 = in.m_71.x;
    float _2118 = in.m_71.y;
    float _2120 = in.m_71.z;
    bool _2122 = _872 != 0.0;
    bool _2124 = isnan(_872);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan(0.0);
    bool _2130 = _2126 || _2128;
    float _2132 = float(uint(_1978));
    float _2134 = float(uint(_2114));
    bool _2136 = _870 == 0.0;
    bool _2138 = !_2130;
    bool _2140 = _2136 && _2138;
    float _2142 = as_type<float>(_1837) * _2132;
    bool _2144 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2146 = isnan(_538);
    bool _2148 = _2144 || _2146;
    bool _2150 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2152 = _2148 || _2150;
    float _2154 = float(_2152);
    float _2156 = as_type<float>(_1837) * _2134;
    float _2158 = -_2088;
    float _2160 = _2158 + 1.0;
    float _2162 = _2092;
    float _2164 = _2068;
    if (_1954)
    {
        _2162 = _2068;
    }
    float _2166 = _2162;
    float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2170 = _538 + _2168;
    bool _2172 = _874 == 0.0;
    bool _2174 = _2172 && _2140;
    float _2176 = _2108 * _2160;
    float _2178 = trunc(_2156);
    float _2180 = precise::max(_2178, 0.0);
    uint _2182 = uint(_2180);
    float _2184 = -_2108;
    float _2186 = _2184 + 1.0;
    float _2188 = _2166;
    if (_2096)
    {
        float _2190 = -_2166;
        float _2192 = _2190 + 1.0;
        _2188 = _2192;
    }
    float _2194 = _2188;
    float _2196 = fma(_2074, _2170, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _2198 = ~_562;
    int _2200 = _2198 + 1;
    float _2202 = _2154 * _2186;
    float _2204 = -_2154;
    float _2206 = _2204 + 1.0;
    if (_1954)
    {
        _2164 = _2194;
    }
    float _2208 = _2164;
    float _2210 = trunc(_2142);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    int _2216 = ~_562;
    int _2218 = _2216 + 1;
    float _2220 = _2110 * _2202;
    float _2222 = _2118;
    float _2224 = _2116;
    float _2226 = _2120;
    if (!_2174)
    {
        float _2228 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2118);
        _2222 = _2228;
    }
    float _2230 = _2222;
    if (!_2174)
    {
        float _2232 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2116);
        _2224 = _2232;
    }
    float _2234 = _2224;
    float _2236 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2238 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2220);
    int _2240 = int(_2060) + int(_2182);
    if (!_2174)
    {
        float _2242 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2120);
        _2226 = _2242;
    }
    float _2244 = _2226;
    float _2246 = fma(_748, _2236, _600);
    float _2248 = fma(_2196, _2176, _2238);
    int _2250 = _2200 * _2240;
    int _2252 = _2250 + _2014;
    float _2254 = abs(_1366);
    float _2256 = log2(_2254);
    int _2258 = _2218 * int(_2214);
    int _2260 = _2258 + _1978;
    float _2262 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2248);
    bool _2264 = uint(_2252) >= uint(_562);
    float _2266 = _948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2268 = _2262 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2270 = float(uint(_2260));
    float _2272 = _972 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2274 = !_2264;
    int _2276 = _2274 ? 0 : (-1);
    float _2278 = _972 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2280 = as_type<float>(_1837) * _2270;
    int _2282 = ~_2240;
    int _2284 = _2282 + _2276;
    int _2286 = _2284 + 1;
    float _2288 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2292 = _2246 + 0.5;
    float _2294 = _2054 + 0.5;
    float _2296 = trunc(_2280);
    float _2298 = precise::max(_2296, 0.0);
    uint _2300 = uint(_2298);
    int _2302 = _562 * _2286;
    int _2304 = _2302 + _2014;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2308 = _2288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _2292;
    out.m_73.y = _2294;
    float _2310 = _2290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2312 = !_1823;
    int _2314 = _2312 ? _2304 : (-1);
    float _2316 = _2306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2318 = ~_562;
    int _2320 = _2318 + 1;
    float _2322 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2324 = _948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2326 = _948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_75.x = _2316;
    out.m_75.y = _2308;
    out.m_75.z = _2310;
    out.m_75.w = _2268;
    float _2328 = exp2(_2322);
    int _2330 = _2314 >> 31;
    float _2332 = _972 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2334 = int(_2214) + int(_2300);
    float _2336 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    int _2338 = _2330 & 3;
    float _2340 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2332);
    int _2342 = _2320 * _2334;
    int _2344 = _2342 + _1978;
    float _2346 = -_942;
    float _2348 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2266);
    float _2350 = _960 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2352 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2278);
    int _2354 = _2314 & 3;
    bool _2356 = _2354 != 0;
    float _2358 = -_942;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2324);
    int _2362 = _2314 + _2338;
    float _2364 = _960 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2366 = uint(_2344) >= uint(_562);
    float _2368 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2360);
    int _2370 = _2362 >> 2;
    float _2372 = _960 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2374 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2364);
    float _2376 = -_942;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2326);
    int _2380 = _2370 << 4;
    int _2382 = _2380 + 368;
    float _2384 = fma(_2328, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2386 = precise::clamp(_2384, 0.0, 1.0);
    float _2388 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2348);
    float _2390 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2378);
    uint _2392 = uint(int(uint(_2382) >> uint(2)));
    uint _2394 = uint(int(uint(int(_2392)) >> uint(2)));
    int _2396 = int(_2392) & 3;
    float _2398 = (*spvDescriptorSet0.vp_c9)._m0[int(_2394)][_2396];
    int _2400 = int(_2392) + 1;
    uint _2402 = uint(int(uint(_2400) >> uint(2)));
    int _2404 = _2400 & 3;
    float _2406 = (*spvDescriptorSet0.vp_c9)._m0[int(_2402)][_2404];
    float _2408 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2350);
    float _2410 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2372);
    float _2412 = _2388 * _2230;
    float _2414 = _2368 * _2230;
    float _2416 = _2390 * _2230;
    float _2418 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2374);
    float _2420 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2408);
    int _2422 = _2382 + 8;
    uint _2424 = uint(int(uint(_2422) >> uint(2)));
    uint _2426 = uint(int(uint(int(_2424)) >> uint(2)));
    int _2428 = int(_2424) & 3;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[int(_2426)][_2428];
    int _2432 = int(_2424) + 1;
    uint _2434 = uint(int(uint(_2432) >> uint(2)));
    int _2436 = _2432 & 3;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[int(_2434)][_2436];
    float _2440 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2410);
    int _2442 = _2314 & 3;
    bool _2444 = _2442 != 0;
    float _2446 = fma(_2420, _2234, _2414);
    int _2448 = _2356 ? 0 : 1;
    float _2450 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2340);
    bool _2452 = uint(_2442) > 1u;
    float _2454 = fma(_2440, _2234, _2416);
    bool _2456 = _2442 != 3;
    float _2458 = fma(_2450, _2244, _2446);
    float _2460 = in.m_77.x;
    bool _2462 = !_2366;
    int _2464 = _2462 ? 0 : (-1);
    float _2466 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2336);
    bool _2468 = uint(_2442) >= 2u;
    float _2470 = fma(_2386, -2.0, 3.0);
    int _2472 = ~_2448;
    int _2474 = _2472 + 1;
    int _2476 = _2474 + 1;
    float _2478 = _2386 * _2386;
    int _2480 = ~_2334;
    int _2482 = _2480 + _2464;
    int _2484 = _2482 + 1;
    float _2486 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2352);
    int _2488 = _2476;
    if (!_2452)
    {
        int _2490 = ~_2448;
        int _2492 = _2490 + 1;
        _2488 = _2492;
    }
    int _2494 = _2488;
    float _2496 = fma(_2418, _2234, _2412);
    bool _2498 = !_2444;
    int _2500 = _2498 ? 0 : 1;
    float _2502 = _2478 * _2470;
    int _2504 = _2468 ? 0 : 1;
    int _2506 = _562 * _2484;
    int _2508 = _2506 + _1978;
    bool _2510 = _2442 != 3;
    float _2512 = _1720 * 0.5;
    int _2514 = abs(_2494);
    float _2516 = -_1782;
    float _2518 = _2516 + 1.0;
    int _2520 = ~_2504;
    int _2522 = _2520 + 1;
    int _2524 = _2522 + 1;
    float _2526 = fma(_2466, _2244, _2496);
    bool _2528 = !_2510;
    int _2530 = _2528 ? 0 : (-1);
    float _2532 = fma(_2486, _2244, _2454);
    int _2534 = abs(_2500);
    int _2536 = _2524;
    if (_2456)
    {
        int _2538 = ~_2504;
        int _2540 = _2538 + 1;
        _2536 = _2540;
    }
    int _2542 = _2536;
    int _2544 = ~_2514;
    int _2546 = _2544 + 1;
    int _2548 = _2546 + 1;
    out.m_79.x = _2526;
    out.m_79.y = _2458;
    out.m_79.z = _2532;
    bool _2550 = !_1968;
    int _2552 = _2550 ? 0 : 1;
    int _2554 = abs(_2530);
    int _2556 = _2548 * as_type<int>(_2406);
    int _2558 = abs(_2542);
    int _2560 = ~_2534;
    int _2562 = _2560 + 1;
    int _2564 = _2562 + 1;
    int _2566 = abs(_2552);
    int _2568 = _2564 * as_type<int>(_2398);
    int _2570 = _2568 + _2556;
    int _2572 = ~_2558;
    int _2574 = _2572 + 1;
    int _2576 = _2574 + 1;
    int _2578 = ~_2554;
    int _2580 = _2578 + 1;
    int _2582 = _2580 + 1;
    int _2584 = _2576 * as_type<int>(_2430);
    int _2586 = _2584 + _2570;
    int _2588 = ~_2566;
    int _2590 = _2588 + 1;
    int _2592 = _2590 + 1;
    float _2594 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2596 = _2582 * as_type<int>(_2438);
    int _2598 = _2596 + _2586;
    float _2600 = -_2502;
    float _2602 = _2600 + 1.0;
    float _2604 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2594);
    bool _2606 = !_1823;
    int _2608 = _2606 ? _2508 : (-1);
    int _2610 = _2598 * _2592;
    float _2612 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2614 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2604);
    float _2616 = fma(_2602, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2502);
    int _2618 = _2608 * _2566;
    int _2620 = _2618 + _2610;
    float _2622 = fma(_1766, -0.5, _2512);
    float _2624 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2614);
    float _2626 = exp2(_2612);
    bool _2628 = _1366 <= 8000.0;
    bool _2630 = isnan(_1366);
    bool _2632 = _2628 || _2630;
    bool _2634 = isnan(8000.0);
    bool _2636 = _2632 || _2634;
    float _2638 = float(_2636);
    float _2640 = float(_2620);
    float _2642 = _2624 + _1720;
    float _2644 = _1764 + _1720;
    float _2646 = _2638 * _2616;
    float _2648 = _2642 * 0.5;
    float _2650 = _2644 * 0.5;
    float _2652 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1764;
    out.gl_Position.y = _1766;
    out.gl_Position.z = _2624;
    out.gl_Position.w = _1720;
    bool _2654 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2656 = isnan(_1502);
    bool _2658 = _2654 || _2656;
    bool _2660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2662 = _2658 || _2660;
    float _2664 = _2518 * _2652;
    float _2666 = precise::clamp(_2664, 0.0, 1.0);
    out.m_81.x = _2650;
    out.m_81.y = _2622;
    out.m_81.z = _2648;
    out.m_81.w = _1720;
    float _2668 = -_2626;
    float _2670 = _2668 + 1.0;
    float _2672 = -_2666;
    float _2674 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2640;
    float _2676 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2678 = _2674 * _2460;
    float _2680 = _2676 * _1788;
    float _2682 = _2640;
    float _2684 = _2650;
    if (!_2662)
    {
        _2682 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2686 = _2682;
    float _2688 = _1799 * _2680;
    float _2690 = _1809 * _2680;
    float _2692 = -_2676;
    float _2694 = _2692 + 1.0;
    float _2696 = _2678 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2698 = fma(_1805, _2688, _1793);
    float _2700 = fma(_1807, _2688, _1795);
    float _2702 = _1799 * _2694;
    float _2704 = fma(_1799, _2690, _1797);
    out.m_85.x = _2696;
    float _2706 = _1418 * _1472;
    float _2708 = _2688;
    float _2710 = _2690;
    float _2712 = _2694;
    float _2714 = _2706;
    float _2716 = _2686;
    float _2718 = _2686;
    if (!_2662)
    {
        _2684 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2720 = _2684;
    out.m_87.x = _2698;
    out.m_87.y = _2700;
    out.m_87.z = _2704;
    out.m_87.w = _2702;
    float _2722 = _2706 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2724 = _2720;
    float _2726 = _2720;
    if (!_2662)
    {
        _2708 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2728 = _2708;
    float _2730 = _2728;
    float _2732 = _2728;
    if (!_2662)
    {
        _2710 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2734 = _2710;
    float _2736 = _2734;
    float _2738 = _2734;
    if (!_2662)
    {
        _2712 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2740 = _2712;
    float _2742 = _2740;
    float _2744 = _2740;
    if (!_2662)
    {
        _2714 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2746 = _2714;
    bool _2748 = !_2662;
    float _2750 = _2746;
    float _2752 = _2746;
    if (!_2748)
    {
        bool _2754 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2756 = isnan(_1502);
        bool _2758 = _2754 || _2756;
        bool _2760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2762 = _2758 || _2760;
        if (!_2762)
        {
            float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2766 = _1502 + _2764;
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2770 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2768;
            float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2776 = 1.0 / _2770;
            float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2782 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2784 = _2782 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2794 = _2766 * _2776;
            float _2796 = precise::clamp(_2794, 0.0, 1.0);
            float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2802 = fma(_2796, _2774, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2804 = fma(_2796, _2800, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2806 = fma(_2796, _2780, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2808 = fma(_2796, _2784, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2810 = fma(_2796, _2788, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2812 = fma(_2796, _2792, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2732 = _2806;
            _2744 = _2810;
            _2726 = _2802;
            _2738 = _2808;
            _2718 = _2804;
            _2752 = _2812;
            _2814 = true;
        }
        else
        {
            bool _2816 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2818 = isnan(_1502);
            bool _2820 = _2816 || _2818;
            bool _2822 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2824 = _2820 || _2822;
            if (!_2824)
            {
                _2724 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2826 = _2724;
            _2726 = _2826;
            if (!_2824)
            {
                _2730 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2828 = _2730;
            _2732 = _2828;
            if (!_2824)
            {
                _2716 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2830 = _2716;
            _2718 = _2830;
            if (!_2824)
            {
                _2736 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2832 = _2736;
            _2738 = _2832;
            if (!_2824)
            {
                _2742 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2834 = _2742;
            _2744 = _2834;
            if (!_2824)
            {
                _2750 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2836 = _2750;
            bool _2838 = !_2824;
            _2752 = _2836;
            if (!_2838)
            {
                bool _2840 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2842 = isnan(_1502);
                bool _2844 = _2840 || _2842;
                bool _2846 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2848 = _2844 || _2846;
                if (!_2848)
                {
                    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2852 = _1502 + _2850;
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2856 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2854;
                    float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2862 = 1.0 / _2856;
                    float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2870 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2872 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2880 = _2852 * _2862;
                    float _2882 = precise::clamp(_2880, 0.0, 1.0);
                    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2886 = _2884 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2888 = fma(_2882, _2860, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2890 = fma(_2882, _2886, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2892 = fma(_2882, _2866, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2894 = fma(_2882, _2870, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2896 = fma(_2882, _2874, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2898 = fma(_2882, _2878, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2732 = _2892;
                    _2744 = _2896;
                    _2726 = _2888;
                    _2738 = _2894;
                    _2718 = _2890;
                    _2752 = _2898;
                    _2814 = true;
                }
                else
                {
                    _2732 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2744 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2726 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2738 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2718 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2752 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2814 = false;
    float _2900 = _2732;
    float _2902 = _2744;
    float _2904 = _2726;
    float _2906 = _2738;
    float _2908 = _2718;
    float _2910 = _2752;
    float _2912 = fma(_2458, -0.5, 0.5);
    float _2914 = precise::clamp(_2912, 0.0, 1.0);
    float _2916 = -_2900;
    float _2918 = _2916 + _2902;
    float _2920 = _2722 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2922 = -_2904;
    float _2924 = _2922 + _2906;
    out.m_89.x = 0.0;
    float _2926 = fma(_2914, _2918, _2900);
    float _2928 = fma(_2914, _2924, _2904);
    out.m_53.x = _2920;
    float _2930 = -_2908;
    float _2932 = _2930 + _2910;
    float _2934 = _2926 * 0.586610972881317138671875;
    bool _2936 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2938 = fma(_2914, _2932, _2908);
    float _2940 = fma(_2928, 0.298911988735198974609375, _2934);
    bool _2942 = _1418 > 0.0;
    bool _2944 = isnan(_1418);
    bool _2946 = _2942 || _2944;
    bool _2948 = isnan(0.0);
    bool _2950 = _2946 || _2948;
    float _2952 = fma(_2938, 0.114477999508380889892578125, _2940);
    bool _2954 = _1472 <= 0.0;
    bool _2956 = !_2950;
    bool _2958 = _2954 || _2956;
    float _2960 = -_2952;
    float _2962 = _2928 + _2960;
    float _2964 = -_2952;
    float _2966 = _2926 + _2964;
    float _2968 = -_2952;
    float _2970 = _2938 + _2968;
    float _2972 = fma(_2962, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2952);
    float _2974 = fma(_2966, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2952);
    float _2976 = fma(_2970, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2952);
    bool _2978 = !_2936;
    if (!_2978)
    {
        float _2980 = -_1356;
        float _2982 = _2980 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2984 = -_1358;
        float _2986 = _2984 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2988 = -_1360;
        float _2990 = _2988 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2992 = _2982 * _2982;
        float _2994 = fma(_2986, _2986, _2992);
        float _2996 = fma(_2990, _2990, _2994);
        float _2998 = sqrt(_2996);
        float _3000 = rsqrt(_2996);
        float _3002 = -_2998;
        float _3004 = _3002 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3006 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3008 = precise::clamp(_3006, 0.0, 1.0);
        float _3010 = _2986 * _3000;
        float _3012 = _2982 * _3000;
        float _3014 = abs(_3008);
        float _3016 = log2(_3014);
        float _3018 = _2990 * _3000;
        float _3020 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3022 = _2458 * _3012;
        float _3024 = -_3012;
        float _3026 = -_3020;
        float _3028 = fma(_3024, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3026);
        float _3030 = fma(_2526, _3010, _3022);
        float _3032 = -_3018;
        float _3034 = fma(_3032, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3028);
        float _3036 = fma(_2532, _3018, _3030);
        float _3038 = precise::clamp(_3036, 0.0, 1.0);
        float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3042 = _3034 + _3040;
        float _3044 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3046 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3048 = precise::clamp(_3046, 0.0, 1.0);
        float _3050 = exp2(_3044);
        float _3052 = _3050 * _3048;
        float _3054 = _3038 * _3052;
        float _3056 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3058 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3060 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3056;
        out.m_89.y = _3058;
        out.m_89.z = _3060;
    }
    out.m_91.x = _2972;
    out.m_91.y = _2974;
    out.m_91.z = _2976;
    if (!_2958)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3062 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3062;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2814 = false;
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
    float _124 = _107;
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
        float _3130 = as_type<float>(_134);
        out.gl_Position.z = _3130;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3185 = as_type<float>(_160);
        out.gl_Position.z = _3185;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _218 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _238 = _236 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _240 = 1.0 / _226;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _242;
    bool _246 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _248 = isnan(_218);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    bool _258 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _260 = isnan(_218);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = 1.0 / _234;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = _218 + _272;
    float _276 = 1.0 / _230;
    float _278 = _274 * _240;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _218 + _280;
    bool _284 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _286 = isnan(_218);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _296;
    float _300 = 1.0 / _238;
    float _302 = _282 * _270;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _306 = _218 + _304;
    bool _308 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _310 = isnan(_218);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_294;
    float _322 = _320 + 1.0;
    float _324 = fma(_298, _278, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _328 = 1.0 / _244;
    float _330 = _222 * _276;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _334 = _218 + _332;
    bool _336 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = isnan(_218);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = _306 * _300;
    float _350 = -_318;
    float _352 = _350 + 1.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _358;
    float _362 = _294 * _352;
    float _364 = _256 * _322;
    bool _366 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _368 = isnan(_218);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = _334 * _328;
    float _380 = -_346;
    float _382 = _380 + 1.0;
    float _384 = -_256;
    float _386 = _384 + 1.0;
    float _388 = fma(_356, _278, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = fma(_360, _278, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _392 = _268 * _382;
    float _394 = -_268;
    float _396 = _394 + 1.0;
    float _398 = _346 * _386;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = _376 * _396;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = -_376;
    float _416 = _414 + 1.0;
    float _418 = fma(_402, _330, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = _388 * _408;
    float _422 = fma(_406, _330, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_412, _330, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _390 * _408;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _432;
    float _436 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _438 = _324 * _408;
    float _440 = fma(_430, _302, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _442 = fma(_434, _302, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _448 = fma(_418, _392, _436);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _460 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _426);
    float _462 = fma(_446, _348, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _464 = fma(_440, _398, _448);
    float _466 = fma(_452, _302, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_458, _348, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _470 = fma(_422, _392, _454);
    float _472 = fma(_424, _392, _460);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _478 = fma(_466, _398, _470);
    float _480 = fma(_442, _398, _472);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _486;
    float _490 = fma(_476, _348, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _492;
    float _496 = fma(_484, _378, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _498 = fma(_488, _378, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _500 = fma(_462, _364, _464);
    float _502 = fma(_494, _378, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _504 = fma(_468, _364, _478);
    float _506 = fma(_490, _364, _480);
    float _508 = fma(_496, _362, _500);
    float _510 = fma(_498, _362, _504);
    float _512 = fma(_502, _362, _506);
    float _514 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[148].x, _508);
    float _516 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[148].y, _510);
    float _518 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[148].z, _512);
    bool _520 = !_326;
    if (!_520)
    {
        float _522 = in.m_57.x;
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _526 = _522 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _194 = _536;
    }
    float _538 = _194;
    float _540 = in.m_57.z;
    float _542 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _544 = log2(_542);
    float _546 = in.m_57.x;
    float _548 = in.m_57.y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _552 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _554 = int(_552);
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _558 = _544 * _116;
    float _560 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _562 = int(_560);
    float _564 = _540 * 2.0;
    float _566 = _546 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _568 = _548 * 2.0;
    float _570 = floor(_564);
    float _572 = _546 * 2.0;
    float _574 = -_550;
    float _576 = fma(_566, 2.0, _574);
    float _578 = _548 + _546;
    float _580 = _548 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _582 = _548 + _540;
    float _584 = float(_562);
    float _586 = _578 + (-1.0);
    float _588 = exp2(_558);
    float _590 = fma(_580, -2.0, _556);
    float _592 = _582 + (-1.0);
    float _594 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _596 = _584 * _116;
    float _598 = -_116;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[76].x, _576);
    bool _602 = _570 >= 0.0;
    bool _604 = isnan(_570);
    bool _606 = _602 || _604;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    float _612 = floor(_572);
    float _614 = float(_554);
    float _616 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _628 = _626 != 0;
    float _630 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _590);
    float _632 = floor(_568);
    bool _634 = !_624;
    int _636 = _634 ? 0 : 1;
    bool _638 = _570 > 0.0;
    float _640 = -_588;
    float _642 = _640 + 1.0;
    int _644 = _610 ? 0 : 1;
    float _646 = in.m_59.x;
    float _648 = in.m_59.y;
    float _650 = in.m_59.z;
    bool _652 = !_620;
    int _654 = _652 ? 0 : 1;
    float _656 = 1.0 / _614;
    bool _658 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _666 = _662 || _664;
    bool _668 = _612 > 0.0;
    bool _670 = _612 >= 0.0;
    bool _672 = isnan(_612);
    bool _674 = _670 || _672;
    bool _676 = isnan(0.0);
    bool _678 = _674 || _676;
    int _680 = ~_644;
    int _682 = _680 + 1;
    int _684 = _682 + 1;
    bool _686 = _632 > 0.0;
    bool _688 = _632 >= 0.0;
    bool _690 = isnan(_632);
    bool _692 = _688 || _690;
    bool _694 = isnan(0.0);
    bool _696 = _692 || _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _700 = 1.0 + _698;
    int _702 = _684;
    if (!_638)
    {
        int _704 = ~_644;
        int _706 = _704 + 1;
        _702 = _706;
    }
    int _708 = _702;
    float _710 = 1.0 / _700;
    bool _712 = !_628;
    int _714 = _712 ? 0 : 1;
    float _716 = _656 * _116;
    float _718 = _666 ? _642 : 0.0;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _724 = _722 != 0;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _728 = _726 != 0;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _732 = _730 != 0;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _736 = _678 ? 0 : 1;
    float _738 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[78].z, _720);
    float _740 = float(_708);
    float _742 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[78].w, _734);
    bool _744 = !_724;
    int _746 = _744 ? 0 : 1;
    float _748 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _738);
    bool _750 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _752 = isnan(1.0);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _758 = _754 || _756;
    float _760 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _742);
    int _762 = abs(_746);
    bool _764 = !_728;
    int _766 = _764 ? 0 : 1;
    int _768 = ~_736;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    float _774 = float(_762);
    int _776 = abs(_766);
    int _778 = _772;
    if (_758)
    {
        float _780 = _718 * _710;
        _126 = _780;
    }
    float _782 = _126;
    if (!_668)
    {
        int _784 = ~_736;
        int _786 = _784 + 1;
        _778 = _786;
    }
    int _788 = _778;
    float _790 = _774 * _740;
    float _792 = float(_776);
    float _794 = _546 + (-0.5);
    int _796 = _696 ? 0 : 1;
    float _798 = _790 * (-2.0);
    float _800 = float(_788);
    float _802 = fma(_798, _646, _646);
    float _804 = fma(_594, _798, _594);
    float _806 = _792 * _800;
    bool _808 = !_732;
    int _810 = _808 ? 0 : 1;
    float _812 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[196].x, _802);
    int _814 = ~_796;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    float _820 = _806 * (-2.0);
    int _822 = _818;
    if (!_686)
    {
        int _824 = ~_796;
        int _826 = _824 + 1;
        _822 = _826;
    }
    int _828 = _822;
    float _830 = fma(_804, _782, _812);
    int _832 = abs(_810);
    float _834 = _548 + (-0.5);
    float _836 = float(_828);
    float _838 = fma(_820, _648, _648);
    float _840 = float(_832);
    float _842 = fma(_616, _820, _616);
    float _844 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[196].y, _838);
    float _846 = _540 + _546;
    float _848 = _840 * _836;
    float _850 = _540 + (-0.5);
    float _852 = fma(_842, _782, _844);
    float _854 = _846 + (-1.0);
    float _856 = _848 * (-2.0);
    float _858 = in.m_61.x;
    float _860 = in.m_61.y;
    float _862 = in.m_61.z;
    float _864 = _830 * 0.15915493667125701904296875;
    float _866 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _868 = fma(_856, _650, _650);
    float _870 = in.m_63.x;
    float _872 = in.m_63.y;
    float _874 = in.m_63.z;
    float _876 = _852 * 0.15915493667125701904296875;
    float _878 = fma(_866, _856, _866);
    float _880 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[196].z, _868);
    float _882 = _864 * 6.283185482025146484375;
    float _884 = cos(_882);
    float _886 = fma(_878, _782, _880);
    float _888 = _886 * 0.15915493667125701904296875;
    float _890 = _876 * 6.283185482025146484375;
    float _892 = sin(_890);
    float _894 = _876 * 6.283185482025146484375;
    float _896 = cos(_894);
    float _898 = _516 * _860;
    float _900 = _518 * _862;
    float _902 = _514 * _858;
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _872);
    float _906 = in.m_46.x;
    float _908 = in.m_46.y;
    float _910 = in.m_46.z;
    float _912 = _898 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _914 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _870);
    float _916 = _864 * 6.283185482025146484375;
    float _918 = sin(_916);
    float _920 = _902 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _874);
    float _924 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _926 = _912 * _904;
    float _928 = _920 * _914;
    float _930 = _884 * _892;
    float _932 = _888 * 6.283185482025146484375;
    float _934 = cos(_932);
    float _936 = _884 * _896;
    float _938 = _924 * _922;
    float _940 = _888 * 6.283185482025146484375;
    float _942 = sin(_940);
    float _944 = _918 * _892;
    float _946 = _918 * _896;
    float _948 = _884 * _934;
    float _950 = _896 * _934;
    float _952 = _918 * _934;
    float _954 = _892 * _934;
    float _956 = _948 * _926;
    float _958 = _952 * _926;
    float _960 = fma(_942, _936, _944);
    float _962 = -_930;
    float _964 = fma(_942, _946, _962);
    float _966 = -_926;
    float _968 = _942 * _966;
    float _970 = -_946;
    float _972 = fma(_942, _930, _970);
    float _974 = fma(_960, _928, _956);
    float _976 = fma(_942, _944, _936);
    float _978 = fma(_950, _928, _968);
    float _980 = fma(_964, _928, _958);
    float _982 = fma(_972, _938, _974);
    float _984 = _908 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _986 = fma(_954, _938, _978);
    float _988 = _908 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _992 = fma(_976, _938, _980);
    float _994 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[6].x, _984);
    float _996 = _982 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[26].x, _990);
    float _1000 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[4].x, _988);
    float _1002 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[6].z, _994);
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[24].x, _996);
    float _1006 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[26].z, _998);
    float _1008 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1000);
    float _1010 = _1002 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1012 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1004);
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1016 = _1008 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1018 = _908 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1020 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1022 = _1010 + _1014;
    float _1024 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1018);
    float _1026 = _1016 + _1020;
    float _1028 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1030 = _1022 + _1028;
    float _1032 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1024);
    float _1034 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1036 = _1026 + _1034;
    float _1038 = _1030 * _1030;
    float _1040 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1042 = fma(_1036, _1036, _1038);
    float _1044 = _982 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1046 = sqrt(_1042);
    float _1048 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1044);
    float _1050 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1052 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1048);
    float _1054 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1050);
    float _1056 = _1052 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1058 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1054);
    float _1060 = _1040 + _1056;
    bool _1062 = _1046 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1064 = _1052;
    float _1066 = _1054;
    float _1068 = _1056;
    float _1070 = _1042;
    float _1072 = _1046;
    float _1074 = _1040;
    float _1076 = _1016;
    if (!_1062)
    {
        _1064 = _1026;
    }
    float _1078 = _1064;
    float _1080 = _1078;
    if (!_1062)
    {
        _1066 = _1022;
    }
    float _1082 = _1066;
    float _1084 = _1082;
    if (!_1062)
    {
        _1068 = _1060;
    }
    float _1086 = _1068;
    bool _1088 = !_1062;
    float _1090 = _1086;
    if (!_1088)
    {
        float _1092 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1096 = _1046 + _1094;
        float _1098 = rsqrt(_1042);
        float _1100 = _1096 * _1092;
        float _1102 = _1060 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1104 = _1100 * 0.15915493667125701904296875;
        float _1106 = _1104 * 6.283185482025146484375;
        float _1108 = cos(_1106);
        float _1110 = _1104 * 6.283185482025146484375;
        float _1112 = sin(_1110);
        float _1114 = _1108 + (-1.0);
        float _1116 = fma(_1112, _1102, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1118 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = _1098 * _1116;
        float _1122 = fma(_1060, _1108, _1118);
        float _1124 = fma(_1036, _1120, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1126 = fma(_1030, _1120, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1090 = _1122;
        _1080 = _1124;
        _1084 = _1126;
        _1070 = _1098;
    }
    float _1128 = _1090;
    float _1130 = _1080;
    float _1132 = _1084;
    float _1134 = _1070;
    float _1136 = -_1040;
    float _1138 = _1136 + _1128;
    float _1140 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1142 = -_1016;
    float _1144 = _1142 + _1130;
    float _1146 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1148 = _1138 * _1138;
    float _1150 = -_1010;
    float _1152 = _1150 + _1132;
    float _1154 = 1.0 / _1140;
    float _1156 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1146);
    float _1158 = fma(_1144, _1144, _1148);
    float _1160 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1156);
    float _1162 = fma(_1152, _1152, _1158);
    bool _1164 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1166 = isnan(0.5);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1172 = _1168 || _1170;
    float _1174 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1176 = sqrt(_1162);
    bool _1178 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1180 = isnan(0.5);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1186 = _1182 || _1184;
    float _1188 = _1174 + _1140;
    float _1190 = _1188 * _1154;
    float _1192 = _1190 * 0.5;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1196 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1194);
    bool _1198 = _1176 > 0.0;
    float _1200 = 1.0 / _1196;
    float _1202 = _1134;
    float _1204 = _1176;
    float _1206 = _1130;
    float _1208 = _1128;
    float _1210 = _1132;
    float _1212 = _1162;
    if (!_1198)
    {
        _1202 = _1128;
    }
    float _1214 = _1202;
    float _1216 = _1214;
    float _1218 = _1214;
    if (!_1198)
    {
        _1204 = _1132;
    }
    float _1220 = _1204;
    bool _1222 = !_1198;
    float _1224 = _1220;
    float _1226 = 0.0;
    if (!_1222)
    {
        float _1228 = _188 * _188;
        float _1230 = fma(_186, _186, _1228);
        float _1232 = rsqrt(_1162);
        float _1234 = fma(_190, _190, _1230);
        float _1236 = sqrt(_1234);
        float _1238 = _1144 * _1232;
        float _1240 = _1138 * _1232;
        float _1242 = _1152 * _1232;
        bool _1244 = _1236 > 0.0;
        float _1246 = _1236;
        _1226 = _1238;
        _1072 = _1234;
        if (!_1244)
        {
            _1216 = _1128;
        }
        float _1248 = _1216;
        _1218 = _1248;
        if (!_1244)
        {
            _1246 = _1132;
        }
        float _1250 = _1246;
        bool _1252 = !_1244;
        _1224 = _1250;
        if (!_1252)
        {
            float _1254 = rsqrt(_1234);
            float _1256 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1258 = _188 * _1254;
            float _1260 = _186 * _1254;
            float _1262 = _1240 * _1258;
            float _1264 = _190 * _1254;
            float _1266 = fma(_1238, _1260, _1262);
            float _1268 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1270 = fma(_1242, _1264, _1266);
            float _1272 = _1270 * _1268;
            float _1274 = fma(_186, _1272, _1130);
            float _1276 = fma(_188, _1272, _1128);
            float _1278 = fma(_190, _1272, _1132);
            _1206 = _1274;
            _1218 = _1276;
            _1224 = _1278;
            _1072 = _1254;
        }
    }
    float _1280 = _1206;
    float _1282 = _1218;
    float _1284 = _1224;
    float _1286 = _1226;
    float _1288 = _1072;
    float _1290 = _1284;
    float _1292 = _1286;
    if (_1186)
    {
        _1208 = 1.0;
    }
    float _1294 = _1208;
    float _1296 = _1294;
    if (_1172)
    {
        _1210 = _1280;
    }
    float _1298 = _1210;
    float _1300 = _1298;
    if (_1172)
    {
        _196 = _1282;
    }
    float _1302 = _196;
    float _1304 = _1302;
    if (!_1172)
    {
        float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1308 = _1040 + _1306;
        float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1312 = _1016 + _1310;
        float _1314 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1316 = -_1040;
        float _1318 = _1316 + _1282;
        float _1320 = _1308 * _1308;
        float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1324 = _1010 + _1322;
        float _1326 = -_1010;
        float _1328 = _1326 + _1284;
        float _1330 = fma(_1312, _1312, _1320);
        float _1332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1334 = fma(_1324, _1324, _1330);
        float _1336 = sqrt(_1334);
        float _1338 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1340 = precise::min(_1336, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1342 = _1340 * _1332;
        float _1344 = _1338 * _1342;
        float _1346 = -_1016;
        float _1348 = _1346 + _1280;
        float _1350 = fma(_1318, _1344, _1040);
        float _1352 = fma(_1348, _1344, _1016);
        float _1354 = fma(_1328, _1344, _1010);
        _1304 = _1350;
        _1300 = _1352;
        _1290 = _1354;
    }
    float _1356 = _1304;
    float _1358 = _1300;
    float _1360 = _1290;
    if (_1186)
    {
        _1074 = 1.0;
    }
    float _1362 = _1074;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1366 = _1200 * _1364;
    float _1368 = _1362;
    if (!_1186)
    {
        float _1370 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1372 = _1370 * 0.15915493667125701904296875;
        float _1374 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1378 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1376;
        float _1380 = _1372 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        float _1384 = _1374 * 0.15915493667125701904296875;
        float _1386 = _1372 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        float _1390 = 1.0 / _1382;
        float _1392 = _1384 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        float _1396 = _1388 * _1390;
        float _1398 = _1384 * 6.283185482025146484375;
        float _1400 = sin(_1398);
        float _1402 = _1394 * _1396;
        float _1404 = 1.0 / _1378;
        float _1406 = 1.0 / _1402;
        float _1408 = _1400 * _1406;
        float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1412 = fma(_1366, _1408, _1410);
        float _1414 = _1412 * _1404;
        float _1416 = precise::clamp(_1414, 0.0, 1.0);
        _1296 = _1416;
    }
    float _1418 = _1296;
    if (!_1186)
    {
        float _1420 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1422 = _1420 * 0.15915493667125701904296875;
        float _1424 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1426 = _1422 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1424 * 0.15915493667125701904296875;
        float _1432 = _1422 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = 1.0 / _1428;
        float _1438 = _1430 * 6.283185482025146484375;
        float _1440 = cos(_1438);
        float _1442 = _1434 * _1436;
        float _1444 = _1430 * 6.283185482025146484375;
        float _1446 = sin(_1444);
        float _1448 = _1440 * _1442;
        float _1450 = 1.0 / _1448;
        float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1454 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1452;
        float _1456 = 1.0 / _1454;
        float _1458 = _1446 * _1450;
        float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1462 = fma(_1366, _1458, _1460);
        float _1464 = _1462 * _1456;
        float _1466 = precise::clamp(_1464, 0.0, 1.0);
        float _1468 = -_1466;
        float _1470 = _1468 + 1.0;
        _1368 = _1470;
    }
    float _1472 = _1368;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1476 = _1356 + _1474;
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1480 = _1358 + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1484 = _1360 + _1482;
    float _1486 = _1476 * _1476;
    float _1488 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1490 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1492 = fma(_1480, _1480, _1486);
    float _1494 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1488);
    float _1496 = fma(_1484, _1484, _1492);
    float _1498 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1494);
    float _1500 = rsqrt(_1496);
    float _1502 = sqrt(_1496);
    float _1504 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1506 = _1480 * _1504;
    float _1508 = _1484 * _1504;
    float _1510 = _1506 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 + _1512;
    float _1516 = sqrt(_1514);
    bool _1518 = _1516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1516 + _1520;
    float _1524 = _1492;
    float _1526 = _1514;
    float _1528 = _1522;
    float _1530 = _1506;
    float _1532 = _1508;
    float _1534 = _1510;
    float _1536 = _1512;
    if (_1518)
    {
        float _1538 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1524 = _1538;
    }
    float _1540 = _1524;
    if (_1518)
    {
        float _1542 = rsqrt(_1514);
        _1526 = _1542;
    }
    float _1544 = _1526;
    if (_1518)
    {
        float _1546 = _1522 * _1540;
        _1528 = _1546;
    }
    float _1548 = _1528;
    if (_1518)
    {
        float _1550 = _1548 * 0.15915493667125701904296875;
        _1292 = _1550;
    }
    float _1552 = _1292;
    float _1554 = _1540;
    if (_1518)
    {
        float _1556 = _1552 * 6.283185482025146484375;
        float _1558 = sin(_1556);
        _1554 = _1558;
    }
    float _1560 = _1554;
    float _1562 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1564 = precise::max(0.0, _1562);
    float _1566 = _1288;
    if (_1518)
    {
        float _1568 = _1552 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        _1566 = _1570;
    }
    float _1572 = _1566;
    float _1574 = -_1504;
    float _1576 = -_1564;
    float _1578 = fma(_1476, _1574, _1576);
    if (_1518)
    {
        float _1580 = _1578 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1212 = _1580;
    }
    float _1582 = _1212;
    float _1584 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1586 = _1582;
    float _1588 = _1560;
    if (_1518)
    {
        float _1590 = fma(_1560, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1586 = _1590;
    }
    float _1592 = _1586;
    float _1594 = _1592;
    if (!_1518)
    {
        _1588 = _1578;
    }
    float _1596 = _1588;
    float _1598 = floor(_1584);
    float _1600 = _1596;
    if (_1518)
    {
        float _1602 = _1572 + (-1.0);
        _1076 = _1602;
    }
    float _1604 = _1076;
    float _1606 = _1604;
    if (_1518)
    {
        float _1608 = _1544 * _1592;
        _1594 = _1608;
    }
    float _1610 = _1594;
    float _1612 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1518)
    {
        float _1614 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1606 = _1614;
    }
    float _1616 = _1606;
    if (_1518)
    {
        float _1618 = _1506 * _1610;
        _1530 = _1618;
    }
    float _1620 = _1530;
    if (_1518)
    {
        float _1622 = _1508 * _1610;
        _1532 = _1622;
    }
    float _1624 = _1532;
    float _1626 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1612);
    if (_1518)
    {
        float _1628 = fma(_1578, _1572, _1616);
        _1600 = _1628;
    }
    float _1630 = _1600;
    if (_1518)
    {
        float _1632 = _1620 * _1620;
        _1534 = _1632;
    }
    float _1634 = _1534;
    if (_1518)
    {
        float _1636 = _1624 * _1624;
        _1536 = _1636;
    }
    float _1638 = _1536;
    float _1640 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1626);
    float _1642 = fma(_1630, _1630, _1634);
    float _1644 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1646 = -_1598;
    float _1648 = _1584 + _1646;
    float _1650 = _1642 + _1638;
    float _1652 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1654 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1656 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1654);
    float _1658 = precise::clamp(_1656, 0.0, 1.0);
    float _1660 = fma(_1010, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1662 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1664 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1652);
    float _1666 = rsqrt(_1650);
    float _1668 = -_1658;
    float _1670 = _1668 + 1.0;
    float _1672 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1490);
    float _1674 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1664);
    float _1676 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1678 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1680 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1672);
    float _1682 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1684 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1686 = abs(_1670);
    float _1688 = log2(_1686);
    float _1690 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1692 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1694 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1684);
    float _1696 = -_1690;
    float _1698 = fma(_1696, _1662, 1.0);
    float _1700 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1702 = _1666 * _1620;
    float _1704 = _1666 * _1630;
    float _1706 = floor(_1660);
    float _1708 = _1666 * _1624;
    float _1710 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1712 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1694);
    float _1714 = -_1710;
    float _1716 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1714);
    float _1718 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1720 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1712);
    float _1722 = log2(_1698);
    float _1724 = -_1708;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1716);
    float _1728 = fma(_1726, -0.5, 0.5);
    float _1730 = fma(_1726, 0.5, 0.5);
    float _1732 = -_1706;
    float _1734 = _1660 + _1732;
    float _1736 = exp2(_1718);
    float _1738 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1678);
    float _1740 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1692);
    float _1742 = _1704 + 1.0;
    float _1744 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1738);
    float _1746 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1740);
    float _1748 = 1.0 / _1720;
    float _1750 = fma(_1730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1752 = _1722 * 0.693147182464599609375;
    float _1754 = fma(_1730, _1750, -0.212114393711090087890625);
    float _1756 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1758 = sqrt(_1728);
    float _1760 = -_1704;
    float _1762 = fma(_1736, _1742, _1760);
    float _1764 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1744);
    float _1766 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1746);
    float _1768 = fma(_1730, _1754, 1.570728778839111328125);
    float _1770 = fma(_1762, 0.5, 0.5);
    float _1772 = _1764 * _1748;
    float _1774 = _1766 * _1748;
    float _1776 = fma(_1772, 0.5, 0.5);
    float _1778 = fma(_1774, -0.5, 0.5);
    float _1780 = _1758 * 0.636619746685028076171875;
    float2 _5734 = float2(_1648, _1734);
    float _1782 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5734, float2(0.0), isnan(_5734)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5734, float2(0.0), isnan(_5734)), level(0.0)).x;
    float _1784 = -_1768;
    float _1786 = fma(_1780, _1784, 1.0);
    float3 _5750 = float3(_1776, _1778, _1756);
    float _1788 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5750, float3(0.0), isnan(_5750)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5750, float3(0.0), isnan(_5750)), level(0.0)).x;
    float3 _5761 = float3(_1776, _1778, _1756);
    float4 _1791 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5761, float3(0.0), isnan(_5761)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5761, float3(0.0), isnan(_5761)), level(0.0)).xyzw;
    float _1793 = _1791.x;
    float _1795 = _1791.y;
    float _1797 = _1791.z;
    float _1799 = _1791.w;
    float2 _5777 = float2(_1786, _1770);
    float3 _1803 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5777, float2(0.0), isnan(_5777)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5777, float2(0.0), isnan(_5777)), level(0.0)).xyz;
    float _1805 = _1803.x;
    float _1807 = _1803.y;
    float _1809 = _1803.z;
    float _1811 = float(uint(_562));
    float _1813 = trunc(_716);
    int _1815 = int(_1813);
    int _1817 = ~_562;
    int _1819 = _1817 + 1;
    float _1821 = _596 * _168;
    bool _1823 = _562 == 0;
    int _1825 = abs(_636);
    int _1827 = abs(_654);
    float _1829 = 1.0 / _1811;
    float _1831 = float(uint(_1815));
    float _1833 = trunc(_1821);
    int _1835 = int(_1833);
    int _1837 = as_type<int>(_1829) + (-2);
    float _1839 = as_type<float>(_1837) * _1831;
    int _1841 = ~_562;
    int _1843 = _1841 + 1;
    float _1845 = trunc(_1839);
    float _1847 = precise::max(_1845, 0.0);
    uint _1850 = uint(_1847);
    int _1852 = _1819 * int(_1850);
    int _1854 = _1852 + _1815;
    float _1856 = float(uint(_1854));
    float _1858 = as_type<float>(_1837) * _1856;
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1862 = _1860 != 0;
    float _1864 = trunc(_1858);
    float _1866 = precise::max(_1864, 0.0);
    uint _1868 = uint(_1866);
    bool _1870 = !_1862;
    float _1872 = _1870 ? 7.345489978790283203125 : 1.0;
    float _1874 = _1872 * _546;
    float _1876 = float(_1815);
    float _1878 = floor(_1874);
    bool _1880 = _1876 >= _584;
    bool _1882 = isnan(_1876);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan(_584);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    int _1892 = int(_1850) + int(_1868);
    float _1894 = trunc(_1890);
    int _1896 = int(_1894);
    int _1898 = _1843 * _1892;
    int _1900 = _1898 + _1815;
    bool _1902 = uint(_1900) >= uint(_562);
    float _1904 = -_1878;
    float _1906 = _1874 + _1904;
    bool _1908 = !_1902;
    int _1910 = _1908 ? 0 : (-1);
    int _1912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1914 = _1912 != 0;
    int _1916 = ~_1892;
    int _1918 = _1916 + _1910;
    int _1920 = _1918 + 1;
    float _1922 = _1906 * _584;
    int _1924 = ~_1896;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    bool _1930 = !_1914;
    int _1932 = _1930 ? 0 : 1;
    int _1934 = _562 * _1920;
    int _1936 = _1934 + _1815;
    int _1938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1940 = _1938 != 0;
    float _1942 = trunc(_1922);
    int _1944 = int(_1942);
    int _1946 = abs(_1932);
    bool _1948 = !_1823;
    int _1950 = _1948 ? _1936 : (-1);
    int _1952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1954 = _1952 != 0;
    int _1956 = _1950 * _1928;
    int _1958 = _562 + (-1);
    float _1960 = in.m_65.y;
    int _1962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1964 = _1962 != 0;
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1968 = _1966 != 0;
    int _1970 = _1896 * _1958;
    int _1972 = _1970 + _1956;
    int _1974 = _1972 * _1825;
    int _1976 = _1944 * _1946;
    int _1978 = _1976 + _1815;
    int _1980 = _1835 * _1827;
    int _1982 = _1980 + _1974;
    int _1984 = abs(_714);
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1988 = _1986 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1990 = !_1940;
    int _1992 = _1990 ? 0 : 1;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _1994 = _548 > 0.5;
    int _1996 = abs(_1992);
    int _1998 = _1978 * _1984;
    int _2000 = _1998 + _1982;
    float _2002 = 1.0 / _1988;
    float _2004 = -_1960;
    float _2006 = _2004 + 1.0;
    int _2008 = ~_562;
    int _2010 = _2008 + 1;
    int _2012 = _1944 * _1996;
    int _2014 = _2012 + _2000;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2018 = _2016 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2020 = as_type<float>(_1996);
    float _2022 = _1960;
    if (_1954)
    {
        float _2024 = in.m_57.x;
        _2020 = _2024;
    }
    float _2026 = _2020;
    if (_1964)
    {
        float _2028 = _1994 ? _2006 : _1960;
        _2022 = _2028;
    }
    float _2030 = _2022;
    float _2032 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2032;
    float _2036 = float(uint(_2014));
    float _2038 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2040 = _2038 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2042 = 1.0 / _2018;
    float _2044 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2046 = as_type<float>(_1837) * _2036;
    float _2048 = _2034 * _2002;
    float _2050 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2052 = -_630;
    float _2054 = fma(_760, _2044, _2052);
    float _2056 = trunc(_2046);
    float _2058 = precise::max(_2056, 0.0);
    uint _2060 = uint(_2058);
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2068 = in.m_65.x;
    float _2070 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2072 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2074 = _2040 * _2042;
    float _2076 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2078 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2080 = isnan(_538);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2086 = _2082 || _2084;
    float _2088 = float(_2086);
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2092 = _538 + _2090;
    bool _2094 = _2026 > 0.5;
    bool _2096 = _2094 && _1954;
    out.m_69.x = _2076;
    out.m_69.y = _2070;
    out.m_69.z = _2072;
    out.m_69.w = _2064;
    bool _2098 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2100 = isnan(_538);
    bool _2102 = _2098 || _2100;
    bool _2104 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2106 = _2102 || _2104;
    float _2108 = float(_2106);
    float _2110 = fma(_2048, _2092, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _2112 = _2010 * int(_2060);
    int _2114 = _2112 + _2014;
    float _2116 = in.m_71.x;
    float _2118 = in.m_71.y;
    float _2120 = in.m_71.z;
    bool _2122 = _872 != 0.0;
    bool _2124 = isnan(_872);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan(0.0);
    bool _2130 = _2126 || _2128;
    float _2132 = float(uint(_1978));
    float _2134 = float(uint(_2114));
    bool _2136 = _870 == 0.0;
    bool _2138 = !_2130;
    bool _2140 = _2136 && _2138;
    float _2142 = as_type<float>(_1837) * _2132;
    bool _2144 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2146 = isnan(_538);
    bool _2148 = _2144 || _2146;
    bool _2150 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2152 = _2148 || _2150;
    float _2154 = float(_2152);
    float _2156 = as_type<float>(_1837) * _2134;
    float _2158 = -_2088;
    float _2160 = _2158 + 1.0;
    float _2162 = _2092;
    float _2164 = _2068;
    if (_1954)
    {
        _2162 = _2068;
    }
    float _2166 = _2162;
    float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2170 = _538 + _2168;
    bool _2172 = _874 == 0.0;
    bool _2174 = _2172 && _2140;
    float _2176 = _2108 * _2160;
    float _2178 = trunc(_2156);
    float _2180 = precise::max(_2178, 0.0);
    uint _2182 = uint(_2180);
    float _2184 = -_2108;
    float _2186 = _2184 + 1.0;
    float _2188 = _2166;
    if (_2096)
    {
        float _2190 = -_2166;
        float _2192 = _2190 + 1.0;
        _2188 = _2192;
    }
    float _2194 = _2188;
    float _2196 = fma(_2074, _2170, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _2198 = ~_562;
    int _2200 = _2198 + 1;
    float _2202 = _2154 * _2186;
    float _2204 = -_2154;
    float _2206 = _2204 + 1.0;
    if (_1954)
    {
        _2164 = _2194;
    }
    float _2208 = _2164;
    float _2210 = trunc(_2142);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    int _2216 = ~_562;
    int _2218 = _2216 + 1;
    float _2220 = _2110 * _2202;
    float _2222 = _2118;
    float _2224 = _2116;
    float _2226 = _2120;
    if (!_2174)
    {
        float _2228 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2118);
        _2222 = _2228;
    }
    float _2230 = _2222;
    if (!_2174)
    {
        float _2232 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2116);
        _2224 = _2232;
    }
    float _2234 = _2224;
    float _2236 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2238 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2220);
    int _2240 = int(_2060) + int(_2182);
    if (!_2174)
    {
        float _2242 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2120);
        _2226 = _2242;
    }
    float _2244 = _2226;
    float _2246 = fma(_748, _2236, _600);
    float _2248 = fma(_2196, _2176, _2238);
    int _2250 = _2200 * _2240;
    int _2252 = _2250 + _2014;
    float _2254 = abs(_1366);
    float _2256 = log2(_2254);
    int _2258 = _2218 * int(_2214);
    int _2260 = _2258 + _1978;
    float _2262 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2248);
    bool _2264 = uint(_2252) >= uint(_562);
    float _2266 = _948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2268 = _2262 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2270 = float(uint(_2260));
    float _2272 = _972 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2274 = !_2264;
    int _2276 = _2274 ? 0 : (-1);
    float _2278 = _972 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2280 = as_type<float>(_1837) * _2270;
    int _2282 = ~_2240;
    int _2284 = _2282 + _2276;
    int _2286 = _2284 + 1;
    float _2288 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2292 = _2246 + 0.5;
    float _2294 = _2054 + 0.5;
    float _2296 = trunc(_2280);
    float _2298 = precise::max(_2296, 0.0);
    uint _2300 = uint(_2298);
    int _2302 = _562 * _2286;
    int _2304 = _2302 + _2014;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2308 = _2288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _2292;
    out.m_73.y = _2294;
    float _2310 = _2290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2312 = !_1823;
    int _2314 = _2312 ? _2304 : (-1);
    float _2316 = _2306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2318 = ~_562;
    int _2320 = _2318 + 1;
    float _2322 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2324 = _948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2326 = _948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_75.x = _2316;
    out.m_75.y = _2308;
    out.m_75.z = _2310;
    out.m_75.w = _2268;
    float _2328 = exp2(_2322);
    int _2330 = _2314 >> 31;
    float _2332 = _972 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2334 = int(_2214) + int(_2300);
    float _2336 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    int _2338 = _2330 & 3;
    float _2340 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2332);
    int _2342 = _2320 * _2334;
    int _2344 = _2342 + _1978;
    float _2346 = -_942;
    float _2348 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2266);
    float _2350 = _960 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2352 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2278);
    int _2354 = _2314 & 3;
    bool _2356 = _2354 != 0;
    float _2358 = -_942;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2324);
    int _2362 = _2314 + _2338;
    float _2364 = _960 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2366 = uint(_2344) >= uint(_562);
    float _2368 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2360);
    int _2370 = _2362 >> 2;
    float _2372 = _960 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2374 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2364);
    float _2376 = -_942;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2326);
    int _2380 = _2370 << 4;
    int _2382 = _2380 + 368;
    float _2384 = fma(_2328, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2386 = precise::clamp(_2384, 0.0, 1.0);
    float _2388 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2348);
    float _2390 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2378);
    uint _2392 = uint(int(uint(_2382) >> uint(2)));
    uint _2394 = uint(int(uint(int(_2392)) >> uint(2)));
    int _2396 = int(_2392) & 3;
    float _2398 = (*spvDescriptorSet0.vp_c9)._m0[int(_2394)][_2396];
    int _2400 = int(_2392) + 1;
    uint _2402 = uint(int(uint(_2400) >> uint(2)));
    int _2404 = _2400 & 3;
    float _2406 = (*spvDescriptorSet0.vp_c9)._m0[int(_2402)][_2404];
    float _2408 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2350);
    float _2410 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2372);
    float _2412 = _2388 * _2230;
    float _2414 = _2368 * _2230;
    float _2416 = _2390 * _2230;
    float _2418 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2374);
    float _2420 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2408);
    int _2422 = _2382 + 8;
    uint _2424 = uint(int(uint(_2422) >> uint(2)));
    uint _2426 = uint(int(uint(int(_2424)) >> uint(2)));
    int _2428 = int(_2424) & 3;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[int(_2426)][_2428];
    int _2432 = int(_2424) + 1;
    uint _2434 = uint(int(uint(_2432) >> uint(2)));
    int _2436 = _2432 & 3;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[int(_2434)][_2436];
    float _2440 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2410);
    int _2442 = _2314 & 3;
    bool _2444 = _2442 != 0;
    float _2446 = fma(_2420, _2234, _2414);
    int _2448 = _2356 ? 0 : 1;
    float _2450 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2340);
    bool _2452 = uint(_2442) > 1u;
    float _2454 = fma(_2440, _2234, _2416);
    bool _2456 = _2442 != 3;
    float _2458 = fma(_2450, _2244, _2446);
    float _2460 = in.m_77.x;
    bool _2462 = !_2366;
    int _2464 = _2462 ? 0 : (-1);
    float _2466 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2336);
    bool _2468 = uint(_2442) >= 2u;
    float _2470 = fma(_2386, -2.0, 3.0);
    int _2472 = ~_2448;
    int _2474 = _2472 + 1;
    int _2476 = _2474 + 1;
    float _2478 = _2386 * _2386;
    int _2480 = ~_2334;
    int _2482 = _2480 + _2464;
    int _2484 = _2482 + 1;
    float _2486 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2352);
    int _2488 = _2476;
    if (!_2452)
    {
        int _2490 = ~_2448;
        int _2492 = _2490 + 1;
        _2488 = _2492;
    }
    int _2494 = _2488;
    float _2496 = fma(_2418, _2234, _2412);
    bool _2498 = !_2444;
    int _2500 = _2498 ? 0 : 1;
    float _2502 = _2478 * _2470;
    int _2504 = _2468 ? 0 : 1;
    int _2506 = _562 * _2484;
    int _2508 = _2506 + _1978;
    bool _2510 = _2442 != 3;
    float _2512 = _1720 * 0.5;
    int _2514 = abs(_2494);
    float _2516 = -_1782;
    float _2518 = _2516 + 1.0;
    int _2520 = ~_2504;
    int _2522 = _2520 + 1;
    int _2524 = _2522 + 1;
    float _2526 = fma(_2466, _2244, _2496);
    bool _2528 = !_2510;
    int _2530 = _2528 ? 0 : (-1);
    float _2532 = fma(_2486, _2244, _2454);
    int _2534 = abs(_2500);
    int _2536 = _2524;
    if (_2456)
    {
        int _2538 = ~_2504;
        int _2540 = _2538 + 1;
        _2536 = _2540;
    }
    int _2542 = _2536;
    int _2544 = ~_2514;
    int _2546 = _2544 + 1;
    int _2548 = _2546 + 1;
    out.m_79.x = _2526;
    out.m_79.y = _2458;
    out.m_79.z = _2532;
    bool _2550 = !_1968;
    int _2552 = _2550 ? 0 : 1;
    int _2554 = abs(_2530);
    int _2556 = _2548 * as_type<int>(_2406);
    int _2558 = abs(_2542);
    int _2560 = ~_2534;
    int _2562 = _2560 + 1;
    int _2564 = _2562 + 1;
    int _2566 = abs(_2552);
    int _2568 = _2564 * as_type<int>(_2398);
    int _2570 = _2568 + _2556;
    int _2572 = ~_2558;
    int _2574 = _2572 + 1;
    int _2576 = _2574 + 1;
    int _2578 = ~_2554;
    int _2580 = _2578 + 1;
    int _2582 = _2580 + 1;
    int _2584 = _2576 * as_type<int>(_2430);
    int _2586 = _2584 + _2570;
    int _2588 = ~_2566;
    int _2590 = _2588 + 1;
    int _2592 = _2590 + 1;
    float _2594 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2596 = _2582 * as_type<int>(_2438);
    int _2598 = _2596 + _2586;
    float _2600 = -_2502;
    float _2602 = _2600 + 1.0;
    float _2604 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2594);
    bool _2606 = !_1823;
    int _2608 = _2606 ? _2508 : (-1);
    int _2610 = _2598 * _2592;
    float _2612 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2614 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2604);
    float _2616 = fma(_2602, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2502);
    int _2618 = _2608 * _2566;
    int _2620 = _2618 + _2610;
    float _2622 = fma(_1766, -0.5, _2512);
    float _2624 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2614);
    float _2626 = exp2(_2612);
    bool _2628 = _1366 <= 8000.0;
    bool _2630 = isnan(_1366);
    bool _2632 = _2628 || _2630;
    bool _2634 = isnan(8000.0);
    bool _2636 = _2632 || _2634;
    float _2638 = float(_2636);
    float _2640 = float(_2620);
    float _2642 = _2624 + _1720;
    float _2644 = _1764 + _1720;
    float _2646 = _2638 * _2616;
    float _2648 = _2642 * 0.5;
    float _2650 = _2644 * 0.5;
    float _2652 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1764;
    out.gl_Position.y = _1766;
    out.gl_Position.z = _2624;
    out.gl_Position.w = _1720;
    bool _2654 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2656 = isnan(_1502);
    bool _2658 = _2654 || _2656;
    bool _2660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2662 = _2658 || _2660;
    float _2664 = _2518 * _2652;
    float _2666 = precise::clamp(_2664, 0.0, 1.0);
    out.m_81.x = _2650;
    out.m_81.y = _2622;
    out.m_81.z = _2648;
    out.m_81.w = _1720;
    float _2668 = -_2626;
    float _2670 = _2668 + 1.0;
    float _2672 = -_2666;
    float _2674 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2640;
    float _2676 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2678 = _2674 * _2460;
    float _2680 = _2676 * _1788;
    float _2682 = _2640;
    float _2684 = _2650;
    if (!_2662)
    {
        _2682 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2686 = _2682;
    float _2688 = _1799 * _2680;
    float _2690 = _1809 * _2680;
    float _2692 = -_2676;
    float _2694 = _2692 + 1.0;
    float _2696 = _2678 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2698 = fma(_1805, _2688, _1793);
    float _2700 = fma(_1807, _2688, _1795);
    float _2702 = _1799 * _2694;
    float _2704 = fma(_1799, _2690, _1797);
    out.m_85.x = _2696;
    float _2706 = _1418 * _1472;
    float _2708 = _2688;
    float _2710 = _2690;
    float _2712 = _2694;
    float _2714 = _2706;
    float _2716 = _2686;
    float _2718 = _2686;
    if (!_2662)
    {
        _2684 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2720 = _2684;
    out.m_87.x = _2698;
    out.m_87.y = _2700;
    out.m_87.z = _2704;
    out.m_87.w = _2702;
    float _2722 = _2706 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2724 = _2720;
    float _2726 = _2720;
    if (!_2662)
    {
        _2708 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2728 = _2708;
    float _2730 = _2728;
    float _2732 = _2728;
    if (!_2662)
    {
        _2710 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2734 = _2710;
    float _2736 = _2734;
    float _2738 = _2734;
    if (!_2662)
    {
        _2712 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2740 = _2712;
    float _2742 = _2740;
    float _2744 = _2740;
    if (!_2662)
    {
        _2714 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2746 = _2714;
    bool _2748 = !_2662;
    float _2750 = _2746;
    float _2752 = _2746;
    if (!_2748)
    {
        bool _2754 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2756 = isnan(_1502);
        bool _2758 = _2754 || _2756;
        bool _2760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2762 = _2758 || _2760;
        if (!_2762)
        {
            float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2766 = _1502 + _2764;
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2770 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2768;
            float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2776 = 1.0 / _2770;
            float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2782 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2784 = _2782 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2794 = _2766 * _2776;
            float _2796 = precise::clamp(_2794, 0.0, 1.0);
            float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2802 = fma(_2796, _2774, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2804 = fma(_2796, _2800, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2806 = fma(_2796, _2780, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2808 = fma(_2796, _2784, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2810 = fma(_2796, _2788, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2812 = fma(_2796, _2792, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2732 = _2806;
            _2744 = _2810;
            _2726 = _2802;
            _2738 = _2808;
            _2718 = _2804;
            _2752 = _2812;
            _2814 = true;
        }
        else
        {
            bool _2816 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2818 = isnan(_1502);
            bool _2820 = _2816 || _2818;
            bool _2822 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2824 = _2820 || _2822;
            if (!_2824)
            {
                _2724 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2826 = _2724;
            _2726 = _2826;
            if (!_2824)
            {
                _2730 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2828 = _2730;
            _2732 = _2828;
            if (!_2824)
            {
                _2716 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2830 = _2716;
            _2718 = _2830;
            if (!_2824)
            {
                _2736 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2832 = _2736;
            _2738 = _2832;
            if (!_2824)
            {
                _2742 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2834 = _2742;
            _2744 = _2834;
            if (!_2824)
            {
                _2750 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2836 = _2750;
            bool _2838 = !_2824;
            _2752 = _2836;
            if (!_2838)
            {
                bool _2840 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2842 = isnan(_1502);
                bool _2844 = _2840 || _2842;
                bool _2846 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2848 = _2844 || _2846;
                if (!_2848)
                {
                    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2852 = _1502 + _2850;
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2856 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2854;
                    float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2862 = 1.0 / _2856;
                    float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2870 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2872 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2880 = _2852 * _2862;
                    float _2882 = precise::clamp(_2880, 0.0, 1.0);
                    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2886 = _2884 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2888 = fma(_2882, _2860, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2890 = fma(_2882, _2886, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2892 = fma(_2882, _2866, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2894 = fma(_2882, _2870, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2896 = fma(_2882, _2874, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2898 = fma(_2882, _2878, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2732 = _2892;
                    _2744 = _2896;
                    _2726 = _2888;
                    _2738 = _2894;
                    _2718 = _2890;
                    _2752 = _2898;
                    _2814 = true;
                }
                else
                {
                    _2732 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2744 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2726 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2738 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2718 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2752 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2814 = false;
    float _2900 = _2732;
    float _2902 = _2744;
    float _2904 = _2726;
    float _2906 = _2738;
    float _2908 = _2718;
    float _2910 = _2752;
    float _2912 = fma(_2458, -0.5, 0.5);
    float _2914 = precise::clamp(_2912, 0.0, 1.0);
    float _2916 = -_2900;
    float _2918 = _2916 + _2902;
    float _2920 = _2722 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2922 = -_2904;
    float _2924 = _2922 + _2906;
    out.m_89.x = 0.0;
    float _2926 = fma(_2914, _2918, _2900);
    float _2928 = fma(_2914, _2924, _2904);
    out.m_53.x = _2920;
    float _2930 = -_2908;
    float _2932 = _2930 + _2910;
    float _2934 = _2926 * 0.586610972881317138671875;
    bool _2936 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2938 = fma(_2914, _2932, _2908);
    float _2940 = fma(_2928, 0.298911988735198974609375, _2934);
    bool _2942 = _1418 > 0.0;
    bool _2944 = isnan(_1418);
    bool _2946 = _2942 || _2944;
    bool _2948 = isnan(0.0);
    bool _2950 = _2946 || _2948;
    float _2952 = fma(_2938, 0.114477999508380889892578125, _2940);
    bool _2954 = _1472 <= 0.0;
    bool _2956 = !_2950;
    bool _2958 = _2954 || _2956;
    float _2960 = -_2952;
    float _2962 = _2928 + _2960;
    float _2964 = -_2952;
    float _2966 = _2926 + _2964;
    float _2968 = -_2952;
    float _2970 = _2938 + _2968;
    float _2972 = fma(_2962, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2952);
    float _2974 = fma(_2966, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2952);
    float _2976 = fma(_2970, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2952);
    bool _2978 = !_2936;
    if (!_2978)
    {
        float _2980 = -_1356;
        float _2982 = _2980 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2984 = -_1358;
        float _2986 = _2984 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2988 = -_1360;
        float _2990 = _2988 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2992 = _2982 * _2982;
        float _2994 = fma(_2986, _2986, _2992);
        float _2996 = fma(_2990, _2990, _2994);
        float _2998 = sqrt(_2996);
        float _3000 = rsqrt(_2996);
        float _3002 = -_2998;
        float _3004 = _3002 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3006 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3008 = precise::clamp(_3006, 0.0, 1.0);
        float _3010 = _2986 * _3000;
        float _3012 = _2982 * _3000;
        float _3014 = abs(_3008);
        float _3016 = log2(_3014);
        float _3018 = _2990 * _3000;
        float _3020 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3022 = _2458 * _3012;
        float _3024 = -_3012;
        float _3026 = -_3020;
        float _3028 = fma(_3024, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3026);
        float _3030 = fma(_2526, _3010, _3022);
        float _3032 = -_3018;
        float _3034 = fma(_3032, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3028);
        float _3036 = fma(_2532, _3018, _3030);
        float _3038 = precise::clamp(_3036, 0.0, 1.0);
        float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3042 = _3034 + _3040;
        float _3044 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3046 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3048 = precise::clamp(_3046, 0.0, 1.0);
        float _3050 = exp2(_3044);
        float _3052 = _3050 * _3048;
        float _3054 = _3038 * _3052;
        float _3056 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3058 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3060 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3056;
        out.m_89.y = _3058;
        out.m_89.z = _3060;
    }
    out.m_91.x = _2972;
    out.m_91.y = _2974;
    out.m_91.z = _2976;
    if (!_2958)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3062 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3062;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

