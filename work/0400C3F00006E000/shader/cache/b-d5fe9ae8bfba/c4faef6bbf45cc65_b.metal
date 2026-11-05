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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_85 [[attribute(0)]];
    float4 m_57 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_73 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_67 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2003 = false;
    bool _1202 = false;
    bool _492 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_50.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_53.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2302 = as_type<float>(_130);
        out.gl_Position.z = _2302;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_55.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _124 = _152;
    }
    float _154 = _124;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2372 = as_type<float>(_168);
        out.gl_Position.z = _2372;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _170 = in.m_57.x;
    float _172 = in.m_57.y;
    float _174 = in.m_57.z;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _180 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _184 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _186);
    float _194 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _188);
    bool _196 = !_176;
    float _214;
    if (!_196)
    {
        float _198 = in.m_59.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        float _218 = float(_114);
        float _220 = 1.0 / _218;
        float _222 = _148 * _220;
        _214 = _222;
    }
    _216 = false;
    float _224 = _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _224 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = _224 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _244 = _242 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _250 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = 1.0 / _248;
    bool _256 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _258 = isnan(_224);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = 1.0 / _244;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _272 = _224 + _270;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _276 = 1.0 / _252;
    float _278 = _228 * _254;
    bool _280 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _282 = isnan(_224);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    float _292 = 1.0 / _240;
    float _294 = _272 * _268;
    bool _296 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _298 = isnan(_224);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    bool _308 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_224);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_306;
    float _322 = _320 + 1.0;
    float _324 = _232 * _276;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    bool _330 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _332 = isnan(_224);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = _290 * _322;
    float _344 = -_290;
    float _346 = _344 + 1.0;
    float _348 = fma(_328, _278, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = _236 * _292;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = _318 * _346;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = fma(_358, _278, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _372 = fma(_362, _278, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _374 = -_318;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _382 = fma(_352, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _384 = fma(_368, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _386 = _266 * _376;
    float _388 = -_266;
    float _390 = _388 + 1.0;
    float _392 = fma(_380, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _394 = _340 * _390;
    float _396 = -_340;
    float _398 = _396 + 1.0;
    float _400 = _348 * _394;
    float _402 = _370 * _394;
    float _404 = _372 * _394;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _406;
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _412 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _414 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].z, _404);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _420;
    float _424 = fma(_408, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _426 = fma(_382, _386, _410);
    float _428 = fma(_392, _386, _412);
    float _430 = fma(_384, _386, _414);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _440 = fma(_418, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _442 = fma(_422, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _448 = fma(_424, _364, _426);
    float _450 = fma(_434, _294, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _452 = fma(_438, _294, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _454 = fma(_446, _294, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _456 = fma(_440, _364, _428);
    float _458 = fma(_442, _364, _430);
    float _460 = fma(_450, _342, _448);
    float _462 = fma(_452, _342, _456);
    float _464 = fma(_454, _342, _458);
    float _466 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[147].x, _460);
    float _468 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[147].y, _462);
    float _470 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[147].z, _464);
    bool _472 = !_274;
    float _490;
    if (!_472)
    {
        float _474 = in.m_59.x;
        float _476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _478 = _474 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _480 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _482 = _480 * _476;
        float _484 = floor(_482);
        float _486 = -_484;
        float _488 = _482 + _486;
        _490 = _488;
        _492 = true;
    }
    else
    {
        float _494 = float(_114);
        float _496 = 1.0 / _494;
        float _498 = _148 * _496;
        _490 = _498;
    }
    _492 = false;
    float _500 = _490;
    float _502 = in.m_61.x;
    float _504 = in.m_61.y;
    float _506 = in.m_61.z;
    float _508 = in.m_63.x;
    float _510 = in.m_63.y;
    float _512 = in.m_63.z;
    float _514 = in.m_50.x;
    float _516 = in.m_50.y;
    float _518 = in.m_50.z;
    float _520 = _468 * _504;
    float _522 = _470 * _506;
    float _524 = _466 * _502;
    float _526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _510);
    float _528 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _530 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _512);
    float _532 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _534 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _508);
    float _536 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _538 = _528 * _526;
    float _540 = _532 * _530;
    float _542 = _516 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _544 = _536 * _534;
    float _546 = _516 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _548 = _538 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _550 = _538 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _552 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[6].x, _542);
    float _554 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[4].x, _546);
    float _556 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[24].x, _548);
    float _558 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[26].x, _550);
    float _560 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[6].z, _552);
    float _562 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[4].z, _554);
    float _564 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[24].z, _556);
    float _566 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[26].z, _558);
    float _568 = _560 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _570 = _562 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _572 = _564 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _574 = _566 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _576 = _516 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _578 = _570 + _572;
    float _580 = _568 + _574;
    float _582 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[5].x, _576);
    float _584 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _586 = _578 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _590 = _580 + _588;
    float _592 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[5].z, _582);
    float _594 = _586 * _586;
    float _596 = _590 * _590;
    float _598 = _592 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _600 = fma(_570, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _602 = _594 + _596;
    float _604 = floor(_600);
    float _606 = sqrt(_602);
    float _608 = -_604;
    float _610 = _600 + _608;
    bool _612 = _606 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _616 = _606 + _614;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _620 = _602;
    float _622 = _592;
    float _624 = _578;
    float _626 = _580;
    float _628 = _594;
    float _630 = _596;
    if (_612)
    {
        float _632 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _618 = _632;
    }
    float _634 = _618;
    if (_612)
    {
        float _636 = rsqrt(_602);
        _620 = _636;
    }
    float _638 = _620;
    float _640 = _634;
    if (_612)
    {
        float _642 = _616 * _634;
        _640 = _642;
    }
    float _644 = _640;
    float _646 = _538 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _648 = _644;
    if (_612)
    {
        float _650 = _644 * 0.15915493667125701904296875;
        _648 = _650;
    }
    float _652 = _648;
    float _654 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[25].x, _646);
    float _656 = _514;
    if (_612)
    {
        float _658 = _652 * 6.283185482025146484375;
        float _660 = sin(_658);
        _656 = _660;
    }
    float _662 = _656;
    float _664 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[25].z, _654);
    float _666 = _664 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _668 = fma(_568, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _670 = _598 + _666;
    float _672 = floor(_668);
    if (_612)
    {
        float _674 = _670 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _622 = _674;
    }
    float _676 = _622;
    float _678 = _676;
    if (_612)
    {
        float _680 = fma(_662, _676, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _678 = _680;
    }
    float _682 = _678;
    float _684 = _682;
    if (_612)
    {
        float _686 = _638 * _682;
        _684 = _686;
    }
    float _688 = _684;
    if (_612)
    {
        float _690 = fma(_586, _688, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _624 = _690;
    }
    float _692 = _624;
    if (_612)
    {
        float _694 = fma(_590, _688, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _626 = _694;
    }
    float _696 = _626;
    float _698 = -_672;
    float _700 = _668 + _698;
    float _702 = fma(_692, 6.2500002968590706586837768554688e-05, 0.5);
    float _704 = fma(_696, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3285 = float2(_702, _704);
    float3 _708 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3285, float2(0.0), isnan(_3285)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3285, float2(0.0), isnan(_3285)), level(0.0)).xyz;
    float _710 = _708.x;
    float _712 = _708.y;
    float _714 = _708.z;
    float2 _3301 = float2(_610, _700);
    float _716 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3301, float2(0.0), isnan(_3301)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3301, float2(0.0), isnan(_3301)), level(0.0)).x;
    float _718 = in.m_59.x;
    float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _722 = in.m_59.y;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _726 = _724 != 0;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _730 = _500 + _728;
    float _732 = in.m_65.w;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _738 = in.m_67.y;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _742 = _740 != 0;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _748 = _746 != 0;
    float _750 = in.m_59.z;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _754 = _752 != 0;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _760 = _758 != 0;
    float _762 = 1.0 / _736;
    float _764 = in.m_67.x;
    float _766 = _718 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _770 = _722 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _772 = -_744;
    float _774 = fma(_766, 2.0, _772);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _776;
    float _780 = fma(_770, -2.0, _756);
    out.m_69.w = _732;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _784 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _786 = _778 * _762;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _790 = _782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _792 = _750 > 0.5;
    float _794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _798 = -_738;
    float _800 = _798 + 1.0;
    float _802 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _806 = _738;
    bool _808 = _760;
    if (_726)
    {
        _804 = _718;
    }
    float _810 = _804;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _814 = _810;
    if (!_726)
    {
        _814 = _750;
    }
    float _816 = _814;
    float _818 = _720 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _820 = _792 ? as_type<int>(_800) : as_type<int>(_738);
    out.m_71.x = _790;
    out.m_71.y = _784;
    out.m_71.z = _802;
    out.m_71.w = _796;
    bool _822 = _722 > 0.5;
    float _824 = fma(_786, _730, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _826 = _754 ? as_type<float>(_820) : _738;
    float _828 = in.m_73.x;
    float _830 = in.m_73.y;
    float _832 = in.m_73.z;
    bool _834 = _510 != 0.0;
    bool _836 = isnan(_510);
    bool _838 = _834 || _836;
    bool _840 = isnan(0.0);
    bool _842 = _838 || _840;
    float _844 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[88].w, _812);
    if (_760)
    {
        float _846 = _822 ? _800 : _738;
        _806 = _846;
    }
    float _848 = _806;
    bool _850 = _508 == 0.0;
    bool _852 = !_842;
    bool _854 = _850 && _852;
    bool _856 = _512 == 0.0;
    bool _858 = _856 && _854;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _862 = 0.0;
    float _864 = _860;
    if (_726)
    {
        _862 = _722;
    }
    float _866 = _862;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _870 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[78].w, _860);
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _874 = _866;
    float _876 = _872;
    int _878 = as_type<int>(_870);
    if (_742)
    {
        bool _880 = _718 > 0.5;
        _808 = _880;
    }
    bool _882 = _808;
    float _884 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[78].z, _868);
    if (!_726)
    {
        _874 = _718;
    }
    float _886 = _874;
    float _888 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[88].z, _872);
    if (!_742)
    {
        _864 = _764;
    }
    float _890 = _864;
    float _892 = fma(_826, _818, -0.5);
    float _894 = _828;
    float _896 = _832;
    float _898 = _830;
    float _900 = _890;
    if (!_858)
    {
        float _902 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[17].y, _828);
        _894 = _902;
    }
    float _904 = _894;
    if (!_858)
    {
        float _906 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[17].y, _832);
        _896 = _906;
    }
    float _908 = _896;
    bool _910 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _912 = isnan(_500);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = _794 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _924 = _920;
    if (!_858)
    {
        float _926 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[17].y, _830);
        _898 = _926;
    }
    float _928 = _898;
    float _930 = -_920;
    float _932 = _930 + 1.0;
    if (!_742)
    {
        _876 = _890;
    }
    float _934 = _876;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _938 = _934;
    if (_742)
    {
        _900 = _764;
    }
    float _940 = _900;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _944 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _946 = isnan(_500);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _952 = _948 || _950;
    float _954 = float(_952);
    float _956 = _816 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _960 = _886 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _962 = fma(_922, _848, -0.5);
    float _964 = _954 * _932;
    float _966 = -_936;
    float _968 = fma(_956, 2.0, _966);
    float _970 = fma(_960, -2.0, _942);
    float _972 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _870);
    float _974 = _824 * _964;
    float _976 = _942;
    float _978 = _940;
    if (_612)
    {
        float _980 = _652 * 6.283185482025146484375;
        float _982 = cos(_980);
        _976 = _982;
    }
    float _984 = _976;
    float _986 = -_148;
    float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[76].x, _774);
    if (_742)
    {
        float _990 = -_940;
        float _992 = _990 + 1.0;
        _878 = as_type<int>(_992);
    }
    int _994 = _878;
    float _996 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _780);
    float _998 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _844);
    float _1000 = _928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1002 = _928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1004 = _928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1008 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1000);
    if (_742)
    {
        float _1010 = _882 ? as_type<float>(_994) : _940;
        _938 = _1010;
    }
    float _1012 = _938;
    float _1014 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1002);
    float _1016 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1004);
    float _1018 = _958 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1020 = 0;
    float _1022 = _1012;
    if (_748)
    {
        float _1024 = -_940;
        float _1026 = _1024 + 1.0;
        _1020 = as_type<int>(_1026);
    }
    int _1028 = _1020;
    float _1030 = -_954;
    float _1032 = _1030 + 1.0;
    float _1034 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _884);
    float _1036 = fma(_1018, _1012, -0.5);
    float _1038 = _1036;
    if (_612)
    {
        float _1040 = _984 + (-1.0);
        _1022 = _1040;
    }
    float _1042 = _1022;
    float _1044 = _1042;
    if (_748)
    {
        float _1046 = _822 ? as_type<float>(_1028) : _940;
        _978 = _1046;
    }
    float _1048 = _978;
    float _1050 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[115].x, _974);
    float _1052 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _888);
    float _1054 = -_148;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[86].x, _968);
    float _1058 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _970);
    float _1060 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_612)
    {
        float _1062 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _150 = _1062;
    }
    float _1064 = _150;
    float _1066 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1050);
    if (!_612)
    {
        _924 = _670;
    }
    float _1068 = _924;
    float _1070 = fma(_1060, _1048, -0.5);
    float _1072 = _1068;
    if (_612)
    {
        float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1076 = _692 + _1074;
        _1044 = _1076;
    }
    float _1078 = _1044;
    if (_612)
    {
        float _1080 = fma(_670, _984, _1064);
        _1072 = _1080;
    }
    float _1082 = _1072;
    float _1084 = fma(_1034, _1036, _988);
    float _1086 = fma(_1052, _1070, _1056);
    if (_612)
    {
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1090 = _696 + _1088;
        _1038 = _1090;
    }
    float _1092 = _1038;
    if (_612)
    {
        float _1094 = _1078 * _1078;
        _628 = _1094;
    }
    float _1096 = _628;
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1100 = _1082 + _1098;
    if (_612)
    {
        float _1102 = _1092 * _1092;
        _630 = _1102;
    }
    float _1104 = _630;
    float _1106 = fma(_1100, _1100, _1096);
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1110 = -_996;
    float _1112 = fma(_972, _962, _1110);
    float _1114 = _1106 + _1104;
    float _1116 = -_1058;
    float _1118 = fma(_998, _892, _1116);
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1124 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1014);
    float _1126 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1008);
    float _1128 = sqrt(_1114);
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1132 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1134 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1112 + 0.5;
    float _1138 = _1118 + 0.5;
    float _1140 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1142 = _1084 + 0.5;
    float _1144 = _1086 + 0.5;
    float _1146 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1016);
    out.m_75.x = _1130;
    out.m_75.y = _1132;
    out.m_75.z = _1134;
    out.m_75.w = _1140;
    out.m_77.x = _1142;
    out.m_77.y = _1136;
    bool _1148 = _1128 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1150 = isnan(_1128);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1156 = _1152 || _1154;
    out.m_79.x = _1144;
    out.m_79.y = _1138;
    out.m_81.x = _1124;
    out.m_81.y = _1126;
    out.m_81.z = _1146;
    float _1158 = _1108;
    float _1160 = _1134;
    float _1162 = _1130;
    if (!_1156)
    {
        _1158 = 1.0;
    }
    float _1164 = _1158;
    out.m_83.x = _710;
    out.m_83.y = _712;
    out.m_83.z = _714;
    bool _1166 = !_1156;
    float _1168 = _1164;
    float _1170 = _712;
    float _1172 = _714;
    if (!_1166)
    {
        bool _1174 = _1128 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1176 = isnan(_1128);
        bool _1178 = _1174 || _1176;
        bool _1180 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1182 = _1178 || _1180;
        if (!_1182)
        {
            float _1184 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1186 = _1128 + _1184;
            float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1190 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1188;
            float _1192 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1194 = _1192 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1196 = 1.0 / _1190;
            float _1198 = _1186 * _1196;
            float _1200 = fma(_1198, _1194, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1168 = _1200;
            _1170 = _1196;
            _1202 = true;
        }
        else
        {
            bool _1204 = _1128 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1206 = isnan(_1128);
            bool _1208 = _1204 || _1206;
            bool _1210 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1212 = _1208 || _1210;
            if (!_1212)
            {
                float _1214 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1216 = _1128 + _1214;
                float _1218 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1220 = _1218 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1224 = _1222 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1226 = 1.0 / _1220;
                float _1228 = _1216 * _1226;
                float _1230 = fma(_1228, _1224, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1168 = _1230;
                _1170 = _1226;
                _1202 = true;
            }
            else
            {
                _1168 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1202 = false;
    float _1232 = _1168;
    float _1234 = _1170;
    float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1238 = _1082 + _1236;
    float _1240 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1242 = _692 + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1246 = _696 + _1244;
    float _1248 = fma(_1238, _1232, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1250 = fma(_1242, _1232, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1252 = fma(_1246, _1232, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1254 = -_598;
    float _1256 = _1254 + _1248;
    float _1258 = -_570;
    float _1260 = _1258 + _1250;
    float _1262 = -_568;
    float _1264 = _1262 + _1252;
    float _1266 = _1256 * _1256;
    float _1268 = fma(_1260, _1260, _1266);
    float _1270 = fma(_1264, _1264, _1268);
    float _1272 = sqrt(_1270);
    bool _1274 = _1272 > 0.0;
    float _1276 = _1272;
    float _1278 = _1234;
    float _1280 = _1252;
    if (!_1274)
    {
        _1276 = _1250;
    }
    float _1282 = _1276;
    float _1284 = _1282;
    if (!_1274)
    {
        _1278 = _1248;
    }
    float _1286 = _1278;
    float _1288 = _1286;
    if (!_1274)
    {
        _1172 = _1252;
    }
    float _1290 = _1172;
    bool _1292 = !_1274;
    float _1294 = _1290;
    float _1296 = _1290;
    if (!_1292)
    {
        float _1298 = _192 * _192;
        float _1300 = fma(_190, _190, _1298);
        float _1302 = fma(_194, _194, _1300);
        float _1304 = rsqrt(_1270);
        float _1306 = sqrt(_1302);
        float _1308 = _1260 * _1304;
        float _1310 = _1256 * _1304;
        float _1312 = _1264 * _1304;
        bool _1314 = _1306 > 0.0;
        float _1316 = _1304;
        float _1318 = _1306;
        _1160 = _1310;
        _1162 = _1308;
        if (!_1314)
        {
            _1316 = _1250;
        }
        float _1320 = _1316;
        _1284 = _1320;
        if (!_1314)
        {
            _1318 = _1248;
        }
        float _1322 = _1318;
        _1288 = _1322;
        if (!_1314)
        {
            _1294 = _1252;
        }
        float _1324 = _1294;
        bool _1326 = !_1314;
        _1296 = _1324;
        if (!_1326)
        {
            float _1328 = rsqrt(_1302);
            float _1330 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1332 = _192 * _1328;
            float _1334 = _190 * _1328;
            float _1336 = _1310 * _1332;
            float _1338 = _194 * _1328;
            float _1340 = fma(_1308, _1334, _1336);
            float _1342 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1344 = fma(_1312, _1338, _1340);
            float _1346 = _1344 * _1342;
            float _1348 = fma(_190, _1346, _1250);
            float _1350 = fma(_192, _1346, _1248);
            float _1352 = fma(_194, _1346, _1252);
            _1288 = _1350;
            _1284 = _1348;
            _1296 = _1352;
        }
    }
    float _1354 = _1288;
    float _1356 = _1284;
    float _1358 = _1296;
    float _1360 = _1160;
    float _1362 = _1162;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1366 = _1354 + _1364;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1370 = _1356 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1374 = _1358 + _1372;
    float _1376 = _1366 * _1366;
    float _1378 = fma(_1370, _1370, _1376);
    float _1380 = fma(_1374, _1374, _1378);
    float _1382 = rsqrt(_1380);
    float _1384 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1386 = _1370 * _1384;
    float _1388 = _1374 * _1384;
    float _1390 = _1386 * _1386;
    float _1392 = _1388 * _1388;
    float _1394 = _1390 + _1392;
    float _1396 = sqrt(_1394);
    bool _1398 = _1396 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = _1396 + _1400;
    float _1404 = _1382;
    float _1406 = _1362;
    float _1408 = _1402;
    float _1410 = _1360;
    float _1412 = _1366;
    float _1414 = _1386;
    if (_1398)
    {
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1404 = _1416;
    }
    float _1418 = _1404;
    if (_1398)
    {
        float _1420 = rsqrt(_1394);
        _1406 = _1420;
    }
    float _1422 = _1406;
    float _1424 = _1422;
    if (_1398)
    {
        float _1426 = _1402 * _1418;
        _1408 = _1426;
    }
    float _1428 = _1408;
    if (_1398)
    {
        float _1430 = _1428 * 0.15915493667125701904296875;
        _1410 = _1430;
    }
    float _1432 = _1410;
    float _1434 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1436 = _1374;
    float _1438 = _1432;
    if (_1398)
    {
        float _1440 = _1432 * 6.283185482025146484375;
        float _1442 = sin(_1440);
        _1436 = _1442;
    }
    float _1444 = _1436;
    float _1446 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1448 = precise::max(0.0, _1446);
    float _1450 = _1418;
    float _1452 = _1448;
    if (_1398)
    {
        float _1454 = _1432 * 6.283185482025146484375;
        float _1456 = cos(_1454);
        _1450 = _1456;
    }
    float _1458 = _1450;
    float _1460 = -_1384;
    float _1462 = -_1448;
    float _1464 = fma(_1366, _1460, _1462);
    float _1466 = _1464;
    if (_1398)
    {
        float _1468 = _1464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1412 = _1468;
    }
    float _1470 = _1412;
    float _1472 = _1470;
    float _1474 = _1444;
    if (_1398)
    {
        float _1476 = fma(_1444, _1470, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1472 = _1476;
    }
    float _1478 = _1472;
    float _1480 = _1478;
    if (!_1398)
    {
        _1474 = _1390;
    }
    float _1482 = _1474;
    float _1484 = _1482;
    if (_1398)
    {
        float _1486 = _1458 + (-1.0);
        _1452 = _1486;
    }
    float _1488 = _1452;
    if (_1398)
    {
        float _1490 = _1422 * _1478;
        _1280 = _1490;
    }
    float _1492 = _1280;
    if (!_1398)
    {
        _1424 = _1388;
    }
    float _1494 = _1424;
    float _1496 = _1494;
    if (_1398)
    {
        float _1498 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1438 = _1498;
    }
    float _1500 = _1438;
    if (_1398)
    {
        float _1502 = _1386 * _1492;
        _1414 = _1502;
    }
    float _1504 = _1414;
    float _1506 = sqrt(_1380);
    if (_1398)
    {
        float _1508 = _1388 * _1492;
        _1496 = _1508;
    }
    float _1510 = _1496;
    if (_1398)
    {
        float _1512 = fma(_1464, _1458, _1500);
        _1466 = _1512;
    }
    float _1514 = _1466;
    if (_1398)
    {
        float _1516 = _1504 * _1504;
        _1484 = _1516;
    }
    float _1518 = _1484;
    if (!_1398)
    {
        _1480 = _1392;
    }
    float _1520 = _1480;
    float _1522 = _1520;
    if (_1398)
    {
        float _1524 = _1510 * _1510;
        _1522 = _1524;
    }
    float _1526 = _1522;
    float _1528 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1530 = fma(_1514, _1514, _1518);
    float _1532 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1528);
    float _1534 = _1530 + _1526;
    float _1536 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1538 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1532);
    float _1540 = rsqrt(_1534);
    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1544 = fma(_1506, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1542);
    float _1546 = precise::clamp(_1544, 0.0, 1.0);
    float _1548 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1550 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1552 = -_1546;
    float _1554 = _1552 + 1.0;
    float _1556 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1536);
    float _1558 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1560 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1548);
    float _1562 = abs(_1554);
    float _1564 = log2(_1562);
    float _1566 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1556);
    float _1568 = _1558 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1570 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1560);
    float _1572 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1550);
    float _1574 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1576 = -_1568;
    float _1578 = fma(_1576, _1434, 1.0);
    float _1580 = _1540 * _1504;
    float _1582 = _1570 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1584 = _1540 * _1514;
    float _1586 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1590 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1572);
    float _1592 = _1540 * _1510;
    float _1594 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1586);
    float _1596 = -_1588;
    float _1598 = fma(_1584, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1596);
    float _1600 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1602 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1604 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1594);
    float _1606 = -_1592;
    float _1608 = fma(_1606, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1598);
    float _1610 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1612 = exp2(_1602);
    float _1614 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1604);
    float _1616 = fma(_1608, -0.5, 0.5);
    float _1618 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1620 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1610);
    float _1622 = fma(_1608, 0.5, 0.5);
    float _1624 = _1584 + 1.0;
    float _1626 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1618);
    float _1628 = log2(_1578);
    float _1630 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1620);
    float _1632 = fma(_1622, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1634 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1626);
    float _1636 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1630);
    float _1638 = fma(_1622, _1632, -0.212114393711090087890625);
    float _1640 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1634);
    float _1642 = 1.0 / _1614;
    float _1644 = -_1584;
    float _1646 = fma(_1612, _1624, _1644);
    float _1648 = fma(_1622, _1638, 1.570728778839111328125);
    float _1650 = fma(_1646, 0.5, 0.5);
    float _1652 = sqrt(_1616);
    float _1654 = _1628 * 0.693147182464599609375;
    float _1656 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1658 = _1636 * _1642;
    float _1660 = _1640 * _1642;
    float _1662 = fma(_1658, 0.5, 0.5);
    float _1664 = fma(_1660, -0.5, 0.5);
    float _1666 = _1652 * 0.636619746685028076171875;
    float _1668 = -_1648;
    float _1670 = fma(_1666, _1668, 1.0);
    float3 _4953 = float3(_1662, _1664, _1656);
    float _1672 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4953, float3(0.0), isnan(_4953)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4953, float3(0.0), isnan(_4953)), level(0.0)).x;
    float3 _4964 = float3(_1662, _1664, _1656);
    float4 _1675 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4964, float3(0.0), isnan(_4964)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4964, float3(0.0), isnan(_4964)), level(0.0)).xyzw;
    float _1677 = _1675.x;
    float _1679 = _1675.y;
    float _1681 = _1675.z;
    float _1683 = _1675.w;
    float2 _4980 = float2(_1670, _1650);
    float3 _1685 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4980, float2(0.0), isnan(_4980)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4980, float2(0.0), isnan(_4980)), level(0.0)).xyz;
    float _1687 = _1685.x;
    float _1689 = _1685.y;
    float _1691 = _1685.z;
    float _1693 = _598 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1695 = _598 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1697 = -_716;
    float _1699 = _1697 + 1.0;
    float _1701 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1693);
    float _1703 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1695);
    float _1705 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1701);
    float _1707 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1703);
    float _1709 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1711 = _1707 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1713 = 1.0 / _1709;
    float _1715 = _1711 + _1709;
    float _1717 = _1715 * _1713;
    float _1719 = _1717 * 0.5;
    float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1723 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1721);
    float _1725 = 1.0 / _1723;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1729 = _1725 * _1727;
    float _1731 = abs(_1729);
    float _1733 = log2(_1731);
    float _1735 = in.m_85.x;
    bool _1737 = _1729 <= 8000.0;
    bool _1739 = isnan(_1729);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan(8000.0);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    bool _1749 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1751 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan(0.5);
    bool _1757 = _1753 || _1755;
    float _1759 = _1733 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1761 = exp2(_1759);
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1765 = precise::clamp(_1763, 0.0, 1.0);
    float _1767 = fma(_1765, -2.0, 3.0);
    float _1769 = _1765 * _1765;
    float _1771 = _1769 * _1767;
    float _1773 = -_1771;
    float _1775 = _1773 + 1.0;
    float _1777 = fma(_1775, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1771);
    float _1779 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1781 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1783 = _1574;
    if (!_1757)
    {
        _1783 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1785 = _1783;
    float _1787 = _1747 * _1777;
    float _1789 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1781);
    float _1791 = exp2(_1779);
    float _1793 = _1787 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1795 = _1785;
    float _1797 = _1787;
    if (!_1757)
    {
        float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1801 = _1785 + _1799;
        _1795 = _1801;
    }
    float _1803 = _1795;
    float _1805 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1789);
    float _1807 = _1614 * 0.5;
    float _1809 = _1699 * _1793;
    float _1811 = precise::clamp(_1809, 0.0, 1.0);
    float _1813 = _1805;
    float _1815 = _1803;
    if (!_1757)
    {
        float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1819 = _1729 + _1817;
        _1797 = _1819;
    }
    float _1821 = _1797;
    float _1823 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1805);
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_1757)
    {
        float _1827 = 1.0 / _1803;
        _1825 = _1827;
    }
    float _1829 = _1825;
    float _1831 = -_1811;
    float _1833 = fma(_1831, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    if (_1757)
    {
        _1813 = 1.0;
    }
    float _1835 = _1813;
    float _1837 = _1823 + _1614;
    float _1839 = _1636 + _1614;
    float _1841 = _1833 * _1735;
    float _1843 = fma(_1640, -0.5, _1807);
    float _1845 = -_1791;
    float _1847 = _1845 + 1.0;
    float _1849 = _1841 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1851 = _1837 * 0.5;
    float _1853 = _1839 * 0.5;
    float _1855 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1636;
    out.gl_Position.y = _1640;
    out.gl_Position.z = _1823;
    out.gl_Position.w = _1614;
    float _1857 = _1835;
    float _1859 = _1851;
    float _1861 = _1853;
    float _1863 = _1843;
    if (!_1757)
    {
        float _1865 = _1821 * _1829;
        float _1867 = precise::clamp(_1865, 0.0, 1.0);
        _1857 = _1867;
    }
    float _1869 = _1857;
    out.m_87.x = _1849;
    bool _1871 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1873 = isnan(_1506);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1879 = _1875 || _1877;
    out.m_89.x = _1853;
    out.m_89.y = _1843;
    out.m_89.z = _1851;
    out.m_89.w = _1614;
    float _1881 = _1869 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_1879)
    {
        _1815 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1883 = _1815;
    float _1885 = _1883;
    float _1887 = _1883;
    if (!_1879)
    {
        _1859 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1889 = _1859;
    float _1891 = _1889;
    float _1893 = _1889;
    if (!_1879)
    {
        _1861 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1895 = _1861;
    float _1897 = _1895;
    float _1899 = _1895;
    if (!_1879)
    {
        _1863 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1901 = _1863;
    float _1903 = _1855 * _1672;
    float _1905 = -_1855;
    float _1907 = _1905 + 1.0;
    float _1909 = _1683 * _1903;
    float _1911 = _1691 * _1903;
    float _1913 = _1683 * _1907;
    float _1915 = _1907;
    float _1917 = _1909;
    float _1919 = _1901;
    float _1921 = _1901;
    if (!_1879)
    {
        _1915 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1923 = _1915;
    float _1925 = fma(_1687, _1909, _1677);
    float _1927 = fma(_1689, _1909, _1679);
    float _1929 = fma(_1683, _1911, _1681);
    float _1931 = _1923;
    float _1933 = _1923;
    if (!_1879)
    {
        _1917 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1935 = _1917;
    out.m_91.x = _1925;
    out.m_91.y = _1927;
    out.m_91.z = _1929;
    out.m_91.w = _1913;
    bool _1937 = !_1879;
    float _1939 = _1935;
    float _1941 = _1935;
    if (!_1937)
    {
        bool _1943 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1945 = isnan(_1506);
        bool _1947 = _1943 || _1945;
        bool _1949 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1951 = _1947 || _1949;
        if (!_1951)
        {
            float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1955 = _1506 + _1953;
            float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1959 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1957;
            float _1961 = 1.0 / _1959;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1979 = _1955 * _1961;
            float _1981 = precise::clamp(_1979, 0.0, 1.0);
            float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1991 = fma(_1981, _1965, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1993 = fma(_1981, _1985, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1995 = fma(_1981, _1989, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1997 = fma(_1981, _1969, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1999 = fma(_1981, _1973, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2001 = fma(_1981, _1977, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1899 = _1995;
            _1941 = _1999;
            _1893 = _1993;
            _1887 = _1997;
            _1921 = _1991;
            _1933 = _2001;
            _2003 = true;
        }
        else
        {
            bool _2005 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2007 = isnan(_1506);
            bool _2009 = _2005 || _2007;
            bool _2011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2013 = _2009 || _2011;
            if (!_2013)
            {
                _1891 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2015 = _1891;
            _1893 = _2015;
            if (!_2013)
            {
                _1897 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2017 = _1897;
            _1899 = _2017;
            if (!_2013)
            {
                _1919 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2019 = _1919;
            _1921 = _2019;
            if (!_2013)
            {
                _1885 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2021 = _1885;
            _1887 = _2021;
            if (!_2013)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2023 = _1939;
            _1941 = _2023;
            if (!_2013)
            {
                _1931 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2025 = _1931;
            bool _2027 = !_2013;
            _1933 = _2025;
            if (!_2027)
            {
                bool _2029 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2031 = isnan(_1506);
                bool _2033 = _2029 || _2031;
                bool _2035 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2037 = _2033 || _2035;
                if (!_2037)
                {
                    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2041 = _1506 + _2039;
                    float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2043;
                    float _2047 = 1.0 / _2045;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2065 = _2041 * _2047;
                    float _2067 = precise::clamp(_2065, 0.0, 1.0);
                    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2071 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2077 = fma(_2067, _2051, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2079 = fma(_2067, _2071, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2081 = fma(_2067, _2075, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2083 = fma(_2067, _2055, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2085 = fma(_2067, _2059, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2087 = fma(_2067, _2063, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1899 = _2081;
                    _1941 = _2085;
                    _1893 = _2079;
                    _1887 = _2083;
                    _1921 = _2077;
                    _1933 = _2087;
                    _2003 = true;
                }
                else
                {
                    _1899 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1893 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1887 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1921 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1933 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2003 = false;
    float _2089 = _1899;
    float _2091 = _1941;
    float _2093 = _1893;
    float _2095 = _1887;
    float _2097 = _1921;
    float _2099 = _1933;
    float _2101 = _1881 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2103 = fma(_1126, -0.5, 0.5);
    float _2105 = precise::clamp(_2103, 0.0, 1.0);
    float _2107 = -_2089;
    float _2109 = _2107 + _2091;
    float _2111 = -_2093;
    float _2113 = _2111 + _2095;
    out.m_53.x = _2101;
    float _2115 = -_2097;
    float _2117 = _2115 + _2099;
    float _2119 = fma(_2105, _2109, _2089);
    float _2121 = fma(_2105, _2113, _2093);
    bool _2123 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2125 = _2119 * 0.586610972881317138671875;
    float _2127 = fma(_2105, _2117, _2097);
    out.m_93.x = 0.0;
    bool _2129 = _1869 > 0.0;
    bool _2131 = isnan(_1869);
    bool _2133 = _2129 || _2131;
    bool _2135 = isnan(0.0);
    bool _2137 = _2133 || _2135;
    float _2139 = fma(_2121, 0.298911988735198974609375, _2125);
    float _2141 = fma(_2127, 0.114477999508380889892578125, _2139);
    float _2143 = -_2141;
    float _2145 = _2121 + _2143;
    float _2147 = -_2141;
    float _2149 = _2119 + _2147;
    float _2151 = -_2141;
    float _2153 = _2127 + _2151;
    float _2155 = fma(_2145, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2141);
    float _2157 = fma(_2149, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2141);
    float _2159 = fma(_2153, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2141);
    bool _2161 = !_2123;
    if (!_2161)
    {
        float _2163 = -_1354;
        float _2165 = _2163 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2167 = -_1356;
        float _2169 = _2167 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2171 = -_1358;
        float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2175 = _2165 * _2165;
        float _2177 = fma(_2169, _2169, _2175);
        float _2179 = fma(_2173, _2173, _2177);
        float _2181 = sqrt(_2179);
        float _2183 = rsqrt(_2179);
        float _2185 = -_2181;
        float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2189 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2191 = precise::clamp(_2189, 0.0, 1.0);
        float _2193 = _2169 * _2183;
        float _2195 = _2165 * _2183;
        float _2197 = abs(_2191);
        float _2199 = log2(_2197);
        float _2201 = _2173 * _2183;
        float _2203 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2205 = _1126 * _2195;
        float _2207 = -_2195;
        float _2209 = -_2203;
        float _2211 = fma(_2207, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2209);
        float _2213 = fma(_1124, _2193, _2205);
        float _2215 = -_2201;
        float _2217 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2211);
        float _2219 = fma(_1146, _2201, _2213);
        float _2221 = precise::clamp(_2219, 0.0, 1.0);
        float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2225 = _2217 + _2223;
        float _2227 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2229 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2231 = precise::clamp(_2229, 0.0, 1.0);
        float _2233 = exp2(_2227);
        float _2235 = _2233 * _2231;
        float _2237 = _2221 * _2235;
        float _2239 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2241 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2243 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2239;
        out.m_93.y = _2241;
        out.m_93.z = _2243;
    }
    out.m_95.x = _2155;
    out.m_95.y = _2157;
    out.m_95.z = _2159;
    if (_2137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2245 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2245;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2003 = false;
    bool _1202 = false;
    bool _492 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_50.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_53.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2302 = as_type<float>(_130);
        out.gl_Position.z = _2302;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_55.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _124 = _152;
    }
    float _154 = _124;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2372 = as_type<float>(_168);
        out.gl_Position.z = _2372;
    }
    if (_160)
    {
        return out;
    }
    float _170 = in.m_57.x;
    float _172 = in.m_57.y;
    float _174 = in.m_57.z;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _180 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _184 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _186);
    float _194 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _188);
    bool _196 = !_176;
    float _214;
    if (!_196)
    {
        float _198 = in.m_59.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        float _218 = float(_114);
        float _220 = 1.0 / _218;
        float _222 = _148 * _220;
        _214 = _222;
    }
    _216 = false;
    float _224 = _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _224 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = _224 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _244 = _242 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _250 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = 1.0 / _248;
    bool _256 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _258 = isnan(_224);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = 1.0 / _244;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _272 = _224 + _270;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _276 = 1.0 / _252;
    float _278 = _228 * _254;
    bool _280 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _282 = isnan(_224);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    float _292 = 1.0 / _240;
    float _294 = _272 * _268;
    bool _296 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _298 = isnan(_224);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    bool _308 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_224);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_306;
    float _322 = _320 + 1.0;
    float _324 = _232 * _276;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    bool _330 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _332 = isnan(_224);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = _290 * _322;
    float _344 = -_290;
    float _346 = _344 + 1.0;
    float _348 = fma(_328, _278, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = _236 * _292;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = _318 * _346;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = fma(_358, _278, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _372 = fma(_362, _278, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _374 = -_318;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _382 = fma(_352, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _384 = fma(_368, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _386 = _266 * _376;
    float _388 = -_266;
    float _390 = _388 + 1.0;
    float _392 = fma(_380, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _394 = _340 * _390;
    float _396 = -_340;
    float _398 = _396 + 1.0;
    float _400 = _348 * _394;
    float _402 = _370 * _394;
    float _404 = _372 * _394;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _406;
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _412 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _414 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].z, _404);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _420;
    float _424 = fma(_408, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _426 = fma(_382, _386, _410);
    float _428 = fma(_392, _386, _412);
    float _430 = fma(_384, _386, _414);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _440 = fma(_418, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _442 = fma(_422, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _448 = fma(_424, _364, _426);
    float _450 = fma(_434, _294, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _452 = fma(_438, _294, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _454 = fma(_446, _294, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _456 = fma(_440, _364, _428);
    float _458 = fma(_442, _364, _430);
    float _460 = fma(_450, _342, _448);
    float _462 = fma(_452, _342, _456);
    float _464 = fma(_454, _342, _458);
    float _466 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[147].x, _460);
    float _468 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[147].y, _462);
    float _470 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[147].z, _464);
    bool _472 = !_274;
    float _490;
    if (!_472)
    {
        float _474 = in.m_59.x;
        float _476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _478 = _474 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _480 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _482 = _480 * _476;
        float _484 = floor(_482);
        float _486 = -_484;
        float _488 = _482 + _486;
        _490 = _488;
        _492 = true;
    }
    else
    {
        float _494 = float(_114);
        float _496 = 1.0 / _494;
        float _498 = _148 * _496;
        _490 = _498;
    }
    _492 = false;
    float _500 = _490;
    float _502 = in.m_61.x;
    float _504 = in.m_61.y;
    float _506 = in.m_61.z;
    float _508 = in.m_63.x;
    float _510 = in.m_63.y;
    float _512 = in.m_63.z;
    float _514 = in.m_50.x;
    float _516 = in.m_50.y;
    float _518 = in.m_50.z;
    float _520 = _468 * _504;
    float _522 = _470 * _506;
    float _524 = _466 * _502;
    float _526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _510);
    float _528 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _530 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _512);
    float _532 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _534 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _508);
    float _536 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _538 = _528 * _526;
    float _540 = _532 * _530;
    float _542 = _516 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _544 = _536 * _534;
    float _546 = _516 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _548 = _538 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _550 = _538 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _552 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[6].x, _542);
    float _554 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[4].x, _546);
    float _556 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[24].x, _548);
    float _558 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[26].x, _550);
    float _560 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[6].z, _552);
    float _562 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[4].z, _554);
    float _564 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[24].z, _556);
    float _566 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[26].z, _558);
    float _568 = _560 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _570 = _562 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _572 = _564 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _574 = _566 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _576 = _516 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _578 = _570 + _572;
    float _580 = _568 + _574;
    float _582 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[5].x, _576);
    float _584 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _586 = _578 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _590 = _580 + _588;
    float _592 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[5].z, _582);
    float _594 = _586 * _586;
    float _596 = _590 * _590;
    float _598 = _592 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _600 = fma(_570, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _602 = _594 + _596;
    float _604 = floor(_600);
    float _606 = sqrt(_602);
    float _608 = -_604;
    float _610 = _600 + _608;
    bool _612 = _606 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _616 = _606 + _614;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _620 = _602;
    float _622 = _592;
    float _624 = _578;
    float _626 = _580;
    float _628 = _594;
    float _630 = _596;
    if (_612)
    {
        float _632 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _618 = _632;
    }
    float _634 = _618;
    if (_612)
    {
        float _636 = rsqrt(_602);
        _620 = _636;
    }
    float _638 = _620;
    float _640 = _634;
    if (_612)
    {
        float _642 = _616 * _634;
        _640 = _642;
    }
    float _644 = _640;
    float _646 = _538 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _648 = _644;
    if (_612)
    {
        float _650 = _644 * 0.15915493667125701904296875;
        _648 = _650;
    }
    float _652 = _648;
    float _654 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[25].x, _646);
    float _656 = _514;
    if (_612)
    {
        float _658 = _652 * 6.283185482025146484375;
        float _660 = sin(_658);
        _656 = _660;
    }
    float _662 = _656;
    float _664 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[25].z, _654);
    float _666 = _664 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _668 = fma(_568, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _670 = _598 + _666;
    float _672 = floor(_668);
    if (_612)
    {
        float _674 = _670 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _622 = _674;
    }
    float _676 = _622;
    float _678 = _676;
    if (_612)
    {
        float _680 = fma(_662, _676, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _678 = _680;
    }
    float _682 = _678;
    float _684 = _682;
    if (_612)
    {
        float _686 = _638 * _682;
        _684 = _686;
    }
    float _688 = _684;
    if (_612)
    {
        float _690 = fma(_586, _688, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _624 = _690;
    }
    float _692 = _624;
    if (_612)
    {
        float _694 = fma(_590, _688, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _626 = _694;
    }
    float _696 = _626;
    float _698 = -_672;
    float _700 = _668 + _698;
    float _702 = fma(_692, 6.2500002968590706586837768554688e-05, 0.5);
    float _704 = fma(_696, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3285 = float2(_702, _704);
    float3 _708 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3285, float2(0.0), isnan(_3285)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3285, float2(0.0), isnan(_3285)), level(0.0)).xyz;
    float _710 = _708.x;
    float _712 = _708.y;
    float _714 = _708.z;
    float2 _3301 = float2(_610, _700);
    float _716 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3301, float2(0.0), isnan(_3301)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3301, float2(0.0), isnan(_3301)), level(0.0)).x;
    float _718 = in.m_59.x;
    float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _722 = in.m_59.y;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _726 = _724 != 0;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _730 = _500 + _728;
    float _732 = in.m_65.w;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _738 = in.m_67.y;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _742 = _740 != 0;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _748 = _746 != 0;
    float _750 = in.m_59.z;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _754 = _752 != 0;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _760 = _758 != 0;
    float _762 = 1.0 / _736;
    float _764 = in.m_67.x;
    float _766 = _718 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _770 = _722 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _772 = -_744;
    float _774 = fma(_766, 2.0, _772);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _776;
    float _780 = fma(_770, -2.0, _756);
    out.m_69.w = _732;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _784 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _786 = _778 * _762;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _790 = _782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _792 = _750 > 0.5;
    float _794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _798 = -_738;
    float _800 = _798 + 1.0;
    float _802 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _806 = _738;
    bool _808 = _760;
    if (_726)
    {
        _804 = _718;
    }
    float _810 = _804;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _814 = _810;
    if (!_726)
    {
        _814 = _750;
    }
    float _816 = _814;
    float _818 = _720 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _820 = _792 ? as_type<int>(_800) : as_type<int>(_738);
    out.m_71.x = _790;
    out.m_71.y = _784;
    out.m_71.z = _802;
    out.m_71.w = _796;
    bool _822 = _722 > 0.5;
    float _824 = fma(_786, _730, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _826 = _754 ? as_type<float>(_820) : _738;
    float _828 = in.m_73.x;
    float _830 = in.m_73.y;
    float _832 = in.m_73.z;
    bool _834 = _510 != 0.0;
    bool _836 = isnan(_510);
    bool _838 = _834 || _836;
    bool _840 = isnan(0.0);
    bool _842 = _838 || _840;
    float _844 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[88].w, _812);
    if (_760)
    {
        float _846 = _822 ? _800 : _738;
        _806 = _846;
    }
    float _848 = _806;
    bool _850 = _508 == 0.0;
    bool _852 = !_842;
    bool _854 = _850 && _852;
    bool _856 = _512 == 0.0;
    bool _858 = _856 && _854;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _862 = 0.0;
    float _864 = _860;
    if (_726)
    {
        _862 = _722;
    }
    float _866 = _862;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _870 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[78].w, _860);
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _874 = _866;
    float _876 = _872;
    int _878 = as_type<int>(_870);
    if (_742)
    {
        bool _880 = _718 > 0.5;
        _808 = _880;
    }
    bool _882 = _808;
    float _884 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[78].z, _868);
    if (!_726)
    {
        _874 = _718;
    }
    float _886 = _874;
    float _888 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[88].z, _872);
    if (!_742)
    {
        _864 = _764;
    }
    float _890 = _864;
    float _892 = fma(_826, _818, -0.5);
    float _894 = _828;
    float _896 = _832;
    float _898 = _830;
    float _900 = _890;
    if (!_858)
    {
        float _902 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[17].y, _828);
        _894 = _902;
    }
    float _904 = _894;
    if (!_858)
    {
        float _906 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[17].y, _832);
        _896 = _906;
    }
    float _908 = _896;
    bool _910 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _912 = isnan(_500);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = _794 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _924 = _920;
    if (!_858)
    {
        float _926 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[17].y, _830);
        _898 = _926;
    }
    float _928 = _898;
    float _930 = -_920;
    float _932 = _930 + 1.0;
    if (!_742)
    {
        _876 = _890;
    }
    float _934 = _876;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _938 = _934;
    if (_742)
    {
        _900 = _764;
    }
    float _940 = _900;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _944 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _946 = isnan(_500);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _952 = _948 || _950;
    float _954 = float(_952);
    float _956 = _816 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _960 = _886 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _962 = fma(_922, _848, -0.5);
    float _964 = _954 * _932;
    float _966 = -_936;
    float _968 = fma(_956, 2.0, _966);
    float _970 = fma(_960, -2.0, _942);
    float _972 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _870);
    float _974 = _824 * _964;
    float _976 = _942;
    float _978 = _940;
    if (_612)
    {
        float _980 = _652 * 6.283185482025146484375;
        float _982 = cos(_980);
        _976 = _982;
    }
    float _984 = _976;
    float _986 = -_148;
    float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[76].x, _774);
    if (_742)
    {
        float _990 = -_940;
        float _992 = _990 + 1.0;
        _878 = as_type<int>(_992);
    }
    int _994 = _878;
    float _996 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _780);
    float _998 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _844);
    float _1000 = _928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1002 = _928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1004 = _928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1008 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1000);
    if (_742)
    {
        float _1010 = _882 ? as_type<float>(_994) : _940;
        _938 = _1010;
    }
    float _1012 = _938;
    float _1014 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1002);
    float _1016 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1004);
    float _1018 = _958 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1020 = 0;
    float _1022 = _1012;
    if (_748)
    {
        float _1024 = -_940;
        float _1026 = _1024 + 1.0;
        _1020 = as_type<int>(_1026);
    }
    int _1028 = _1020;
    float _1030 = -_954;
    float _1032 = _1030 + 1.0;
    float _1034 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _884);
    float _1036 = fma(_1018, _1012, -0.5);
    float _1038 = _1036;
    if (_612)
    {
        float _1040 = _984 + (-1.0);
        _1022 = _1040;
    }
    float _1042 = _1022;
    float _1044 = _1042;
    if (_748)
    {
        float _1046 = _822 ? as_type<float>(_1028) : _940;
        _978 = _1046;
    }
    float _1048 = _978;
    float _1050 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[115].x, _974);
    float _1052 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _888);
    float _1054 = -_148;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[86].x, _968);
    float _1058 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _970);
    float _1060 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_612)
    {
        float _1062 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _150 = _1062;
    }
    float _1064 = _150;
    float _1066 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1050);
    if (!_612)
    {
        _924 = _670;
    }
    float _1068 = _924;
    float _1070 = fma(_1060, _1048, -0.5);
    float _1072 = _1068;
    if (_612)
    {
        float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1076 = _692 + _1074;
        _1044 = _1076;
    }
    float _1078 = _1044;
    if (_612)
    {
        float _1080 = fma(_670, _984, _1064);
        _1072 = _1080;
    }
    float _1082 = _1072;
    float _1084 = fma(_1034, _1036, _988);
    float _1086 = fma(_1052, _1070, _1056);
    if (_612)
    {
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1090 = _696 + _1088;
        _1038 = _1090;
    }
    float _1092 = _1038;
    if (_612)
    {
        float _1094 = _1078 * _1078;
        _628 = _1094;
    }
    float _1096 = _628;
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1100 = _1082 + _1098;
    if (_612)
    {
        float _1102 = _1092 * _1092;
        _630 = _1102;
    }
    float _1104 = _630;
    float _1106 = fma(_1100, _1100, _1096);
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1110 = -_996;
    float _1112 = fma(_972, _962, _1110);
    float _1114 = _1106 + _1104;
    float _1116 = -_1058;
    float _1118 = fma(_998, _892, _1116);
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1124 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1014);
    float _1126 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1008);
    float _1128 = sqrt(_1114);
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1132 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1134 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1112 + 0.5;
    float _1138 = _1118 + 0.5;
    float _1140 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1142 = _1084 + 0.5;
    float _1144 = _1086 + 0.5;
    float _1146 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1016);
    out.m_75.x = _1130;
    out.m_75.y = _1132;
    out.m_75.z = _1134;
    out.m_75.w = _1140;
    out.m_77.x = _1142;
    out.m_77.y = _1136;
    bool _1148 = _1128 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1150 = isnan(_1128);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1156 = _1152 || _1154;
    out.m_79.x = _1144;
    out.m_79.y = _1138;
    out.m_81.x = _1124;
    out.m_81.y = _1126;
    out.m_81.z = _1146;
    float _1158 = _1108;
    float _1160 = _1134;
    float _1162 = _1130;
    if (!_1156)
    {
        _1158 = 1.0;
    }
    float _1164 = _1158;
    out.m_83.x = _710;
    out.m_83.y = _712;
    out.m_83.z = _714;
    bool _1166 = !_1156;
    float _1168 = _1164;
    float _1170 = _712;
    float _1172 = _714;
    if (!_1166)
    {
        bool _1174 = _1128 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1176 = isnan(_1128);
        bool _1178 = _1174 || _1176;
        bool _1180 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1182 = _1178 || _1180;
        if (!_1182)
        {
            float _1184 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1186 = _1128 + _1184;
            float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1190 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1188;
            float _1192 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1194 = _1192 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1196 = 1.0 / _1190;
            float _1198 = _1186 * _1196;
            float _1200 = fma(_1198, _1194, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1168 = _1200;
            _1170 = _1196;
            _1202 = true;
        }
        else
        {
            bool _1204 = _1128 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1206 = isnan(_1128);
            bool _1208 = _1204 || _1206;
            bool _1210 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1212 = _1208 || _1210;
            if (!_1212)
            {
                float _1214 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1216 = _1128 + _1214;
                float _1218 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1220 = _1218 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1224 = _1222 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1226 = 1.0 / _1220;
                float _1228 = _1216 * _1226;
                float _1230 = fma(_1228, _1224, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1168 = _1230;
                _1170 = _1226;
                _1202 = true;
            }
            else
            {
                _1168 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1202 = false;
    float _1232 = _1168;
    float _1234 = _1170;
    float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1238 = _1082 + _1236;
    float _1240 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1242 = _692 + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1246 = _696 + _1244;
    float _1248 = fma(_1238, _1232, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1250 = fma(_1242, _1232, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1252 = fma(_1246, _1232, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1254 = -_598;
    float _1256 = _1254 + _1248;
    float _1258 = -_570;
    float _1260 = _1258 + _1250;
    float _1262 = -_568;
    float _1264 = _1262 + _1252;
    float _1266 = _1256 * _1256;
    float _1268 = fma(_1260, _1260, _1266);
    float _1270 = fma(_1264, _1264, _1268);
    float _1272 = sqrt(_1270);
    bool _1274 = _1272 > 0.0;
    float _1276 = _1272;
    float _1278 = _1234;
    float _1280 = _1252;
    if (!_1274)
    {
        _1276 = _1250;
    }
    float _1282 = _1276;
    float _1284 = _1282;
    if (!_1274)
    {
        _1278 = _1248;
    }
    float _1286 = _1278;
    float _1288 = _1286;
    if (!_1274)
    {
        _1172 = _1252;
    }
    float _1290 = _1172;
    bool _1292 = !_1274;
    float _1294 = _1290;
    float _1296 = _1290;
    if (!_1292)
    {
        float _1298 = _192 * _192;
        float _1300 = fma(_190, _190, _1298);
        float _1302 = fma(_194, _194, _1300);
        float _1304 = rsqrt(_1270);
        float _1306 = sqrt(_1302);
        float _1308 = _1260 * _1304;
        float _1310 = _1256 * _1304;
        float _1312 = _1264 * _1304;
        bool _1314 = _1306 > 0.0;
        float _1316 = _1304;
        float _1318 = _1306;
        _1160 = _1310;
        _1162 = _1308;
        if (!_1314)
        {
            _1316 = _1250;
        }
        float _1320 = _1316;
        _1284 = _1320;
        if (!_1314)
        {
            _1318 = _1248;
        }
        float _1322 = _1318;
        _1288 = _1322;
        if (!_1314)
        {
            _1294 = _1252;
        }
        float _1324 = _1294;
        bool _1326 = !_1314;
        _1296 = _1324;
        if (!_1326)
        {
            float _1328 = rsqrt(_1302);
            float _1330 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1332 = _192 * _1328;
            float _1334 = _190 * _1328;
            float _1336 = _1310 * _1332;
            float _1338 = _194 * _1328;
            float _1340 = fma(_1308, _1334, _1336);
            float _1342 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1344 = fma(_1312, _1338, _1340);
            float _1346 = _1344 * _1342;
            float _1348 = fma(_190, _1346, _1250);
            float _1350 = fma(_192, _1346, _1248);
            float _1352 = fma(_194, _1346, _1252);
            _1288 = _1350;
            _1284 = _1348;
            _1296 = _1352;
        }
    }
    float _1354 = _1288;
    float _1356 = _1284;
    float _1358 = _1296;
    float _1360 = _1160;
    float _1362 = _1162;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1366 = _1354 + _1364;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1370 = _1356 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1374 = _1358 + _1372;
    float _1376 = _1366 * _1366;
    float _1378 = fma(_1370, _1370, _1376);
    float _1380 = fma(_1374, _1374, _1378);
    float _1382 = rsqrt(_1380);
    float _1384 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1386 = _1370 * _1384;
    float _1388 = _1374 * _1384;
    float _1390 = _1386 * _1386;
    float _1392 = _1388 * _1388;
    float _1394 = _1390 + _1392;
    float _1396 = sqrt(_1394);
    bool _1398 = _1396 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = _1396 + _1400;
    float _1404 = _1382;
    float _1406 = _1362;
    float _1408 = _1402;
    float _1410 = _1360;
    float _1412 = _1366;
    float _1414 = _1386;
    if (_1398)
    {
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1404 = _1416;
    }
    float _1418 = _1404;
    if (_1398)
    {
        float _1420 = rsqrt(_1394);
        _1406 = _1420;
    }
    float _1422 = _1406;
    float _1424 = _1422;
    if (_1398)
    {
        float _1426 = _1402 * _1418;
        _1408 = _1426;
    }
    float _1428 = _1408;
    if (_1398)
    {
        float _1430 = _1428 * 0.15915493667125701904296875;
        _1410 = _1430;
    }
    float _1432 = _1410;
    float _1434 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1436 = _1374;
    float _1438 = _1432;
    if (_1398)
    {
        float _1440 = _1432 * 6.283185482025146484375;
        float _1442 = sin(_1440);
        _1436 = _1442;
    }
    float _1444 = _1436;
    float _1446 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1448 = precise::max(0.0, _1446);
    float _1450 = _1418;
    float _1452 = _1448;
    if (_1398)
    {
        float _1454 = _1432 * 6.283185482025146484375;
        float _1456 = cos(_1454);
        _1450 = _1456;
    }
    float _1458 = _1450;
    float _1460 = -_1384;
    float _1462 = -_1448;
    float _1464 = fma(_1366, _1460, _1462);
    float _1466 = _1464;
    if (_1398)
    {
        float _1468 = _1464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1412 = _1468;
    }
    float _1470 = _1412;
    float _1472 = _1470;
    float _1474 = _1444;
    if (_1398)
    {
        float _1476 = fma(_1444, _1470, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1472 = _1476;
    }
    float _1478 = _1472;
    float _1480 = _1478;
    if (!_1398)
    {
        _1474 = _1390;
    }
    float _1482 = _1474;
    float _1484 = _1482;
    if (_1398)
    {
        float _1486 = _1458 + (-1.0);
        _1452 = _1486;
    }
    float _1488 = _1452;
    if (_1398)
    {
        float _1490 = _1422 * _1478;
        _1280 = _1490;
    }
    float _1492 = _1280;
    if (!_1398)
    {
        _1424 = _1388;
    }
    float _1494 = _1424;
    float _1496 = _1494;
    if (_1398)
    {
        float _1498 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1438 = _1498;
    }
    float _1500 = _1438;
    if (_1398)
    {
        float _1502 = _1386 * _1492;
        _1414 = _1502;
    }
    float _1504 = _1414;
    float _1506 = sqrt(_1380);
    if (_1398)
    {
        float _1508 = _1388 * _1492;
        _1496 = _1508;
    }
    float _1510 = _1496;
    if (_1398)
    {
        float _1512 = fma(_1464, _1458, _1500);
        _1466 = _1512;
    }
    float _1514 = _1466;
    if (_1398)
    {
        float _1516 = _1504 * _1504;
        _1484 = _1516;
    }
    float _1518 = _1484;
    if (!_1398)
    {
        _1480 = _1392;
    }
    float _1520 = _1480;
    float _1522 = _1520;
    if (_1398)
    {
        float _1524 = _1510 * _1510;
        _1522 = _1524;
    }
    float _1526 = _1522;
    float _1528 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1530 = fma(_1514, _1514, _1518);
    float _1532 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1528);
    float _1534 = _1530 + _1526;
    float _1536 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1538 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1532);
    float _1540 = rsqrt(_1534);
    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1544 = fma(_1506, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1542);
    float _1546 = precise::clamp(_1544, 0.0, 1.0);
    float _1548 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1550 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1552 = -_1546;
    float _1554 = _1552 + 1.0;
    float _1556 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1536);
    float _1558 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1560 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1548);
    float _1562 = abs(_1554);
    float _1564 = log2(_1562);
    float _1566 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1556);
    float _1568 = _1558 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1570 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1560);
    float _1572 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1550);
    float _1574 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1576 = -_1568;
    float _1578 = fma(_1576, _1434, 1.0);
    float _1580 = _1540 * _1504;
    float _1582 = _1570 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1584 = _1540 * _1514;
    float _1586 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1590 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1572);
    float _1592 = _1540 * _1510;
    float _1594 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1586);
    float _1596 = -_1588;
    float _1598 = fma(_1584, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1596);
    float _1600 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1602 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1604 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1594);
    float _1606 = -_1592;
    float _1608 = fma(_1606, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1598);
    float _1610 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1612 = exp2(_1602);
    float _1614 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1604);
    float _1616 = fma(_1608, -0.5, 0.5);
    float _1618 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1620 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1610);
    float _1622 = fma(_1608, 0.5, 0.5);
    float _1624 = _1584 + 1.0;
    float _1626 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1618);
    float _1628 = log2(_1578);
    float _1630 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1620);
    float _1632 = fma(_1622, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1634 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1626);
    float _1636 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1630);
    float _1638 = fma(_1622, _1632, -0.212114393711090087890625);
    float _1640 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1634);
    float _1642 = 1.0 / _1614;
    float _1644 = -_1584;
    float _1646 = fma(_1612, _1624, _1644);
    float _1648 = fma(_1622, _1638, 1.570728778839111328125);
    float _1650 = fma(_1646, 0.5, 0.5);
    float _1652 = sqrt(_1616);
    float _1654 = _1628 * 0.693147182464599609375;
    float _1656 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1658 = _1636 * _1642;
    float _1660 = _1640 * _1642;
    float _1662 = fma(_1658, 0.5, 0.5);
    float _1664 = fma(_1660, -0.5, 0.5);
    float _1666 = _1652 * 0.636619746685028076171875;
    float _1668 = -_1648;
    float _1670 = fma(_1666, _1668, 1.0);
    float3 _4953 = float3(_1662, _1664, _1656);
    float _1672 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4953, float3(0.0), isnan(_4953)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4953, float3(0.0), isnan(_4953)), level(0.0)).x;
    float3 _4964 = float3(_1662, _1664, _1656);
    float4 _1675 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4964, float3(0.0), isnan(_4964)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4964, float3(0.0), isnan(_4964)), level(0.0)).xyzw;
    float _1677 = _1675.x;
    float _1679 = _1675.y;
    float _1681 = _1675.z;
    float _1683 = _1675.w;
    float2 _4980 = float2(_1670, _1650);
    float3 _1685 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4980, float2(0.0), isnan(_4980)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4980, float2(0.0), isnan(_4980)), level(0.0)).xyz;
    float _1687 = _1685.x;
    float _1689 = _1685.y;
    float _1691 = _1685.z;
    float _1693 = _598 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1695 = _598 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1697 = -_716;
    float _1699 = _1697 + 1.0;
    float _1701 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1693);
    float _1703 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1695);
    float _1705 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1701);
    float _1707 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1703);
    float _1709 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1711 = _1707 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1713 = 1.0 / _1709;
    float _1715 = _1711 + _1709;
    float _1717 = _1715 * _1713;
    float _1719 = _1717 * 0.5;
    float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1723 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1721);
    float _1725 = 1.0 / _1723;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1729 = _1725 * _1727;
    float _1731 = abs(_1729);
    float _1733 = log2(_1731);
    float _1735 = in.m_85.x;
    bool _1737 = _1729 <= 8000.0;
    bool _1739 = isnan(_1729);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan(8000.0);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    bool _1749 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1751 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan(0.5);
    bool _1757 = _1753 || _1755;
    float _1759 = _1733 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1761 = exp2(_1759);
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1765 = precise::clamp(_1763, 0.0, 1.0);
    float _1767 = fma(_1765, -2.0, 3.0);
    float _1769 = _1765 * _1765;
    float _1771 = _1769 * _1767;
    float _1773 = -_1771;
    float _1775 = _1773 + 1.0;
    float _1777 = fma(_1775, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1771);
    float _1779 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1781 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1783 = _1574;
    if (!_1757)
    {
        _1783 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1785 = _1783;
    float _1787 = _1747 * _1777;
    float _1789 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1781);
    float _1791 = exp2(_1779);
    float _1793 = _1787 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1795 = _1785;
    float _1797 = _1787;
    if (!_1757)
    {
        float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1801 = _1785 + _1799;
        _1795 = _1801;
    }
    float _1803 = _1795;
    float _1805 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1789);
    float _1807 = _1614 * 0.5;
    float _1809 = _1699 * _1793;
    float _1811 = precise::clamp(_1809, 0.0, 1.0);
    float _1813 = _1805;
    float _1815 = _1803;
    if (!_1757)
    {
        float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1819 = _1729 + _1817;
        _1797 = _1819;
    }
    float _1821 = _1797;
    float _1823 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1805);
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_1757)
    {
        float _1827 = 1.0 / _1803;
        _1825 = _1827;
    }
    float _1829 = _1825;
    float _1831 = -_1811;
    float _1833 = fma(_1831, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    if (_1757)
    {
        _1813 = 1.0;
    }
    float _1835 = _1813;
    float _1837 = _1823 + _1614;
    float _1839 = _1636 + _1614;
    float _1841 = _1833 * _1735;
    float _1843 = fma(_1640, -0.5, _1807);
    float _1845 = -_1791;
    float _1847 = _1845 + 1.0;
    float _1849 = _1841 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1851 = _1837 * 0.5;
    float _1853 = _1839 * 0.5;
    float _1855 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1636;
    out.gl_Position.y = _1640;
    out.gl_Position.z = _1823;
    out.gl_Position.w = _1614;
    float _1857 = _1835;
    float _1859 = _1851;
    float _1861 = _1853;
    float _1863 = _1843;
    if (!_1757)
    {
        float _1865 = _1821 * _1829;
        float _1867 = precise::clamp(_1865, 0.0, 1.0);
        _1857 = _1867;
    }
    float _1869 = _1857;
    out.m_87.x = _1849;
    bool _1871 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1873 = isnan(_1506);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1879 = _1875 || _1877;
    out.m_89.x = _1853;
    out.m_89.y = _1843;
    out.m_89.z = _1851;
    out.m_89.w = _1614;
    float _1881 = _1869 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_1879)
    {
        _1815 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1883 = _1815;
    float _1885 = _1883;
    float _1887 = _1883;
    if (!_1879)
    {
        _1859 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1889 = _1859;
    float _1891 = _1889;
    float _1893 = _1889;
    if (!_1879)
    {
        _1861 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1895 = _1861;
    float _1897 = _1895;
    float _1899 = _1895;
    if (!_1879)
    {
        _1863 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1901 = _1863;
    float _1903 = _1855 * _1672;
    float _1905 = -_1855;
    float _1907 = _1905 + 1.0;
    float _1909 = _1683 * _1903;
    float _1911 = _1691 * _1903;
    float _1913 = _1683 * _1907;
    float _1915 = _1907;
    float _1917 = _1909;
    float _1919 = _1901;
    float _1921 = _1901;
    if (!_1879)
    {
        _1915 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1923 = _1915;
    float _1925 = fma(_1687, _1909, _1677);
    float _1927 = fma(_1689, _1909, _1679);
    float _1929 = fma(_1683, _1911, _1681);
    float _1931 = _1923;
    float _1933 = _1923;
    if (!_1879)
    {
        _1917 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1935 = _1917;
    out.m_91.x = _1925;
    out.m_91.y = _1927;
    out.m_91.z = _1929;
    out.m_91.w = _1913;
    bool _1937 = !_1879;
    float _1939 = _1935;
    float _1941 = _1935;
    if (!_1937)
    {
        bool _1943 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1945 = isnan(_1506);
        bool _1947 = _1943 || _1945;
        bool _1949 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1951 = _1947 || _1949;
        if (!_1951)
        {
            float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1955 = _1506 + _1953;
            float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1959 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1957;
            float _1961 = 1.0 / _1959;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1979 = _1955 * _1961;
            float _1981 = precise::clamp(_1979, 0.0, 1.0);
            float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1991 = fma(_1981, _1965, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1993 = fma(_1981, _1985, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1995 = fma(_1981, _1989, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1997 = fma(_1981, _1969, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1999 = fma(_1981, _1973, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2001 = fma(_1981, _1977, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1899 = _1995;
            _1941 = _1999;
            _1893 = _1993;
            _1887 = _1997;
            _1921 = _1991;
            _1933 = _2001;
            _2003 = true;
        }
        else
        {
            bool _2005 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2007 = isnan(_1506);
            bool _2009 = _2005 || _2007;
            bool _2011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2013 = _2009 || _2011;
            if (!_2013)
            {
                _1891 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2015 = _1891;
            _1893 = _2015;
            if (!_2013)
            {
                _1897 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2017 = _1897;
            _1899 = _2017;
            if (!_2013)
            {
                _1919 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2019 = _1919;
            _1921 = _2019;
            if (!_2013)
            {
                _1885 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2021 = _1885;
            _1887 = _2021;
            if (!_2013)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2023 = _1939;
            _1941 = _2023;
            if (!_2013)
            {
                _1931 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2025 = _1931;
            bool _2027 = !_2013;
            _1933 = _2025;
            if (!_2027)
            {
                bool _2029 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2031 = isnan(_1506);
                bool _2033 = _2029 || _2031;
                bool _2035 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2037 = _2033 || _2035;
                if (!_2037)
                {
                    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2041 = _1506 + _2039;
                    float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2043;
                    float _2047 = 1.0 / _2045;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2065 = _2041 * _2047;
                    float _2067 = precise::clamp(_2065, 0.0, 1.0);
                    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2071 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2077 = fma(_2067, _2051, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2079 = fma(_2067, _2071, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2081 = fma(_2067, _2075, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2083 = fma(_2067, _2055, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2085 = fma(_2067, _2059, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2087 = fma(_2067, _2063, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1899 = _2081;
                    _1941 = _2085;
                    _1893 = _2079;
                    _1887 = _2083;
                    _1921 = _2077;
                    _1933 = _2087;
                    _2003 = true;
                }
                else
                {
                    _1899 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1893 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1887 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1921 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1933 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2003 = false;
    float _2089 = _1899;
    float _2091 = _1941;
    float _2093 = _1893;
    float _2095 = _1887;
    float _2097 = _1921;
    float _2099 = _1933;
    float _2101 = _1881 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2103 = fma(_1126, -0.5, 0.5);
    float _2105 = precise::clamp(_2103, 0.0, 1.0);
    float _2107 = -_2089;
    float _2109 = _2107 + _2091;
    float _2111 = -_2093;
    float _2113 = _2111 + _2095;
    out.m_53.x = _2101;
    float _2115 = -_2097;
    float _2117 = _2115 + _2099;
    float _2119 = fma(_2105, _2109, _2089);
    float _2121 = fma(_2105, _2113, _2093);
    bool _2123 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2125 = _2119 * 0.586610972881317138671875;
    float _2127 = fma(_2105, _2117, _2097);
    out.m_93.x = 0.0;
    bool _2129 = _1869 > 0.0;
    bool _2131 = isnan(_1869);
    bool _2133 = _2129 || _2131;
    bool _2135 = isnan(0.0);
    bool _2137 = _2133 || _2135;
    float _2139 = fma(_2121, 0.298911988735198974609375, _2125);
    float _2141 = fma(_2127, 0.114477999508380889892578125, _2139);
    float _2143 = -_2141;
    float _2145 = _2121 + _2143;
    float _2147 = -_2141;
    float _2149 = _2119 + _2147;
    float _2151 = -_2141;
    float _2153 = _2127 + _2151;
    float _2155 = fma(_2145, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2141);
    float _2157 = fma(_2149, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2141);
    float _2159 = fma(_2153, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2141);
    bool _2161 = !_2123;
    if (!_2161)
    {
        float _2163 = -_1354;
        float _2165 = _2163 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2167 = -_1356;
        float _2169 = _2167 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2171 = -_1358;
        float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2175 = _2165 * _2165;
        float _2177 = fma(_2169, _2169, _2175);
        float _2179 = fma(_2173, _2173, _2177);
        float _2181 = sqrt(_2179);
        float _2183 = rsqrt(_2179);
        float _2185 = -_2181;
        float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2189 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2191 = precise::clamp(_2189, 0.0, 1.0);
        float _2193 = _2169 * _2183;
        float _2195 = _2165 * _2183;
        float _2197 = abs(_2191);
        float _2199 = log2(_2197);
        float _2201 = _2173 * _2183;
        float _2203 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2205 = _1126 * _2195;
        float _2207 = -_2195;
        float _2209 = -_2203;
        float _2211 = fma(_2207, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2209);
        float _2213 = fma(_1124, _2193, _2205);
        float _2215 = -_2201;
        float _2217 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2211);
        float _2219 = fma(_1146, _2201, _2213);
        float _2221 = precise::clamp(_2219, 0.0, 1.0);
        float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2225 = _2217 + _2223;
        float _2227 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2229 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2231 = precise::clamp(_2229, 0.0, 1.0);
        float _2233 = exp2(_2227);
        float _2235 = _2233 * _2231;
        float _2237 = _2221 * _2235;
        float _2239 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2241 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2243 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2239;
        out.m_93.y = _2241;
        out.m_93.z = _2243;
    }
    out.m_95.x = _2155;
    out.m_95.y = _2157;
    out.m_95.z = _2159;
    if (_2137)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2245 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2245;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2003 = false;
    bool _1202 = false;
    bool _492 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_50.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_53.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2302 = as_type<float>(_130);
        out.gl_Position.z = _2302;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_55.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _124 = _152;
    }
    float _154 = _124;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2372 = as_type<float>(_168);
        out.gl_Position.z = _2372;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _170 = in.m_57.x;
    float _172 = in.m_57.y;
    float _174 = in.m_57.z;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _180 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _184 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _186);
    float _194 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _188);
    bool _196 = !_176;
    float _214;
    if (!_196)
    {
        float _198 = in.m_59.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        float _218 = float(_114);
        float _220 = 1.0 / _218;
        float _222 = _148 * _220;
        _214 = _222;
    }
    _216 = false;
    float _224 = _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _224 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = _224 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _244 = _242 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _250 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = 1.0 / _248;
    bool _256 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _258 = isnan(_224);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = 1.0 / _244;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _272 = _224 + _270;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _276 = 1.0 / _252;
    float _278 = _228 * _254;
    bool _280 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _282 = isnan(_224);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    float _292 = 1.0 / _240;
    float _294 = _272 * _268;
    bool _296 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _298 = isnan(_224);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    bool _308 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_224);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_306;
    float _322 = _320 + 1.0;
    float _324 = _232 * _276;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    bool _330 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _332 = isnan(_224);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = _290 * _322;
    float _344 = -_290;
    float _346 = _344 + 1.0;
    float _348 = fma(_328, _278, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = _236 * _292;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = _318 * _346;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = fma(_358, _278, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _372 = fma(_362, _278, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _374 = -_318;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _382 = fma(_352, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _384 = fma(_368, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _386 = _266 * _376;
    float _388 = -_266;
    float _390 = _388 + 1.0;
    float _392 = fma(_380, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _394 = _340 * _390;
    float _396 = -_340;
    float _398 = _396 + 1.0;
    float _400 = _348 * _394;
    float _402 = _370 * _394;
    float _404 = _372 * _394;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _406;
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _412 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _414 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].z, _404);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _420;
    float _424 = fma(_408, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _426 = fma(_382, _386, _410);
    float _428 = fma(_392, _386, _412);
    float _430 = fma(_384, _386, _414);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _440 = fma(_418, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _442 = fma(_422, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _448 = fma(_424, _364, _426);
    float _450 = fma(_434, _294, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _452 = fma(_438, _294, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _454 = fma(_446, _294, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _456 = fma(_440, _364, _428);
    float _458 = fma(_442, _364, _430);
    float _460 = fma(_450, _342, _448);
    float _462 = fma(_452, _342, _456);
    float _464 = fma(_454, _342, _458);
    float _466 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[147].x, _460);
    float _468 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[147].y, _462);
    float _470 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[147].z, _464);
    bool _472 = !_274;
    float _490;
    if (!_472)
    {
        float _474 = in.m_59.x;
        float _476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _478 = _474 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _480 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _482 = _480 * _476;
        float _484 = floor(_482);
        float _486 = -_484;
        float _488 = _482 + _486;
        _490 = _488;
        _492 = true;
    }
    else
    {
        float _494 = float(_114);
        float _496 = 1.0 / _494;
        float _498 = _148 * _496;
        _490 = _498;
    }
    _492 = false;
    float _500 = _490;
    float _502 = in.m_61.x;
    float _504 = in.m_61.y;
    float _506 = in.m_61.z;
    float _508 = in.m_63.x;
    float _510 = in.m_63.y;
    float _512 = in.m_63.z;
    float _514 = in.m_50.x;
    float _516 = in.m_50.y;
    float _518 = in.m_50.z;
    float _520 = _468 * _504;
    float _522 = _470 * _506;
    float _524 = _466 * _502;
    float _526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _510);
    float _528 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _530 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _512);
    float _532 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _534 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _508);
    float _536 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _538 = _528 * _526;
    float _540 = _532 * _530;
    float _542 = _516 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _544 = _536 * _534;
    float _546 = _516 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _548 = _538 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _550 = _538 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _552 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[6].x, _542);
    float _554 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[4].x, _546);
    float _556 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[24].x, _548);
    float _558 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[26].x, _550);
    float _560 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[6].z, _552);
    float _562 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[4].z, _554);
    float _564 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[24].z, _556);
    float _566 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[26].z, _558);
    float _568 = _560 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _570 = _562 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _572 = _564 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _574 = _566 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _576 = _516 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _578 = _570 + _572;
    float _580 = _568 + _574;
    float _582 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[5].x, _576);
    float _584 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _586 = _578 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _590 = _580 + _588;
    float _592 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[5].z, _582);
    float _594 = _586 * _586;
    float _596 = _590 * _590;
    float _598 = _592 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _600 = fma(_570, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _602 = _594 + _596;
    float _604 = floor(_600);
    float _606 = sqrt(_602);
    float _608 = -_604;
    float _610 = _600 + _608;
    bool _612 = _606 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _616 = _606 + _614;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _620 = _602;
    float _622 = _592;
    float _624 = _578;
    float _626 = _580;
    float _628 = _594;
    float _630 = _596;
    if (_612)
    {
        float _632 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _618 = _632;
    }
    float _634 = _618;
    if (_612)
    {
        float _636 = rsqrt(_602);
        _620 = _636;
    }
    float _638 = _620;
    float _640 = _634;
    if (_612)
    {
        float _642 = _616 * _634;
        _640 = _642;
    }
    float _644 = _640;
    float _646 = _538 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _648 = _644;
    if (_612)
    {
        float _650 = _644 * 0.15915493667125701904296875;
        _648 = _650;
    }
    float _652 = _648;
    float _654 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[25].x, _646);
    float _656 = _514;
    if (_612)
    {
        float _658 = _652 * 6.283185482025146484375;
        float _660 = sin(_658);
        _656 = _660;
    }
    float _662 = _656;
    float _664 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[25].z, _654);
    float _666 = _664 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _668 = fma(_568, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _670 = _598 + _666;
    float _672 = floor(_668);
    if (_612)
    {
        float _674 = _670 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _622 = _674;
    }
    float _676 = _622;
    float _678 = _676;
    if (_612)
    {
        float _680 = fma(_662, _676, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _678 = _680;
    }
    float _682 = _678;
    float _684 = _682;
    if (_612)
    {
        float _686 = _638 * _682;
        _684 = _686;
    }
    float _688 = _684;
    if (_612)
    {
        float _690 = fma(_586, _688, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _624 = _690;
    }
    float _692 = _624;
    if (_612)
    {
        float _694 = fma(_590, _688, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _626 = _694;
    }
    float _696 = _626;
    float _698 = -_672;
    float _700 = _668 + _698;
    float _702 = fma(_692, 6.2500002968590706586837768554688e-05, 0.5);
    float _704 = fma(_696, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3285 = float2(_702, _704);
    float3 _708 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3285, float2(0.0), isnan(_3285)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3285, float2(0.0), isnan(_3285)), level(0.0)).xyz;
    float _710 = _708.x;
    float _712 = _708.y;
    float _714 = _708.z;
    float2 _3301 = float2(_610, _700);
    float _716 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3301, float2(0.0), isnan(_3301)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3301, float2(0.0), isnan(_3301)), level(0.0)).x;
    float _718 = in.m_59.x;
    float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _722 = in.m_59.y;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _726 = _724 != 0;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _730 = _500 + _728;
    float _732 = in.m_65.w;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _738 = in.m_67.y;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _742 = _740 != 0;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _748 = _746 != 0;
    float _750 = in.m_59.z;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _754 = _752 != 0;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _760 = _758 != 0;
    float _762 = 1.0 / _736;
    float _764 = in.m_67.x;
    float _766 = _718 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _770 = _722 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _772 = -_744;
    float _774 = fma(_766, 2.0, _772);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _776;
    float _780 = fma(_770, -2.0, _756);
    out.m_69.w = _732;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _784 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _786 = _778 * _762;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _790 = _782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _792 = _750 > 0.5;
    float _794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _798 = -_738;
    float _800 = _798 + 1.0;
    float _802 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _806 = _738;
    bool _808 = _760;
    if (_726)
    {
        _804 = _718;
    }
    float _810 = _804;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _814 = _810;
    if (!_726)
    {
        _814 = _750;
    }
    float _816 = _814;
    float _818 = _720 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _820 = _792 ? as_type<int>(_800) : as_type<int>(_738);
    out.m_71.x = _790;
    out.m_71.y = _784;
    out.m_71.z = _802;
    out.m_71.w = _796;
    bool _822 = _722 > 0.5;
    float _824 = fma(_786, _730, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _826 = _754 ? as_type<float>(_820) : _738;
    float _828 = in.m_73.x;
    float _830 = in.m_73.y;
    float _832 = in.m_73.z;
    bool _834 = _510 != 0.0;
    bool _836 = isnan(_510);
    bool _838 = _834 || _836;
    bool _840 = isnan(0.0);
    bool _842 = _838 || _840;
    float _844 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[88].w, _812);
    if (_760)
    {
        float _846 = _822 ? _800 : _738;
        _806 = _846;
    }
    float _848 = _806;
    bool _850 = _508 == 0.0;
    bool _852 = !_842;
    bool _854 = _850 && _852;
    bool _856 = _512 == 0.0;
    bool _858 = _856 && _854;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _862 = 0.0;
    float _864 = _860;
    if (_726)
    {
        _862 = _722;
    }
    float _866 = _862;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _870 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[78].w, _860);
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _874 = _866;
    float _876 = _872;
    int _878 = as_type<int>(_870);
    if (_742)
    {
        bool _880 = _718 > 0.5;
        _808 = _880;
    }
    bool _882 = _808;
    float _884 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[78].z, _868);
    if (!_726)
    {
        _874 = _718;
    }
    float _886 = _874;
    float _888 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[88].z, _872);
    if (!_742)
    {
        _864 = _764;
    }
    float _890 = _864;
    float _892 = fma(_826, _818, -0.5);
    float _894 = _828;
    float _896 = _832;
    float _898 = _830;
    float _900 = _890;
    if (!_858)
    {
        float _902 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[17].y, _828);
        _894 = _902;
    }
    float _904 = _894;
    if (!_858)
    {
        float _906 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[17].y, _832);
        _896 = _906;
    }
    float _908 = _896;
    bool _910 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _912 = isnan(_500);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = _794 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _924 = _920;
    if (!_858)
    {
        float _926 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[17].y, _830);
        _898 = _926;
    }
    float _928 = _898;
    float _930 = -_920;
    float _932 = _930 + 1.0;
    if (!_742)
    {
        _876 = _890;
    }
    float _934 = _876;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _938 = _934;
    if (_742)
    {
        _900 = _764;
    }
    float _940 = _900;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _944 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _946 = isnan(_500);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _952 = _948 || _950;
    float _954 = float(_952);
    float _956 = _816 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _960 = _886 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _962 = fma(_922, _848, -0.5);
    float _964 = _954 * _932;
    float _966 = -_936;
    float _968 = fma(_956, 2.0, _966);
    float _970 = fma(_960, -2.0, _942);
    float _972 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _870);
    float _974 = _824 * _964;
    float _976 = _942;
    float _978 = _940;
    if (_612)
    {
        float _980 = _652 * 6.283185482025146484375;
        float _982 = cos(_980);
        _976 = _982;
    }
    float _984 = _976;
    float _986 = -_148;
    float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[76].x, _774);
    if (_742)
    {
        float _990 = -_940;
        float _992 = _990 + 1.0;
        _878 = as_type<int>(_992);
    }
    int _994 = _878;
    float _996 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _780);
    float _998 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _844);
    float _1000 = _928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1002 = _928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1004 = _928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1008 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1000);
    if (_742)
    {
        float _1010 = _882 ? as_type<float>(_994) : _940;
        _938 = _1010;
    }
    float _1012 = _938;
    float _1014 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1002);
    float _1016 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1004);
    float _1018 = _958 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1020 = 0;
    float _1022 = _1012;
    if (_748)
    {
        float _1024 = -_940;
        float _1026 = _1024 + 1.0;
        _1020 = as_type<int>(_1026);
    }
    int _1028 = _1020;
    float _1030 = -_954;
    float _1032 = _1030 + 1.0;
    float _1034 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _884);
    float _1036 = fma(_1018, _1012, -0.5);
    float _1038 = _1036;
    if (_612)
    {
        float _1040 = _984 + (-1.0);
        _1022 = _1040;
    }
    float _1042 = _1022;
    float _1044 = _1042;
    if (_748)
    {
        float _1046 = _822 ? as_type<float>(_1028) : _940;
        _978 = _1046;
    }
    float _1048 = _978;
    float _1050 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[115].x, _974);
    float _1052 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _888);
    float _1054 = -_148;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[86].x, _968);
    float _1058 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _970);
    float _1060 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_612)
    {
        float _1062 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _150 = _1062;
    }
    float _1064 = _150;
    float _1066 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1050);
    if (!_612)
    {
        _924 = _670;
    }
    float _1068 = _924;
    float _1070 = fma(_1060, _1048, -0.5);
    float _1072 = _1068;
    if (_612)
    {
        float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1076 = _692 + _1074;
        _1044 = _1076;
    }
    float _1078 = _1044;
    if (_612)
    {
        float _1080 = fma(_670, _984, _1064);
        _1072 = _1080;
    }
    float _1082 = _1072;
    float _1084 = fma(_1034, _1036, _988);
    float _1086 = fma(_1052, _1070, _1056);
    if (_612)
    {
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1090 = _696 + _1088;
        _1038 = _1090;
    }
    float _1092 = _1038;
    if (_612)
    {
        float _1094 = _1078 * _1078;
        _628 = _1094;
    }
    float _1096 = _628;
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1100 = _1082 + _1098;
    if (_612)
    {
        float _1102 = _1092 * _1092;
        _630 = _1102;
    }
    float _1104 = _630;
    float _1106 = fma(_1100, _1100, _1096);
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1110 = -_996;
    float _1112 = fma(_972, _962, _1110);
    float _1114 = _1106 + _1104;
    float _1116 = -_1058;
    float _1118 = fma(_998, _892, _1116);
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1124 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1014);
    float _1126 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1008);
    float _1128 = sqrt(_1114);
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1132 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1134 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1112 + 0.5;
    float _1138 = _1118 + 0.5;
    float _1140 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1142 = _1084 + 0.5;
    float _1144 = _1086 + 0.5;
    float _1146 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1016);
    out.m_75.x = _1130;
    out.m_75.y = _1132;
    out.m_75.z = _1134;
    out.m_75.w = _1140;
    out.m_77.x = _1142;
    out.m_77.y = _1136;
    bool _1148 = _1128 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1150 = isnan(_1128);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1156 = _1152 || _1154;
    out.m_79.x = _1144;
    out.m_79.y = _1138;
    out.m_81.x = _1124;
    out.m_81.y = _1126;
    out.m_81.z = _1146;
    float _1158 = _1108;
    float _1160 = _1134;
    float _1162 = _1130;
    if (!_1156)
    {
        _1158 = 1.0;
    }
    float _1164 = _1158;
    out.m_83.x = _710;
    out.m_83.y = _712;
    out.m_83.z = _714;
    bool _1166 = !_1156;
    float _1168 = _1164;
    float _1170 = _712;
    float _1172 = _714;
    if (!_1166)
    {
        bool _1174 = _1128 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1176 = isnan(_1128);
        bool _1178 = _1174 || _1176;
        bool _1180 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1182 = _1178 || _1180;
        if (!_1182)
        {
            float _1184 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1186 = _1128 + _1184;
            float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1190 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1188;
            float _1192 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1194 = _1192 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1196 = 1.0 / _1190;
            float _1198 = _1186 * _1196;
            float _1200 = fma(_1198, _1194, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1168 = _1200;
            _1170 = _1196;
            _1202 = true;
        }
        else
        {
            bool _1204 = _1128 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1206 = isnan(_1128);
            bool _1208 = _1204 || _1206;
            bool _1210 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1212 = _1208 || _1210;
            if (!_1212)
            {
                float _1214 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1216 = _1128 + _1214;
                float _1218 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1220 = _1218 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1224 = _1222 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1226 = 1.0 / _1220;
                float _1228 = _1216 * _1226;
                float _1230 = fma(_1228, _1224, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1168 = _1230;
                _1170 = _1226;
                _1202 = true;
            }
            else
            {
                _1168 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1202 = false;
    float _1232 = _1168;
    float _1234 = _1170;
    float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1238 = _1082 + _1236;
    float _1240 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1242 = _692 + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1246 = _696 + _1244;
    float _1248 = fma(_1238, _1232, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1250 = fma(_1242, _1232, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1252 = fma(_1246, _1232, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1254 = -_598;
    float _1256 = _1254 + _1248;
    float _1258 = -_570;
    float _1260 = _1258 + _1250;
    float _1262 = -_568;
    float _1264 = _1262 + _1252;
    float _1266 = _1256 * _1256;
    float _1268 = fma(_1260, _1260, _1266);
    float _1270 = fma(_1264, _1264, _1268);
    float _1272 = sqrt(_1270);
    bool _1274 = _1272 > 0.0;
    float _1276 = _1272;
    float _1278 = _1234;
    float _1280 = _1252;
    if (!_1274)
    {
        _1276 = _1250;
    }
    float _1282 = _1276;
    float _1284 = _1282;
    if (!_1274)
    {
        _1278 = _1248;
    }
    float _1286 = _1278;
    float _1288 = _1286;
    if (!_1274)
    {
        _1172 = _1252;
    }
    float _1290 = _1172;
    bool _1292 = !_1274;
    float _1294 = _1290;
    float _1296 = _1290;
    if (!_1292)
    {
        float _1298 = _192 * _192;
        float _1300 = fma(_190, _190, _1298);
        float _1302 = fma(_194, _194, _1300);
        float _1304 = rsqrt(_1270);
        float _1306 = sqrt(_1302);
        float _1308 = _1260 * _1304;
        float _1310 = _1256 * _1304;
        float _1312 = _1264 * _1304;
        bool _1314 = _1306 > 0.0;
        float _1316 = _1304;
        float _1318 = _1306;
        _1160 = _1310;
        _1162 = _1308;
        if (!_1314)
        {
            _1316 = _1250;
        }
        float _1320 = _1316;
        _1284 = _1320;
        if (!_1314)
        {
            _1318 = _1248;
        }
        float _1322 = _1318;
        _1288 = _1322;
        if (!_1314)
        {
            _1294 = _1252;
        }
        float _1324 = _1294;
        bool _1326 = !_1314;
        _1296 = _1324;
        if (!_1326)
        {
            float _1328 = rsqrt(_1302);
            float _1330 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1332 = _192 * _1328;
            float _1334 = _190 * _1328;
            float _1336 = _1310 * _1332;
            float _1338 = _194 * _1328;
            float _1340 = fma(_1308, _1334, _1336);
            float _1342 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1344 = fma(_1312, _1338, _1340);
            float _1346 = _1344 * _1342;
            float _1348 = fma(_190, _1346, _1250);
            float _1350 = fma(_192, _1346, _1248);
            float _1352 = fma(_194, _1346, _1252);
            _1288 = _1350;
            _1284 = _1348;
            _1296 = _1352;
        }
    }
    float _1354 = _1288;
    float _1356 = _1284;
    float _1358 = _1296;
    float _1360 = _1160;
    float _1362 = _1162;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1366 = _1354 + _1364;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1370 = _1356 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1374 = _1358 + _1372;
    float _1376 = _1366 * _1366;
    float _1378 = fma(_1370, _1370, _1376);
    float _1380 = fma(_1374, _1374, _1378);
    float _1382 = rsqrt(_1380);
    float _1384 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1386 = _1370 * _1384;
    float _1388 = _1374 * _1384;
    float _1390 = _1386 * _1386;
    float _1392 = _1388 * _1388;
    float _1394 = _1390 + _1392;
    float _1396 = sqrt(_1394);
    bool _1398 = _1396 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = _1396 + _1400;
    float _1404 = _1382;
    float _1406 = _1362;
    float _1408 = _1402;
    float _1410 = _1360;
    float _1412 = _1366;
    float _1414 = _1386;
    if (_1398)
    {
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1404 = _1416;
    }
    float _1418 = _1404;
    if (_1398)
    {
        float _1420 = rsqrt(_1394);
        _1406 = _1420;
    }
    float _1422 = _1406;
    float _1424 = _1422;
    if (_1398)
    {
        float _1426 = _1402 * _1418;
        _1408 = _1426;
    }
    float _1428 = _1408;
    if (_1398)
    {
        float _1430 = _1428 * 0.15915493667125701904296875;
        _1410 = _1430;
    }
    float _1432 = _1410;
    float _1434 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1436 = _1374;
    float _1438 = _1432;
    if (_1398)
    {
        float _1440 = _1432 * 6.283185482025146484375;
        float _1442 = sin(_1440);
        _1436 = _1442;
    }
    float _1444 = _1436;
    float _1446 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1448 = precise::max(0.0, _1446);
    float _1450 = _1418;
    float _1452 = _1448;
    if (_1398)
    {
        float _1454 = _1432 * 6.283185482025146484375;
        float _1456 = cos(_1454);
        _1450 = _1456;
    }
    float _1458 = _1450;
    float _1460 = -_1384;
    float _1462 = -_1448;
    float _1464 = fma(_1366, _1460, _1462);
    float _1466 = _1464;
    if (_1398)
    {
        float _1468 = _1464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1412 = _1468;
    }
    float _1470 = _1412;
    float _1472 = _1470;
    float _1474 = _1444;
    if (_1398)
    {
        float _1476 = fma(_1444, _1470, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1472 = _1476;
    }
    float _1478 = _1472;
    float _1480 = _1478;
    if (!_1398)
    {
        _1474 = _1390;
    }
    float _1482 = _1474;
    float _1484 = _1482;
    if (_1398)
    {
        float _1486 = _1458 + (-1.0);
        _1452 = _1486;
    }
    float _1488 = _1452;
    if (_1398)
    {
        float _1490 = _1422 * _1478;
        _1280 = _1490;
    }
    float _1492 = _1280;
    if (!_1398)
    {
        _1424 = _1388;
    }
    float _1494 = _1424;
    float _1496 = _1494;
    if (_1398)
    {
        float _1498 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1438 = _1498;
    }
    float _1500 = _1438;
    if (_1398)
    {
        float _1502 = _1386 * _1492;
        _1414 = _1502;
    }
    float _1504 = _1414;
    float _1506 = sqrt(_1380);
    if (_1398)
    {
        float _1508 = _1388 * _1492;
        _1496 = _1508;
    }
    float _1510 = _1496;
    if (_1398)
    {
        float _1512 = fma(_1464, _1458, _1500);
        _1466 = _1512;
    }
    float _1514 = _1466;
    if (_1398)
    {
        float _1516 = _1504 * _1504;
        _1484 = _1516;
    }
    float _1518 = _1484;
    if (!_1398)
    {
        _1480 = _1392;
    }
    float _1520 = _1480;
    float _1522 = _1520;
    if (_1398)
    {
        float _1524 = _1510 * _1510;
        _1522 = _1524;
    }
    float _1526 = _1522;
    float _1528 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1530 = fma(_1514, _1514, _1518);
    float _1532 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1528);
    float _1534 = _1530 + _1526;
    float _1536 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1538 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1532);
    float _1540 = rsqrt(_1534);
    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1544 = fma(_1506, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1542);
    float _1546 = precise::clamp(_1544, 0.0, 1.0);
    float _1548 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1550 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1552 = -_1546;
    float _1554 = _1552 + 1.0;
    float _1556 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1536);
    float _1558 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1560 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1548);
    float _1562 = abs(_1554);
    float _1564 = log2(_1562);
    float _1566 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1556);
    float _1568 = _1558 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1570 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1560);
    float _1572 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1550);
    float _1574 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1576 = -_1568;
    float _1578 = fma(_1576, _1434, 1.0);
    float _1580 = _1540 * _1504;
    float _1582 = _1570 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1584 = _1540 * _1514;
    float _1586 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1590 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1572);
    float _1592 = _1540 * _1510;
    float _1594 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1586);
    float _1596 = -_1588;
    float _1598 = fma(_1584, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1596);
    float _1600 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1602 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1604 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1594);
    float _1606 = -_1592;
    float _1608 = fma(_1606, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1598);
    float _1610 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1612 = exp2(_1602);
    float _1614 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1604);
    float _1616 = fma(_1608, -0.5, 0.5);
    float _1618 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1620 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1610);
    float _1622 = fma(_1608, 0.5, 0.5);
    float _1624 = _1584 + 1.0;
    float _1626 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1618);
    float _1628 = log2(_1578);
    float _1630 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1620);
    float _1632 = fma(_1622, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1634 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1626);
    float _1636 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1630);
    float _1638 = fma(_1622, _1632, -0.212114393711090087890625);
    float _1640 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1634);
    float _1642 = 1.0 / _1614;
    float _1644 = -_1584;
    float _1646 = fma(_1612, _1624, _1644);
    float _1648 = fma(_1622, _1638, 1.570728778839111328125);
    float _1650 = fma(_1646, 0.5, 0.5);
    float _1652 = sqrt(_1616);
    float _1654 = _1628 * 0.693147182464599609375;
    float _1656 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1658 = _1636 * _1642;
    float _1660 = _1640 * _1642;
    float _1662 = fma(_1658, 0.5, 0.5);
    float _1664 = fma(_1660, -0.5, 0.5);
    float _1666 = _1652 * 0.636619746685028076171875;
    float _1668 = -_1648;
    float _1670 = fma(_1666, _1668, 1.0);
    float3 _4953 = float3(_1662, _1664, _1656);
    float _1672 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4953, float3(0.0), isnan(_4953)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4953, float3(0.0), isnan(_4953)), level(0.0)).x;
    float3 _4964 = float3(_1662, _1664, _1656);
    float4 _1675 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4964, float3(0.0), isnan(_4964)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4964, float3(0.0), isnan(_4964)), level(0.0)).xyzw;
    float _1677 = _1675.x;
    float _1679 = _1675.y;
    float _1681 = _1675.z;
    float _1683 = _1675.w;
    float2 _4980 = float2(_1670, _1650);
    float3 _1685 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4980, float2(0.0), isnan(_4980)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4980, float2(0.0), isnan(_4980)), level(0.0)).xyz;
    float _1687 = _1685.x;
    float _1689 = _1685.y;
    float _1691 = _1685.z;
    float _1693 = _598 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1695 = _598 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1697 = -_716;
    float _1699 = _1697 + 1.0;
    float _1701 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1693);
    float _1703 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1695);
    float _1705 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1701);
    float _1707 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1703);
    float _1709 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1711 = _1707 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1713 = 1.0 / _1709;
    float _1715 = _1711 + _1709;
    float _1717 = _1715 * _1713;
    float _1719 = _1717 * 0.5;
    float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1723 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1721);
    float _1725 = 1.0 / _1723;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1729 = _1725 * _1727;
    float _1731 = abs(_1729);
    float _1733 = log2(_1731);
    float _1735 = in.m_85.x;
    bool _1737 = _1729 <= 8000.0;
    bool _1739 = isnan(_1729);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan(8000.0);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    bool _1749 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1751 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan(0.5);
    bool _1757 = _1753 || _1755;
    float _1759 = _1733 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1761 = exp2(_1759);
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1765 = precise::clamp(_1763, 0.0, 1.0);
    float _1767 = fma(_1765, -2.0, 3.0);
    float _1769 = _1765 * _1765;
    float _1771 = _1769 * _1767;
    float _1773 = -_1771;
    float _1775 = _1773 + 1.0;
    float _1777 = fma(_1775, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1771);
    float _1779 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1781 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1783 = _1574;
    if (!_1757)
    {
        _1783 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1785 = _1783;
    float _1787 = _1747 * _1777;
    float _1789 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1781);
    float _1791 = exp2(_1779);
    float _1793 = _1787 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1795 = _1785;
    float _1797 = _1787;
    if (!_1757)
    {
        float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1801 = _1785 + _1799;
        _1795 = _1801;
    }
    float _1803 = _1795;
    float _1805 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1789);
    float _1807 = _1614 * 0.5;
    float _1809 = _1699 * _1793;
    float _1811 = precise::clamp(_1809, 0.0, 1.0);
    float _1813 = _1805;
    float _1815 = _1803;
    if (!_1757)
    {
        float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1819 = _1729 + _1817;
        _1797 = _1819;
    }
    float _1821 = _1797;
    float _1823 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1805);
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_1757)
    {
        float _1827 = 1.0 / _1803;
        _1825 = _1827;
    }
    float _1829 = _1825;
    float _1831 = -_1811;
    float _1833 = fma(_1831, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    if (_1757)
    {
        _1813 = 1.0;
    }
    float _1835 = _1813;
    float _1837 = _1823 + _1614;
    float _1839 = _1636 + _1614;
    float _1841 = _1833 * _1735;
    float _1843 = fma(_1640, -0.5, _1807);
    float _1845 = -_1791;
    float _1847 = _1845 + 1.0;
    float _1849 = _1841 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1851 = _1837 * 0.5;
    float _1853 = _1839 * 0.5;
    float _1855 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1636;
    out.gl_Position.y = _1640;
    out.gl_Position.z = _1823;
    out.gl_Position.w = _1614;
    float _1857 = _1835;
    float _1859 = _1851;
    float _1861 = _1853;
    float _1863 = _1843;
    if (!_1757)
    {
        float _1865 = _1821 * _1829;
        float _1867 = precise::clamp(_1865, 0.0, 1.0);
        _1857 = _1867;
    }
    float _1869 = _1857;
    out.m_87.x = _1849;
    bool _1871 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1873 = isnan(_1506);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1879 = _1875 || _1877;
    out.m_89.x = _1853;
    out.m_89.y = _1843;
    out.m_89.z = _1851;
    out.m_89.w = _1614;
    float _1881 = _1869 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_1879)
    {
        _1815 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1883 = _1815;
    float _1885 = _1883;
    float _1887 = _1883;
    if (!_1879)
    {
        _1859 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1889 = _1859;
    float _1891 = _1889;
    float _1893 = _1889;
    if (!_1879)
    {
        _1861 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1895 = _1861;
    float _1897 = _1895;
    float _1899 = _1895;
    if (!_1879)
    {
        _1863 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1901 = _1863;
    float _1903 = _1855 * _1672;
    float _1905 = -_1855;
    float _1907 = _1905 + 1.0;
    float _1909 = _1683 * _1903;
    float _1911 = _1691 * _1903;
    float _1913 = _1683 * _1907;
    float _1915 = _1907;
    float _1917 = _1909;
    float _1919 = _1901;
    float _1921 = _1901;
    if (!_1879)
    {
        _1915 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1923 = _1915;
    float _1925 = fma(_1687, _1909, _1677);
    float _1927 = fma(_1689, _1909, _1679);
    float _1929 = fma(_1683, _1911, _1681);
    float _1931 = _1923;
    float _1933 = _1923;
    if (!_1879)
    {
        _1917 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1935 = _1917;
    out.m_91.x = _1925;
    out.m_91.y = _1927;
    out.m_91.z = _1929;
    out.m_91.w = _1913;
    bool _1937 = !_1879;
    float _1939 = _1935;
    float _1941 = _1935;
    if (!_1937)
    {
        bool _1943 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1945 = isnan(_1506);
        bool _1947 = _1943 || _1945;
        bool _1949 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1951 = _1947 || _1949;
        if (!_1951)
        {
            float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1955 = _1506 + _1953;
            float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1959 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1957;
            float _1961 = 1.0 / _1959;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1979 = _1955 * _1961;
            float _1981 = precise::clamp(_1979, 0.0, 1.0);
            float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1991 = fma(_1981, _1965, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1993 = fma(_1981, _1985, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1995 = fma(_1981, _1989, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1997 = fma(_1981, _1969, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1999 = fma(_1981, _1973, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2001 = fma(_1981, _1977, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1899 = _1995;
            _1941 = _1999;
            _1893 = _1993;
            _1887 = _1997;
            _1921 = _1991;
            _1933 = _2001;
            _2003 = true;
        }
        else
        {
            bool _2005 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2007 = isnan(_1506);
            bool _2009 = _2005 || _2007;
            bool _2011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2013 = _2009 || _2011;
            if (!_2013)
            {
                _1891 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2015 = _1891;
            _1893 = _2015;
            if (!_2013)
            {
                _1897 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2017 = _1897;
            _1899 = _2017;
            if (!_2013)
            {
                _1919 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2019 = _1919;
            _1921 = _2019;
            if (!_2013)
            {
                _1885 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2021 = _1885;
            _1887 = _2021;
            if (!_2013)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2023 = _1939;
            _1941 = _2023;
            if (!_2013)
            {
                _1931 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2025 = _1931;
            bool _2027 = !_2013;
            _1933 = _2025;
            if (!_2027)
            {
                bool _2029 = _1506 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2031 = isnan(_1506);
                bool _2033 = _2029 || _2031;
                bool _2035 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2037 = _2033 || _2035;
                if (!_2037)
                {
                    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2041 = _1506 + _2039;
                    float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2043;
                    float _2047 = 1.0 / _2045;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2065 = _2041 * _2047;
                    float _2067 = precise::clamp(_2065, 0.0, 1.0);
                    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2071 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2077 = fma(_2067, _2051, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2079 = fma(_2067, _2071, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2081 = fma(_2067, _2075, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2083 = fma(_2067, _2055, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2085 = fma(_2067, _2059, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2087 = fma(_2067, _2063, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1899 = _2081;
                    _1941 = _2085;
                    _1893 = _2079;
                    _1887 = _2083;
                    _1921 = _2077;
                    _1933 = _2087;
                    _2003 = true;
                }
                else
                {
                    _1899 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1893 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1887 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1921 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1933 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2003 = false;
    float _2089 = _1899;
    float _2091 = _1941;
    float _2093 = _1893;
    float _2095 = _1887;
    float _2097 = _1921;
    float _2099 = _1933;
    float _2101 = _1881 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2103 = fma(_1126, -0.5, 0.5);
    float _2105 = precise::clamp(_2103, 0.0, 1.0);
    float _2107 = -_2089;
    float _2109 = _2107 + _2091;
    float _2111 = -_2093;
    float _2113 = _2111 + _2095;
    out.m_53.x = _2101;
    float _2115 = -_2097;
    float _2117 = _2115 + _2099;
    float _2119 = fma(_2105, _2109, _2089);
    float _2121 = fma(_2105, _2113, _2093);
    bool _2123 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2125 = _2119 * 0.586610972881317138671875;
    float _2127 = fma(_2105, _2117, _2097);
    out.m_93.x = 0.0;
    bool _2129 = _1869 > 0.0;
    bool _2131 = isnan(_1869);
    bool _2133 = _2129 || _2131;
    bool _2135 = isnan(0.0);
    bool _2137 = _2133 || _2135;
    float _2139 = fma(_2121, 0.298911988735198974609375, _2125);
    float _2141 = fma(_2127, 0.114477999508380889892578125, _2139);
    float _2143 = -_2141;
    float _2145 = _2121 + _2143;
    float _2147 = -_2141;
    float _2149 = _2119 + _2147;
    float _2151 = -_2141;
    float _2153 = _2127 + _2151;
    float _2155 = fma(_2145, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2141);
    float _2157 = fma(_2149, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2141);
    float _2159 = fma(_2153, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2141);
    bool _2161 = !_2123;
    if (!_2161)
    {
        float _2163 = -_1354;
        float _2165 = _2163 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2167 = -_1356;
        float _2169 = _2167 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2171 = -_1358;
        float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2175 = _2165 * _2165;
        float _2177 = fma(_2169, _2169, _2175);
        float _2179 = fma(_2173, _2173, _2177);
        float _2181 = sqrt(_2179);
        float _2183 = rsqrt(_2179);
        float _2185 = -_2181;
        float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2189 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2191 = precise::clamp(_2189, 0.0, 1.0);
        float _2193 = _2169 * _2183;
        float _2195 = _2165 * _2183;
        float _2197 = abs(_2191);
        float _2199 = log2(_2197);
        float _2201 = _2173 * _2183;
        float _2203 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2205 = _1126 * _2195;
        float _2207 = -_2195;
        float _2209 = -_2203;
        float _2211 = fma(_2207, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2209);
        float _2213 = fma(_1124, _2193, _2205);
        float _2215 = -_2201;
        float _2217 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2211);
        float _2219 = fma(_1146, _2201, _2213);
        float _2221 = precise::clamp(_2219, 0.0, 1.0);
        float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2225 = _2217 + _2223;
        float _2227 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2229 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2231 = precise::clamp(_2229, 0.0, 1.0);
        float _2233 = exp2(_2227);
        float _2235 = _2233 * _2231;
        float _2237 = _2221 * _2235;
        float _2239 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2241 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2243 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2239;
        out.m_93.y = _2241;
        out.m_93.z = _2243;
    }
    out.m_95.x = _2155;
    out.m_95.y = _2157;
    out.m_95.z = _2159;
    if (_2137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2245 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2245;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

