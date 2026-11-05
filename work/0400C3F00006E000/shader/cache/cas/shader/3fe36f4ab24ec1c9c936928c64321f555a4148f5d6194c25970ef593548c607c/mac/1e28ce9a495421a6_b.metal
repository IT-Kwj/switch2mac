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
    float4 m_69 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_95 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_75 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_77 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
    float4 m_63 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2233 = false;
    bool _222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_49.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2466 = as_type<float>(_132);
        out.gl_Position.z = _2466;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_51.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_116);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _126;
    if (_164)
    {
        out.m_49.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2535 = as_type<float>(_170);
        out.gl_Position.z = _2535;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = _174 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _182 = _174 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _184 = _174 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _186 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].x, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].z, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].z, _188);
    float _196 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].z, _190);
    bool _198 = !_178;
    float _200 = _196;
    float _202 = _194;
    float _220;
    if (!_198)
    {
        float _204 = in.m_55.x;
        float _206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _210 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _212 = _210 * _206;
        float _214 = floor(_212);
        float _216 = -_214;
        float _218 = _212 + _216;
        _220 = _218;
        _222 = true;
    }
    else
    {
        float _224 = float(_116);
        float _226 = 1.0 / _224;
        float _228 = _150 * _226;
        _220 = _228;
    }
    _222 = false;
    float _230 = _220;
    float _232 = in.m_55.x;
    float _234 = in.m_55.y;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _238 = _230 + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _246 = _244 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = in.m_55.z;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _252 = _250 != 0;
    float _254 = 1.0 / _242;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _230 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _272 = 1.0 / _246;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _230 + _278;
    float _282 = _232 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _284 = 1.0 / _258;
    float _286 = -_274;
    float _288 = fma(_282, 2.0, _286);
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _300 = _298 != 0;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = _230 + _306;
    float _310 = _262 * _272;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = _230 + _312;
    float _316 = 1.0 / _266;
    float _318 = _248 * 2.0;
    float _320 = _308 * _254;
    float _322 = _232 * 2.0;
    float _324 = _234 + _248;
    float _326 = 0.0;
    if (!_252)
    {
        _326 = _248;
    }
    float _328 = _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _330;
    float _334 = 0.0;
    float _336 = _328;
    if (!_252)
    {
        _334 = _248;
    }
    float _338 = _334;
    float _340 = 1.0 / _304;
    float _342 = _324 + (-1.0);
    float _344 = _314 * _284;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _346;
    float _350 = _338;
    if (_252)
    {
        _336 = _234;
    }
    float _352 = _336;
    float _354 = -_150;
    float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[76].x, _288);
    if (_252)
    {
        _350 = _234;
    }
    float _358 = _350;
    float _360 = 1.0 / _270;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _362;
    float _366 = fma(_364, _320, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _368 = _238 * _340;
    float _370 = _232 + _248;
    float _372 = floor(_318);
    float _374 = _234 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _376 = _370 + (-1.0);
    bool _378 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _380 = isnan(_230);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = fma(_374, -2.0, _276);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _394 = _230 + _392;
    float _396 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _398 = _234 * 2.0;
    float _400 = floor(_322);
    float _402 = _394 * _316;
    float _404 = _280 * _360;
    float _406 = fma(_348, _402, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _410 = _372 > 0.0;
    float _412 = floor(_398);
    bool _414 = _372 >= 0.0;
    bool _416 = isnan(_372);
    bool _418 = _414 || _416;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    float _424 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _426 = _234 + _232;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _428;
    int _432 = _422 ? 0 : 1;
    float _434 = -_388;
    float _436 = _434 + 1.0;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _438;
    float _442 = _426 + (-1.0);
    bool _444 = _400 >= 0.0;
    bool _446 = isnan(_400);
    bool _448 = _444 || _446;
    bool _450 = isnan(0.0);
    bool _452 = _448 || _450;
    float _454 = fma(_430, _320, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _456 = fma(_440, _320, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _458 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _460 = _452 ? 0 : 1;
    float _462 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[83].w, _408);
    float _464 = _442;
    if (!_252)
    {
        _464 = _234;
    }
    float _466 = _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _468;
    bool _472 = _412 > 0.0;
    float _474 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _390);
    bool _476 = _412 >= 0.0;
    bool _478 = isnan(_412);
    bool _480 = _476 || _478;
    bool _482 = isnan(0.0);
    bool _484 = _480 || _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _490 = _466;
    bool _492 = _472;
    int _494 = as_type<int>(_474);
    if (_252)
    {
        _490 = _232;
    }
    float _496 = _490;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _502 = _400 > 0.0;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _516 = fma(_488, _310, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _518 = fma(_500, _310, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _524 = fma(_510, _404, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _526 = fma(_514, _404, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _532;
    float _536 = fma(_506, _310, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _538 = fma(_470, _402, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _540 = fma(_522, _404, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _542 = fma(_530, _344, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _544;
    bool _548 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _550 = isnan(_230);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = fma(_534, _344, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    bool _562 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _564 = isnan(_230);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = fma(_332, _402, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _576 = fma(_546, _344, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _578 = -_558;
    float _580 = _578 + 1.0;
    bool _582 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _584 = isnan(_230);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -_572;
    float _596 = _594 + 1.0;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _602 = _572 * _580;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _608 = _592 * _596;
    float _610 = -_592;
    float _612 = _610 + 1.0;
    float _614 = fma(_600, _368, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    bool _616 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _618 = isnan(_230);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = fma(_606, _368, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    bool _630 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _632 = isnan(_230);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = _388 * _612;
    bool _644 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _646 = isnan(_230);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = _626 * _436;
    float _658 = -_626;
    float _660 = _658 + 1.0;
    float _662 = _352 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _664 = _640 * _660;
    float _666 = -_640;
    float _668 = _666 + 1.0;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _674 = _654 * _668;
    float _676 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[83].z, _670);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _684 = _456 * _674;
    float _686 = fma(_662, -2.0, _672);
    float _688 = fma(_680, _368, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _690 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _692 = log2(_690);
    float _694 = _496 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _696 = _454 * _674;
    float _698 = _366 * _674;
    float _700 = -_654;
    float _702 = _700 + 1.0;
    bool _704 = !_292;
    int _706 = _704 ? 0 : 1;
    float _708 = -_682;
    float _710 = fma(_694, 2.0, _708);
    int _712 = _484 ? 0 : 1;
    float _714 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].x, _684);
    float _716 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].y, _696);
    float _718 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].z, _698);
    int _720 = ~_432;
    int _722 = _720 + 1;
    int _724 = _722 + 1;
    float _726 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _676);
    int _728 = ~_460;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    float _734 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _462);
    int _736 = abs(_706);
    float _738 = -_150;
    float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[81].x, _710);
    int _742 = _724;
    int _744 = _732;
    if (!_410)
    {
        int _746 = ~_432;
        int _748 = _746 + 1;
        _742 = _748;
    }
    int _750 = _742;
    float _752 = fma(_516, _664, _714);
    if (!_502)
    {
        int _754 = ~_460;
        int _756 = _754 + 1;
        _744 = _756;
    }
    int _758 = _744;
    float _760 = _692 * _150;
    float _762 = fma(_518, _664, _716);
    float _764 = float(_736);
    float _766 = fma(_536, _664, _718);
    float _768 = float(_750);
    float _770 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _686);
    float _772 = exp2(_760);
    float _774 = fma(_406, _656, _762);
    float _776 = _764 * _768;
    float _778 = in.m_57.x;
    float _780 = in.m_57.y;
    float _782 = in.m_57.z;
    bool _784 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _786 = isnan(1.0);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _792 = _788 || _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _796 = 1.0 + _794;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _800 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _802 = isnan(0.0);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _808 = _804 || _806;
    float _810 = 1.0 / _796;
    int _812 = ~_712;
    int _814 = _812 + 1;
    int _816 = _814 + 1;
    float _818 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[78].z, _798);
    bool _820 = !_296;
    int _822 = _820 ? 0 : 1;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _826 = -_772;
    float _828 = _826 + 1.0;
    int _830 = _816;
    if (!_472)
    {
        int _832 = ~_712;
        int _834 = _832 + 1;
        _830 = _834;
    }
    int _836 = _830;
    float _838 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _818);
    int _840 = abs(_822);
    float _842 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[78].w, _824);
    float _844 = _808 ? _828 : 0.0;
    float _846 = _776 * (-2.0);
    float _848 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _842);
    bool _850 = !_300;
    int _852 = _850 ? 0 : 1;
    float _854 = _232 + (-0.5);
    float _856 = _848;
    if (_792)
    {
        float _858 = _844 * _810;
        _154 = _858;
    }
    float _860 = _154;
    float _862 = float(_836);
    float _864 = fma(_846, _778, _778);
    float _866 = float(_840);
    float _868 = fma(_538, _656, _752);
    float _870 = float(_758);
    float _872 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[196].x, _864);
    int _874 = abs(_852);
    float _876 = fma(_524, _642, _868);
    float _878 = fma(_458, _846, _458);
    float _880 = _866 * _870;
    float _882 = _234 + (-0.5);
    float _884 = fma(_542, _608, _876);
    float _886 = _880 * (-2.0);
    float _888 = float(_874);
    float _890 = fma(_878, _860, _872);
    float _892 = fma(_628, _602, _884);
    float _894 = fma(_886, _780, _780);
    float _896 = fma(_424, _886, _424);
    float _898 = _888 * _862;
    float _900 = fma(_574, _656, _766);
    float _902 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[196].y, _894);
    float _904 = fma(_526, _642, _774);
    float _906 = _898 * (-2.0);
    float _908 = fma(_540, _642, _900);
    float _910 = fma(_896, _860, _902);
    float _912 = in.m_59.x;
    float _914 = in.m_59.y;
    float _916 = in.m_59.z;
    float _918 = fma(_906, _782, _782);
    float _920 = _248 + (-0.5);
    float _922 = fma(_396, _906, _396);
    float _924 = in.m_61.x;
    float _926 = in.m_61.y;
    float _928 = in.m_61.z;
    float _930 = fma(_576, _608, _908);
    float _932 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[196].z, _918);
    float _934 = fma(_560, _608, _904);
    float _936 = _890 * 0.15915493667125701904296875;
    float _938 = fma(_688, _602, _930);
    float _940 = fma(_922, _860, _932);
    float _942 = fma(_614, _602, _934);
    float _944 = _910 * 0.15915493667125701904296875;
    float _946 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[149].x, _892);
    float _948 = _940 * 0.15915493667125701904296875;
    float _950 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[149].z, _938);
    float _952 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[149].y, _942);
    float _954 = _936 * 6.283185482025146484375;
    float _956 = cos(_954);
    float _958 = _944 * 6.283185482025146484375;
    float _960 = sin(_958);
    float _962 = _952 * _926;
    float _964 = _950 * _928;
    float _966 = _946 * _924;
    float _968 = in.m_46.x;
    float _970 = in.m_46.y;
    float _972 = in.m_46.z;
    float _974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _914);
    float _976 = _944 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _962 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _912);
    float _984 = _966 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _916);
    float _988 = _974 * _980;
    float _990 = _964 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _992 = _982 * _984;
    float _994 = _936 * 6.283185482025146484375;
    float _996 = sin(_994);
    float _998 = _956 * _960;
    float _1000 = _986 * _990;
    float _1002 = _948 * 6.283185482025146484375;
    float _1004 = cos(_1002);
    float _1006 = _956 * _978;
    float _1008 = _948 * 6.283185482025146484375;
    float _1010 = sin(_1008);
    float _1012 = _996 * _960;
    float _1014 = _996 * _978;
    float _1016 = _956 * _1004;
    float _1018 = _996 * _1004;
    float _1020 = _978 * _1004;
    float _1022 = _960 * _1004;
    float _1024 = _1016 * _988;
    float _1026 = fma(_1010, _1006, _1012);
    float _1028 = -_988;
    float _1030 = _1010 * _1028;
    float _1032 = -_998;
    float _1034 = fma(_1010, _1014, _1032);
    float _1036 = _1018 * _988;
    float _1038 = -_1014;
    float _1040 = fma(_1010, _998, _1038);
    float _1042 = fma(_1026, _992, _1024);
    float _1044 = fma(_1020, _992, _1030);
    float _1046 = fma(_1034, _992, _1036);
    float _1048 = fma(_1010, _1012, _1006);
    float _1050 = fma(_1040, _1000, _1042);
    float _1052 = _970 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1054 = fma(_1022, _1000, _1044);
    float _1056 = fma(_1048, _1000, _1046);
    float _1058 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1060 = _970 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1062 = fma(_968, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1052);
    float _1064 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1066 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1058);
    float _1068 = fma(_968, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1060);
    float _1070 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1062);
    float _1072 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1064);
    float _1074 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1066);
    float _1076 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1068);
    float _1078 = _1070 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1080 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1072);
    float _1082 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1084 = _1076 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1086 = _970 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1088 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1090 = _1078 + _1082;
    float _1092 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1094 = fma(_968, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1086);
    float _1096 = _1084 + _1088;
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1100 = _1090 + _1098;
    float _1102 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1092);
    float _1104 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1094);
    float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1108 = _1096 + _1106;
    float _1110 = _1100 * _1100;
    float _1112 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1102);
    float _1114 = _1104 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1116 = fma(_1108, _1108, _1110);
    float _1118 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1120 = sqrt(_1116);
    float _1122 = _1114 + _1118;
    bool _1124 = _1120 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1126 = _968;
    float _1128 = _972;
    float _1130 = _1104;
    float _1132 = _1100;
    float _1134 = _932;
    if (!_1124)
    {
        _1126 = _1096;
    }
    float _1136 = _1126;
    float _1138 = _1136;
    if (!_1124)
    {
        _1128 = _1090;
    }
    float _1140 = _1128;
    float _1142 = _1140;
    if (!_1124)
    {
        _1130 = _1122;
    }
    float _1144 = _1130;
    bool _1146 = !_1124;
    float _1148 = _1144;
    if (!_1146)
    {
        float _1150 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1154 = _1120 + _1152;
        float _1156 = _1122 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1158 = rsqrt(_1116);
        float _1160 = _1154 * _1150;
        float _1162 = _1160 * 0.15915493667125701904296875;
        float _1164 = _1162 * 6.283185482025146484375;
        float _1166 = cos(_1164);
        float _1168 = _1162 * 6.283185482025146484375;
        float _1170 = sin(_1168);
        float _1172 = _1166 + (-1.0);
        float _1174 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1176 = fma(_1170, _1156, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1178 = fma(_1122, _1166, _1174);
        float _1180 = _1158 * _1176;
        float _1182 = fma(_1108, _1180, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1184 = fma(_1100, _1180, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1148 = _1178;
        _1138 = _1182;
        _1142 = _1184;
    }
    float _1186 = _1148;
    float _1188 = _1138;
    float _1190 = _1142;
    float _1192 = -_1114;
    float _1194 = _1192 + _1186;
    float _1196 = -_1084;
    float _1198 = _1196 + _1188;
    float _1200 = -_1078;
    float _1202 = _1200 + _1190;
    float _1204 = _1194 * _1194;
    float _1206 = fma(_1198, _1198, _1204);
    float _1208 = fma(_1202, _1202, _1206);
    float _1210 = sqrt(_1208);
    bool _1212 = _1210 > 0.0;
    bool _1214 = !_1212;
    float _1216 = _1186;
    float _1218 = _1188;
    float _1220 = _1190;
    float _1222 = _1208;
    float _1224 = _1198;
    if (!_1214)
    {
        float _1226 = _194 * _194;
        float _1228 = fma(_192, _192, _1226);
        float _1230 = rsqrt(_1208);
        float _1232 = fma(_196, _196, _1228);
        float _1234 = sqrt(_1232);
        float _1236 = _1198 * _1230;
        float _1238 = _1194 * _1230;
        float _1240 = _1202 * _1230;
        bool _1242 = _1234 > 0.0;
        bool _1244 = !_1242;
        _1132 = _1232;
        if (!_1244)
        {
            float _1246 = rsqrt(_1232);
            float _1248 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1250 = _194 * _1246;
            float _1252 = _192 * _1246;
            float _1254 = _196 * _1246;
            float _1256 = _1238 * _1250;
            float _1258 = fma(_1236, _1252, _1256);
            float _1260 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1262 = fma(_1240, _1254, _1258);
            float _1264 = _1262 * _1260;
            float _1266 = fma(_192, _1264, _1188);
            float _1268 = fma(_194, _1264, _1186);
            float _1270 = fma(_196, _1264, _1190);
            _1216 = _1268;
            _1218 = _1266;
            _1220 = _1270;
            _1222 = _1252;
            _1224 = _1258;
        }
    }
    float _1272 = _1216;
    float _1274 = _1218;
    float _1276 = _1220;
    float _1278 = _1132;
    float _1280 = _1222;
    float _1282 = _1224;
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1286 = _1272 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1290 = _1274 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1294 = _1276 + _1292;
    float _1296 = _1286 * _1286;
    float _1298 = fma(_1290, _1290, _1296);
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1302 = fma(_1294, _1294, _1298);
    float _1304 = rsqrt(_1302);
    float _1306 = sqrt(_1302);
    float _1308 = _1304 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1310 = _1290 * _1308;
    float _1312 = _1294 * _1308;
    float _1314 = _1310 * _1310;
    float _1316 = _1312 * _1312;
    float _1318 = _1314 + _1316;
    float _1320 = sqrt(_1318);
    bool _1322 = _1320 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1326 = _1320 + _1324;
    float _1328 = _1278;
    float _1330 = _1326;
    float _1332 = _1282;
    float _1334 = _1310;
    if (_1322)
    {
        float _1336 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1328 = _1336;
    }
    float _1338 = _1328;
    if (_1322)
    {
        float _1340 = rsqrt(_1318);
        _200 = _1340;
    }
    float _1342 = _200;
    float _1344 = _1342;
    if (_1322)
    {
        float _1346 = _1326 * _1338;
        _1330 = _1346;
    }
    float _1348 = _1330;
    if (_1322)
    {
        float _1350 = _1348 * 0.15915493667125701904296875;
        _1332 = _1350;
    }
    float _1352 = _1332;
    float _1354 = _1280;
    if (_1322)
    {
        float _1356 = _1352 * 6.283185482025146484375;
        float _1358 = sin(_1356);
        _1354 = _1358;
    }
    float _1360 = _1354;
    float _1362 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1364 = precise::max(0.0, _1362);
    float _1366 = _1338;
    float _1368 = _1364;
    if (_1322)
    {
        float _1370 = _1352 * 6.283185482025146484375;
        float _1372 = cos(_1370);
        _1366 = _1372;
    }
    float _1374 = _1366;
    float _1376 = -_1308;
    float _1378 = -_1364;
    float _1380 = fma(_1286, _1376, _1378);
    if (_1322)
    {
        float _1382 = _1380 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _202 = _1382;
    }
    float _1384 = _202;
    float _1386 = _1384;
    float _1388 = _1360;
    if (_1322)
    {
        float _1390 = fma(_1360, _1384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1386 = _1390;
    }
    float _1392 = _1386;
    float _1394 = _1392;
    if (!_1322)
    {
        _1388 = _1314;
    }
    float _1396 = _1388;
    float _1398 = _1396;
    if (_1322)
    {
        float _1400 = _1374 + (-1.0);
        _1368 = _1400;
    }
    float _1402 = _1368;
    float _1404 = _1402;
    if (_1322)
    {
        float _1406 = _1342 * _1392;
        _1134 = _1406;
    }
    float _1408 = _1134;
    if (!_1322)
    {
        _1394 = _1380;
    }
    float _1410 = _1394;
    float _1412 = _1410;
    if (_1322)
    {
        float _1414 = _1402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1344 = _1414;
    }
    float _1416 = _1344;
    float _1418 = _1416;
    if (_1322)
    {
        float _1420 = _1310 * _1408;
        _1334 = _1420;
    }
    float _1422 = _1334;
    if (!_1322)
    {
        _1404 = _1312;
    }
    float _1424 = _1404;
    float _1426 = _1424;
    if (_1322)
    {
        float _1428 = _1312 * _1408;
        _1426 = _1428;
    }
    float _1430 = _1426;
    if (_1322)
    {
        float _1432 = fma(_1380, _1374, _1416);
        _1412 = _1432;
    }
    float _1434 = _1412;
    if (_1322)
    {
        float _1436 = _1422 * _1422;
        _1398 = _1436;
    }
    float _1438 = _1398;
    if (!_1322)
    {
        _1418 = _1316;
    }
    float _1440 = _1418;
    float _1442 = _1440;
    if (_1322)
    {
        float _1444 = _1430 * _1430;
        _1442 = _1444;
    }
    float _1446 = _1442;
    float _1448 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1450 = fma(_1434, _1434, _1438);
    float _1452 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1454 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1456 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1448);
    float _1458 = _1450 + _1446;
    float _1460 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1462 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1452);
    float _1464 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1456);
    float _1466 = fma(_1084, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1468 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1460);
    float _1470 = rsqrt(_1458);
    float _1472 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1474 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1468);
    float _1476 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1462);
    float _1478 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1454);
    float _1480 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1482 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1486 = fma(_1306, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1484);
    float _1488 = precise::clamp(_1486, 0.0, 1.0);
    float _1490 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1478);
    float _1492 = _1476 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1494 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1480);
    float _1496 = -_1488;
    float _1498 = _1496 + 1.0;
    float _1500 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1502 = floor(_1466);
    float _1504 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1494);
    float _1506 = _1470 * _1422;
    float _1508 = _1470 * _1434;
    float _1510 = _1470 * _1430;
    float _1512 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1504);
    float _1514 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1516 = fma(_1078, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1518 = abs(_1498);
    float _1520 = log2(_1518);
    float _1522 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1524 = -_1514;
    float _1526 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1524);
    float _1528 = -_1510;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1526);
    float _1532 = _1492 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1534 = floor(_1516);
    float _1536 = fma(_1530, -0.5, 0.5);
    float _1538 = fma(_1530, 0.5, 0.5);
    float _1540 = -_1502;
    float _1542 = _1466 + _1540;
    float _1544 = -_1532;
    float _1546 = fma(_1544, _1300, 1.0);
    float _1548 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1550 = fma(_1538, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1552 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1554 = sqrt(_1536);
    float _1556 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1548);
    float _1558 = fma(_1538, _1550, -0.212114393711090087890625);
    float _1560 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1522);
    float _1562 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1556);
    float _1564 = fma(_1538, _1558, 1.570728778839111328125);
    float _1566 = -_1534;
    float _1568 = _1516 + _1566;
    float _1570 = 1.0 / _1512;
    float _1572 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1560);
    float _1574 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1562);
    float _1576 = _1508 + 1.0;
    float _1578 = exp2(_1552);
    float _1580 = _1554 * 0.636619746685028076171875;
    float _1582 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1572);
    float _1584 = log2(_1546);
    float _1586 = _1574 * _1570;
    float _1588 = _1582 * _1570;
    float _1590 = -_1564;
    float _1592 = fma(_1580, _1590, 1.0);
    float2 _4834 = float2(_1542, _1568);
    float _1594 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4834, float2(0.0), isnan(_4834)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4834, float2(0.0), isnan(_4834)), level(0.0)).x;
    float _1596 = fma(_1586, 0.5, 0.5);
    float _1598 = -_1508;
    float _1600 = fma(_1578, _1576, _1598);
    float _1602 = fma(_1600, 0.5, 0.5);
    float _1604 = fma(_1588, -0.5, 0.5);
    float _1606 = _1584 * 0.693147182464599609375;
    float _1608 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4864 = float3(_1596, _1604, _1608);
    float _1610 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4864, float3(0.0), isnan(_4864)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4864, float3(0.0), isnan(_4864)), level(0.0)).x;
    float3 _4875 = float3(_1596, _1604, _1608);
    float4 _1613 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4875, float3(0.0), isnan(_4875)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4875, float3(0.0), isnan(_4875)), level(0.0)).xyzw;
    float _1615 = _1613.x;
    float _1617 = _1613.y;
    float _1619 = _1613.z;
    float _1621 = _1613.w;
    float2 _4891 = float2(_1592, _1602);
    float3 _1625 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4891, float2(0.0), isnan(_4891)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4891, float2(0.0), isnan(_4891)), level(0.0)).xyz;
    float _1627 = _1625.x;
    float _1629 = _1625.y;
    float _1631 = _1625.z;
    float _1633 = in.m_63.w;
    float _1635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1637 = _234 > 0.5;
    float _1639 = in.m_63.x;
    int _1641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1643 = _1641 != 0;
    float _1645 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1649 = _1647 != 0;
    float _1651 = in.m_63.y;
    int _1653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1655 = _1653 != 0;
    float _1657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1659 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1661 = in.m_63.z;
    float _1663 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1665 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1659);
    float _1667 = in.m_55.w;
    float _1669 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1663);
    if (_1643)
    {
        bool _1671 = _248 > 0.5;
        _492 = _1671;
    }
    bool _1673 = _492;
    float _1675 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1665);
    float _1677 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1669);
    float _1679 = in.m_65.x;
    float _1681 = _1677 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_67.w = _1633;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1689 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1691 = in.m_65.y;
    float _1693 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1639;
    float _1699 = _1635 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1703 = _1701 != 0;
    out.m_67.y = _1651;
    bool _1705 = _1667 > 0.5;
    float _1707 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_67.z = _1661;
    float _1709 = _1707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1711 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_69.x = _1693;
    out.m_69.y = _1695;
    out.m_69.z = _1697;
    out.m_69.w = _1689;
    float _1713 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1717 = 1.0 / _1681;
    float _1719 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1723 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    bool _1725 = _1703;
    float _1727 = _1715;
    int _1729 = as_type<int>(_1699);
    float _1731 = _1679;
    float _1733 = _1711;
    if (_1649)
    {
        float _1735 = in.m_55.x;
        _1723 = _1735;
    }
    float _1737 = _1723;
    float _1739 = -_1691;
    float _1741 = _1739 + 1.0;
    float _1743 = _1719 + _1681;
    float _1745 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1747 = _1713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1749 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1645);
    out.m_71.x = _1290;
    out.m_71.y = _1286;
    out.m_71.z = _1294;
    int _1751 = _1637 ? as_type<int>(_1741) : as_type<int>(_1691);
    float _1753 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1749);
    bool _1755 = _914 != 0.0;
    bool _1757 = isnan(_914);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan(0.0);
    bool _1763 = _1759 || _1761;
    out.m_73.x = _1745;
    out.m_73.y = _1747;
    out.m_73.z = _1709;
    out.m_73.w = _1715;
    float _1765 = _1743 * _1717;
    float _1767 = _1765 * 0.5;
    bool _1769 = _912 == 0.0;
    bool _1771 = !_1763;
    bool _1773 = _1769 && _1771;
    float _1775 = in.m_75.x;
    float _1777 = in.m_75.y;
    float _1779 = in.m_75.z;
    float _1781 = _1703 ? as_type<float>(_1751) : _1691;
    float _1783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1785 = _1691;
    float _1787 = _1745;
    if (_1655)
    {
        float _1789 = _1705 ? _1741 : _1691;
        _1785 = _1789;
    }
    float _1791 = _1785;
    float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1795 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1793);
    bool _1797 = _916 == 0.0;
    bool _1799 = _1797 && _1773;
    float _1801 = fma(_1699, _1781, -0.5);
    float _1803 = fma(_1711, _1791, -0.5);
    if (_1649)
    {
        bool _1805 = _1737 > 0.5;
        _1725 = _1805;
    }
    bool _1807 = _1725;
    float _1809 = 1.0 / _1795;
    if (!_1649)
    {
        _1727 = _1679;
    }
    float _1811 = _1727;
    float _1813 = -_474;
    float _1815 = fma(_848, _1801, _1813);
    float _1817 = -_770;
    float _1819 = fma(_734, _1803, _1817);
    float _1821 = in.m_77.x;
    float _1823 = in.m_77.y;
    float _1825 = in.m_77.z;
    float _1827 = in.m_77.w;
    float _1829 = _1811;
    if (!_1649)
    {
        _1787 = _1811;
    }
    float _1831 = _1787;
    float _1833 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1835 = _1831;
    if (_1649)
    {
        _1829 = _1679;
    }
    float _1837 = _1829;
    float _1839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1841 = _1837;
    if (_1649)
    {
        float _1843 = -_1837;
        float _1845 = _1843 + 1.0;
        _494 = as_type<int>(_1845);
    }
    int _1847 = _494;
    float _1849 = as_type<float>(_1847);
    if (_1643)
    {
        float _1851 = -_1837;
        float _1853 = _1851 + 1.0;
        _1729 = as_type<int>(_1853);
    }
    int _1855 = _1729;
    float _1857 = _1775;
    if (_1799)
    {
        _1731 = _1777;
    }
    float _1859 = _1731;
    float _1861 = _1859;
    if (_1799)
    {
        _1733 = _1775;
    }
    float _1863 = _1733;
    float _1865 = _1863;
    if (_1649)
    {
        float _1867 = _1807 ? as_type<float>(_1847) : _1837;
        _1835 = _1867;
    }
    float _1869 = _1835;
    if (_1799)
    {
        _1849 = _1859;
    }
    float _1871 = _1849;
    float _1873 = _1871;
    if (!_1799)
    {
        _1861 = _1777;
    }
    float _1875 = _1861;
    float _1877 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1879 = _1809 * _1877;
    float _1881 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1643)
    {
        float _1883 = _1673 ? as_type<float>(_1855) : _1837;
        _1841 = _1883;
    }
    float _1885 = _1841;
    float _1887 = _1839 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1889 = abs(_1879);
    float _1891 = log2(_1889);
    if (_1799)
    {
        _856 = _1863;
    }
    float _1893 = _856;
    float _1895 = fma(_1881, _1869, -0.5);
    float _1897 = _1893;
    if (!_1799)
    {
        _1865 = _1775;
    }
    float _1899 = _1865;
    float _1901 = fma(_1887, _1885, -0.5);
    if (!_1799)
    {
        float _1903 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1875);
        _1873 = _1903;
    }
    float _1905 = _1873;
    float _1907 = _1823 * _1779;
    float _1909 = fma(_838, _1895, _356);
    if (!_1799)
    {
        float _1911 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1899);
        _1897 = _1911;
    }
    float _1913 = _1897;
    float _1915 = fma(_726, _1901, _740);
    float _1917 = _1821 * _1875;
    float _1919 = _1825 * _1899;
    float _1921 = _1815 + 0.5;
    float _1923 = _1915 + 0.5;
    float _1925 = -_1917;
    float _1927 = fma(_1823, _1899, _1925);
    float _1929 = -_1919;
    float _1931 = fma(_1821, _1779, _1929);
    float _1933 = _1891 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1935 = -_1907;
    float _1937 = fma(_1825, _1875, _1935);
    if (_1799)
    {
        _1857 = _1779;
    }
    float _1939 = _1857;
    float _1941 = _1939;
    if (!_1799)
    {
        float _1943 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1779);
        _1941 = _1943;
    }
    float _1945 = _1941;
    float _1947 = exp2(_1933);
    float _1949 = _1931 * _1827;
    float _1951 = _1937 * _1827;
    float _1953 = _1927 * _1827;
    float _1955 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1957 = _1819 + 0.5;
    float _1959 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1961 = -_1010;
    float _1963 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1833);
    float _1965 = -_1010;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1955);
    float _1969 = _1909 + 0.5;
    float _1971 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1973 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1975 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1977 = -_1010;
    float _1979 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1959);
    out.m_79.x = _1969;
    out.m_79.y = _1921;
    out.m_79.z = _1923;
    out.m_79.w = _1957;
    float _1981 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1983 = precise::clamp(_1981, 0.0, 1.0);
    float _1985 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1971);
    float _1987 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1973);
    float _1989 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1975);
    float _1991 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1993 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1995 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1967);
    float _1997 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1963);
    float _1999 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1979);
    float _2001 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1991);
    float _2003 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1993);
    float _2005 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1985);
    float _2007 = _1995 * _1823;
    float _2009 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2011 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1987);
    float _2013 = _1997 * _1823;
    float _2015 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2009);
    float _2017 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1989);
    float _2019 = _1999 * _1823;
    float _2021 = _1995 * _1905;
    float _2023 = _1949 * _1995;
    float _2025 = _1949 * _1997;
    float _2027 = _1949 * _1999;
    float _2029 = fma(_1983, -2.0, 3.0);
    float _2031 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2001);
    float _2033 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2015);
    float _2035 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2003);
    float _2037 = fma(_2005, _1821, _2007);
    float _2039 = fma(_2011, _1821, _2013);
    float _2041 = fma(_2017, _1821, _2019);
    float _2043 = _1997 * _1905;
    float _2045 = fma(_2005, _1913, _2021);
    float _2047 = fma(_1951, _2005, _2023);
    float _2049 = fma(_2031, _1825, _2037);
    float _2051 = fma(_2033, _1825, _2039);
    float _2053 = fma(_2035, _1825, _2041);
    float _2055 = fma(_2011, _1913, _2043);
    float _2057 = fma(_1951, _2011, _2025);
    float _2059 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2061 = _1983 * _1983;
    float _2063 = _1999 * _1905;
    float _2065 = fma(_1951, _2017, _2027);
    bool _2067 = _1879 <= 8000.0;
    bool _2069 = isnan(_1879);
    bool _2071 = _2067 || _2069;
    bool _2073 = isnan(8000.0);
    bool _2075 = _2071 || _2073;
    float _2077 = float(_2075);
    float _2079 = _2061 * _2029;
    float _2081 = exp2(_2059);
    float _2083 = fma(_2017, _1913, _2063);
    float _2085 = fma(_1953, _2031, _2047);
    float _2087 = -_2079;
    float _2089 = _2087 + 1.0;
    float _2091 = in.m_81.x;
    bool _2093 = _1306 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2095 = isnan(_1306);
    bool _2097 = _2093 || _2095;
    bool _2099 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2101 = _2097 || _2099;
    float _2103 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2079);
    float _2105 = fma(_1953, _2033, _2057);
    float _2107 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1753);
    float _2109 = fma(_1953, _2035, _2065);
    float _2111 = _2077 * _2103;
    float _2113 = _2107 + _1512;
    float _2115 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2117 = -_2081;
    float _2119 = _2117 + 1.0;
    out.m_83.x = _2085;
    out.m_83.y = _2105;
    out.m_83.z = _2109;
    float _2121 = _2113 * 0.5;
    out.m_85.x = _2049;
    out.m_85.y = _2051;
    out.m_85.z = _2053;
    out.m_87.z = _2121;
    out.m_87.w = _1512;
    float _2123 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1574;
    out.gl_Position.y = _1582;
    out.gl_Position.z = _2107;
    out.gl_Position.w = _1512;
    float _2125 = fma(_2031, _1945, _2045);
    float _2127 = fma(_2033, _1945, _2055);
    float _2129 = fma(_2035, _1945, _2083);
    out.m_89.x = _2125;
    out.m_89.y = _2127;
    out.m_89.z = _2129;
    float _2131 = -_1594;
    float _2133 = _2131 + 1.0;
    float _2135 = _2133 * _2115;
    float _2137 = precise::clamp(_2135, 0.0, 1.0);
    float _2139 = -_2137;
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2143 = _2141 * _2091;
    float _2145 = _2143 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2147 = _2143;
    if (!_2101)
    {
        _2147 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2149 = _2147;
    float _2151 = _2123 * _1610;
    float _2153 = -_2123;
    float _2155 = _2153 + 1.0;
    out.m_91.x = _2145;
    float _2157 = _1621 * _2151;
    float _2159 = _1631 * _2151;
    float _2161 = _2151;
    float _2163 = _2159;
    float _2165 = _2149;
    float _2167 = _2149;
    if (!_2101)
    {
        _2161 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2169 = _2161;
    float _2171 = fma(_1627, _2157, _1615);
    float _2173 = fma(_1629, _2157, _1617);
    float _2175 = _1621 * _2155;
    float _2177 = fma(_1621, _2159, _1619);
    float _2179 = _2169;
    float _2181 = _2169;
    if (!_2101)
    {
        _2163 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2183 = _2163;
    out.m_93.x = _2171;
    out.m_93.y = _2173;
    out.m_93.z = _2177;
    out.m_93.w = _2175;
    bool _2185 = !_2101;
    float _2187 = _2183;
    float _2189 = _2183;
    if (!_2185)
    {
        bool _2191 = _1306 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2193 = isnan(_1306);
        bool _2195 = _2191 || _2193;
        bool _2197 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2199 = _2195 || _2197;
        if (!_2199)
        {
            float _2201 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2203 = _1306 + _2201;
            float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2207 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2205;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2217 = 1.0 / _2207;
            float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2221 = _2219 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2223 = _2203 * _2217;
            float _2225 = precise::clamp(_2223, 0.0, 1.0);
            float _2227 = fma(_2225, _2211, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2229 = fma(_2225, _2215, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2231 = fma(_2225, _2221, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2181 = _2229;
            _2189 = _2227;
            _2167 = _2231;
            _2233 = true;
        }
        else
        {
            bool _2235 = _1306 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2237 = isnan(_1306);
            bool _2239 = _2235 || _2237;
            bool _2241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2243 = _2239 || _2241;
            if (!_2243)
            {
                _2187 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2245 = _2187;
            _2189 = _2245;
            if (!_2243)
            {
                _2179 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2247 = _2179;
            _2181 = _2247;
            if (!_2243)
            {
                _2165 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2249 = _2165;
            bool _2251 = !_2243;
            _2167 = _2249;
            if (!_2251)
            {
                bool _2253 = _1306 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2255 = isnan(_1306);
                bool _2257 = _2253 || _2255;
                bool _2259 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2261 = _2257 || _2259;
                if (!_2261)
                {
                    float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2265 = _1306 + _2263;
                    float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2269 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2267;
                    float _2271 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2275 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2279 = 1.0 / _2269;
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2285 = _2265 * _2279;
                    float _2287 = precise::clamp(_2285, 0.0, 1.0);
                    float _2289 = fma(_2287, _2273, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2291 = fma(_2287, _2277, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2293 = fma(_2287, _2283, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2181 = _2291;
                    _2189 = _2289;
                    _2167 = _2293;
                    _2233 = true;
                }
                else
                {
                    _2181 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2189 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2167 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2233 = false;
    float _2295 = _2181;
    float _2297 = _2189;
    float _2299 = _2167;
    float _2301 = _2295 * 0.586610972881317138671875;
    bool _2303 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_95.x = 0.0;
    float _2305 = fma(_2297, 0.298911988735198974609375, _2301);
    float _2307 = fma(_2299, 0.114477999508380889892578125, _2305);
    float _2309 = -_2307;
    float _2311 = _2309 + _2297;
    float _2313 = -_2307;
    float _2315 = _2313 + _2295;
    float _2317 = -_2307;
    float _2319 = _2317 + _2299;
    float _2321 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2323 = fma(_2311, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2307);
    float _2325 = fma(_2315, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2307);
    float _2327 = fma(_2319, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2307);
    out.m_49.x = _2321;
    out.m_97.x = _2323;
    out.m_97.y = _2325;
    out.m_97.z = _2327;
    if (!_2303)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2329 = -_1272;
    float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2333 = -_1274;
    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2337 = -_1276;
    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2341 = _2331 * _2331;
    float _2343 = fma(_2335, _2335, _2341);
    float _2345 = fma(_2339, _2339, _2343);
    float _2347 = sqrt(_2345);
    float _2349 = rsqrt(_2345);
    float _2351 = -_2347;
    float _2353 = _2351 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2355 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2357 = precise::clamp(_2355, 0.0, 1.0);
    float _2359 = _2335 * _2349;
    float _2361 = _2331 * _2349;
    float _2363 = abs(_2357);
    float _2365 = log2(_2363);
    float _2367 = _2339 * _2349;
    float _2369 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2371 = _2127 * _2361;
    float _2373 = -_2361;
    float _2375 = -_2369;
    float _2377 = fma(_2373, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2375);
    float _2379 = fma(_2125, _2359, _2371);
    float _2381 = -_2367;
    float _2383 = fma(_2381, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2377);
    float _2385 = fma(_2129, _2367, _2379);
    float _2387 = precise::clamp(_2385, 0.0, 1.0);
    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2391 = _2383 + _2389;
    float _2393 = _2365 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2395 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2397 = precise::clamp(_2395, 0.0, 1.0);
    float _2399 = exp2(_2393);
    float _2401 = _2399 * _2397;
    float _2403 = _2387 * _2401;
    float _2405 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2407 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2409 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2405;
    out.m_95.y = _2407;
    out.m_95.z = _2409;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2233 = false;
    bool _222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_49.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2466 = as_type<float>(_132);
        out.gl_Position.z = _2466;
    }
    if (!_120)
    {
        return out;
    }
    float _136 = in.m_51.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_116);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _126;
    if (_164)
    {
        out.m_49.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2535 = as_type<float>(_170);
        out.gl_Position.z = _2535;
    }
    if (_164)
    {
        return out;
    }
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = _174 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _182 = _174 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _184 = _174 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _186 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].x, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].z, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].z, _188);
    float _196 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].z, _190);
    bool _198 = !_178;
    float _200 = _196;
    float _202 = _194;
    float _220;
    if (!_198)
    {
        float _204 = in.m_55.x;
        float _206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _210 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _212 = _210 * _206;
        float _214 = floor(_212);
        float _216 = -_214;
        float _218 = _212 + _216;
        _220 = _218;
        _222 = true;
    }
    else
    {
        float _224 = float(_116);
        float _226 = 1.0 / _224;
        float _228 = _150 * _226;
        _220 = _228;
    }
    _222 = false;
    float _230 = _220;
    float _232 = in.m_55.x;
    float _234 = in.m_55.y;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _238 = _230 + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _246 = _244 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = in.m_55.z;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _252 = _250 != 0;
    float _254 = 1.0 / _242;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _230 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _272 = 1.0 / _246;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _230 + _278;
    float _282 = _232 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _284 = 1.0 / _258;
    float _286 = -_274;
    float _288 = fma(_282, 2.0, _286);
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _300 = _298 != 0;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = _230 + _306;
    float _310 = _262 * _272;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = _230 + _312;
    float _316 = 1.0 / _266;
    float _318 = _248 * 2.0;
    float _320 = _308 * _254;
    float _322 = _232 * 2.0;
    float _324 = _234 + _248;
    float _326 = 0.0;
    if (!_252)
    {
        _326 = _248;
    }
    float _328 = _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _330;
    float _334 = 0.0;
    float _336 = _328;
    if (!_252)
    {
        _334 = _248;
    }
    float _338 = _334;
    float _340 = 1.0 / _304;
    float _342 = _324 + (-1.0);
    float _344 = _314 * _284;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _346;
    float _350 = _338;
    if (_252)
    {
        _336 = _234;
    }
    float _352 = _336;
    float _354 = -_150;
    float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[76].x, _288);
    if (_252)
    {
        _350 = _234;
    }
    float _358 = _350;
    float _360 = 1.0 / _270;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _362;
    float _366 = fma(_364, _320, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _368 = _238 * _340;
    float _370 = _232 + _248;
    float _372 = floor(_318);
    float _374 = _234 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _376 = _370 + (-1.0);
    bool _378 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _380 = isnan(_230);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = fma(_374, -2.0, _276);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _394 = _230 + _392;
    float _396 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _398 = _234 * 2.0;
    float _400 = floor(_322);
    float _402 = _394 * _316;
    float _404 = _280 * _360;
    float _406 = fma(_348, _402, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _410 = _372 > 0.0;
    float _412 = floor(_398);
    bool _414 = _372 >= 0.0;
    bool _416 = isnan(_372);
    bool _418 = _414 || _416;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    float _424 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _426 = _234 + _232;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _428;
    int _432 = _422 ? 0 : 1;
    float _434 = -_388;
    float _436 = _434 + 1.0;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _438;
    float _442 = _426 + (-1.0);
    bool _444 = _400 >= 0.0;
    bool _446 = isnan(_400);
    bool _448 = _444 || _446;
    bool _450 = isnan(0.0);
    bool _452 = _448 || _450;
    float _454 = fma(_430, _320, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _456 = fma(_440, _320, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _458 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _460 = _452 ? 0 : 1;
    float _462 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[83].w, _408);
    float _464 = _442;
    if (!_252)
    {
        _464 = _234;
    }
    float _466 = _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _468;
    bool _472 = _412 > 0.0;
    float _474 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _390);
    bool _476 = _412 >= 0.0;
    bool _478 = isnan(_412);
    bool _480 = _476 || _478;
    bool _482 = isnan(0.0);
    bool _484 = _480 || _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _490 = _466;
    bool _492 = _472;
    int _494 = as_type<int>(_474);
    if (_252)
    {
        _490 = _232;
    }
    float _496 = _490;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _502 = _400 > 0.0;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _516 = fma(_488, _310, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _518 = fma(_500, _310, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _524 = fma(_510, _404, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _526 = fma(_514, _404, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _532;
    float _536 = fma(_506, _310, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _538 = fma(_470, _402, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _540 = fma(_522, _404, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _542 = fma(_530, _344, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _544;
    bool _548 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _550 = isnan(_230);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = fma(_534, _344, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    bool _562 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _564 = isnan(_230);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = fma(_332, _402, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _576 = fma(_546, _344, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _578 = -_558;
    float _580 = _578 + 1.0;
    bool _582 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _584 = isnan(_230);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -_572;
    float _596 = _594 + 1.0;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _602 = _572 * _580;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _608 = _592 * _596;
    float _610 = -_592;
    float _612 = _610 + 1.0;
    float _614 = fma(_600, _368, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    bool _616 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _618 = isnan(_230);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = fma(_606, _368, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    bool _630 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _632 = isnan(_230);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = _388 * _612;
    bool _644 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _646 = isnan(_230);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = _626 * _436;
    float _658 = -_626;
    float _660 = _658 + 1.0;
    float _662 = _352 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _664 = _640 * _660;
    float _666 = -_640;
    float _668 = _666 + 1.0;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _674 = _654 * _668;
    float _676 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[83].z, _670);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _684 = _456 * _674;
    float _686 = fma(_662, -2.0, _672);
    float _688 = fma(_680, _368, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _690 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _692 = log2(_690);
    float _694 = _496 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _696 = _454 * _674;
    float _698 = _366 * _674;
    float _700 = -_654;
    float _702 = _700 + 1.0;
    bool _704 = !_292;
    int _706 = _704 ? 0 : 1;
    float _708 = -_682;
    float _710 = fma(_694, 2.0, _708);
    int _712 = _484 ? 0 : 1;
    float _714 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].x, _684);
    float _716 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].y, _696);
    float _718 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].z, _698);
    int _720 = ~_432;
    int _722 = _720 + 1;
    int _724 = _722 + 1;
    float _726 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _676);
    int _728 = ~_460;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    float _734 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _462);
    int _736 = abs(_706);
    float _738 = -_150;
    float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[81].x, _710);
    int _742 = _724;
    int _744 = _732;
    if (!_410)
    {
        int _746 = ~_432;
        int _748 = _746 + 1;
        _742 = _748;
    }
    int _750 = _742;
    float _752 = fma(_516, _664, _714);
    if (!_502)
    {
        int _754 = ~_460;
        int _756 = _754 + 1;
        _744 = _756;
    }
    int _758 = _744;
    float _760 = _692 * _150;
    float _762 = fma(_518, _664, _716);
    float _764 = float(_736);
    float _766 = fma(_536, _664, _718);
    float _768 = float(_750);
    float _770 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _686);
    float _772 = exp2(_760);
    float _774 = fma(_406, _656, _762);
    float _776 = _764 * _768;
    float _778 = in.m_57.x;
    float _780 = in.m_57.y;
    float _782 = in.m_57.z;
    bool _784 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _786 = isnan(1.0);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _792 = _788 || _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _796 = 1.0 + _794;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _800 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _802 = isnan(0.0);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _808 = _804 || _806;
    float _810 = 1.0 / _796;
    int _812 = ~_712;
    int _814 = _812 + 1;
    int _816 = _814 + 1;
    float _818 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[78].z, _798);
    bool _820 = !_296;
    int _822 = _820 ? 0 : 1;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _826 = -_772;
    float _828 = _826 + 1.0;
    int _830 = _816;
    if (!_472)
    {
        int _832 = ~_712;
        int _834 = _832 + 1;
        _830 = _834;
    }
    int _836 = _830;
    float _838 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _818);
    int _840 = abs(_822);
    float _842 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[78].w, _824);
    float _844 = _808 ? _828 : 0.0;
    float _846 = _776 * (-2.0);
    float _848 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _842);
    bool _850 = !_300;
    int _852 = _850 ? 0 : 1;
    float _854 = _232 + (-0.5);
    float _856 = _848;
    if (_792)
    {
        float _858 = _844 * _810;
        _154 = _858;
    }
    float _860 = _154;
    float _862 = float(_836);
    float _864 = fma(_846, _778, _778);
    float _866 = float(_840);
    float _868 = fma(_538, _656, _752);
    float _870 = float(_758);
    float _872 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[196].x, _864);
    int _874 = abs(_852);
    float _876 = fma(_524, _642, _868);
    float _878 = fma(_458, _846, _458);
    float _880 = _866 * _870;
    float _882 = _234 + (-0.5);
    float _884 = fma(_542, _608, _876);
    float _886 = _880 * (-2.0);
    float _888 = float(_874);
    float _890 = fma(_878, _860, _872);
    float _892 = fma(_628, _602, _884);
    float _894 = fma(_886, _780, _780);
    float _896 = fma(_424, _886, _424);
    float _898 = _888 * _862;
    float _900 = fma(_574, _656, _766);
    float _902 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[196].y, _894);
    float _904 = fma(_526, _642, _774);
    float _906 = _898 * (-2.0);
    float _908 = fma(_540, _642, _900);
    float _910 = fma(_896, _860, _902);
    float _912 = in.m_59.x;
    float _914 = in.m_59.y;
    float _916 = in.m_59.z;
    float _918 = fma(_906, _782, _782);
    float _920 = _248 + (-0.5);
    float _922 = fma(_396, _906, _396);
    float _924 = in.m_61.x;
    float _926 = in.m_61.y;
    float _928 = in.m_61.z;
    float _930 = fma(_576, _608, _908);
    float _932 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[196].z, _918);
    float _934 = fma(_560, _608, _904);
    float _936 = _890 * 0.15915493667125701904296875;
    float _938 = fma(_688, _602, _930);
    float _940 = fma(_922, _860, _932);
    float _942 = fma(_614, _602, _934);
    float _944 = _910 * 0.15915493667125701904296875;
    float _946 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[149].x, _892);
    float _948 = _940 * 0.15915493667125701904296875;
    float _950 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[149].z, _938);
    float _952 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[149].y, _942);
    float _954 = _936 * 6.283185482025146484375;
    float _956 = cos(_954);
    float _958 = _944 * 6.283185482025146484375;
    float _960 = sin(_958);
    float _962 = _952 * _926;
    float _964 = _950 * _928;
    float _966 = _946 * _924;
    float _968 = in.m_46.x;
    float _970 = in.m_46.y;
    float _972 = in.m_46.z;
    float _974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _914);
    float _976 = _944 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _962 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _912);
    float _984 = _966 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _916);
    float _988 = _974 * _980;
    float _990 = _964 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _992 = _982 * _984;
    float _994 = _936 * 6.283185482025146484375;
    float _996 = sin(_994);
    float _998 = _956 * _960;
    float _1000 = _986 * _990;
    float _1002 = _948 * 6.283185482025146484375;
    float _1004 = cos(_1002);
    float _1006 = _956 * _978;
    float _1008 = _948 * 6.283185482025146484375;
    float _1010 = sin(_1008);
    float _1012 = _996 * _960;
    float _1014 = _996 * _978;
    float _1016 = _956 * _1004;
    float _1018 = _996 * _1004;
    float _1020 = _978 * _1004;
    float _1022 = _960 * _1004;
    float _1024 = _1016 * _988;
    float _1026 = fma(_1010, _1006, _1012);
    float _1028 = -_988;
    float _1030 = _1010 * _1028;
    float _1032 = -_998;
    float _1034 = fma(_1010, _1014, _1032);
    float _1036 = _1018 * _988;
    float _1038 = -_1014;
    float _1040 = fma(_1010, _998, _1038);
    float _1042 = fma(_1026, _992, _1024);
    float _1044 = fma(_1020, _992, _1030);
    float _1046 = fma(_1034, _992, _1036);
    float _1048 = fma(_1010, _1012, _1006);
    float _1050 = fma(_1040, _1000, _1042);
    float _1052 = _970 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1054 = fma(_1022, _1000, _1044);
    float _1056 = fma(_1048, _1000, _1046);
    float _1058 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1060 = _970 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1062 = fma(_968, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1052);
    float _1064 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1066 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1058);
    float _1068 = fma(_968, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1060);
    float _1070 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1062);
    float _1072 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1064);
    float _1074 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1066);
    float _1076 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1068);
    float _1078 = _1070 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1080 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1072);
    float _1082 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1084 = _1076 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1086 = _970 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1088 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1090 = _1078 + _1082;
    float _1092 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1094 = fma(_968, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1086);
    float _1096 = _1084 + _1088;
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1100 = _1090 + _1098;
    float _1102 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1092);
    float _1104 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1094);
    float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1108 = _1096 + _1106;
    float _1110 = _1100 * _1100;
    float _1112 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1102);
    float _1114 = _1104 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1116 = fma(_1108, _1108, _1110);
    float _1118 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1120 = sqrt(_1116);
    float _1122 = _1114 + _1118;
    bool _1124 = _1120 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1126 = _968;
    float _1128 = _972;
    float _1130 = _1104;
    float _1132 = _1100;
    float _1134 = _932;
    if (!_1124)
    {
        _1126 = _1096;
    }
    float _1136 = _1126;
    float _1138 = _1136;
    if (!_1124)
    {
        _1128 = _1090;
    }
    float _1140 = _1128;
    float _1142 = _1140;
    if (!_1124)
    {
        _1130 = _1122;
    }
    float _1144 = _1130;
    bool _1146 = !_1124;
    float _1148 = _1144;
    if (!_1146)
    {
        float _1150 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1154 = _1120 + _1152;
        float _1156 = _1122 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1158 = rsqrt(_1116);
        float _1160 = _1154 * _1150;
        float _1162 = _1160 * 0.15915493667125701904296875;
        float _1164 = _1162 * 6.283185482025146484375;
        float _1166 = cos(_1164);
        float _1168 = _1162 * 6.283185482025146484375;
        float _1170 = sin(_1168);
        float _1172 = _1166 + (-1.0);
        float _1174 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1176 = fma(_1170, _1156, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1178 = fma(_1122, _1166, _1174);
        float _1180 = _1158 * _1176;
        float _1182 = fma(_1108, _1180, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1184 = fma(_1100, _1180, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1148 = _1178;
        _1138 = _1182;
        _1142 = _1184;
    }
    float _1186 = _1148;
    float _1188 = _1138;
    float _1190 = _1142;
    float _1192 = -_1114;
    float _1194 = _1192 + _1186;
    float _1196 = -_1084;
    float _1198 = _1196 + _1188;
    float _1200 = -_1078;
    float _1202 = _1200 + _1190;
    float _1204 = _1194 * _1194;
    float _1206 = fma(_1198, _1198, _1204);
    float _1208 = fma(_1202, _1202, _1206);
    float _1210 = sqrt(_1208);
    bool _1212 = _1210 > 0.0;
    bool _1214 = !_1212;
    float _1216 = _1186;
    float _1218 = _1188;
    float _1220 = _1190;
    float _1222 = _1208;
    float _1224 = _1198;
    if (!_1214)
    {
        float _1226 = _194 * _194;
        float _1228 = fma(_192, _192, _1226);
        float _1230 = rsqrt(_1208);
        float _1232 = fma(_196, _196, _1228);
        float _1234 = sqrt(_1232);
        float _1236 = _1198 * _1230;
        float _1238 = _1194 * _1230;
        float _1240 = _1202 * _1230;
        bool _1242 = _1234 > 0.0;
        bool _1244 = !_1242;
        _1132 = _1232;
        if (!_1244)
        {
            float _1246 = rsqrt(_1232);
            float _1248 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1250 = _194 * _1246;
            float _1252 = _192 * _1246;
            float _1254 = _196 * _1246;
            float _1256 = _1238 * _1250;
            float _1258 = fma(_1236, _1252, _1256);
            float _1260 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1262 = fma(_1240, _1254, _1258);
            float _1264 = _1262 * _1260;
            float _1266 = fma(_192, _1264, _1188);
            float _1268 = fma(_194, _1264, _1186);
            float _1270 = fma(_196, _1264, _1190);
            _1216 = _1268;
            _1218 = _1266;
            _1220 = _1270;
            _1222 = _1252;
            _1224 = _1258;
        }
    }
    float _1272 = _1216;
    float _1274 = _1218;
    float _1276 = _1220;
    float _1278 = _1132;
    float _1280 = _1222;
    float _1282 = _1224;
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1286 = _1272 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1290 = _1274 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1294 = _1276 + _1292;
    float _1296 = _1286 * _1286;
    float _1298 = fma(_1290, _1290, _1296);
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1302 = fma(_1294, _1294, _1298);
    float _1304 = rsqrt(_1302);
    float _1306 = sqrt(_1302);
    float _1308 = _1304 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1310 = _1290 * _1308;
    float _1312 = _1294 * _1308;
    float _1314 = _1310 * _1310;
    float _1316 = _1312 * _1312;
    float _1318 = _1314 + _1316;
    float _1320 = sqrt(_1318);
    bool _1322 = _1320 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1326 = _1320 + _1324;
    float _1328 = _1278;
    float _1330 = _1326;
    float _1332 = _1282;
    float _1334 = _1310;
    if (_1322)
    {
        float _1336 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1328 = _1336;
    }
    float _1338 = _1328;
    if (_1322)
    {
        float _1340 = rsqrt(_1318);
        _200 = _1340;
    }
    float _1342 = _200;
    float _1344 = _1342;
    if (_1322)
    {
        float _1346 = _1326 * _1338;
        _1330 = _1346;
    }
    float _1348 = _1330;
    if (_1322)
    {
        float _1350 = _1348 * 0.15915493667125701904296875;
        _1332 = _1350;
    }
    float _1352 = _1332;
    float _1354 = _1280;
    if (_1322)
    {
        float _1356 = _1352 * 6.283185482025146484375;
        float _1358 = sin(_1356);
        _1354 = _1358;
    }
    float _1360 = _1354;
    float _1362 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1364 = precise::max(0.0, _1362);
    float _1366 = _1338;
    float _1368 = _1364;
    if (_1322)
    {
        float _1370 = _1352 * 6.283185482025146484375;
        float _1372 = cos(_1370);
        _1366 = _1372;
    }
    float _1374 = _1366;
    float _1376 = -_1308;
    float _1378 = -_1364;
    float _1380 = fma(_1286, _1376, _1378);
    if (_1322)
    {
        float _1382 = _1380 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _202 = _1382;
    }
    float _1384 = _202;
    float _1386 = _1384;
    float _1388 = _1360;
    if (_1322)
    {
        float _1390 = fma(_1360, _1384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1386 = _1390;
    }
    float _1392 = _1386;
    float _1394 = _1392;
    if (!_1322)
    {
        _1388 = _1314;
    }
    float _1396 = _1388;
    float _1398 = _1396;
    if (_1322)
    {
        float _1400 = _1374 + (-1.0);
        _1368 = _1400;
    }
    float _1402 = _1368;
    float _1404 = _1402;
    if (_1322)
    {
        float _1406 = _1342 * _1392;
        _1134 = _1406;
    }
    float _1408 = _1134;
    if (!_1322)
    {
        _1394 = _1380;
    }
    float _1410 = _1394;
    float _1412 = _1410;
    if (_1322)
    {
        float _1414 = _1402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1344 = _1414;
    }
    float _1416 = _1344;
    float _1418 = _1416;
    if (_1322)
    {
        float _1420 = _1310 * _1408;
        _1334 = _1420;
    }
    float _1422 = _1334;
    if (!_1322)
    {
        _1404 = _1312;
    }
    float _1424 = _1404;
    float _1426 = _1424;
    if (_1322)
    {
        float _1428 = _1312 * _1408;
        _1426 = _1428;
    }
    float _1430 = _1426;
    if (_1322)
    {
        float _1432 = fma(_1380, _1374, _1416);
        _1412 = _1432;
    }
    float _1434 = _1412;
    if (_1322)
    {
        float _1436 = _1422 * _1422;
        _1398 = _1436;
    }
    float _1438 = _1398;
    if (!_1322)
    {
        _1418 = _1316;
    }
    float _1440 = _1418;
    float _1442 = _1440;
    if (_1322)
    {
        float _1444 = _1430 * _1430;
        _1442 = _1444;
    }
    float _1446 = _1442;
    float _1448 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1450 = fma(_1434, _1434, _1438);
    float _1452 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1454 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1456 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1448);
    float _1458 = _1450 + _1446;
    float _1460 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1462 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1452);
    float _1464 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1456);
    float _1466 = fma(_1084, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1468 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1460);
    float _1470 = rsqrt(_1458);
    float _1472 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1474 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1468);
    float _1476 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1462);
    float _1478 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1454);
    float _1480 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1482 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1486 = fma(_1306, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1484);
    float _1488 = precise::clamp(_1486, 0.0, 1.0);
    float _1490 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1478);
    float _1492 = _1476 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1494 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1480);
    float _1496 = -_1488;
    float _1498 = _1496 + 1.0;
    float _1500 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1502 = floor(_1466);
    float _1504 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1494);
    float _1506 = _1470 * _1422;
    float _1508 = _1470 * _1434;
    float _1510 = _1470 * _1430;
    float _1512 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1504);
    float _1514 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1516 = fma(_1078, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1518 = abs(_1498);
    float _1520 = log2(_1518);
    float _1522 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1524 = -_1514;
    float _1526 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1524);
    float _1528 = -_1510;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1526);
    float _1532 = _1492 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1534 = floor(_1516);
    float _1536 = fma(_1530, -0.5, 0.5);
    float _1538 = fma(_1530, 0.5, 0.5);
    float _1540 = -_1502;
    float _1542 = _1466 + _1540;
    float _1544 = -_1532;
    float _1546 = fma(_1544, _1300, 1.0);
    float _1548 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1550 = fma(_1538, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1552 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1554 = sqrt(_1536);
    float _1556 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1548);
    float _1558 = fma(_1538, _1550, -0.212114393711090087890625);
    float _1560 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1522);
    float _1562 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1556);
    float _1564 = fma(_1538, _1558, 1.570728778839111328125);
    float _1566 = -_1534;
    float _1568 = _1516 + _1566;
    float _1570 = 1.0 / _1512;
    float _1572 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1560);
    float _1574 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1562);
    float _1576 = _1508 + 1.0;
    float _1578 = exp2(_1552);
    float _1580 = _1554 * 0.636619746685028076171875;
    float _1582 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1572);
    float _1584 = log2(_1546);
    float _1586 = _1574 * _1570;
    float _1588 = _1582 * _1570;
    float _1590 = -_1564;
    float _1592 = fma(_1580, _1590, 1.0);
    float2 _4834 = float2(_1542, _1568);
    float _1594 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4834, float2(0.0), isnan(_4834)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4834, float2(0.0), isnan(_4834)), level(0.0)).x;
    float _1596 = fma(_1586, 0.5, 0.5);
    float _1598 = -_1508;
    float _1600 = fma(_1578, _1576, _1598);
    float _1602 = fma(_1600, 0.5, 0.5);
    float _1604 = fma(_1588, -0.5, 0.5);
    float _1606 = _1584 * 0.693147182464599609375;
    float _1608 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4864 = float3(_1596, _1604, _1608);
    float _1610 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4864, float3(0.0), isnan(_4864)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4864, float3(0.0), isnan(_4864)), level(0.0)).x;
    float3 _4875 = float3(_1596, _1604, _1608);
    float4 _1613 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4875, float3(0.0), isnan(_4875)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4875, float3(0.0), isnan(_4875)), level(0.0)).xyzw;
    float _1615 = _1613.x;
    float _1617 = _1613.y;
    float _1619 = _1613.z;
    float _1621 = _1613.w;
    float2 _4891 = float2(_1592, _1602);
    float3 _1625 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4891, float2(0.0), isnan(_4891)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4891, float2(0.0), isnan(_4891)), level(0.0)).xyz;
    float _1627 = _1625.x;
    float _1629 = _1625.y;
    float _1631 = _1625.z;
    float _1633 = in.m_63.w;
    float _1635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1637 = _234 > 0.5;
    float _1639 = in.m_63.x;
    int _1641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1643 = _1641 != 0;
    float _1645 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1649 = _1647 != 0;
    float _1651 = in.m_63.y;
    int _1653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1655 = _1653 != 0;
    float _1657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1659 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1661 = in.m_63.z;
    float _1663 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1665 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1659);
    float _1667 = in.m_55.w;
    float _1669 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1663);
    if (_1643)
    {
        bool _1671 = _248 > 0.5;
        _492 = _1671;
    }
    bool _1673 = _492;
    float _1675 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1665);
    float _1677 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1669);
    float _1679 = in.m_65.x;
    float _1681 = _1677 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_67.w = _1633;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1689 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1691 = in.m_65.y;
    float _1693 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1639;
    float _1699 = _1635 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1703 = _1701 != 0;
    out.m_67.y = _1651;
    bool _1705 = _1667 > 0.5;
    float _1707 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_67.z = _1661;
    float _1709 = _1707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1711 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_69.x = _1693;
    out.m_69.y = _1695;
    out.m_69.z = _1697;
    out.m_69.w = _1689;
    float _1713 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1717 = 1.0 / _1681;
    float _1719 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1723 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    bool _1725 = _1703;
    float _1727 = _1715;
    int _1729 = as_type<int>(_1699);
    float _1731 = _1679;
    float _1733 = _1711;
    if (_1649)
    {
        float _1735 = in.m_55.x;
        _1723 = _1735;
    }
    float _1737 = _1723;
    float _1739 = -_1691;
    float _1741 = _1739 + 1.0;
    float _1743 = _1719 + _1681;
    float _1745 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1747 = _1713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1749 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1645);
    out.m_71.x = _1290;
    out.m_71.y = _1286;
    out.m_71.z = _1294;
    int _1751 = _1637 ? as_type<int>(_1741) : as_type<int>(_1691);
    float _1753 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1749);
    bool _1755 = _914 != 0.0;
    bool _1757 = isnan(_914);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan(0.0);
    bool _1763 = _1759 || _1761;
    out.m_73.x = _1745;
    out.m_73.y = _1747;
    out.m_73.z = _1709;
    out.m_73.w = _1715;
    float _1765 = _1743 * _1717;
    float _1767 = _1765 * 0.5;
    bool _1769 = _912 == 0.0;
    bool _1771 = !_1763;
    bool _1773 = _1769 && _1771;
    float _1775 = in.m_75.x;
    float _1777 = in.m_75.y;
    float _1779 = in.m_75.z;
    float _1781 = _1703 ? as_type<float>(_1751) : _1691;
    float _1783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1785 = _1691;
    float _1787 = _1745;
    if (_1655)
    {
        float _1789 = _1705 ? _1741 : _1691;
        _1785 = _1789;
    }
    float _1791 = _1785;
    float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1795 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1793);
    bool _1797 = _916 == 0.0;
    bool _1799 = _1797 && _1773;
    float _1801 = fma(_1699, _1781, -0.5);
    float _1803 = fma(_1711, _1791, -0.5);
    if (_1649)
    {
        bool _1805 = _1737 > 0.5;
        _1725 = _1805;
    }
    bool _1807 = _1725;
    float _1809 = 1.0 / _1795;
    if (!_1649)
    {
        _1727 = _1679;
    }
    float _1811 = _1727;
    float _1813 = -_474;
    float _1815 = fma(_848, _1801, _1813);
    float _1817 = -_770;
    float _1819 = fma(_734, _1803, _1817);
    float _1821 = in.m_77.x;
    float _1823 = in.m_77.y;
    float _1825 = in.m_77.z;
    float _1827 = in.m_77.w;
    float _1829 = _1811;
    if (!_1649)
    {
        _1787 = _1811;
    }
    float _1831 = _1787;
    float _1833 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1835 = _1831;
    if (_1649)
    {
        _1829 = _1679;
    }
    float _1837 = _1829;
    float _1839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1841 = _1837;
    if (_1649)
    {
        float _1843 = -_1837;
        float _1845 = _1843 + 1.0;
        _494 = as_type<int>(_1845);
    }
    int _1847 = _494;
    float _1849 = as_type<float>(_1847);
    if (_1643)
    {
        float _1851 = -_1837;
        float _1853 = _1851 + 1.0;
        _1729 = as_type<int>(_1853);
    }
    int _1855 = _1729;
    float _1857 = _1775;
    if (_1799)
    {
        _1731 = _1777;
    }
    float _1859 = _1731;
    float _1861 = _1859;
    if (_1799)
    {
        _1733 = _1775;
    }
    float _1863 = _1733;
    float _1865 = _1863;
    if (_1649)
    {
        float _1867 = _1807 ? as_type<float>(_1847) : _1837;
        _1835 = _1867;
    }
    float _1869 = _1835;
    if (_1799)
    {
        _1849 = _1859;
    }
    float _1871 = _1849;
    float _1873 = _1871;
    if (!_1799)
    {
        _1861 = _1777;
    }
    float _1875 = _1861;
    float _1877 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1879 = _1809 * _1877;
    float _1881 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1643)
    {
        float _1883 = _1673 ? as_type<float>(_1855) : _1837;
        _1841 = _1883;
    }
    float _1885 = _1841;
    float _1887 = _1839 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1889 = abs(_1879);
    float _1891 = log2(_1889);
    if (_1799)
    {
        _856 = _1863;
    }
    float _1893 = _856;
    float _1895 = fma(_1881, _1869, -0.5);
    float _1897 = _1893;
    if (!_1799)
    {
        _1865 = _1775;
    }
    float _1899 = _1865;
    float _1901 = fma(_1887, _1885, -0.5);
    if (!_1799)
    {
        float _1903 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1875);
        _1873 = _1903;
    }
    float _1905 = _1873;
    float _1907 = _1823 * _1779;
    float _1909 = fma(_838, _1895, _356);
    if (!_1799)
    {
        float _1911 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1899);
        _1897 = _1911;
    }
    float _1913 = _1897;
    float _1915 = fma(_726, _1901, _740);
    float _1917 = _1821 * _1875;
    float _1919 = _1825 * _1899;
    float _1921 = _1815 + 0.5;
    float _1923 = _1915 + 0.5;
    float _1925 = -_1917;
    float _1927 = fma(_1823, _1899, _1925);
    float _1929 = -_1919;
    float _1931 = fma(_1821, _1779, _1929);
    float _1933 = _1891 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1935 = -_1907;
    float _1937 = fma(_1825, _1875, _1935);
    if (_1799)
    {
        _1857 = _1779;
    }
    float _1939 = _1857;
    float _1941 = _1939;
    if (!_1799)
    {
        float _1943 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1779);
        _1941 = _1943;
    }
    float _1945 = _1941;
    float _1947 = exp2(_1933);
    float _1949 = _1931 * _1827;
    float _1951 = _1937 * _1827;
    float _1953 = _1927 * _1827;
    float _1955 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1957 = _1819 + 0.5;
    float _1959 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1961 = -_1010;
    float _1963 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1833);
    float _1965 = -_1010;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1955);
    float _1969 = _1909 + 0.5;
    float _1971 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1973 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1975 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1977 = -_1010;
    float _1979 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1959);
    out.m_79.x = _1969;
    out.m_79.y = _1921;
    out.m_79.z = _1923;
    out.m_79.w = _1957;
    float _1981 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1983 = precise::clamp(_1981, 0.0, 1.0);
    float _1985 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1971);
    float _1987 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1973);
    float _1989 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1975);
    float _1991 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1993 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1995 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1967);
    float _1997 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1963);
    float _1999 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1979);
    float _2001 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1991);
    float _2003 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1993);
    float _2005 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1985);
    float _2007 = _1995 * _1823;
    float _2009 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2011 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1987);
    float _2013 = _1997 * _1823;
    float _2015 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2009);
    float _2017 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1989);
    float _2019 = _1999 * _1823;
    float _2021 = _1995 * _1905;
    float _2023 = _1949 * _1995;
    float _2025 = _1949 * _1997;
    float _2027 = _1949 * _1999;
    float _2029 = fma(_1983, -2.0, 3.0);
    float _2031 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2001);
    float _2033 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2015);
    float _2035 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2003);
    float _2037 = fma(_2005, _1821, _2007);
    float _2039 = fma(_2011, _1821, _2013);
    float _2041 = fma(_2017, _1821, _2019);
    float _2043 = _1997 * _1905;
    float _2045 = fma(_2005, _1913, _2021);
    float _2047 = fma(_1951, _2005, _2023);
    float _2049 = fma(_2031, _1825, _2037);
    float _2051 = fma(_2033, _1825, _2039);
    float _2053 = fma(_2035, _1825, _2041);
    float _2055 = fma(_2011, _1913, _2043);
    float _2057 = fma(_1951, _2011, _2025);
    float _2059 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2061 = _1983 * _1983;
    float _2063 = _1999 * _1905;
    float _2065 = fma(_1951, _2017, _2027);
    bool _2067 = _1879 <= 8000.0;
    bool _2069 = isnan(_1879);
    bool _2071 = _2067 || _2069;
    bool _2073 = isnan(8000.0);
    bool _2075 = _2071 || _2073;
    float _2077 = float(_2075);
    float _2079 = _2061 * _2029;
    float _2081 = exp2(_2059);
    float _2083 = fma(_2017, _1913, _2063);
    float _2085 = fma(_1953, _2031, _2047);
    float _2087 = -_2079;
    float _2089 = _2087 + 1.0;
    float _2091 = in.m_81.x;
    bool _2093 = _1306 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2095 = isnan(_1306);
    bool _2097 = _2093 || _2095;
    bool _2099 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2101 = _2097 || _2099;
    float _2103 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2079);
    float _2105 = fma(_1953, _2033, _2057);
    float _2107 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1753);
    float _2109 = fma(_1953, _2035, _2065);
    float _2111 = _2077 * _2103;
    float _2113 = _2107 + _1512;
    float _2115 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2117 = -_2081;
    float _2119 = _2117 + 1.0;
    out.m_83.x = _2085;
    out.m_83.y = _2105;
    out.m_83.z = _2109;
    float _2121 = _2113 * 0.5;
    out.m_85.x = _2049;
    out.m_85.y = _2051;
    out.m_85.z = _2053;
    out.m_87.z = _2121;
    out.m_87.w = _1512;
    float _2123 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1574;
    out.gl_Position.y = _1582;
    out.gl_Position.z = _2107;
    out.gl_Position.w = _1512;
    float _2125 = fma(_2031, _1945, _2045);
    float _2127 = fma(_2033, _1945, _2055);
    float _2129 = fma(_2035, _1945, _2083);
    out.m_89.x = _2125;
    out.m_89.y = _2127;
    out.m_89.z = _2129;
    float _2131 = -_1594;
    float _2133 = _2131 + 1.0;
    float _2135 = _2133 * _2115;
    float _2137 = precise::clamp(_2135, 0.0, 1.0);
    float _2139 = -_2137;
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2143 = _2141 * _2091;
    float _2145 = _2143 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2147 = _2143;
    if (!_2101)
    {
        _2147 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2149 = _2147;
    float _2151 = _2123 * _1610;
    float _2153 = -_2123;
    float _2155 = _2153 + 1.0;
    out.m_91.x = _2145;
    float _2157 = _1621 * _2151;
    float _2159 = _1631 * _2151;
    float _2161 = _2151;
    float _2163 = _2159;
    float _2165 = _2149;
    float _2167 = _2149;
    if (!_2101)
    {
        _2161 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2169 = _2161;
    float _2171 = fma(_1627, _2157, _1615);
    float _2173 = fma(_1629, _2157, _1617);
    float _2175 = _1621 * _2155;
    float _2177 = fma(_1621, _2159, _1619);
    float _2179 = _2169;
    float _2181 = _2169;
    if (!_2101)
    {
        _2163 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2183 = _2163;
    out.m_93.x = _2171;
    out.m_93.y = _2173;
    out.m_93.z = _2177;
    out.m_93.w = _2175;
    bool _2185 = !_2101;
    float _2187 = _2183;
    float _2189 = _2183;
    if (!_2185)
    {
        bool _2191 = _1306 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2193 = isnan(_1306);
        bool _2195 = _2191 || _2193;
        bool _2197 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2199 = _2195 || _2197;
        if (!_2199)
        {
            float _2201 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2203 = _1306 + _2201;
            float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2207 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2205;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2217 = 1.0 / _2207;
            float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2221 = _2219 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2223 = _2203 * _2217;
            float _2225 = precise::clamp(_2223, 0.0, 1.0);
            float _2227 = fma(_2225, _2211, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2229 = fma(_2225, _2215, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2231 = fma(_2225, _2221, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2181 = _2229;
            _2189 = _2227;
            _2167 = _2231;
            _2233 = true;
        }
        else
        {
            bool _2235 = _1306 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2237 = isnan(_1306);
            bool _2239 = _2235 || _2237;
            bool _2241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2243 = _2239 || _2241;
            if (!_2243)
            {
                _2187 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2245 = _2187;
            _2189 = _2245;
            if (!_2243)
            {
                _2179 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2247 = _2179;
            _2181 = _2247;
            if (!_2243)
            {
                _2165 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2249 = _2165;
            bool _2251 = !_2243;
            _2167 = _2249;
            if (!_2251)
            {
                bool _2253 = _1306 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2255 = isnan(_1306);
                bool _2257 = _2253 || _2255;
                bool _2259 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2261 = _2257 || _2259;
                if (!_2261)
                {
                    float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2265 = _1306 + _2263;
                    float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2269 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2267;
                    float _2271 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2275 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2279 = 1.0 / _2269;
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2285 = _2265 * _2279;
                    float _2287 = precise::clamp(_2285, 0.0, 1.0);
                    float _2289 = fma(_2287, _2273, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2291 = fma(_2287, _2277, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2293 = fma(_2287, _2283, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2181 = _2291;
                    _2189 = _2289;
                    _2167 = _2293;
                    _2233 = true;
                }
                else
                {
                    _2181 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2189 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2167 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2233 = false;
    float _2295 = _2181;
    float _2297 = _2189;
    float _2299 = _2167;
    float _2301 = _2295 * 0.586610972881317138671875;
    bool _2303 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_95.x = 0.0;
    float _2305 = fma(_2297, 0.298911988735198974609375, _2301);
    float _2307 = fma(_2299, 0.114477999508380889892578125, _2305);
    float _2309 = -_2307;
    float _2311 = _2309 + _2297;
    float _2313 = -_2307;
    float _2315 = _2313 + _2295;
    float _2317 = -_2307;
    float _2319 = _2317 + _2299;
    float _2321 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2323 = fma(_2311, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2307);
    float _2325 = fma(_2315, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2307);
    float _2327 = fma(_2319, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2307);
    out.m_49.x = _2321;
    out.m_97.x = _2323;
    out.m_97.y = _2325;
    out.m_97.z = _2327;
    if (!_2303)
    {
        return out;
    }
    float _2329 = -_1272;
    float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2333 = -_1274;
    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2337 = -_1276;
    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2341 = _2331 * _2331;
    float _2343 = fma(_2335, _2335, _2341);
    float _2345 = fma(_2339, _2339, _2343);
    float _2347 = sqrt(_2345);
    float _2349 = rsqrt(_2345);
    float _2351 = -_2347;
    float _2353 = _2351 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2355 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2357 = precise::clamp(_2355, 0.0, 1.0);
    float _2359 = _2335 * _2349;
    float _2361 = _2331 * _2349;
    float _2363 = abs(_2357);
    float _2365 = log2(_2363);
    float _2367 = _2339 * _2349;
    float _2369 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2371 = _2127 * _2361;
    float _2373 = -_2361;
    float _2375 = -_2369;
    float _2377 = fma(_2373, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2375);
    float _2379 = fma(_2125, _2359, _2371);
    float _2381 = -_2367;
    float _2383 = fma(_2381, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2377);
    float _2385 = fma(_2129, _2367, _2379);
    float _2387 = precise::clamp(_2385, 0.0, 1.0);
    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2391 = _2383 + _2389;
    float _2393 = _2365 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2395 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2397 = precise::clamp(_2395, 0.0, 1.0);
    float _2399 = exp2(_2393);
    float _2401 = _2399 * _2397;
    float _2403 = _2387 * _2401;
    float _2405 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2407 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2409 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2405;
    out.m_95.y = _2407;
    out.m_95.z = _2409;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2233 = false;
    bool _222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_49.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2466 = as_type<float>(_132);
        out.gl_Position.z = _2466;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_51.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_116);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _126;
    if (_164)
    {
        out.m_49.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2535 = as_type<float>(_170);
        out.gl_Position.z = _2535;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = _174 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _182 = _174 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _184 = _174 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _186 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].x, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].z, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].z, _188);
    float _196 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].z, _190);
    bool _198 = !_178;
    float _200 = _196;
    float _202 = _194;
    float _220;
    if (!_198)
    {
        float _204 = in.m_55.x;
        float _206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _210 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _212 = _210 * _206;
        float _214 = floor(_212);
        float _216 = -_214;
        float _218 = _212 + _216;
        _220 = _218;
        _222 = true;
    }
    else
    {
        float _224 = float(_116);
        float _226 = 1.0 / _224;
        float _228 = _150 * _226;
        _220 = _228;
    }
    _222 = false;
    float _230 = _220;
    float _232 = in.m_55.x;
    float _234 = in.m_55.y;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _238 = _230 + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _246 = _244 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = in.m_55.z;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _252 = _250 != 0;
    float _254 = 1.0 / _242;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _230 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _272 = 1.0 / _246;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _230 + _278;
    float _282 = _232 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _284 = 1.0 / _258;
    float _286 = -_274;
    float _288 = fma(_282, 2.0, _286);
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _300 = _298 != 0;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = _230 + _306;
    float _310 = _262 * _272;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = _230 + _312;
    float _316 = 1.0 / _266;
    float _318 = _248 * 2.0;
    float _320 = _308 * _254;
    float _322 = _232 * 2.0;
    float _324 = _234 + _248;
    float _326 = 0.0;
    if (!_252)
    {
        _326 = _248;
    }
    float _328 = _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _330;
    float _334 = 0.0;
    float _336 = _328;
    if (!_252)
    {
        _334 = _248;
    }
    float _338 = _334;
    float _340 = 1.0 / _304;
    float _342 = _324 + (-1.0);
    float _344 = _314 * _284;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _346;
    float _350 = _338;
    if (_252)
    {
        _336 = _234;
    }
    float _352 = _336;
    float _354 = -_150;
    float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[76].x, _288);
    if (_252)
    {
        _350 = _234;
    }
    float _358 = _350;
    float _360 = 1.0 / _270;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _362;
    float _366 = fma(_364, _320, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _368 = _238 * _340;
    float _370 = _232 + _248;
    float _372 = floor(_318);
    float _374 = _234 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _376 = _370 + (-1.0);
    bool _378 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _380 = isnan(_230);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = fma(_374, -2.0, _276);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _394 = _230 + _392;
    float _396 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _398 = _234 * 2.0;
    float _400 = floor(_322);
    float _402 = _394 * _316;
    float _404 = _280 * _360;
    float _406 = fma(_348, _402, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _410 = _372 > 0.0;
    float _412 = floor(_398);
    bool _414 = _372 >= 0.0;
    bool _416 = isnan(_372);
    bool _418 = _414 || _416;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    float _424 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _426 = _234 + _232;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _428;
    int _432 = _422 ? 0 : 1;
    float _434 = -_388;
    float _436 = _434 + 1.0;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _438;
    float _442 = _426 + (-1.0);
    bool _444 = _400 >= 0.0;
    bool _446 = isnan(_400);
    bool _448 = _444 || _446;
    bool _450 = isnan(0.0);
    bool _452 = _448 || _450;
    float _454 = fma(_430, _320, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _456 = fma(_440, _320, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _458 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _460 = _452 ? 0 : 1;
    float _462 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[83].w, _408);
    float _464 = _442;
    if (!_252)
    {
        _464 = _234;
    }
    float _466 = _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _468;
    bool _472 = _412 > 0.0;
    float _474 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _390);
    bool _476 = _412 >= 0.0;
    bool _478 = isnan(_412);
    bool _480 = _476 || _478;
    bool _482 = isnan(0.0);
    bool _484 = _480 || _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _490 = _466;
    bool _492 = _472;
    int _494 = as_type<int>(_474);
    if (_252)
    {
        _490 = _232;
    }
    float _496 = _490;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _502 = _400 > 0.0;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _516 = fma(_488, _310, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _518 = fma(_500, _310, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _524 = fma(_510, _404, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _526 = fma(_514, _404, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _532;
    float _536 = fma(_506, _310, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _538 = fma(_470, _402, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _540 = fma(_522, _404, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _542 = fma(_530, _344, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _544;
    bool _548 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _550 = isnan(_230);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = fma(_534, _344, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    bool _562 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _564 = isnan(_230);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = fma(_332, _402, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _576 = fma(_546, _344, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _578 = -_558;
    float _580 = _578 + 1.0;
    bool _582 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _584 = isnan(_230);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -_572;
    float _596 = _594 + 1.0;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _602 = _572 * _580;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _608 = _592 * _596;
    float _610 = -_592;
    float _612 = _610 + 1.0;
    float _614 = fma(_600, _368, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    bool _616 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _618 = isnan(_230);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = fma(_606, _368, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    bool _630 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _632 = isnan(_230);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = _388 * _612;
    bool _644 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _646 = isnan(_230);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = _626 * _436;
    float _658 = -_626;
    float _660 = _658 + 1.0;
    float _662 = _352 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _664 = _640 * _660;
    float _666 = -_640;
    float _668 = _666 + 1.0;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _674 = _654 * _668;
    float _676 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[83].z, _670);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _684 = _456 * _674;
    float _686 = fma(_662, -2.0, _672);
    float _688 = fma(_680, _368, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _690 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _692 = log2(_690);
    float _694 = _496 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _696 = _454 * _674;
    float _698 = _366 * _674;
    float _700 = -_654;
    float _702 = _700 + 1.0;
    bool _704 = !_292;
    int _706 = _704 ? 0 : 1;
    float _708 = -_682;
    float _710 = fma(_694, 2.0, _708);
    int _712 = _484 ? 0 : 1;
    float _714 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].x, _684);
    float _716 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].y, _696);
    float _718 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[143].z, _698);
    int _720 = ~_432;
    int _722 = _720 + 1;
    int _724 = _722 + 1;
    float _726 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _676);
    int _728 = ~_460;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    float _734 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _462);
    int _736 = abs(_706);
    float _738 = -_150;
    float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[81].x, _710);
    int _742 = _724;
    int _744 = _732;
    if (!_410)
    {
        int _746 = ~_432;
        int _748 = _746 + 1;
        _742 = _748;
    }
    int _750 = _742;
    float _752 = fma(_516, _664, _714);
    if (!_502)
    {
        int _754 = ~_460;
        int _756 = _754 + 1;
        _744 = _756;
    }
    int _758 = _744;
    float _760 = _692 * _150;
    float _762 = fma(_518, _664, _716);
    float _764 = float(_736);
    float _766 = fma(_536, _664, _718);
    float _768 = float(_750);
    float _770 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _686);
    float _772 = exp2(_760);
    float _774 = fma(_406, _656, _762);
    float _776 = _764 * _768;
    float _778 = in.m_57.x;
    float _780 = in.m_57.y;
    float _782 = in.m_57.z;
    bool _784 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _786 = isnan(1.0);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _792 = _788 || _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _796 = 1.0 + _794;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _800 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _802 = isnan(0.0);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _808 = _804 || _806;
    float _810 = 1.0 / _796;
    int _812 = ~_712;
    int _814 = _812 + 1;
    int _816 = _814 + 1;
    float _818 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[78].z, _798);
    bool _820 = !_296;
    int _822 = _820 ? 0 : 1;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _826 = -_772;
    float _828 = _826 + 1.0;
    int _830 = _816;
    if (!_472)
    {
        int _832 = ~_712;
        int _834 = _832 + 1;
        _830 = _834;
    }
    int _836 = _830;
    float _838 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _818);
    int _840 = abs(_822);
    float _842 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[78].w, _824);
    float _844 = _808 ? _828 : 0.0;
    float _846 = _776 * (-2.0);
    float _848 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _842);
    bool _850 = !_300;
    int _852 = _850 ? 0 : 1;
    float _854 = _232 + (-0.5);
    float _856 = _848;
    if (_792)
    {
        float _858 = _844 * _810;
        _154 = _858;
    }
    float _860 = _154;
    float _862 = float(_836);
    float _864 = fma(_846, _778, _778);
    float _866 = float(_840);
    float _868 = fma(_538, _656, _752);
    float _870 = float(_758);
    float _872 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[196].x, _864);
    int _874 = abs(_852);
    float _876 = fma(_524, _642, _868);
    float _878 = fma(_458, _846, _458);
    float _880 = _866 * _870;
    float _882 = _234 + (-0.5);
    float _884 = fma(_542, _608, _876);
    float _886 = _880 * (-2.0);
    float _888 = float(_874);
    float _890 = fma(_878, _860, _872);
    float _892 = fma(_628, _602, _884);
    float _894 = fma(_886, _780, _780);
    float _896 = fma(_424, _886, _424);
    float _898 = _888 * _862;
    float _900 = fma(_574, _656, _766);
    float _902 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[196].y, _894);
    float _904 = fma(_526, _642, _774);
    float _906 = _898 * (-2.0);
    float _908 = fma(_540, _642, _900);
    float _910 = fma(_896, _860, _902);
    float _912 = in.m_59.x;
    float _914 = in.m_59.y;
    float _916 = in.m_59.z;
    float _918 = fma(_906, _782, _782);
    float _920 = _248 + (-0.5);
    float _922 = fma(_396, _906, _396);
    float _924 = in.m_61.x;
    float _926 = in.m_61.y;
    float _928 = in.m_61.z;
    float _930 = fma(_576, _608, _908);
    float _932 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[196].z, _918);
    float _934 = fma(_560, _608, _904);
    float _936 = _890 * 0.15915493667125701904296875;
    float _938 = fma(_688, _602, _930);
    float _940 = fma(_922, _860, _932);
    float _942 = fma(_614, _602, _934);
    float _944 = _910 * 0.15915493667125701904296875;
    float _946 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[149].x, _892);
    float _948 = _940 * 0.15915493667125701904296875;
    float _950 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[149].z, _938);
    float _952 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[149].y, _942);
    float _954 = _936 * 6.283185482025146484375;
    float _956 = cos(_954);
    float _958 = _944 * 6.283185482025146484375;
    float _960 = sin(_958);
    float _962 = _952 * _926;
    float _964 = _950 * _928;
    float _966 = _946 * _924;
    float _968 = in.m_46.x;
    float _970 = in.m_46.y;
    float _972 = in.m_46.z;
    float _974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _914);
    float _976 = _944 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _962 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _912);
    float _984 = _966 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _916);
    float _988 = _974 * _980;
    float _990 = _964 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _992 = _982 * _984;
    float _994 = _936 * 6.283185482025146484375;
    float _996 = sin(_994);
    float _998 = _956 * _960;
    float _1000 = _986 * _990;
    float _1002 = _948 * 6.283185482025146484375;
    float _1004 = cos(_1002);
    float _1006 = _956 * _978;
    float _1008 = _948 * 6.283185482025146484375;
    float _1010 = sin(_1008);
    float _1012 = _996 * _960;
    float _1014 = _996 * _978;
    float _1016 = _956 * _1004;
    float _1018 = _996 * _1004;
    float _1020 = _978 * _1004;
    float _1022 = _960 * _1004;
    float _1024 = _1016 * _988;
    float _1026 = fma(_1010, _1006, _1012);
    float _1028 = -_988;
    float _1030 = _1010 * _1028;
    float _1032 = -_998;
    float _1034 = fma(_1010, _1014, _1032);
    float _1036 = _1018 * _988;
    float _1038 = -_1014;
    float _1040 = fma(_1010, _998, _1038);
    float _1042 = fma(_1026, _992, _1024);
    float _1044 = fma(_1020, _992, _1030);
    float _1046 = fma(_1034, _992, _1036);
    float _1048 = fma(_1010, _1012, _1006);
    float _1050 = fma(_1040, _1000, _1042);
    float _1052 = _970 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1054 = fma(_1022, _1000, _1044);
    float _1056 = fma(_1048, _1000, _1046);
    float _1058 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1060 = _970 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1062 = fma(_968, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1052);
    float _1064 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1066 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1058);
    float _1068 = fma(_968, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1060);
    float _1070 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1062);
    float _1072 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1064);
    float _1074 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1066);
    float _1076 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1068);
    float _1078 = _1070 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1080 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1072);
    float _1082 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1084 = _1076 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1086 = _970 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1088 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1090 = _1078 + _1082;
    float _1092 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1094 = fma(_968, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1086);
    float _1096 = _1084 + _1088;
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1100 = _1090 + _1098;
    float _1102 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1092);
    float _1104 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1094);
    float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1108 = _1096 + _1106;
    float _1110 = _1100 * _1100;
    float _1112 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1102);
    float _1114 = _1104 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1116 = fma(_1108, _1108, _1110);
    float _1118 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1120 = sqrt(_1116);
    float _1122 = _1114 + _1118;
    bool _1124 = _1120 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1126 = _968;
    float _1128 = _972;
    float _1130 = _1104;
    float _1132 = _1100;
    float _1134 = _932;
    if (!_1124)
    {
        _1126 = _1096;
    }
    float _1136 = _1126;
    float _1138 = _1136;
    if (!_1124)
    {
        _1128 = _1090;
    }
    float _1140 = _1128;
    float _1142 = _1140;
    if (!_1124)
    {
        _1130 = _1122;
    }
    float _1144 = _1130;
    bool _1146 = !_1124;
    float _1148 = _1144;
    if (!_1146)
    {
        float _1150 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1154 = _1120 + _1152;
        float _1156 = _1122 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1158 = rsqrt(_1116);
        float _1160 = _1154 * _1150;
        float _1162 = _1160 * 0.15915493667125701904296875;
        float _1164 = _1162 * 6.283185482025146484375;
        float _1166 = cos(_1164);
        float _1168 = _1162 * 6.283185482025146484375;
        float _1170 = sin(_1168);
        float _1172 = _1166 + (-1.0);
        float _1174 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1176 = fma(_1170, _1156, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1178 = fma(_1122, _1166, _1174);
        float _1180 = _1158 * _1176;
        float _1182 = fma(_1108, _1180, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1184 = fma(_1100, _1180, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1148 = _1178;
        _1138 = _1182;
        _1142 = _1184;
    }
    float _1186 = _1148;
    float _1188 = _1138;
    float _1190 = _1142;
    float _1192 = -_1114;
    float _1194 = _1192 + _1186;
    float _1196 = -_1084;
    float _1198 = _1196 + _1188;
    float _1200 = -_1078;
    float _1202 = _1200 + _1190;
    float _1204 = _1194 * _1194;
    float _1206 = fma(_1198, _1198, _1204);
    float _1208 = fma(_1202, _1202, _1206);
    float _1210 = sqrt(_1208);
    bool _1212 = _1210 > 0.0;
    bool _1214 = !_1212;
    float _1216 = _1186;
    float _1218 = _1188;
    float _1220 = _1190;
    float _1222 = _1208;
    float _1224 = _1198;
    if (!_1214)
    {
        float _1226 = _194 * _194;
        float _1228 = fma(_192, _192, _1226);
        float _1230 = rsqrt(_1208);
        float _1232 = fma(_196, _196, _1228);
        float _1234 = sqrt(_1232);
        float _1236 = _1198 * _1230;
        float _1238 = _1194 * _1230;
        float _1240 = _1202 * _1230;
        bool _1242 = _1234 > 0.0;
        bool _1244 = !_1242;
        _1132 = _1232;
        if (!_1244)
        {
            float _1246 = rsqrt(_1232);
            float _1248 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1250 = _194 * _1246;
            float _1252 = _192 * _1246;
            float _1254 = _196 * _1246;
            float _1256 = _1238 * _1250;
            float _1258 = fma(_1236, _1252, _1256);
            float _1260 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1262 = fma(_1240, _1254, _1258);
            float _1264 = _1262 * _1260;
            float _1266 = fma(_192, _1264, _1188);
            float _1268 = fma(_194, _1264, _1186);
            float _1270 = fma(_196, _1264, _1190);
            _1216 = _1268;
            _1218 = _1266;
            _1220 = _1270;
            _1222 = _1252;
            _1224 = _1258;
        }
    }
    float _1272 = _1216;
    float _1274 = _1218;
    float _1276 = _1220;
    float _1278 = _1132;
    float _1280 = _1222;
    float _1282 = _1224;
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1286 = _1272 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1290 = _1274 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1294 = _1276 + _1292;
    float _1296 = _1286 * _1286;
    float _1298 = fma(_1290, _1290, _1296);
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1302 = fma(_1294, _1294, _1298);
    float _1304 = rsqrt(_1302);
    float _1306 = sqrt(_1302);
    float _1308 = _1304 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1310 = _1290 * _1308;
    float _1312 = _1294 * _1308;
    float _1314 = _1310 * _1310;
    float _1316 = _1312 * _1312;
    float _1318 = _1314 + _1316;
    float _1320 = sqrt(_1318);
    bool _1322 = _1320 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1326 = _1320 + _1324;
    float _1328 = _1278;
    float _1330 = _1326;
    float _1332 = _1282;
    float _1334 = _1310;
    if (_1322)
    {
        float _1336 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1328 = _1336;
    }
    float _1338 = _1328;
    if (_1322)
    {
        float _1340 = rsqrt(_1318);
        _200 = _1340;
    }
    float _1342 = _200;
    float _1344 = _1342;
    if (_1322)
    {
        float _1346 = _1326 * _1338;
        _1330 = _1346;
    }
    float _1348 = _1330;
    if (_1322)
    {
        float _1350 = _1348 * 0.15915493667125701904296875;
        _1332 = _1350;
    }
    float _1352 = _1332;
    float _1354 = _1280;
    if (_1322)
    {
        float _1356 = _1352 * 6.283185482025146484375;
        float _1358 = sin(_1356);
        _1354 = _1358;
    }
    float _1360 = _1354;
    float _1362 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1364 = precise::max(0.0, _1362);
    float _1366 = _1338;
    float _1368 = _1364;
    if (_1322)
    {
        float _1370 = _1352 * 6.283185482025146484375;
        float _1372 = cos(_1370);
        _1366 = _1372;
    }
    float _1374 = _1366;
    float _1376 = -_1308;
    float _1378 = -_1364;
    float _1380 = fma(_1286, _1376, _1378);
    if (_1322)
    {
        float _1382 = _1380 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _202 = _1382;
    }
    float _1384 = _202;
    float _1386 = _1384;
    float _1388 = _1360;
    if (_1322)
    {
        float _1390 = fma(_1360, _1384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1386 = _1390;
    }
    float _1392 = _1386;
    float _1394 = _1392;
    if (!_1322)
    {
        _1388 = _1314;
    }
    float _1396 = _1388;
    float _1398 = _1396;
    if (_1322)
    {
        float _1400 = _1374 + (-1.0);
        _1368 = _1400;
    }
    float _1402 = _1368;
    float _1404 = _1402;
    if (_1322)
    {
        float _1406 = _1342 * _1392;
        _1134 = _1406;
    }
    float _1408 = _1134;
    if (!_1322)
    {
        _1394 = _1380;
    }
    float _1410 = _1394;
    float _1412 = _1410;
    if (_1322)
    {
        float _1414 = _1402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1344 = _1414;
    }
    float _1416 = _1344;
    float _1418 = _1416;
    if (_1322)
    {
        float _1420 = _1310 * _1408;
        _1334 = _1420;
    }
    float _1422 = _1334;
    if (!_1322)
    {
        _1404 = _1312;
    }
    float _1424 = _1404;
    float _1426 = _1424;
    if (_1322)
    {
        float _1428 = _1312 * _1408;
        _1426 = _1428;
    }
    float _1430 = _1426;
    if (_1322)
    {
        float _1432 = fma(_1380, _1374, _1416);
        _1412 = _1432;
    }
    float _1434 = _1412;
    if (_1322)
    {
        float _1436 = _1422 * _1422;
        _1398 = _1436;
    }
    float _1438 = _1398;
    if (!_1322)
    {
        _1418 = _1316;
    }
    float _1440 = _1418;
    float _1442 = _1440;
    if (_1322)
    {
        float _1444 = _1430 * _1430;
        _1442 = _1444;
    }
    float _1446 = _1442;
    float _1448 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1450 = fma(_1434, _1434, _1438);
    float _1452 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1454 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1456 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1448);
    float _1458 = _1450 + _1446;
    float _1460 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1462 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1452);
    float _1464 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1456);
    float _1466 = fma(_1084, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1468 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1460);
    float _1470 = rsqrt(_1458);
    float _1472 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1474 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1468);
    float _1476 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1462);
    float _1478 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1454);
    float _1480 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1482 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1486 = fma(_1306, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1484);
    float _1488 = precise::clamp(_1486, 0.0, 1.0);
    float _1490 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1478);
    float _1492 = _1476 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1494 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1480);
    float _1496 = -_1488;
    float _1498 = _1496 + 1.0;
    float _1500 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1502 = floor(_1466);
    float _1504 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1494);
    float _1506 = _1470 * _1422;
    float _1508 = _1470 * _1434;
    float _1510 = _1470 * _1430;
    float _1512 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1504);
    float _1514 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1516 = fma(_1078, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1518 = abs(_1498);
    float _1520 = log2(_1518);
    float _1522 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1524 = -_1514;
    float _1526 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1524);
    float _1528 = -_1510;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1526);
    float _1532 = _1492 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1534 = floor(_1516);
    float _1536 = fma(_1530, -0.5, 0.5);
    float _1538 = fma(_1530, 0.5, 0.5);
    float _1540 = -_1502;
    float _1542 = _1466 + _1540;
    float _1544 = -_1532;
    float _1546 = fma(_1544, _1300, 1.0);
    float _1548 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1550 = fma(_1538, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1552 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1554 = sqrt(_1536);
    float _1556 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1548);
    float _1558 = fma(_1538, _1550, -0.212114393711090087890625);
    float _1560 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1522);
    float _1562 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1556);
    float _1564 = fma(_1538, _1558, 1.570728778839111328125);
    float _1566 = -_1534;
    float _1568 = _1516 + _1566;
    float _1570 = 1.0 / _1512;
    float _1572 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1560);
    float _1574 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1562);
    float _1576 = _1508 + 1.0;
    float _1578 = exp2(_1552);
    float _1580 = _1554 * 0.636619746685028076171875;
    float _1582 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1572);
    float _1584 = log2(_1546);
    float _1586 = _1574 * _1570;
    float _1588 = _1582 * _1570;
    float _1590 = -_1564;
    float _1592 = fma(_1580, _1590, 1.0);
    float2 _4834 = float2(_1542, _1568);
    float _1594 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4834, float2(0.0), isnan(_4834)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4834, float2(0.0), isnan(_4834)), level(0.0)).x;
    float _1596 = fma(_1586, 0.5, 0.5);
    float _1598 = -_1508;
    float _1600 = fma(_1578, _1576, _1598);
    float _1602 = fma(_1600, 0.5, 0.5);
    float _1604 = fma(_1588, -0.5, 0.5);
    float _1606 = _1584 * 0.693147182464599609375;
    float _1608 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4864 = float3(_1596, _1604, _1608);
    float _1610 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4864, float3(0.0), isnan(_4864)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4864, float3(0.0), isnan(_4864)), level(0.0)).x;
    float3 _4875 = float3(_1596, _1604, _1608);
    float4 _1613 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4875, float3(0.0), isnan(_4875)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4875, float3(0.0), isnan(_4875)), level(0.0)).xyzw;
    float _1615 = _1613.x;
    float _1617 = _1613.y;
    float _1619 = _1613.z;
    float _1621 = _1613.w;
    float2 _4891 = float2(_1592, _1602);
    float3 _1625 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4891, float2(0.0), isnan(_4891)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4891, float2(0.0), isnan(_4891)), level(0.0)).xyz;
    float _1627 = _1625.x;
    float _1629 = _1625.y;
    float _1631 = _1625.z;
    float _1633 = in.m_63.w;
    float _1635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1637 = _234 > 0.5;
    float _1639 = in.m_63.x;
    int _1641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1643 = _1641 != 0;
    float _1645 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1649 = _1647 != 0;
    float _1651 = in.m_63.y;
    int _1653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1655 = _1653 != 0;
    float _1657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1659 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1661 = in.m_63.z;
    float _1663 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1665 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1659);
    float _1667 = in.m_55.w;
    float _1669 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1663);
    if (_1643)
    {
        bool _1671 = _248 > 0.5;
        _492 = _1671;
    }
    bool _1673 = _492;
    float _1675 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1665);
    float _1677 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1669);
    float _1679 = in.m_65.x;
    float _1681 = _1677 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_67.w = _1633;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1689 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1691 = in.m_65.y;
    float _1693 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1639;
    float _1699 = _1635 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1703 = _1701 != 0;
    out.m_67.y = _1651;
    bool _1705 = _1667 > 0.5;
    float _1707 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_67.z = _1661;
    float _1709 = _1707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1711 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_69.x = _1693;
    out.m_69.y = _1695;
    out.m_69.z = _1697;
    out.m_69.w = _1689;
    float _1713 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1717 = 1.0 / _1681;
    float _1719 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1723 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    bool _1725 = _1703;
    float _1727 = _1715;
    int _1729 = as_type<int>(_1699);
    float _1731 = _1679;
    float _1733 = _1711;
    if (_1649)
    {
        float _1735 = in.m_55.x;
        _1723 = _1735;
    }
    float _1737 = _1723;
    float _1739 = -_1691;
    float _1741 = _1739 + 1.0;
    float _1743 = _1719 + _1681;
    float _1745 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1747 = _1713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1749 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1645);
    out.m_71.x = _1290;
    out.m_71.y = _1286;
    out.m_71.z = _1294;
    int _1751 = _1637 ? as_type<int>(_1741) : as_type<int>(_1691);
    float _1753 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1749);
    bool _1755 = _914 != 0.0;
    bool _1757 = isnan(_914);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan(0.0);
    bool _1763 = _1759 || _1761;
    out.m_73.x = _1745;
    out.m_73.y = _1747;
    out.m_73.z = _1709;
    out.m_73.w = _1715;
    float _1765 = _1743 * _1717;
    float _1767 = _1765 * 0.5;
    bool _1769 = _912 == 0.0;
    bool _1771 = !_1763;
    bool _1773 = _1769 && _1771;
    float _1775 = in.m_75.x;
    float _1777 = in.m_75.y;
    float _1779 = in.m_75.z;
    float _1781 = _1703 ? as_type<float>(_1751) : _1691;
    float _1783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1785 = _1691;
    float _1787 = _1745;
    if (_1655)
    {
        float _1789 = _1705 ? _1741 : _1691;
        _1785 = _1789;
    }
    float _1791 = _1785;
    float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1795 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1793);
    bool _1797 = _916 == 0.0;
    bool _1799 = _1797 && _1773;
    float _1801 = fma(_1699, _1781, -0.5);
    float _1803 = fma(_1711, _1791, -0.5);
    if (_1649)
    {
        bool _1805 = _1737 > 0.5;
        _1725 = _1805;
    }
    bool _1807 = _1725;
    float _1809 = 1.0 / _1795;
    if (!_1649)
    {
        _1727 = _1679;
    }
    float _1811 = _1727;
    float _1813 = -_474;
    float _1815 = fma(_848, _1801, _1813);
    float _1817 = -_770;
    float _1819 = fma(_734, _1803, _1817);
    float _1821 = in.m_77.x;
    float _1823 = in.m_77.y;
    float _1825 = in.m_77.z;
    float _1827 = in.m_77.w;
    float _1829 = _1811;
    if (!_1649)
    {
        _1787 = _1811;
    }
    float _1831 = _1787;
    float _1833 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1835 = _1831;
    if (_1649)
    {
        _1829 = _1679;
    }
    float _1837 = _1829;
    float _1839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1841 = _1837;
    if (_1649)
    {
        float _1843 = -_1837;
        float _1845 = _1843 + 1.0;
        _494 = as_type<int>(_1845);
    }
    int _1847 = _494;
    float _1849 = as_type<float>(_1847);
    if (_1643)
    {
        float _1851 = -_1837;
        float _1853 = _1851 + 1.0;
        _1729 = as_type<int>(_1853);
    }
    int _1855 = _1729;
    float _1857 = _1775;
    if (_1799)
    {
        _1731 = _1777;
    }
    float _1859 = _1731;
    float _1861 = _1859;
    if (_1799)
    {
        _1733 = _1775;
    }
    float _1863 = _1733;
    float _1865 = _1863;
    if (_1649)
    {
        float _1867 = _1807 ? as_type<float>(_1847) : _1837;
        _1835 = _1867;
    }
    float _1869 = _1835;
    if (_1799)
    {
        _1849 = _1859;
    }
    float _1871 = _1849;
    float _1873 = _1871;
    if (!_1799)
    {
        _1861 = _1777;
    }
    float _1875 = _1861;
    float _1877 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1879 = _1809 * _1877;
    float _1881 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1643)
    {
        float _1883 = _1673 ? as_type<float>(_1855) : _1837;
        _1841 = _1883;
    }
    float _1885 = _1841;
    float _1887 = _1839 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1889 = abs(_1879);
    float _1891 = log2(_1889);
    if (_1799)
    {
        _856 = _1863;
    }
    float _1893 = _856;
    float _1895 = fma(_1881, _1869, -0.5);
    float _1897 = _1893;
    if (!_1799)
    {
        _1865 = _1775;
    }
    float _1899 = _1865;
    float _1901 = fma(_1887, _1885, -0.5);
    if (!_1799)
    {
        float _1903 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1875);
        _1873 = _1903;
    }
    float _1905 = _1873;
    float _1907 = _1823 * _1779;
    float _1909 = fma(_838, _1895, _356);
    if (!_1799)
    {
        float _1911 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1899);
        _1897 = _1911;
    }
    float _1913 = _1897;
    float _1915 = fma(_726, _1901, _740);
    float _1917 = _1821 * _1875;
    float _1919 = _1825 * _1899;
    float _1921 = _1815 + 0.5;
    float _1923 = _1915 + 0.5;
    float _1925 = -_1917;
    float _1927 = fma(_1823, _1899, _1925);
    float _1929 = -_1919;
    float _1931 = fma(_1821, _1779, _1929);
    float _1933 = _1891 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1935 = -_1907;
    float _1937 = fma(_1825, _1875, _1935);
    if (_1799)
    {
        _1857 = _1779;
    }
    float _1939 = _1857;
    float _1941 = _1939;
    if (!_1799)
    {
        float _1943 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1779);
        _1941 = _1943;
    }
    float _1945 = _1941;
    float _1947 = exp2(_1933);
    float _1949 = _1931 * _1827;
    float _1951 = _1937 * _1827;
    float _1953 = _1927 * _1827;
    float _1955 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1957 = _1819 + 0.5;
    float _1959 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1961 = -_1010;
    float _1963 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1833);
    float _1965 = -_1010;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1955);
    float _1969 = _1909 + 0.5;
    float _1971 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1973 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1975 = _1026 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1977 = -_1010;
    float _1979 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1959);
    out.m_79.x = _1969;
    out.m_79.y = _1921;
    out.m_79.z = _1923;
    out.m_79.w = _1957;
    float _1981 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1983 = precise::clamp(_1981, 0.0, 1.0);
    float _1985 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1971);
    float _1987 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1973);
    float _1989 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1975);
    float _1991 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1993 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1995 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1967);
    float _1997 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1963);
    float _1999 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1979);
    float _2001 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1991);
    float _2003 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1993);
    float _2005 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1985);
    float _2007 = _1995 * _1823;
    float _2009 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2011 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1987);
    float _2013 = _1997 * _1823;
    float _2015 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2009);
    float _2017 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1989);
    float _2019 = _1999 * _1823;
    float _2021 = _1995 * _1905;
    float _2023 = _1949 * _1995;
    float _2025 = _1949 * _1997;
    float _2027 = _1949 * _1999;
    float _2029 = fma(_1983, -2.0, 3.0);
    float _2031 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2001);
    float _2033 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2015);
    float _2035 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2003);
    float _2037 = fma(_2005, _1821, _2007);
    float _2039 = fma(_2011, _1821, _2013);
    float _2041 = fma(_2017, _1821, _2019);
    float _2043 = _1997 * _1905;
    float _2045 = fma(_2005, _1913, _2021);
    float _2047 = fma(_1951, _2005, _2023);
    float _2049 = fma(_2031, _1825, _2037);
    float _2051 = fma(_2033, _1825, _2039);
    float _2053 = fma(_2035, _1825, _2041);
    float _2055 = fma(_2011, _1913, _2043);
    float _2057 = fma(_1951, _2011, _2025);
    float _2059 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2061 = _1983 * _1983;
    float _2063 = _1999 * _1905;
    float _2065 = fma(_1951, _2017, _2027);
    bool _2067 = _1879 <= 8000.0;
    bool _2069 = isnan(_1879);
    bool _2071 = _2067 || _2069;
    bool _2073 = isnan(8000.0);
    bool _2075 = _2071 || _2073;
    float _2077 = float(_2075);
    float _2079 = _2061 * _2029;
    float _2081 = exp2(_2059);
    float _2083 = fma(_2017, _1913, _2063);
    float _2085 = fma(_1953, _2031, _2047);
    float _2087 = -_2079;
    float _2089 = _2087 + 1.0;
    float _2091 = in.m_81.x;
    bool _2093 = _1306 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2095 = isnan(_1306);
    bool _2097 = _2093 || _2095;
    bool _2099 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2101 = _2097 || _2099;
    float _2103 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2079);
    float _2105 = fma(_1953, _2033, _2057);
    float _2107 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1753);
    float _2109 = fma(_1953, _2035, _2065);
    float _2111 = _2077 * _2103;
    float _2113 = _2107 + _1512;
    float _2115 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2117 = -_2081;
    float _2119 = _2117 + 1.0;
    out.m_83.x = _2085;
    out.m_83.y = _2105;
    out.m_83.z = _2109;
    float _2121 = _2113 * 0.5;
    out.m_85.x = _2049;
    out.m_85.y = _2051;
    out.m_85.z = _2053;
    out.m_87.z = _2121;
    out.m_87.w = _1512;
    float _2123 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1574;
    out.gl_Position.y = _1582;
    out.gl_Position.z = _2107;
    out.gl_Position.w = _1512;
    float _2125 = fma(_2031, _1945, _2045);
    float _2127 = fma(_2033, _1945, _2055);
    float _2129 = fma(_2035, _1945, _2083);
    out.m_89.x = _2125;
    out.m_89.y = _2127;
    out.m_89.z = _2129;
    float _2131 = -_1594;
    float _2133 = _2131 + 1.0;
    float _2135 = _2133 * _2115;
    float _2137 = precise::clamp(_2135, 0.0, 1.0);
    float _2139 = -_2137;
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2143 = _2141 * _2091;
    float _2145 = _2143 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2147 = _2143;
    if (!_2101)
    {
        _2147 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2149 = _2147;
    float _2151 = _2123 * _1610;
    float _2153 = -_2123;
    float _2155 = _2153 + 1.0;
    out.m_91.x = _2145;
    float _2157 = _1621 * _2151;
    float _2159 = _1631 * _2151;
    float _2161 = _2151;
    float _2163 = _2159;
    float _2165 = _2149;
    float _2167 = _2149;
    if (!_2101)
    {
        _2161 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2169 = _2161;
    float _2171 = fma(_1627, _2157, _1615);
    float _2173 = fma(_1629, _2157, _1617);
    float _2175 = _1621 * _2155;
    float _2177 = fma(_1621, _2159, _1619);
    float _2179 = _2169;
    float _2181 = _2169;
    if (!_2101)
    {
        _2163 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2183 = _2163;
    out.m_93.x = _2171;
    out.m_93.y = _2173;
    out.m_93.z = _2177;
    out.m_93.w = _2175;
    bool _2185 = !_2101;
    float _2187 = _2183;
    float _2189 = _2183;
    if (!_2185)
    {
        bool _2191 = _1306 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2193 = isnan(_1306);
        bool _2195 = _2191 || _2193;
        bool _2197 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2199 = _2195 || _2197;
        if (!_2199)
        {
            float _2201 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2203 = _1306 + _2201;
            float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2207 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2205;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2217 = 1.0 / _2207;
            float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2221 = _2219 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2223 = _2203 * _2217;
            float _2225 = precise::clamp(_2223, 0.0, 1.0);
            float _2227 = fma(_2225, _2211, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2229 = fma(_2225, _2215, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2231 = fma(_2225, _2221, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2181 = _2229;
            _2189 = _2227;
            _2167 = _2231;
            _2233 = true;
        }
        else
        {
            bool _2235 = _1306 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2237 = isnan(_1306);
            bool _2239 = _2235 || _2237;
            bool _2241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2243 = _2239 || _2241;
            if (!_2243)
            {
                _2187 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2245 = _2187;
            _2189 = _2245;
            if (!_2243)
            {
                _2179 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2247 = _2179;
            _2181 = _2247;
            if (!_2243)
            {
                _2165 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2249 = _2165;
            bool _2251 = !_2243;
            _2167 = _2249;
            if (!_2251)
            {
                bool _2253 = _1306 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2255 = isnan(_1306);
                bool _2257 = _2253 || _2255;
                bool _2259 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2261 = _2257 || _2259;
                if (!_2261)
                {
                    float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2265 = _1306 + _2263;
                    float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2269 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2267;
                    float _2271 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2275 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2279 = 1.0 / _2269;
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2285 = _2265 * _2279;
                    float _2287 = precise::clamp(_2285, 0.0, 1.0);
                    float _2289 = fma(_2287, _2273, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2291 = fma(_2287, _2277, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2293 = fma(_2287, _2283, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2181 = _2291;
                    _2189 = _2289;
                    _2167 = _2293;
                    _2233 = true;
                }
                else
                {
                    _2181 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2189 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2167 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2233 = false;
    float _2295 = _2181;
    float _2297 = _2189;
    float _2299 = _2167;
    float _2301 = _2295 * 0.586610972881317138671875;
    bool _2303 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_95.x = 0.0;
    float _2305 = fma(_2297, 0.298911988735198974609375, _2301);
    float _2307 = fma(_2299, 0.114477999508380889892578125, _2305);
    float _2309 = -_2307;
    float _2311 = _2309 + _2297;
    float _2313 = -_2307;
    float _2315 = _2313 + _2295;
    float _2317 = -_2307;
    float _2319 = _2317 + _2299;
    float _2321 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2323 = fma(_2311, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2307);
    float _2325 = fma(_2315, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2307);
    float _2327 = fma(_2319, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2307);
    out.m_49.x = _2321;
    out.m_97.x = _2323;
    out.m_97.y = _2325;
    out.m_97.z = _2327;
    if (!_2303)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2329 = -_1272;
    float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2333 = -_1274;
    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2337 = -_1276;
    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2341 = _2331 * _2331;
    float _2343 = fma(_2335, _2335, _2341);
    float _2345 = fma(_2339, _2339, _2343);
    float _2347 = sqrt(_2345);
    float _2349 = rsqrt(_2345);
    float _2351 = -_2347;
    float _2353 = _2351 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2355 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2357 = precise::clamp(_2355, 0.0, 1.0);
    float _2359 = _2335 * _2349;
    float _2361 = _2331 * _2349;
    float _2363 = abs(_2357);
    float _2365 = log2(_2363);
    float _2367 = _2339 * _2349;
    float _2369 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2371 = _2127 * _2361;
    float _2373 = -_2361;
    float _2375 = -_2369;
    float _2377 = fma(_2373, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2375);
    float _2379 = fma(_2125, _2359, _2371);
    float _2381 = -_2367;
    float _2383 = fma(_2381, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2377);
    float _2385 = fma(_2129, _2367, _2379);
    float _2387 = precise::clamp(_2385, 0.0, 1.0);
    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2391 = _2383 + _2389;
    float _2393 = _2365 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2395 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2397 = precise::clamp(_2395, 0.0, 1.0);
    float _2399 = exp2(_2393);
    float _2401 = _2399 * _2397;
    float _2403 = _2387 * _2401;
    float _2405 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2407 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2409 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2405;
    out.m_95.y = _2407;
    out.m_95.z = _2409;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

