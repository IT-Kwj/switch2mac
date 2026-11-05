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
    float4 m_61 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
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
    bool _2179 = false;
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
        float _2412 = as_type<float>(_132);
        out.gl_Position.z = _2412;
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
        float _2481 = as_type<float>(_170);
        out.gl_Position.z = _2481;
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
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = _230 + _236;
    float _240 = in.m_55.z;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _250;
    float _254 = 1.0 / _244;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _264 = 1.0 / _252;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _268 = _230 + _266;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _272 = _270 != 0;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _230 + _274;
    float _278 = 1.0 / _248;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _280;
    float _284 = _234 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _286 = _276 * _254;
    float _288 = _234 + _240;
    float _290 = fma(_284, -2.0, _260);
    float _292 = _240 * 2.0;
    float _294 = 1.0 / _282;
    float _296 = _232 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _298 = _238 * _264;
    float _300 = _234 * 2.0;
    float _302 = _288 + (-1.0);
    float _304 = -_262;
    float _306 = fma(_296, 2.0, _304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _230 + _308;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _314 = _312 != 0;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _318 = _316 != 0;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _322 = _320 != 0;
    float _324 = floor(_292);
    float _326 = _232 * 2.0;
    float _328 = _310 * _278;
    float _330 = _232 + _240;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _230 + _332;
    float _336 = 0.0;
    if (!_272)
    {
        _336 = _240;
    }
    float _338 = _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _340;
    float _344 = _330 + (-1.0);
    float _346 = floor(_326);
    float _348 = _338;
    if (_272)
    {
        _348 = _234;
    }
    float _350 = _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    float _356 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = fma(_342, _286, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = 1.0 / _258;
    bool _370 = _324 >= 0.0;
    bool _372 = isnan(_324);
    bool _374 = _370 || _372;
    bool _376 = isnan(0.0);
    bool _378 = _374 || _376;
    float _380 = fma(_354, _286, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _382 = _324 > 0.0;
    float _384 = fma(_360, _328, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _386 = _378 ? 0 : 1;
    float _388 = fma(_364, _328, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _390 = floor(_300);
    float _392 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _394 = _234 + _232;
    bool _396 = _346 >= 0.0;
    bool _398 = isnan(_346);
    bool _400 = _396 || _398;
    bool _402 = isnan(0.0);
    bool _404 = _400 || _402;
    float _406 = _268 * _294;
    float _408 = _394 + (-1.0);
    int _410 = _404 ? 0 : 1;
    float _412 = _334 * _368;
    float _414 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _416 = _408;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_272)
    {
        _416 = _234;
    }
    float _420 = _416;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _422;
    float _426 = _420;
    if (!_272)
    {
        _418 = _240;
    }
    float _428 = _418;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _434 = _428;
    if (_272)
    {
        _426 = _232;
    }
    float _436 = _426;
    float _438 = -_150;
    float _440 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[76].x, _306);
    if (_272)
    {
        _434 = _234;
    }
    float _442 = _434;
    float _444 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _290);
    bool _446 = _346 > 0.0;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _448;
    bool _452 = _390 > 0.0;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _458 = _390 >= 0.0;
    bool _460 = isnan(_390);
    bool _462 = _458 || _460;
    bool _464 = isnan(0.0);
    bool _466 = _462 || _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _468;
    float _472 = fma(_450, _286, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _474 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _476 = isnan(_230);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = fma(_456, _328, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    float _492 = fma(_470, _298, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _494 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _496 = isnan(_230);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -_484;
    float _508 = _506 + 1.0;
    float _510 = fma(_490, _298, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _516 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _518 = isnan(_230);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _532 = -_504;
    float _534 = _532 + 1.0;
    float _536 = _504 * _508;
    float _538 = fma(_514, _412, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _540 = fma(_424, _298, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _542 = fma(_530, _412, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _544 = fma(_432, _412, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _546 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _548 = isnan(_230);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = _526 * _534;
    float _560 = -_526;
    float _562 = _560 + 1.0;
    bool _564 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _566 = isnan(_230);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = _442 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _578 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _580 = isnan(_230);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = _556 * _562;
    float _592 = -_556;
    float _594 = _592 + 1.0;
    float _596 = -_588;
    float _598 = _596 + 1.0;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _602 = _588 * _594;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _604;
    float _608 = _574 * _598;
    float _610 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[83].w, _600);
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _614 = _472 * _608;
    float _616 = _366 * _608;
    float _618 = _380 * _608;
    float _620 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[83].z, _612);
    float _622 = _436 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _626 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _628 = log2(_626);
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _632 = -_574;
    float _634 = _632 + 1.0;
    float _636 = fma(_576, -2.0, _624);
    bool _638 = !_314;
    int _640 = _638 ? 0 : 1;
    float _642 = -_630;
    float _644 = fma(_622, 2.0, _642);
    float _646 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].x, _614);
    float _648 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].y, _616);
    float _650 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].z, _618);
    int _652 = ~_386;
    int _654 = _652 + 1;
    int _656 = _654 + 1;
    float _658 = fma(_606, _406, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    int _660 = abs(_640);
    float _662 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _620);
    int _664 = _656;
    bool _666 = _452;
    int _668 = as_type<int>(_444);
    if (!_382)
    {
        int _670 = ~_386;
        int _672 = _670 + 1;
        _664 = _672;
    }
    int _674 = _664;
    float _676 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _610);
    int _678 = _466 ? 0 : 1;
    float _680 = _628 * _150;
    float _682 = float(_660);
    float _684 = -_150;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[81].x, _644);
    float _688 = float(_674);
    float _690 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _636);
    int _692 = ~_678;
    int _694 = _692 + 1;
    int _696 = _694 + 1;
    float _698 = exp2(_680);
    int _700 = _696;
    if (!_452)
    {
        int _702 = ~_678;
        int _704 = _702 + 1;
        _700 = _704;
    }
    int _706 = _700;
    float _708 = _682 * _688;
    int _710 = ~_410;
    int _712 = _710 + 1;
    int _714 = _712 + 1;
    float _716 = in.m_57.x;
    float _718 = in.m_57.y;
    float _720 = in.m_57.z;
    int _722 = _714;
    if (!_446)
    {
        int _724 = ~_410;
        int _726 = _724 + 1;
        _722 = _726;
    }
    int _728 = _722;
    float _730 = _708 * (-2.0);
    float _732 = fma(_486, _602, _646);
    float _734 = fma(_414, _730, _414);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _738 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _740 = isnan(1.0);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _746 = _742 || _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _750 = 1.0 + _748;
    bool _752 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _760 = _756 || _758;
    float _762 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[78].z, _736);
    bool _764 = !_318;
    int _766 = _764 ? 0 : 1;
    float _768 = 1.0 / _750;
    float _770 = -_698;
    float _772 = _770 + 1.0;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _776 = abs(_766);
    float _778 = _232 + (-0.5);
    float _780 = float(_728);
    float _782 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[78].w, _774);
    float _784 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _762);
    float _786 = _760 ? _772 : 0.0;
    float _788 = fma(_730, _716, _716);
    float _790 = float(_776);
    float _792 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _782);
    bool _794 = !_322;
    int _796 = _794 ? 0 : 1;
    float _798 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[196].x, _788);
    float _800 = fma(_384, _602, _648);
    float _802 = _780;
    float _804 = _792;
    if (_746)
    {
        float _806 = _786 * _768;
        _154 = _806;
    }
    float _808 = _154;
    float _810 = _790 * _780;
    int _812 = abs(_796);
    float _814 = fma(_388, _602, _650);
    float _816 = fma(_734, _808, _798);
    float _818 = _810 * (-2.0);
    float _820 = _234 + (-0.5);
    float _822 = float(_706);
    float _824 = _816 * 0.15915493667125701904296875;
    float _826 = float(_812);
    float _828 = fma(_818, _718, _718);
    float _830 = fma(_392, _818, _392);
    float _832 = fma(_540, _590, _814);
    float _834 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].y, _828);
    float _836 = _826 * _822;
    float _838 = fma(_492, _590, _732);
    float _840 = fma(_830, _808, _834);
    float _842 = _836 * (-2.0);
    float _844 = in.m_59.x;
    float _846 = in.m_59.y;
    float _848 = in.m_59.z;
    float _850 = fma(_510, _590, _800);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _852;
    float _856 = fma(_842, _720, _720);
    float _858 = _240 + (-0.5);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _860;
    float _864 = _840 * 0.15915493667125701904296875;
    float _866 = fma(_854, _406, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _868 = in.m_61.x;
    float _870 = in.m_61.y;
    float _872 = in.m_61.z;
    float _874 = fma(_356, _842, _356);
    float _876 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[196].z, _856);
    float _878 = fma(_862, _406, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _880 = fma(_538, _558, _838);
    float _882 = fma(_544, _558, _832);
    float _884 = fma(_542, _558, _850);
    float _886 = fma(_874, _808, _876);
    float _888 = fma(_658, _536, _880);
    float _890 = fma(_878, _536, _882);
    float _892 = fma(_866, _536, _884);
    float _894 = _886 * 0.15915493667125701904296875;
    float _896 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[148].x, _888);
    float _898 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[148].z, _890);
    float _900 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[148].y, _892);
    float _902 = _824 * 6.283185482025146484375;
    float _904 = cos(_902);
    float _906 = _896 * _844;
    float _908 = _898 * _848;
    float _910 = _900 * _846;
    float _912 = in.m_46.x;
    float _914 = in.m_46.y;
    float _916 = in.m_46.z;
    float _918 = _906 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _920 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _922 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _924 = _864 * 6.283185482025146484375;
    float _926 = sin(_924);
    float _928 = _864 * 6.283185482025146484375;
    float _930 = cos(_928);
    float _932 = _824 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = _904 * _926;
    float _938 = _894 * 6.283185482025146484375;
    float _940 = cos(_938);
    float _942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _870);
    float _944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _868);
    float _946 = _894 * 6.283185482025146484375;
    float _948 = sin(_946);
    float _950 = _934 * _926;
    float _952 = _942 * _922;
    float _954 = _904 * _930;
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _872);
    float _958 = _944 * _918;
    float _960 = _934 * _930;
    float _962 = _904 * _940;
    float _964 = _930 * _940;
    float _966 = _934 * _940;
    float _968 = _926 * _940;
    float _970 = _962 * _952;
    float _972 = _956 * _920;
    float _974 = fma(_948, _954, _950);
    float _976 = -_952;
    float _978 = _948 * _976;
    float _980 = -_936;
    float _982 = fma(_948, _960, _980);
    float _984 = _966 * _952;
    float _986 = -_960;
    float _988 = fma(_948, _936, _986);
    float _990 = fma(_974, _958, _970);
    float _992 = fma(_964, _958, _978);
    float _994 = fma(_982, _958, _984);
    float _996 = fma(_948, _950, _954);
    float _998 = fma(_988, _972, _990);
    float _1000 = _914 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1002 = fma(_968, _972, _992);
    float _1004 = fma(_996, _972, _994);
    float _1006 = _998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1008 = _914 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1010 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1000);
    float _1012 = _998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1014 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1006);
    float _1016 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1008);
    float _1018 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1010);
    float _1020 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1012);
    float _1022 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1014);
    float _1024 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1016);
    float _1026 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1028 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1020);
    float _1030 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1034 = _914 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1036 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1038 = _1026 + _1030;
    float _1040 = _998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1042 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1034);
    float _1044 = _1032 + _1036;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1048 = _1038 + _1046;
    float _1050 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1040);
    float _1052 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1042);
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1056 = _1044 + _1054;
    float _1058 = _1048 * _1048;
    float _1060 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1050);
    float _1062 = _1052 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1064 = fma(_1056, _1056, _1058);
    float _1066 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1068 = sqrt(_1064);
    float _1070 = _1062 + _1066;
    bool _1072 = _1068 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1074 = _912;
    float _1076 = _916;
    float _1078 = _1052;
    float _1080 = _1048;
    if (!_1072)
    {
        _1074 = _1044;
    }
    float _1082 = _1074;
    float _1084 = _1082;
    if (!_1072)
    {
        _1076 = _1038;
    }
    float _1086 = _1076;
    float _1088 = _1086;
    if (!_1072)
    {
        _1078 = _1070;
    }
    float _1090 = _1078;
    bool _1092 = !_1072;
    float _1094 = _1090;
    if (!_1092)
    {
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1100 = _1068 + _1098;
        float _1102 = _1070 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1104 = rsqrt(_1064);
        float _1106 = _1100 * _1096;
        float _1108 = _1106 * 0.15915493667125701904296875;
        float _1110 = _1108 * 6.283185482025146484375;
        float _1112 = cos(_1110);
        float _1114 = _1108 * 6.283185482025146484375;
        float _1116 = sin(_1114);
        float _1118 = _1112 + (-1.0);
        float _1120 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = fma(_1116, _1102, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1124 = fma(_1070, _1112, _1120);
        float _1126 = _1104 * _1122;
        float _1128 = fma(_1056, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1130 = fma(_1048, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1094 = _1124;
        _1084 = _1128;
        _1088 = _1130;
    }
    float _1132 = _1094;
    float _1134 = _1084;
    float _1136 = _1088;
    float _1138 = -_1062;
    float _1140 = _1138 + _1132;
    float _1142 = -_1032;
    float _1144 = _1142 + _1134;
    float _1146 = -_1026;
    float _1148 = _1146 + _1136;
    float _1150 = _1140 * _1140;
    float _1152 = fma(_1144, _1144, _1150);
    float _1154 = fma(_1148, _1148, _1152);
    float _1156 = sqrt(_1154);
    bool _1158 = _1156 > 0.0;
    bool _1160 = !_1158;
    float _1162 = _1132;
    float _1164 = _1134;
    float _1166 = _1136;
    float _1168 = _1154;
    float _1170 = _1144;
    if (!_1160)
    {
        float _1172 = _194 * _194;
        float _1174 = fma(_192, _192, _1172);
        float _1176 = rsqrt(_1154);
        float _1178 = fma(_196, _196, _1174);
        float _1180 = sqrt(_1178);
        float _1182 = _1144 * _1176;
        float _1184 = _1140 * _1176;
        float _1186 = _1148 * _1176;
        bool _1188 = _1180 > 0.0;
        bool _1190 = !_1188;
        _1080 = _1178;
        if (!_1190)
        {
            float _1192 = rsqrt(_1178);
            float _1194 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1196 = _194 * _1192;
            float _1198 = _192 * _1192;
            float _1200 = _196 * _1192;
            float _1202 = _1184 * _1196;
            float _1204 = fma(_1182, _1198, _1202);
            float _1206 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1208 = fma(_1186, _1200, _1204);
            float _1210 = _1208 * _1206;
            float _1212 = fma(_192, _1210, _1134);
            float _1214 = fma(_194, _1210, _1132);
            float _1216 = fma(_196, _1210, _1136);
            _1162 = _1214;
            _1164 = _1212;
            _1166 = _1216;
            _1168 = _1198;
            _1170 = _1204;
        }
    }
    float _1218 = _1162;
    float _1220 = _1164;
    float _1222 = _1166;
    float _1224 = _1080;
    float _1226 = _1168;
    float _1228 = _1170;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1232 = _1218 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1236 = _1220 + _1234;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1240 = _1222 + _1238;
    float _1242 = _1232 * _1232;
    float _1244 = fma(_1236, _1236, _1242);
    float _1246 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1248 = fma(_1240, _1240, _1244);
    float _1250 = rsqrt(_1248);
    float _1252 = sqrt(_1248);
    float _1254 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1256 = _1236 * _1254;
    float _1258 = _1240 * _1254;
    float _1260 = _1256 * _1256;
    float _1262 = _1258 * _1258;
    float _1264 = _1260 + _1262;
    float _1266 = sqrt(_1264);
    bool _1268 = _1266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1272 = _1266 + _1270;
    float _1274 = _1224;
    float _1276 = _1272;
    float _1278 = _1228;
    float _1280 = _1256;
    if (_1268)
    {
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1282;
    }
    float _1284 = _1274;
    if (_1268)
    {
        float _1286 = rsqrt(_1264);
        _200 = _1286;
    }
    float _1288 = _200;
    float _1290 = _1288;
    if (_1268)
    {
        float _1292 = _1272 * _1284;
        _1276 = _1292;
    }
    float _1294 = _1276;
    if (_1268)
    {
        float _1296 = _1294 * 0.15915493667125701904296875;
        _1278 = _1296;
    }
    float _1298 = _1278;
    float _1300 = _1226;
    if (_1268)
    {
        float _1302 = _1298 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        _1300 = _1304;
    }
    float _1306 = _1300;
    float _1308 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1310 = precise::max(0.0, _1308);
    float _1312 = _1284;
    float _1314 = _1310;
    if (_1268)
    {
        float _1316 = _1298 * 6.283185482025146484375;
        float _1318 = cos(_1316);
        _1312 = _1318;
    }
    float _1320 = _1312;
    float _1322 = -_1254;
    float _1324 = -_1310;
    float _1326 = fma(_1232, _1322, _1324);
    if (_1268)
    {
        float _1328 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _202 = _1328;
    }
    float _1330 = _202;
    float _1332 = _1330;
    float _1334 = _1306;
    if (_1268)
    {
        float _1336 = fma(_1306, _1330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1332 = _1336;
    }
    float _1338 = _1332;
    float _1340 = _1338;
    if (!_1268)
    {
        _1334 = _1260;
    }
    float _1342 = _1334;
    float _1344 = _1342;
    if (_1268)
    {
        float _1346 = _1320 + (-1.0);
        _1314 = _1346;
    }
    float _1348 = _1314;
    float _1350 = _1348;
    if (_1268)
    {
        float _1352 = _1288 * _1338;
        _802 = _1352;
    }
    float _1354 = _802;
    if (!_1268)
    {
        _1340 = _1326;
    }
    float _1356 = _1340;
    float _1358 = _1356;
    if (_1268)
    {
        float _1360 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1290 = _1360;
    }
    float _1362 = _1290;
    float _1364 = _1362;
    if (_1268)
    {
        float _1366 = _1256 * _1354;
        _1280 = _1366;
    }
    float _1368 = _1280;
    if (!_1268)
    {
        _1350 = _1258;
    }
    float _1370 = _1350;
    float _1372 = _1370;
    if (_1268)
    {
        float _1374 = _1258 * _1354;
        _1372 = _1374;
    }
    float _1376 = _1372;
    if (_1268)
    {
        float _1378 = fma(_1326, _1320, _1362);
        _1358 = _1378;
    }
    float _1380 = _1358;
    if (_1268)
    {
        float _1382 = _1368 * _1368;
        _1344 = _1382;
    }
    float _1384 = _1344;
    if (!_1268)
    {
        _1364 = _1262;
    }
    float _1386 = _1364;
    float _1388 = _1386;
    if (_1268)
    {
        float _1390 = _1376 * _1376;
        _1388 = _1390;
    }
    float _1392 = _1388;
    float _1394 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1396 = fma(_1380, _1380, _1384);
    float _1398 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1400 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1402 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1394);
    float _1404 = _1396 + _1392;
    float _1406 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1408 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1398);
    float _1410 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1402);
    float _1412 = fma(_1032, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1414 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1406);
    float _1416 = rsqrt(_1404);
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1420 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1414);
    float _1422 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1408);
    float _1424 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1400);
    float _1426 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1428 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1432 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1430);
    float _1434 = precise::clamp(_1432, 0.0, 1.0);
    float _1436 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1424);
    float _1438 = _1422 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1440 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1426);
    float _1442 = -_1434;
    float _1444 = _1442 + 1.0;
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1448 = floor(_1412);
    float _1450 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1440);
    float _1452 = _1416 * _1368;
    float _1454 = _1416 * _1380;
    float _1456 = _1416 * _1376;
    float _1458 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1450);
    float _1460 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1462 = fma(_1026, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1464 = abs(_1444);
    float _1466 = log2(_1464);
    float _1468 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1470 = -_1460;
    float _1472 = fma(_1454, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1470);
    float _1474 = -_1456;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1472);
    float _1478 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1480 = floor(_1462);
    float _1482 = fma(_1476, -0.5, 0.5);
    float _1484 = fma(_1476, 0.5, 0.5);
    float _1486 = -_1448;
    float _1488 = _1412 + _1486;
    float _1490 = -_1478;
    float _1492 = fma(_1490, _1246, 1.0);
    float _1494 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1496 = fma(_1484, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1498 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1500 = sqrt(_1482);
    float _1502 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1494);
    float _1504 = fma(_1484, _1496, -0.212114393711090087890625);
    float _1506 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1468);
    float _1508 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1502);
    float _1510 = fma(_1484, _1504, 1.570728778839111328125);
    float _1512 = -_1480;
    float _1514 = _1462 + _1512;
    float _1516 = 1.0 / _1458;
    float _1518 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1506);
    float _1520 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1508);
    float _1522 = _1454 + 1.0;
    float _1524 = exp2(_1498);
    float _1526 = _1500 * 0.636619746685028076171875;
    float _1528 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1518);
    float _1530 = log2(_1492);
    float _1532 = _1520 * _1516;
    float _1534 = _1528 * _1516;
    float _1536 = -_1510;
    float _1538 = fma(_1526, _1536, 1.0);
    float2 _4691 = float2(_1488, _1514);
    float _1540 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4691, float2(0.0), isnan(_4691)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4691, float2(0.0), isnan(_4691)), level(0.0)).x;
    float _1542 = fma(_1532, 0.5, 0.5);
    float _1544 = -_1454;
    float _1546 = fma(_1524, _1522, _1544);
    float _1548 = fma(_1546, 0.5, 0.5);
    float _1550 = fma(_1534, -0.5, 0.5);
    float _1552 = _1530 * 0.693147182464599609375;
    float _1554 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4721 = float3(_1542, _1550, _1554);
    float _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4721, float3(0.0), isnan(_4721)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4721, float3(0.0), isnan(_4721)), level(0.0)).x;
    float3 _4732 = float3(_1542, _1550, _1554);
    float4 _1559 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4732, float3(0.0), isnan(_4732)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4732, float3(0.0), isnan(_4732)), level(0.0)).xyzw;
    float _1561 = _1559.x;
    float _1563 = _1559.y;
    float _1565 = _1559.z;
    float _1567 = _1559.w;
    float2 _4748 = float2(_1538, _1548);
    float3 _1571 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4748, float2(0.0), isnan(_4748)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4748, float2(0.0), isnan(_4748)), level(0.0)).xyz;
    float _1573 = _1571.x;
    float _1575 = _1571.y;
    float _1577 = _1571.z;
    float _1579 = in.m_63.w;
    float _1581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1583 = _234 > 0.5;
    float _1585 = in.m_63.x;
    int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1589 = _1587 != 0;
    float _1591 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1595 = _1593 != 0;
    float _1597 = in.m_63.y;
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1601 = _1599 != 0;
    float _1603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1605 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1607 = in.m_63.z;
    float _1609 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1611 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1605);
    float _1613 = in.m_55.w;
    float _1615 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1609);
    if (_1589)
    {
        bool _1617 = _240 > 0.5;
        _666 = _1617;
    }
    bool _1619 = _666;
    float _1621 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1611);
    float _1623 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1615);
    float _1625 = in.m_65.x;
    float _1627 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_67.w = _1579;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1633 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1635 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1637 = in.m_65.y;
    float _1639 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1641 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1643 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1585;
    float _1645 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1649 = _1647 != 0;
    out.m_67.y = _1597;
    bool _1651 = _1613 > 0.5;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_67.z = _1607;
    float _1655 = _1653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1657 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_69.x = _1639;
    out.m_69.y = _1641;
    out.m_69.z = _1643;
    out.m_69.w = _1635;
    float _1659 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1663 = 1.0 / _1627;
    float _1665 = _1621 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1669 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    bool _1671 = _1649;
    float _1673 = _1661;
    int _1675 = as_type<int>(_1645);
    float _1677 = _1625;
    float _1679 = _1657;
    if (_1595)
    {
        float _1681 = in.m_55.x;
        _1669 = _1681;
    }
    float _1683 = _1669;
    float _1685 = -_1637;
    float _1687 = _1685 + 1.0;
    float _1689 = _1665 + _1627;
    float _1691 = _1667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1693 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1591);
    out.m_71.x = _1236;
    out.m_71.y = _1232;
    out.m_71.z = _1240;
    int _1697 = _1583 ? as_type<int>(_1687) : as_type<int>(_1637);
    float _1699 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1695);
    bool _1701 = _870 != 0.0;
    bool _1703 = isnan(_870);
    bool _1705 = _1701 || _1703;
    bool _1707 = isnan(0.0);
    bool _1709 = _1705 || _1707;
    out.m_73.x = _1691;
    out.m_73.y = _1693;
    out.m_73.z = _1655;
    out.m_73.w = _1661;
    float _1711 = _1689 * _1663;
    float _1713 = _1711 * 0.5;
    bool _1715 = _868 == 0.0;
    bool _1717 = !_1709;
    bool _1719 = _1715 && _1717;
    float _1721 = in.m_75.x;
    float _1723 = in.m_75.y;
    float _1725 = in.m_75.z;
    float _1727 = _1649 ? as_type<float>(_1697) : _1637;
    float _1729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1731 = _1637;
    float _1733 = _1691;
    if (_1601)
    {
        float _1735 = _1651 ? _1687 : _1637;
        _1731 = _1735;
    }
    float _1737 = _1731;
    float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1741 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1739);
    bool _1743 = _872 == 0.0;
    bool _1745 = _1743 && _1719;
    float _1747 = fma(_1645, _1727, -0.5);
    float _1749 = fma(_1657, _1737, -0.5);
    if (_1595)
    {
        bool _1751 = _1683 > 0.5;
        _1671 = _1751;
    }
    bool _1753 = _1671;
    float _1755 = 1.0 / _1741;
    if (!_1595)
    {
        _1673 = _1625;
    }
    float _1757 = _1673;
    float _1759 = -_444;
    float _1761 = fma(_792, _1747, _1759);
    float _1763 = -_690;
    float _1765 = fma(_676, _1749, _1763);
    float _1767 = in.m_77.x;
    float _1769 = in.m_77.y;
    float _1771 = in.m_77.z;
    float _1773 = in.m_77.w;
    float _1775 = _1757;
    if (!_1595)
    {
        _1733 = _1757;
    }
    float _1777 = _1733;
    float _1779 = _962 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1781 = _1777;
    if (_1595)
    {
        _1775 = _1625;
    }
    float _1783 = _1775;
    float _1785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1787 = _1783;
    if (_1595)
    {
        float _1789 = -_1783;
        float _1791 = _1789 + 1.0;
        _668 = as_type<int>(_1791);
    }
    int _1793 = _668;
    float _1795 = as_type<float>(_1793);
    if (_1589)
    {
        float _1797 = -_1783;
        float _1799 = _1797 + 1.0;
        _1675 = as_type<int>(_1799);
    }
    int _1801 = _1675;
    float _1803 = _1721;
    if (_1745)
    {
        _1677 = _1723;
    }
    float _1805 = _1677;
    float _1807 = _1805;
    if (_1745)
    {
        _1679 = _1721;
    }
    float _1809 = _1679;
    float _1811 = _1809;
    if (_1595)
    {
        float _1813 = _1753 ? as_type<float>(_1793) : _1783;
        _1781 = _1813;
    }
    float _1815 = _1781;
    if (_1745)
    {
        _1795 = _1805;
    }
    float _1817 = _1795;
    float _1819 = _1817;
    if (!_1745)
    {
        _1807 = _1723;
    }
    float _1821 = _1807;
    float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1825 = _1755 * _1823;
    float _1827 = _1729 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1589)
    {
        float _1829 = _1619 ? as_type<float>(_1801) : _1783;
        _1787 = _1829;
    }
    float _1831 = _1787;
    float _1833 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1835 = abs(_1825);
    float _1837 = log2(_1835);
    if (_1745)
    {
        _804 = _1809;
    }
    float _1839 = _804;
    float _1841 = fma(_1827, _1815, -0.5);
    float _1843 = _1839;
    if (!_1745)
    {
        _1811 = _1721;
    }
    float _1845 = _1811;
    float _1847 = fma(_1833, _1831, -0.5);
    if (!_1745)
    {
        float _1849 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1821);
        _1819 = _1849;
    }
    float _1851 = _1819;
    float _1853 = _1769 * _1725;
    float _1855 = fma(_784, _1841, _440);
    if (!_1745)
    {
        float _1857 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1845);
        _1843 = _1857;
    }
    float _1859 = _1843;
    float _1861 = fma(_662, _1847, _686);
    float _1863 = _1767 * _1821;
    float _1865 = _1771 * _1845;
    float _1867 = _1761 + 0.5;
    float _1869 = _1861 + 0.5;
    float _1871 = -_1863;
    float _1873 = fma(_1769, _1845, _1871);
    float _1875 = -_1865;
    float _1877 = fma(_1767, _1725, _1875);
    float _1879 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1881 = -_1853;
    float _1883 = fma(_1771, _1821, _1881);
    if (_1745)
    {
        _1803 = _1725;
    }
    float _1885 = _1803;
    float _1887 = _1885;
    if (!_1745)
    {
        float _1889 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1725);
        _1887 = _1889;
    }
    float _1891 = _1887;
    float _1893 = exp2(_1879);
    float _1895 = _1877 * _1773;
    float _1897 = _1883 * _1773;
    float _1899 = _1873 * _1773;
    float _1901 = _962 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1903 = _1765 + 0.5;
    float _1905 = _962 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1907 = -_948;
    float _1909 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1779);
    float _1911 = -_948;
    float _1913 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1901);
    float _1915 = _1855 + 0.5;
    float _1917 = _974 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1919 = _974 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1921 = _974 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1923 = -_948;
    float _1925 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1905);
    out.m_79.x = _1915;
    out.m_79.y = _1867;
    out.m_79.z = _1869;
    out.m_79.w = _1903;
    float _1927 = fma(_1893, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1929 = precise::clamp(_1927, 0.0, 1.0);
    float _1931 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1917);
    float _1933 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1919);
    float _1935 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1921);
    float _1937 = _988 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1939 = _988 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1941 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1913);
    float _1943 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1909);
    float _1945 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1925);
    float _1947 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1937);
    float _1949 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1939);
    float _1951 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1931);
    float _1953 = _1941 * _1769;
    float _1955 = _988 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1957 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1933);
    float _1959 = _1943 * _1769;
    float _1961 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1955);
    float _1963 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1935);
    float _1965 = _1945 * _1769;
    float _1967 = _1941 * _1851;
    float _1969 = _1895 * _1941;
    float _1971 = _1895 * _1943;
    float _1973 = _1895 * _1945;
    float _1975 = fma(_1929, -2.0, 3.0);
    float _1977 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1947);
    float _1979 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1961);
    float _1981 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1949);
    float _1983 = fma(_1951, _1767, _1953);
    float _1985 = fma(_1957, _1767, _1959);
    float _1987 = fma(_1963, _1767, _1965);
    float _1989 = _1943 * _1851;
    float _1991 = fma(_1951, _1859, _1967);
    float _1993 = fma(_1897, _1951, _1969);
    float _1995 = fma(_1977, _1771, _1983);
    float _1997 = fma(_1979, _1771, _1985);
    float _1999 = fma(_1981, _1771, _1987);
    float _2001 = fma(_1957, _1859, _1989);
    float _2003 = fma(_1897, _1957, _1971);
    float _2005 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2007 = _1929 * _1929;
    float _2009 = _1945 * _1851;
    float _2011 = fma(_1897, _1963, _1973);
    bool _2013 = _1825 <= 8000.0;
    bool _2015 = isnan(_1825);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan(8000.0);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    float _2025 = _2007 * _1975;
    float _2027 = exp2(_2005);
    float _2029 = fma(_1963, _1859, _2009);
    float _2031 = fma(_1899, _1977, _1993);
    float _2033 = -_2025;
    float _2035 = _2033 + 1.0;
    float _2037 = in.m_81.x;
    bool _2039 = _1252 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2041 = isnan(_1252);
    bool _2043 = _2039 || _2041;
    bool _2045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2047 = _2043 || _2045;
    float _2049 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2025);
    float _2051 = fma(_1899, _1979, _2003);
    float _2053 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1699);
    float _2055 = fma(_1899, _1981, _2011);
    float _2057 = _2023 * _2049;
    float _2059 = _2053 + _1458;
    float _2061 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2063 = -_2027;
    float _2065 = _2063 + 1.0;
    out.m_83.x = _2031;
    out.m_83.y = _2051;
    out.m_83.z = _2055;
    float _2067 = _2059 * 0.5;
    out.m_85.x = _1995;
    out.m_85.y = _1997;
    out.m_85.z = _1999;
    out.m_87.z = _2067;
    out.m_87.w = _1458;
    float _2069 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1520;
    out.gl_Position.y = _1528;
    out.gl_Position.z = _2053;
    out.gl_Position.w = _1458;
    float _2071 = fma(_1977, _1891, _1991);
    float _2073 = fma(_1979, _1891, _2001);
    float _2075 = fma(_1981, _1891, _2029);
    out.m_89.x = _2071;
    out.m_89.y = _2073;
    out.m_89.z = _2075;
    float _2077 = -_1540;
    float _2079 = _2077 + 1.0;
    float _2081 = _2079 * _2061;
    float _2083 = precise::clamp(_2081, 0.0, 1.0);
    float _2085 = -_2083;
    float _2087 = fma(_2085, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2089 = _2087 * _2037;
    float _2091 = _2089 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2093 = _2089;
    if (!_2047)
    {
        _2093 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2095 = _2093;
    float _2097 = _2069 * _1556;
    float _2099 = -_2069;
    float _2101 = _2099 + 1.0;
    out.m_91.x = _2091;
    float _2103 = _1567 * _2097;
    float _2105 = _1577 * _2097;
    float _2107 = _2097;
    float _2109 = _2105;
    float _2111 = _2095;
    float _2113 = _2095;
    if (!_2047)
    {
        _2107 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2115 = _2107;
    float _2117 = fma(_1573, _2103, _1561);
    float _2119 = fma(_1575, _2103, _1563);
    float _2121 = _1567 * _2101;
    float _2123 = fma(_1567, _2105, _1565);
    float _2125 = _2115;
    float _2127 = _2115;
    if (!_2047)
    {
        _2109 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2129 = _2109;
    out.m_93.x = _2117;
    out.m_93.y = _2119;
    out.m_93.z = _2123;
    out.m_93.w = _2121;
    bool _2131 = !_2047;
    float _2133 = _2129;
    float _2135 = _2129;
    if (!_2131)
    {
        bool _2137 = _1252 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2139 = isnan(_1252);
        bool _2141 = _2137 || _2139;
        bool _2143 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2145 = _2141 || _2143;
        if (!_2145)
        {
            float _2147 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2149 = _1252 + _2147;
            float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2153 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2151;
            float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2157 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2163 = 1.0 / _2153;
            float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2169 = _2149 * _2163;
            float _2171 = precise::clamp(_2169, 0.0, 1.0);
            float _2173 = fma(_2171, _2157, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2175 = fma(_2171, _2161, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2177 = fma(_2171, _2167, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2127 = _2175;
            _2135 = _2173;
            _2113 = _2177;
            _2179 = true;
        }
        else
        {
            bool _2181 = _1252 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2183 = isnan(_1252);
            bool _2185 = _2181 || _2183;
            bool _2187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2189 = _2185 || _2187;
            if (!_2189)
            {
                _2133 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2191 = _2133;
            _2135 = _2191;
            if (!_2189)
            {
                _2125 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2193 = _2125;
            _2127 = _2193;
            if (!_2189)
            {
                _2111 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2195 = _2111;
            bool _2197 = !_2189;
            _2113 = _2195;
            if (!_2197)
            {
                bool _2199 = _1252 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2201 = isnan(_1252);
                bool _2203 = _2199 || _2201;
                bool _2205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2207 = _2203 || _2205;
                if (!_2207)
                {
                    float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2211 = _1252 + _2209;
                    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2215 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2213;
                    float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2225 = 1.0 / _2215;
                    float _2227 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2229 = _2227 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2231 = _2211 * _2225;
                    float _2233 = precise::clamp(_2231, 0.0, 1.0);
                    float _2235 = fma(_2233, _2219, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2237 = fma(_2233, _2223, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2239 = fma(_2233, _2229, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2127 = _2237;
                    _2135 = _2235;
                    _2113 = _2239;
                    _2179 = true;
                }
                else
                {
                    _2127 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2135 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2113 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2179 = false;
    float _2241 = _2127;
    float _2243 = _2135;
    float _2245 = _2113;
    float _2247 = _2241 * 0.586610972881317138671875;
    bool _2249 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_95.x = 0.0;
    float _2251 = fma(_2243, 0.298911988735198974609375, _2247);
    float _2253 = fma(_2245, 0.114477999508380889892578125, _2251);
    float _2255 = -_2253;
    float _2257 = _2255 + _2243;
    float _2259 = -_2253;
    float _2261 = _2259 + _2241;
    float _2263 = -_2253;
    float _2265 = _2263 + _2245;
    float _2267 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2269 = fma(_2257, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2253);
    float _2271 = fma(_2261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2253);
    float _2273 = fma(_2265, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2253);
    out.m_49.x = _2267;
    out.m_97.x = _2269;
    out.m_97.y = _2271;
    out.m_97.z = _2273;
    if (!_2249)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2275 = -_1218;
    float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2279 = -_1220;
    float _2281 = _2279 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2283 = -_1222;
    float _2285 = _2283 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2287 = _2277 * _2277;
    float _2289 = fma(_2281, _2281, _2287);
    float _2291 = fma(_2285, _2285, _2289);
    float _2293 = sqrt(_2291);
    float _2295 = rsqrt(_2291);
    float _2297 = -_2293;
    float _2299 = _2297 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2301 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2303 = precise::clamp(_2301, 0.0, 1.0);
    float _2305 = _2281 * _2295;
    float _2307 = _2277 * _2295;
    float _2309 = abs(_2303);
    float _2311 = log2(_2309);
    float _2313 = _2285 * _2295;
    float _2315 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2317 = _2073 * _2307;
    float _2319 = -_2307;
    float _2321 = -_2315;
    float _2323 = fma(_2319, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2321);
    float _2325 = fma(_2071, _2305, _2317);
    float _2327 = -_2313;
    float _2329 = fma(_2327, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2323);
    float _2331 = fma(_2075, _2313, _2325);
    float _2333 = precise::clamp(_2331, 0.0, 1.0);
    float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2337 = _2329 + _2335;
    float _2339 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2343 = precise::clamp(_2341, 0.0, 1.0);
    float _2345 = exp2(_2339);
    float _2347 = _2345 * _2343;
    float _2349 = _2333 * _2347;
    float _2351 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2353 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2355 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2351;
    out.m_95.y = _2353;
    out.m_95.z = _2355;
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
    bool _2179 = false;
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
        float _2412 = as_type<float>(_132);
        out.gl_Position.z = _2412;
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
        float _2481 = as_type<float>(_170);
        out.gl_Position.z = _2481;
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
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = _230 + _236;
    float _240 = in.m_55.z;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _250;
    float _254 = 1.0 / _244;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _264 = 1.0 / _252;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _268 = _230 + _266;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _272 = _270 != 0;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _230 + _274;
    float _278 = 1.0 / _248;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _280;
    float _284 = _234 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _286 = _276 * _254;
    float _288 = _234 + _240;
    float _290 = fma(_284, -2.0, _260);
    float _292 = _240 * 2.0;
    float _294 = 1.0 / _282;
    float _296 = _232 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _298 = _238 * _264;
    float _300 = _234 * 2.0;
    float _302 = _288 + (-1.0);
    float _304 = -_262;
    float _306 = fma(_296, 2.0, _304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _230 + _308;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _314 = _312 != 0;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _318 = _316 != 0;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _322 = _320 != 0;
    float _324 = floor(_292);
    float _326 = _232 * 2.0;
    float _328 = _310 * _278;
    float _330 = _232 + _240;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _230 + _332;
    float _336 = 0.0;
    if (!_272)
    {
        _336 = _240;
    }
    float _338 = _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _340;
    float _344 = _330 + (-1.0);
    float _346 = floor(_326);
    float _348 = _338;
    if (_272)
    {
        _348 = _234;
    }
    float _350 = _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    float _356 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = fma(_342, _286, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = 1.0 / _258;
    bool _370 = _324 >= 0.0;
    bool _372 = isnan(_324);
    bool _374 = _370 || _372;
    bool _376 = isnan(0.0);
    bool _378 = _374 || _376;
    float _380 = fma(_354, _286, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _382 = _324 > 0.0;
    float _384 = fma(_360, _328, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _386 = _378 ? 0 : 1;
    float _388 = fma(_364, _328, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _390 = floor(_300);
    float _392 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _394 = _234 + _232;
    bool _396 = _346 >= 0.0;
    bool _398 = isnan(_346);
    bool _400 = _396 || _398;
    bool _402 = isnan(0.0);
    bool _404 = _400 || _402;
    float _406 = _268 * _294;
    float _408 = _394 + (-1.0);
    int _410 = _404 ? 0 : 1;
    float _412 = _334 * _368;
    float _414 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _416 = _408;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_272)
    {
        _416 = _234;
    }
    float _420 = _416;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _422;
    float _426 = _420;
    if (!_272)
    {
        _418 = _240;
    }
    float _428 = _418;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _434 = _428;
    if (_272)
    {
        _426 = _232;
    }
    float _436 = _426;
    float _438 = -_150;
    float _440 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[76].x, _306);
    if (_272)
    {
        _434 = _234;
    }
    float _442 = _434;
    float _444 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _290);
    bool _446 = _346 > 0.0;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _448;
    bool _452 = _390 > 0.0;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _458 = _390 >= 0.0;
    bool _460 = isnan(_390);
    bool _462 = _458 || _460;
    bool _464 = isnan(0.0);
    bool _466 = _462 || _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _468;
    float _472 = fma(_450, _286, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _474 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _476 = isnan(_230);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = fma(_456, _328, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    float _492 = fma(_470, _298, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _494 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _496 = isnan(_230);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -_484;
    float _508 = _506 + 1.0;
    float _510 = fma(_490, _298, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _516 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _518 = isnan(_230);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _532 = -_504;
    float _534 = _532 + 1.0;
    float _536 = _504 * _508;
    float _538 = fma(_514, _412, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _540 = fma(_424, _298, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _542 = fma(_530, _412, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _544 = fma(_432, _412, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _546 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _548 = isnan(_230);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = _526 * _534;
    float _560 = -_526;
    float _562 = _560 + 1.0;
    bool _564 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _566 = isnan(_230);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = _442 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _578 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _580 = isnan(_230);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = _556 * _562;
    float _592 = -_556;
    float _594 = _592 + 1.0;
    float _596 = -_588;
    float _598 = _596 + 1.0;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _602 = _588 * _594;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _604;
    float _608 = _574 * _598;
    float _610 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[83].w, _600);
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _614 = _472 * _608;
    float _616 = _366 * _608;
    float _618 = _380 * _608;
    float _620 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[83].z, _612);
    float _622 = _436 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _626 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _628 = log2(_626);
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _632 = -_574;
    float _634 = _632 + 1.0;
    float _636 = fma(_576, -2.0, _624);
    bool _638 = !_314;
    int _640 = _638 ? 0 : 1;
    float _642 = -_630;
    float _644 = fma(_622, 2.0, _642);
    float _646 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].x, _614);
    float _648 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].y, _616);
    float _650 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].z, _618);
    int _652 = ~_386;
    int _654 = _652 + 1;
    int _656 = _654 + 1;
    float _658 = fma(_606, _406, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    int _660 = abs(_640);
    float _662 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _620);
    int _664 = _656;
    bool _666 = _452;
    int _668 = as_type<int>(_444);
    if (!_382)
    {
        int _670 = ~_386;
        int _672 = _670 + 1;
        _664 = _672;
    }
    int _674 = _664;
    float _676 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _610);
    int _678 = _466 ? 0 : 1;
    float _680 = _628 * _150;
    float _682 = float(_660);
    float _684 = -_150;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[81].x, _644);
    float _688 = float(_674);
    float _690 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _636);
    int _692 = ~_678;
    int _694 = _692 + 1;
    int _696 = _694 + 1;
    float _698 = exp2(_680);
    int _700 = _696;
    if (!_452)
    {
        int _702 = ~_678;
        int _704 = _702 + 1;
        _700 = _704;
    }
    int _706 = _700;
    float _708 = _682 * _688;
    int _710 = ~_410;
    int _712 = _710 + 1;
    int _714 = _712 + 1;
    float _716 = in.m_57.x;
    float _718 = in.m_57.y;
    float _720 = in.m_57.z;
    int _722 = _714;
    if (!_446)
    {
        int _724 = ~_410;
        int _726 = _724 + 1;
        _722 = _726;
    }
    int _728 = _722;
    float _730 = _708 * (-2.0);
    float _732 = fma(_486, _602, _646);
    float _734 = fma(_414, _730, _414);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _738 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _740 = isnan(1.0);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _746 = _742 || _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _750 = 1.0 + _748;
    bool _752 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _760 = _756 || _758;
    float _762 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[78].z, _736);
    bool _764 = !_318;
    int _766 = _764 ? 0 : 1;
    float _768 = 1.0 / _750;
    float _770 = -_698;
    float _772 = _770 + 1.0;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _776 = abs(_766);
    float _778 = _232 + (-0.5);
    float _780 = float(_728);
    float _782 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[78].w, _774);
    float _784 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _762);
    float _786 = _760 ? _772 : 0.0;
    float _788 = fma(_730, _716, _716);
    float _790 = float(_776);
    float _792 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _782);
    bool _794 = !_322;
    int _796 = _794 ? 0 : 1;
    float _798 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[196].x, _788);
    float _800 = fma(_384, _602, _648);
    float _802 = _780;
    float _804 = _792;
    if (_746)
    {
        float _806 = _786 * _768;
        _154 = _806;
    }
    float _808 = _154;
    float _810 = _790 * _780;
    int _812 = abs(_796);
    float _814 = fma(_388, _602, _650);
    float _816 = fma(_734, _808, _798);
    float _818 = _810 * (-2.0);
    float _820 = _234 + (-0.5);
    float _822 = float(_706);
    float _824 = _816 * 0.15915493667125701904296875;
    float _826 = float(_812);
    float _828 = fma(_818, _718, _718);
    float _830 = fma(_392, _818, _392);
    float _832 = fma(_540, _590, _814);
    float _834 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].y, _828);
    float _836 = _826 * _822;
    float _838 = fma(_492, _590, _732);
    float _840 = fma(_830, _808, _834);
    float _842 = _836 * (-2.0);
    float _844 = in.m_59.x;
    float _846 = in.m_59.y;
    float _848 = in.m_59.z;
    float _850 = fma(_510, _590, _800);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _852;
    float _856 = fma(_842, _720, _720);
    float _858 = _240 + (-0.5);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _860;
    float _864 = _840 * 0.15915493667125701904296875;
    float _866 = fma(_854, _406, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _868 = in.m_61.x;
    float _870 = in.m_61.y;
    float _872 = in.m_61.z;
    float _874 = fma(_356, _842, _356);
    float _876 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[196].z, _856);
    float _878 = fma(_862, _406, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _880 = fma(_538, _558, _838);
    float _882 = fma(_544, _558, _832);
    float _884 = fma(_542, _558, _850);
    float _886 = fma(_874, _808, _876);
    float _888 = fma(_658, _536, _880);
    float _890 = fma(_878, _536, _882);
    float _892 = fma(_866, _536, _884);
    float _894 = _886 * 0.15915493667125701904296875;
    float _896 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[148].x, _888);
    float _898 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[148].z, _890);
    float _900 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[148].y, _892);
    float _902 = _824 * 6.283185482025146484375;
    float _904 = cos(_902);
    float _906 = _896 * _844;
    float _908 = _898 * _848;
    float _910 = _900 * _846;
    float _912 = in.m_46.x;
    float _914 = in.m_46.y;
    float _916 = in.m_46.z;
    float _918 = _906 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _920 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _922 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _924 = _864 * 6.283185482025146484375;
    float _926 = sin(_924);
    float _928 = _864 * 6.283185482025146484375;
    float _930 = cos(_928);
    float _932 = _824 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = _904 * _926;
    float _938 = _894 * 6.283185482025146484375;
    float _940 = cos(_938);
    float _942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _870);
    float _944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _868);
    float _946 = _894 * 6.283185482025146484375;
    float _948 = sin(_946);
    float _950 = _934 * _926;
    float _952 = _942 * _922;
    float _954 = _904 * _930;
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _872);
    float _958 = _944 * _918;
    float _960 = _934 * _930;
    float _962 = _904 * _940;
    float _964 = _930 * _940;
    float _966 = _934 * _940;
    float _968 = _926 * _940;
    float _970 = _962 * _952;
    float _972 = _956 * _920;
    float _974 = fma(_948, _954, _950);
    float _976 = -_952;
    float _978 = _948 * _976;
    float _980 = -_936;
    float _982 = fma(_948, _960, _980);
    float _984 = _966 * _952;
    float _986 = -_960;
    float _988 = fma(_948, _936, _986);
    float _990 = fma(_974, _958, _970);
    float _992 = fma(_964, _958, _978);
    float _994 = fma(_982, _958, _984);
    float _996 = fma(_948, _950, _954);
    float _998 = fma(_988, _972, _990);
    float _1000 = _914 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1002 = fma(_968, _972, _992);
    float _1004 = fma(_996, _972, _994);
    float _1006 = _998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1008 = _914 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1010 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1000);
    float _1012 = _998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1014 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1006);
    float _1016 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1008);
    float _1018 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1010);
    float _1020 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1012);
    float _1022 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1014);
    float _1024 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1016);
    float _1026 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1028 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1020);
    float _1030 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1034 = _914 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1036 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1038 = _1026 + _1030;
    float _1040 = _998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1042 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1034);
    float _1044 = _1032 + _1036;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1048 = _1038 + _1046;
    float _1050 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1040);
    float _1052 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1042);
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1056 = _1044 + _1054;
    float _1058 = _1048 * _1048;
    float _1060 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1050);
    float _1062 = _1052 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1064 = fma(_1056, _1056, _1058);
    float _1066 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1068 = sqrt(_1064);
    float _1070 = _1062 + _1066;
    bool _1072 = _1068 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1074 = _912;
    float _1076 = _916;
    float _1078 = _1052;
    float _1080 = _1048;
    if (!_1072)
    {
        _1074 = _1044;
    }
    float _1082 = _1074;
    float _1084 = _1082;
    if (!_1072)
    {
        _1076 = _1038;
    }
    float _1086 = _1076;
    float _1088 = _1086;
    if (!_1072)
    {
        _1078 = _1070;
    }
    float _1090 = _1078;
    bool _1092 = !_1072;
    float _1094 = _1090;
    if (!_1092)
    {
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1100 = _1068 + _1098;
        float _1102 = _1070 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1104 = rsqrt(_1064);
        float _1106 = _1100 * _1096;
        float _1108 = _1106 * 0.15915493667125701904296875;
        float _1110 = _1108 * 6.283185482025146484375;
        float _1112 = cos(_1110);
        float _1114 = _1108 * 6.283185482025146484375;
        float _1116 = sin(_1114);
        float _1118 = _1112 + (-1.0);
        float _1120 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = fma(_1116, _1102, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1124 = fma(_1070, _1112, _1120);
        float _1126 = _1104 * _1122;
        float _1128 = fma(_1056, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1130 = fma(_1048, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1094 = _1124;
        _1084 = _1128;
        _1088 = _1130;
    }
    float _1132 = _1094;
    float _1134 = _1084;
    float _1136 = _1088;
    float _1138 = -_1062;
    float _1140 = _1138 + _1132;
    float _1142 = -_1032;
    float _1144 = _1142 + _1134;
    float _1146 = -_1026;
    float _1148 = _1146 + _1136;
    float _1150 = _1140 * _1140;
    float _1152 = fma(_1144, _1144, _1150);
    float _1154 = fma(_1148, _1148, _1152);
    float _1156 = sqrt(_1154);
    bool _1158 = _1156 > 0.0;
    bool _1160 = !_1158;
    float _1162 = _1132;
    float _1164 = _1134;
    float _1166 = _1136;
    float _1168 = _1154;
    float _1170 = _1144;
    if (!_1160)
    {
        float _1172 = _194 * _194;
        float _1174 = fma(_192, _192, _1172);
        float _1176 = rsqrt(_1154);
        float _1178 = fma(_196, _196, _1174);
        float _1180 = sqrt(_1178);
        float _1182 = _1144 * _1176;
        float _1184 = _1140 * _1176;
        float _1186 = _1148 * _1176;
        bool _1188 = _1180 > 0.0;
        bool _1190 = !_1188;
        _1080 = _1178;
        if (!_1190)
        {
            float _1192 = rsqrt(_1178);
            float _1194 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1196 = _194 * _1192;
            float _1198 = _192 * _1192;
            float _1200 = _196 * _1192;
            float _1202 = _1184 * _1196;
            float _1204 = fma(_1182, _1198, _1202);
            float _1206 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1208 = fma(_1186, _1200, _1204);
            float _1210 = _1208 * _1206;
            float _1212 = fma(_192, _1210, _1134);
            float _1214 = fma(_194, _1210, _1132);
            float _1216 = fma(_196, _1210, _1136);
            _1162 = _1214;
            _1164 = _1212;
            _1166 = _1216;
            _1168 = _1198;
            _1170 = _1204;
        }
    }
    float _1218 = _1162;
    float _1220 = _1164;
    float _1222 = _1166;
    float _1224 = _1080;
    float _1226 = _1168;
    float _1228 = _1170;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1232 = _1218 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1236 = _1220 + _1234;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1240 = _1222 + _1238;
    float _1242 = _1232 * _1232;
    float _1244 = fma(_1236, _1236, _1242);
    float _1246 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1248 = fma(_1240, _1240, _1244);
    float _1250 = rsqrt(_1248);
    float _1252 = sqrt(_1248);
    float _1254 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1256 = _1236 * _1254;
    float _1258 = _1240 * _1254;
    float _1260 = _1256 * _1256;
    float _1262 = _1258 * _1258;
    float _1264 = _1260 + _1262;
    float _1266 = sqrt(_1264);
    bool _1268 = _1266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1272 = _1266 + _1270;
    float _1274 = _1224;
    float _1276 = _1272;
    float _1278 = _1228;
    float _1280 = _1256;
    if (_1268)
    {
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1282;
    }
    float _1284 = _1274;
    if (_1268)
    {
        float _1286 = rsqrt(_1264);
        _200 = _1286;
    }
    float _1288 = _200;
    float _1290 = _1288;
    if (_1268)
    {
        float _1292 = _1272 * _1284;
        _1276 = _1292;
    }
    float _1294 = _1276;
    if (_1268)
    {
        float _1296 = _1294 * 0.15915493667125701904296875;
        _1278 = _1296;
    }
    float _1298 = _1278;
    float _1300 = _1226;
    if (_1268)
    {
        float _1302 = _1298 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        _1300 = _1304;
    }
    float _1306 = _1300;
    float _1308 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1310 = precise::max(0.0, _1308);
    float _1312 = _1284;
    float _1314 = _1310;
    if (_1268)
    {
        float _1316 = _1298 * 6.283185482025146484375;
        float _1318 = cos(_1316);
        _1312 = _1318;
    }
    float _1320 = _1312;
    float _1322 = -_1254;
    float _1324 = -_1310;
    float _1326 = fma(_1232, _1322, _1324);
    if (_1268)
    {
        float _1328 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _202 = _1328;
    }
    float _1330 = _202;
    float _1332 = _1330;
    float _1334 = _1306;
    if (_1268)
    {
        float _1336 = fma(_1306, _1330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1332 = _1336;
    }
    float _1338 = _1332;
    float _1340 = _1338;
    if (!_1268)
    {
        _1334 = _1260;
    }
    float _1342 = _1334;
    float _1344 = _1342;
    if (_1268)
    {
        float _1346 = _1320 + (-1.0);
        _1314 = _1346;
    }
    float _1348 = _1314;
    float _1350 = _1348;
    if (_1268)
    {
        float _1352 = _1288 * _1338;
        _802 = _1352;
    }
    float _1354 = _802;
    if (!_1268)
    {
        _1340 = _1326;
    }
    float _1356 = _1340;
    float _1358 = _1356;
    if (_1268)
    {
        float _1360 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1290 = _1360;
    }
    float _1362 = _1290;
    float _1364 = _1362;
    if (_1268)
    {
        float _1366 = _1256 * _1354;
        _1280 = _1366;
    }
    float _1368 = _1280;
    if (!_1268)
    {
        _1350 = _1258;
    }
    float _1370 = _1350;
    float _1372 = _1370;
    if (_1268)
    {
        float _1374 = _1258 * _1354;
        _1372 = _1374;
    }
    float _1376 = _1372;
    if (_1268)
    {
        float _1378 = fma(_1326, _1320, _1362);
        _1358 = _1378;
    }
    float _1380 = _1358;
    if (_1268)
    {
        float _1382 = _1368 * _1368;
        _1344 = _1382;
    }
    float _1384 = _1344;
    if (!_1268)
    {
        _1364 = _1262;
    }
    float _1386 = _1364;
    float _1388 = _1386;
    if (_1268)
    {
        float _1390 = _1376 * _1376;
        _1388 = _1390;
    }
    float _1392 = _1388;
    float _1394 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1396 = fma(_1380, _1380, _1384);
    float _1398 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1400 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1402 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1394);
    float _1404 = _1396 + _1392;
    float _1406 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1408 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1398);
    float _1410 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1402);
    float _1412 = fma(_1032, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1414 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1406);
    float _1416 = rsqrt(_1404);
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1420 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1414);
    float _1422 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1408);
    float _1424 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1400);
    float _1426 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1428 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1432 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1430);
    float _1434 = precise::clamp(_1432, 0.0, 1.0);
    float _1436 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1424);
    float _1438 = _1422 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1440 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1426);
    float _1442 = -_1434;
    float _1444 = _1442 + 1.0;
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1448 = floor(_1412);
    float _1450 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1440);
    float _1452 = _1416 * _1368;
    float _1454 = _1416 * _1380;
    float _1456 = _1416 * _1376;
    float _1458 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1450);
    float _1460 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1462 = fma(_1026, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1464 = abs(_1444);
    float _1466 = log2(_1464);
    float _1468 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1470 = -_1460;
    float _1472 = fma(_1454, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1470);
    float _1474 = -_1456;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1472);
    float _1478 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1480 = floor(_1462);
    float _1482 = fma(_1476, -0.5, 0.5);
    float _1484 = fma(_1476, 0.5, 0.5);
    float _1486 = -_1448;
    float _1488 = _1412 + _1486;
    float _1490 = -_1478;
    float _1492 = fma(_1490, _1246, 1.0);
    float _1494 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1496 = fma(_1484, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1498 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1500 = sqrt(_1482);
    float _1502 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1494);
    float _1504 = fma(_1484, _1496, -0.212114393711090087890625);
    float _1506 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1468);
    float _1508 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1502);
    float _1510 = fma(_1484, _1504, 1.570728778839111328125);
    float _1512 = -_1480;
    float _1514 = _1462 + _1512;
    float _1516 = 1.0 / _1458;
    float _1518 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1506);
    float _1520 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1508);
    float _1522 = _1454 + 1.0;
    float _1524 = exp2(_1498);
    float _1526 = _1500 * 0.636619746685028076171875;
    float _1528 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1518);
    float _1530 = log2(_1492);
    float _1532 = _1520 * _1516;
    float _1534 = _1528 * _1516;
    float _1536 = -_1510;
    float _1538 = fma(_1526, _1536, 1.0);
    float2 _4691 = float2(_1488, _1514);
    float _1540 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4691, float2(0.0), isnan(_4691)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4691, float2(0.0), isnan(_4691)), level(0.0)).x;
    float _1542 = fma(_1532, 0.5, 0.5);
    float _1544 = -_1454;
    float _1546 = fma(_1524, _1522, _1544);
    float _1548 = fma(_1546, 0.5, 0.5);
    float _1550 = fma(_1534, -0.5, 0.5);
    float _1552 = _1530 * 0.693147182464599609375;
    float _1554 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4721 = float3(_1542, _1550, _1554);
    float _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4721, float3(0.0), isnan(_4721)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4721, float3(0.0), isnan(_4721)), level(0.0)).x;
    float3 _4732 = float3(_1542, _1550, _1554);
    float4 _1559 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4732, float3(0.0), isnan(_4732)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4732, float3(0.0), isnan(_4732)), level(0.0)).xyzw;
    float _1561 = _1559.x;
    float _1563 = _1559.y;
    float _1565 = _1559.z;
    float _1567 = _1559.w;
    float2 _4748 = float2(_1538, _1548);
    float3 _1571 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4748, float2(0.0), isnan(_4748)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4748, float2(0.0), isnan(_4748)), level(0.0)).xyz;
    float _1573 = _1571.x;
    float _1575 = _1571.y;
    float _1577 = _1571.z;
    float _1579 = in.m_63.w;
    float _1581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1583 = _234 > 0.5;
    float _1585 = in.m_63.x;
    int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1589 = _1587 != 0;
    float _1591 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1595 = _1593 != 0;
    float _1597 = in.m_63.y;
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1601 = _1599 != 0;
    float _1603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1605 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1607 = in.m_63.z;
    float _1609 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1611 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1605);
    float _1613 = in.m_55.w;
    float _1615 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1609);
    if (_1589)
    {
        bool _1617 = _240 > 0.5;
        _666 = _1617;
    }
    bool _1619 = _666;
    float _1621 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1611);
    float _1623 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1615);
    float _1625 = in.m_65.x;
    float _1627 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_67.w = _1579;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1633 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1635 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1637 = in.m_65.y;
    float _1639 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1641 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1643 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1585;
    float _1645 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1649 = _1647 != 0;
    out.m_67.y = _1597;
    bool _1651 = _1613 > 0.5;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_67.z = _1607;
    float _1655 = _1653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1657 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_69.x = _1639;
    out.m_69.y = _1641;
    out.m_69.z = _1643;
    out.m_69.w = _1635;
    float _1659 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1663 = 1.0 / _1627;
    float _1665 = _1621 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1669 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    bool _1671 = _1649;
    float _1673 = _1661;
    int _1675 = as_type<int>(_1645);
    float _1677 = _1625;
    float _1679 = _1657;
    if (_1595)
    {
        float _1681 = in.m_55.x;
        _1669 = _1681;
    }
    float _1683 = _1669;
    float _1685 = -_1637;
    float _1687 = _1685 + 1.0;
    float _1689 = _1665 + _1627;
    float _1691 = _1667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1693 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1591);
    out.m_71.x = _1236;
    out.m_71.y = _1232;
    out.m_71.z = _1240;
    int _1697 = _1583 ? as_type<int>(_1687) : as_type<int>(_1637);
    float _1699 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1695);
    bool _1701 = _870 != 0.0;
    bool _1703 = isnan(_870);
    bool _1705 = _1701 || _1703;
    bool _1707 = isnan(0.0);
    bool _1709 = _1705 || _1707;
    out.m_73.x = _1691;
    out.m_73.y = _1693;
    out.m_73.z = _1655;
    out.m_73.w = _1661;
    float _1711 = _1689 * _1663;
    float _1713 = _1711 * 0.5;
    bool _1715 = _868 == 0.0;
    bool _1717 = !_1709;
    bool _1719 = _1715 && _1717;
    float _1721 = in.m_75.x;
    float _1723 = in.m_75.y;
    float _1725 = in.m_75.z;
    float _1727 = _1649 ? as_type<float>(_1697) : _1637;
    float _1729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1731 = _1637;
    float _1733 = _1691;
    if (_1601)
    {
        float _1735 = _1651 ? _1687 : _1637;
        _1731 = _1735;
    }
    float _1737 = _1731;
    float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1741 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1739);
    bool _1743 = _872 == 0.0;
    bool _1745 = _1743 && _1719;
    float _1747 = fma(_1645, _1727, -0.5);
    float _1749 = fma(_1657, _1737, -0.5);
    if (_1595)
    {
        bool _1751 = _1683 > 0.5;
        _1671 = _1751;
    }
    bool _1753 = _1671;
    float _1755 = 1.0 / _1741;
    if (!_1595)
    {
        _1673 = _1625;
    }
    float _1757 = _1673;
    float _1759 = -_444;
    float _1761 = fma(_792, _1747, _1759);
    float _1763 = -_690;
    float _1765 = fma(_676, _1749, _1763);
    float _1767 = in.m_77.x;
    float _1769 = in.m_77.y;
    float _1771 = in.m_77.z;
    float _1773 = in.m_77.w;
    float _1775 = _1757;
    if (!_1595)
    {
        _1733 = _1757;
    }
    float _1777 = _1733;
    float _1779 = _962 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1781 = _1777;
    if (_1595)
    {
        _1775 = _1625;
    }
    float _1783 = _1775;
    float _1785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1787 = _1783;
    if (_1595)
    {
        float _1789 = -_1783;
        float _1791 = _1789 + 1.0;
        _668 = as_type<int>(_1791);
    }
    int _1793 = _668;
    float _1795 = as_type<float>(_1793);
    if (_1589)
    {
        float _1797 = -_1783;
        float _1799 = _1797 + 1.0;
        _1675 = as_type<int>(_1799);
    }
    int _1801 = _1675;
    float _1803 = _1721;
    if (_1745)
    {
        _1677 = _1723;
    }
    float _1805 = _1677;
    float _1807 = _1805;
    if (_1745)
    {
        _1679 = _1721;
    }
    float _1809 = _1679;
    float _1811 = _1809;
    if (_1595)
    {
        float _1813 = _1753 ? as_type<float>(_1793) : _1783;
        _1781 = _1813;
    }
    float _1815 = _1781;
    if (_1745)
    {
        _1795 = _1805;
    }
    float _1817 = _1795;
    float _1819 = _1817;
    if (!_1745)
    {
        _1807 = _1723;
    }
    float _1821 = _1807;
    float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1825 = _1755 * _1823;
    float _1827 = _1729 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1589)
    {
        float _1829 = _1619 ? as_type<float>(_1801) : _1783;
        _1787 = _1829;
    }
    float _1831 = _1787;
    float _1833 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1835 = abs(_1825);
    float _1837 = log2(_1835);
    if (_1745)
    {
        _804 = _1809;
    }
    float _1839 = _804;
    float _1841 = fma(_1827, _1815, -0.5);
    float _1843 = _1839;
    if (!_1745)
    {
        _1811 = _1721;
    }
    float _1845 = _1811;
    float _1847 = fma(_1833, _1831, -0.5);
    if (!_1745)
    {
        float _1849 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1821);
        _1819 = _1849;
    }
    float _1851 = _1819;
    float _1853 = _1769 * _1725;
    float _1855 = fma(_784, _1841, _440);
    if (!_1745)
    {
        float _1857 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1845);
        _1843 = _1857;
    }
    float _1859 = _1843;
    float _1861 = fma(_662, _1847, _686);
    float _1863 = _1767 * _1821;
    float _1865 = _1771 * _1845;
    float _1867 = _1761 + 0.5;
    float _1869 = _1861 + 0.5;
    float _1871 = -_1863;
    float _1873 = fma(_1769, _1845, _1871);
    float _1875 = -_1865;
    float _1877 = fma(_1767, _1725, _1875);
    float _1879 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1881 = -_1853;
    float _1883 = fma(_1771, _1821, _1881);
    if (_1745)
    {
        _1803 = _1725;
    }
    float _1885 = _1803;
    float _1887 = _1885;
    if (!_1745)
    {
        float _1889 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1725);
        _1887 = _1889;
    }
    float _1891 = _1887;
    float _1893 = exp2(_1879);
    float _1895 = _1877 * _1773;
    float _1897 = _1883 * _1773;
    float _1899 = _1873 * _1773;
    float _1901 = _962 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1903 = _1765 + 0.5;
    float _1905 = _962 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1907 = -_948;
    float _1909 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1779);
    float _1911 = -_948;
    float _1913 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1901);
    float _1915 = _1855 + 0.5;
    float _1917 = _974 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1919 = _974 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1921 = _974 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1923 = -_948;
    float _1925 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1905);
    out.m_79.x = _1915;
    out.m_79.y = _1867;
    out.m_79.z = _1869;
    out.m_79.w = _1903;
    float _1927 = fma(_1893, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1929 = precise::clamp(_1927, 0.0, 1.0);
    float _1931 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1917);
    float _1933 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1919);
    float _1935 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1921);
    float _1937 = _988 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1939 = _988 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1941 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1913);
    float _1943 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1909);
    float _1945 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1925);
    float _1947 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1937);
    float _1949 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1939);
    float _1951 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1931);
    float _1953 = _1941 * _1769;
    float _1955 = _988 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1957 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1933);
    float _1959 = _1943 * _1769;
    float _1961 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1955);
    float _1963 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1935);
    float _1965 = _1945 * _1769;
    float _1967 = _1941 * _1851;
    float _1969 = _1895 * _1941;
    float _1971 = _1895 * _1943;
    float _1973 = _1895 * _1945;
    float _1975 = fma(_1929, -2.0, 3.0);
    float _1977 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1947);
    float _1979 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1961);
    float _1981 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1949);
    float _1983 = fma(_1951, _1767, _1953);
    float _1985 = fma(_1957, _1767, _1959);
    float _1987 = fma(_1963, _1767, _1965);
    float _1989 = _1943 * _1851;
    float _1991 = fma(_1951, _1859, _1967);
    float _1993 = fma(_1897, _1951, _1969);
    float _1995 = fma(_1977, _1771, _1983);
    float _1997 = fma(_1979, _1771, _1985);
    float _1999 = fma(_1981, _1771, _1987);
    float _2001 = fma(_1957, _1859, _1989);
    float _2003 = fma(_1897, _1957, _1971);
    float _2005 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2007 = _1929 * _1929;
    float _2009 = _1945 * _1851;
    float _2011 = fma(_1897, _1963, _1973);
    bool _2013 = _1825 <= 8000.0;
    bool _2015 = isnan(_1825);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan(8000.0);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    float _2025 = _2007 * _1975;
    float _2027 = exp2(_2005);
    float _2029 = fma(_1963, _1859, _2009);
    float _2031 = fma(_1899, _1977, _1993);
    float _2033 = -_2025;
    float _2035 = _2033 + 1.0;
    float _2037 = in.m_81.x;
    bool _2039 = _1252 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2041 = isnan(_1252);
    bool _2043 = _2039 || _2041;
    bool _2045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2047 = _2043 || _2045;
    float _2049 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2025);
    float _2051 = fma(_1899, _1979, _2003);
    float _2053 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1699);
    float _2055 = fma(_1899, _1981, _2011);
    float _2057 = _2023 * _2049;
    float _2059 = _2053 + _1458;
    float _2061 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2063 = -_2027;
    float _2065 = _2063 + 1.0;
    out.m_83.x = _2031;
    out.m_83.y = _2051;
    out.m_83.z = _2055;
    float _2067 = _2059 * 0.5;
    out.m_85.x = _1995;
    out.m_85.y = _1997;
    out.m_85.z = _1999;
    out.m_87.z = _2067;
    out.m_87.w = _1458;
    float _2069 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1520;
    out.gl_Position.y = _1528;
    out.gl_Position.z = _2053;
    out.gl_Position.w = _1458;
    float _2071 = fma(_1977, _1891, _1991);
    float _2073 = fma(_1979, _1891, _2001);
    float _2075 = fma(_1981, _1891, _2029);
    out.m_89.x = _2071;
    out.m_89.y = _2073;
    out.m_89.z = _2075;
    float _2077 = -_1540;
    float _2079 = _2077 + 1.0;
    float _2081 = _2079 * _2061;
    float _2083 = precise::clamp(_2081, 0.0, 1.0);
    float _2085 = -_2083;
    float _2087 = fma(_2085, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2089 = _2087 * _2037;
    float _2091 = _2089 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2093 = _2089;
    if (!_2047)
    {
        _2093 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2095 = _2093;
    float _2097 = _2069 * _1556;
    float _2099 = -_2069;
    float _2101 = _2099 + 1.0;
    out.m_91.x = _2091;
    float _2103 = _1567 * _2097;
    float _2105 = _1577 * _2097;
    float _2107 = _2097;
    float _2109 = _2105;
    float _2111 = _2095;
    float _2113 = _2095;
    if (!_2047)
    {
        _2107 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2115 = _2107;
    float _2117 = fma(_1573, _2103, _1561);
    float _2119 = fma(_1575, _2103, _1563);
    float _2121 = _1567 * _2101;
    float _2123 = fma(_1567, _2105, _1565);
    float _2125 = _2115;
    float _2127 = _2115;
    if (!_2047)
    {
        _2109 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2129 = _2109;
    out.m_93.x = _2117;
    out.m_93.y = _2119;
    out.m_93.z = _2123;
    out.m_93.w = _2121;
    bool _2131 = !_2047;
    float _2133 = _2129;
    float _2135 = _2129;
    if (!_2131)
    {
        bool _2137 = _1252 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2139 = isnan(_1252);
        bool _2141 = _2137 || _2139;
        bool _2143 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2145 = _2141 || _2143;
        if (!_2145)
        {
            float _2147 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2149 = _1252 + _2147;
            float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2153 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2151;
            float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2157 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2163 = 1.0 / _2153;
            float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2169 = _2149 * _2163;
            float _2171 = precise::clamp(_2169, 0.0, 1.0);
            float _2173 = fma(_2171, _2157, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2175 = fma(_2171, _2161, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2177 = fma(_2171, _2167, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2127 = _2175;
            _2135 = _2173;
            _2113 = _2177;
            _2179 = true;
        }
        else
        {
            bool _2181 = _1252 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2183 = isnan(_1252);
            bool _2185 = _2181 || _2183;
            bool _2187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2189 = _2185 || _2187;
            if (!_2189)
            {
                _2133 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2191 = _2133;
            _2135 = _2191;
            if (!_2189)
            {
                _2125 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2193 = _2125;
            _2127 = _2193;
            if (!_2189)
            {
                _2111 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2195 = _2111;
            bool _2197 = !_2189;
            _2113 = _2195;
            if (!_2197)
            {
                bool _2199 = _1252 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2201 = isnan(_1252);
                bool _2203 = _2199 || _2201;
                bool _2205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2207 = _2203 || _2205;
                if (!_2207)
                {
                    float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2211 = _1252 + _2209;
                    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2215 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2213;
                    float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2225 = 1.0 / _2215;
                    float _2227 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2229 = _2227 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2231 = _2211 * _2225;
                    float _2233 = precise::clamp(_2231, 0.0, 1.0);
                    float _2235 = fma(_2233, _2219, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2237 = fma(_2233, _2223, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2239 = fma(_2233, _2229, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2127 = _2237;
                    _2135 = _2235;
                    _2113 = _2239;
                    _2179 = true;
                }
                else
                {
                    _2127 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2135 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2113 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2179 = false;
    float _2241 = _2127;
    float _2243 = _2135;
    float _2245 = _2113;
    float _2247 = _2241 * 0.586610972881317138671875;
    bool _2249 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_95.x = 0.0;
    float _2251 = fma(_2243, 0.298911988735198974609375, _2247);
    float _2253 = fma(_2245, 0.114477999508380889892578125, _2251);
    float _2255 = -_2253;
    float _2257 = _2255 + _2243;
    float _2259 = -_2253;
    float _2261 = _2259 + _2241;
    float _2263 = -_2253;
    float _2265 = _2263 + _2245;
    float _2267 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2269 = fma(_2257, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2253);
    float _2271 = fma(_2261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2253);
    float _2273 = fma(_2265, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2253);
    out.m_49.x = _2267;
    out.m_97.x = _2269;
    out.m_97.y = _2271;
    out.m_97.z = _2273;
    if (!_2249)
    {
        return out;
    }
    float _2275 = -_1218;
    float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2279 = -_1220;
    float _2281 = _2279 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2283 = -_1222;
    float _2285 = _2283 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2287 = _2277 * _2277;
    float _2289 = fma(_2281, _2281, _2287);
    float _2291 = fma(_2285, _2285, _2289);
    float _2293 = sqrt(_2291);
    float _2295 = rsqrt(_2291);
    float _2297 = -_2293;
    float _2299 = _2297 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2301 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2303 = precise::clamp(_2301, 0.0, 1.0);
    float _2305 = _2281 * _2295;
    float _2307 = _2277 * _2295;
    float _2309 = abs(_2303);
    float _2311 = log2(_2309);
    float _2313 = _2285 * _2295;
    float _2315 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2317 = _2073 * _2307;
    float _2319 = -_2307;
    float _2321 = -_2315;
    float _2323 = fma(_2319, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2321);
    float _2325 = fma(_2071, _2305, _2317);
    float _2327 = -_2313;
    float _2329 = fma(_2327, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2323);
    float _2331 = fma(_2075, _2313, _2325);
    float _2333 = precise::clamp(_2331, 0.0, 1.0);
    float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2337 = _2329 + _2335;
    float _2339 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2343 = precise::clamp(_2341, 0.0, 1.0);
    float _2345 = exp2(_2339);
    float _2347 = _2345 * _2343;
    float _2349 = _2333 * _2347;
    float _2351 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2353 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2355 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2351;
    out.m_95.y = _2353;
    out.m_95.z = _2355;
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
    bool _2179 = false;
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
        float _2412 = as_type<float>(_132);
        out.gl_Position.z = _2412;
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
        float _2481 = as_type<float>(_170);
        out.gl_Position.z = _2481;
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
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = _230 + _236;
    float _240 = in.m_55.z;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _250;
    float _254 = 1.0 / _244;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _264 = 1.0 / _252;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _268 = _230 + _266;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _272 = _270 != 0;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _230 + _274;
    float _278 = 1.0 / _248;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _280;
    float _284 = _234 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _286 = _276 * _254;
    float _288 = _234 + _240;
    float _290 = fma(_284, -2.0, _260);
    float _292 = _240 * 2.0;
    float _294 = 1.0 / _282;
    float _296 = _232 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _298 = _238 * _264;
    float _300 = _234 * 2.0;
    float _302 = _288 + (-1.0);
    float _304 = -_262;
    float _306 = fma(_296, 2.0, _304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _230 + _308;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _314 = _312 != 0;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _318 = _316 != 0;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _322 = _320 != 0;
    float _324 = floor(_292);
    float _326 = _232 * 2.0;
    float _328 = _310 * _278;
    float _330 = _232 + _240;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _230 + _332;
    float _336 = 0.0;
    if (!_272)
    {
        _336 = _240;
    }
    float _338 = _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _340;
    float _344 = _330 + (-1.0);
    float _346 = floor(_326);
    float _348 = _338;
    if (_272)
    {
        _348 = _234;
    }
    float _350 = _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    float _356 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = fma(_342, _286, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = 1.0 / _258;
    bool _370 = _324 >= 0.0;
    bool _372 = isnan(_324);
    bool _374 = _370 || _372;
    bool _376 = isnan(0.0);
    bool _378 = _374 || _376;
    float _380 = fma(_354, _286, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _382 = _324 > 0.0;
    float _384 = fma(_360, _328, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _386 = _378 ? 0 : 1;
    float _388 = fma(_364, _328, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _390 = floor(_300);
    float _392 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _394 = _234 + _232;
    bool _396 = _346 >= 0.0;
    bool _398 = isnan(_346);
    bool _400 = _396 || _398;
    bool _402 = isnan(0.0);
    bool _404 = _400 || _402;
    float _406 = _268 * _294;
    float _408 = _394 + (-1.0);
    int _410 = _404 ? 0 : 1;
    float _412 = _334 * _368;
    float _414 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _416 = _408;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_272)
    {
        _416 = _234;
    }
    float _420 = _416;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _422;
    float _426 = _420;
    if (!_272)
    {
        _418 = _240;
    }
    float _428 = _418;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _434 = _428;
    if (_272)
    {
        _426 = _232;
    }
    float _436 = _426;
    float _438 = -_150;
    float _440 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[76].x, _306);
    if (_272)
    {
        _434 = _234;
    }
    float _442 = _434;
    float _444 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _290);
    bool _446 = _346 > 0.0;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _448;
    bool _452 = _390 > 0.0;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _458 = _390 >= 0.0;
    bool _460 = isnan(_390);
    bool _462 = _458 || _460;
    bool _464 = isnan(0.0);
    bool _466 = _462 || _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _468;
    float _472 = fma(_450, _286, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _474 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _476 = isnan(_230);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = fma(_456, _328, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    float _492 = fma(_470, _298, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _494 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _496 = isnan(_230);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -_484;
    float _508 = _506 + 1.0;
    float _510 = fma(_490, _298, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _516 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _518 = isnan(_230);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _532 = -_504;
    float _534 = _532 + 1.0;
    float _536 = _504 * _508;
    float _538 = fma(_514, _412, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _540 = fma(_424, _298, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _542 = fma(_530, _412, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _544 = fma(_432, _412, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _546 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _548 = isnan(_230);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = _526 * _534;
    float _560 = -_526;
    float _562 = _560 + 1.0;
    bool _564 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _566 = isnan(_230);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = _442 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _578 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _580 = isnan(_230);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = _556 * _562;
    float _592 = -_556;
    float _594 = _592 + 1.0;
    float _596 = -_588;
    float _598 = _596 + 1.0;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _602 = _588 * _594;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _604;
    float _608 = _574 * _598;
    float _610 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[83].w, _600);
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _614 = _472 * _608;
    float _616 = _366 * _608;
    float _618 = _380 * _608;
    float _620 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[83].z, _612);
    float _622 = _436 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _626 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _628 = log2(_626);
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _632 = -_574;
    float _634 = _632 + 1.0;
    float _636 = fma(_576, -2.0, _624);
    bool _638 = !_314;
    int _640 = _638 ? 0 : 1;
    float _642 = -_630;
    float _644 = fma(_622, 2.0, _642);
    float _646 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].x, _614);
    float _648 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].y, _616);
    float _650 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].z, _618);
    int _652 = ~_386;
    int _654 = _652 + 1;
    int _656 = _654 + 1;
    float _658 = fma(_606, _406, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    int _660 = abs(_640);
    float _662 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _620);
    int _664 = _656;
    bool _666 = _452;
    int _668 = as_type<int>(_444);
    if (!_382)
    {
        int _670 = ~_386;
        int _672 = _670 + 1;
        _664 = _672;
    }
    int _674 = _664;
    float _676 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _610);
    int _678 = _466 ? 0 : 1;
    float _680 = _628 * _150;
    float _682 = float(_660);
    float _684 = -_150;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[81].x, _644);
    float _688 = float(_674);
    float _690 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _636);
    int _692 = ~_678;
    int _694 = _692 + 1;
    int _696 = _694 + 1;
    float _698 = exp2(_680);
    int _700 = _696;
    if (!_452)
    {
        int _702 = ~_678;
        int _704 = _702 + 1;
        _700 = _704;
    }
    int _706 = _700;
    float _708 = _682 * _688;
    int _710 = ~_410;
    int _712 = _710 + 1;
    int _714 = _712 + 1;
    float _716 = in.m_57.x;
    float _718 = in.m_57.y;
    float _720 = in.m_57.z;
    int _722 = _714;
    if (!_446)
    {
        int _724 = ~_410;
        int _726 = _724 + 1;
        _722 = _726;
    }
    int _728 = _722;
    float _730 = _708 * (-2.0);
    float _732 = fma(_486, _602, _646);
    float _734 = fma(_414, _730, _414);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _738 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _740 = isnan(1.0);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _746 = _742 || _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _750 = 1.0 + _748;
    bool _752 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _760 = _756 || _758;
    float _762 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[78].z, _736);
    bool _764 = !_318;
    int _766 = _764 ? 0 : 1;
    float _768 = 1.0 / _750;
    float _770 = -_698;
    float _772 = _770 + 1.0;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _776 = abs(_766);
    float _778 = _232 + (-0.5);
    float _780 = float(_728);
    float _782 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[78].w, _774);
    float _784 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _762);
    float _786 = _760 ? _772 : 0.0;
    float _788 = fma(_730, _716, _716);
    float _790 = float(_776);
    float _792 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _782);
    bool _794 = !_322;
    int _796 = _794 ? 0 : 1;
    float _798 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[196].x, _788);
    float _800 = fma(_384, _602, _648);
    float _802 = _780;
    float _804 = _792;
    if (_746)
    {
        float _806 = _786 * _768;
        _154 = _806;
    }
    float _808 = _154;
    float _810 = _790 * _780;
    int _812 = abs(_796);
    float _814 = fma(_388, _602, _650);
    float _816 = fma(_734, _808, _798);
    float _818 = _810 * (-2.0);
    float _820 = _234 + (-0.5);
    float _822 = float(_706);
    float _824 = _816 * 0.15915493667125701904296875;
    float _826 = float(_812);
    float _828 = fma(_818, _718, _718);
    float _830 = fma(_392, _818, _392);
    float _832 = fma(_540, _590, _814);
    float _834 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].y, _828);
    float _836 = _826 * _822;
    float _838 = fma(_492, _590, _732);
    float _840 = fma(_830, _808, _834);
    float _842 = _836 * (-2.0);
    float _844 = in.m_59.x;
    float _846 = in.m_59.y;
    float _848 = in.m_59.z;
    float _850 = fma(_510, _590, _800);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _852;
    float _856 = fma(_842, _720, _720);
    float _858 = _240 + (-0.5);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _860;
    float _864 = _840 * 0.15915493667125701904296875;
    float _866 = fma(_854, _406, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _868 = in.m_61.x;
    float _870 = in.m_61.y;
    float _872 = in.m_61.z;
    float _874 = fma(_356, _842, _356);
    float _876 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[196].z, _856);
    float _878 = fma(_862, _406, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _880 = fma(_538, _558, _838);
    float _882 = fma(_544, _558, _832);
    float _884 = fma(_542, _558, _850);
    float _886 = fma(_874, _808, _876);
    float _888 = fma(_658, _536, _880);
    float _890 = fma(_878, _536, _882);
    float _892 = fma(_866, _536, _884);
    float _894 = _886 * 0.15915493667125701904296875;
    float _896 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[148].x, _888);
    float _898 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[148].z, _890);
    float _900 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[148].y, _892);
    float _902 = _824 * 6.283185482025146484375;
    float _904 = cos(_902);
    float _906 = _896 * _844;
    float _908 = _898 * _848;
    float _910 = _900 * _846;
    float _912 = in.m_46.x;
    float _914 = in.m_46.y;
    float _916 = in.m_46.z;
    float _918 = _906 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _920 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _922 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _924 = _864 * 6.283185482025146484375;
    float _926 = sin(_924);
    float _928 = _864 * 6.283185482025146484375;
    float _930 = cos(_928);
    float _932 = _824 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = _904 * _926;
    float _938 = _894 * 6.283185482025146484375;
    float _940 = cos(_938);
    float _942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _870);
    float _944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _868);
    float _946 = _894 * 6.283185482025146484375;
    float _948 = sin(_946);
    float _950 = _934 * _926;
    float _952 = _942 * _922;
    float _954 = _904 * _930;
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _872);
    float _958 = _944 * _918;
    float _960 = _934 * _930;
    float _962 = _904 * _940;
    float _964 = _930 * _940;
    float _966 = _934 * _940;
    float _968 = _926 * _940;
    float _970 = _962 * _952;
    float _972 = _956 * _920;
    float _974 = fma(_948, _954, _950);
    float _976 = -_952;
    float _978 = _948 * _976;
    float _980 = -_936;
    float _982 = fma(_948, _960, _980);
    float _984 = _966 * _952;
    float _986 = -_960;
    float _988 = fma(_948, _936, _986);
    float _990 = fma(_974, _958, _970);
    float _992 = fma(_964, _958, _978);
    float _994 = fma(_982, _958, _984);
    float _996 = fma(_948, _950, _954);
    float _998 = fma(_988, _972, _990);
    float _1000 = _914 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1002 = fma(_968, _972, _992);
    float _1004 = fma(_996, _972, _994);
    float _1006 = _998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1008 = _914 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1010 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1000);
    float _1012 = _998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1014 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1006);
    float _1016 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1008);
    float _1018 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1010);
    float _1020 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1012);
    float _1022 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1014);
    float _1024 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1016);
    float _1026 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1028 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1020);
    float _1030 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1034 = _914 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1036 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1038 = _1026 + _1030;
    float _1040 = _998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1042 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1034);
    float _1044 = _1032 + _1036;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1048 = _1038 + _1046;
    float _1050 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1040);
    float _1052 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1042);
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1056 = _1044 + _1054;
    float _1058 = _1048 * _1048;
    float _1060 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1050);
    float _1062 = _1052 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1064 = fma(_1056, _1056, _1058);
    float _1066 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1068 = sqrt(_1064);
    float _1070 = _1062 + _1066;
    bool _1072 = _1068 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1074 = _912;
    float _1076 = _916;
    float _1078 = _1052;
    float _1080 = _1048;
    if (!_1072)
    {
        _1074 = _1044;
    }
    float _1082 = _1074;
    float _1084 = _1082;
    if (!_1072)
    {
        _1076 = _1038;
    }
    float _1086 = _1076;
    float _1088 = _1086;
    if (!_1072)
    {
        _1078 = _1070;
    }
    float _1090 = _1078;
    bool _1092 = !_1072;
    float _1094 = _1090;
    if (!_1092)
    {
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1100 = _1068 + _1098;
        float _1102 = _1070 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1104 = rsqrt(_1064);
        float _1106 = _1100 * _1096;
        float _1108 = _1106 * 0.15915493667125701904296875;
        float _1110 = _1108 * 6.283185482025146484375;
        float _1112 = cos(_1110);
        float _1114 = _1108 * 6.283185482025146484375;
        float _1116 = sin(_1114);
        float _1118 = _1112 + (-1.0);
        float _1120 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = fma(_1116, _1102, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1124 = fma(_1070, _1112, _1120);
        float _1126 = _1104 * _1122;
        float _1128 = fma(_1056, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1130 = fma(_1048, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1094 = _1124;
        _1084 = _1128;
        _1088 = _1130;
    }
    float _1132 = _1094;
    float _1134 = _1084;
    float _1136 = _1088;
    float _1138 = -_1062;
    float _1140 = _1138 + _1132;
    float _1142 = -_1032;
    float _1144 = _1142 + _1134;
    float _1146 = -_1026;
    float _1148 = _1146 + _1136;
    float _1150 = _1140 * _1140;
    float _1152 = fma(_1144, _1144, _1150);
    float _1154 = fma(_1148, _1148, _1152);
    float _1156 = sqrt(_1154);
    bool _1158 = _1156 > 0.0;
    bool _1160 = !_1158;
    float _1162 = _1132;
    float _1164 = _1134;
    float _1166 = _1136;
    float _1168 = _1154;
    float _1170 = _1144;
    if (!_1160)
    {
        float _1172 = _194 * _194;
        float _1174 = fma(_192, _192, _1172);
        float _1176 = rsqrt(_1154);
        float _1178 = fma(_196, _196, _1174);
        float _1180 = sqrt(_1178);
        float _1182 = _1144 * _1176;
        float _1184 = _1140 * _1176;
        float _1186 = _1148 * _1176;
        bool _1188 = _1180 > 0.0;
        bool _1190 = !_1188;
        _1080 = _1178;
        if (!_1190)
        {
            float _1192 = rsqrt(_1178);
            float _1194 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1196 = _194 * _1192;
            float _1198 = _192 * _1192;
            float _1200 = _196 * _1192;
            float _1202 = _1184 * _1196;
            float _1204 = fma(_1182, _1198, _1202);
            float _1206 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1208 = fma(_1186, _1200, _1204);
            float _1210 = _1208 * _1206;
            float _1212 = fma(_192, _1210, _1134);
            float _1214 = fma(_194, _1210, _1132);
            float _1216 = fma(_196, _1210, _1136);
            _1162 = _1214;
            _1164 = _1212;
            _1166 = _1216;
            _1168 = _1198;
            _1170 = _1204;
        }
    }
    float _1218 = _1162;
    float _1220 = _1164;
    float _1222 = _1166;
    float _1224 = _1080;
    float _1226 = _1168;
    float _1228 = _1170;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1232 = _1218 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1236 = _1220 + _1234;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1240 = _1222 + _1238;
    float _1242 = _1232 * _1232;
    float _1244 = fma(_1236, _1236, _1242);
    float _1246 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1248 = fma(_1240, _1240, _1244);
    float _1250 = rsqrt(_1248);
    float _1252 = sqrt(_1248);
    float _1254 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1256 = _1236 * _1254;
    float _1258 = _1240 * _1254;
    float _1260 = _1256 * _1256;
    float _1262 = _1258 * _1258;
    float _1264 = _1260 + _1262;
    float _1266 = sqrt(_1264);
    bool _1268 = _1266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1272 = _1266 + _1270;
    float _1274 = _1224;
    float _1276 = _1272;
    float _1278 = _1228;
    float _1280 = _1256;
    if (_1268)
    {
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1282;
    }
    float _1284 = _1274;
    if (_1268)
    {
        float _1286 = rsqrt(_1264);
        _200 = _1286;
    }
    float _1288 = _200;
    float _1290 = _1288;
    if (_1268)
    {
        float _1292 = _1272 * _1284;
        _1276 = _1292;
    }
    float _1294 = _1276;
    if (_1268)
    {
        float _1296 = _1294 * 0.15915493667125701904296875;
        _1278 = _1296;
    }
    float _1298 = _1278;
    float _1300 = _1226;
    if (_1268)
    {
        float _1302 = _1298 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        _1300 = _1304;
    }
    float _1306 = _1300;
    float _1308 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1310 = precise::max(0.0, _1308);
    float _1312 = _1284;
    float _1314 = _1310;
    if (_1268)
    {
        float _1316 = _1298 * 6.283185482025146484375;
        float _1318 = cos(_1316);
        _1312 = _1318;
    }
    float _1320 = _1312;
    float _1322 = -_1254;
    float _1324 = -_1310;
    float _1326 = fma(_1232, _1322, _1324);
    if (_1268)
    {
        float _1328 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _202 = _1328;
    }
    float _1330 = _202;
    float _1332 = _1330;
    float _1334 = _1306;
    if (_1268)
    {
        float _1336 = fma(_1306, _1330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1332 = _1336;
    }
    float _1338 = _1332;
    float _1340 = _1338;
    if (!_1268)
    {
        _1334 = _1260;
    }
    float _1342 = _1334;
    float _1344 = _1342;
    if (_1268)
    {
        float _1346 = _1320 + (-1.0);
        _1314 = _1346;
    }
    float _1348 = _1314;
    float _1350 = _1348;
    if (_1268)
    {
        float _1352 = _1288 * _1338;
        _802 = _1352;
    }
    float _1354 = _802;
    if (!_1268)
    {
        _1340 = _1326;
    }
    float _1356 = _1340;
    float _1358 = _1356;
    if (_1268)
    {
        float _1360 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1290 = _1360;
    }
    float _1362 = _1290;
    float _1364 = _1362;
    if (_1268)
    {
        float _1366 = _1256 * _1354;
        _1280 = _1366;
    }
    float _1368 = _1280;
    if (!_1268)
    {
        _1350 = _1258;
    }
    float _1370 = _1350;
    float _1372 = _1370;
    if (_1268)
    {
        float _1374 = _1258 * _1354;
        _1372 = _1374;
    }
    float _1376 = _1372;
    if (_1268)
    {
        float _1378 = fma(_1326, _1320, _1362);
        _1358 = _1378;
    }
    float _1380 = _1358;
    if (_1268)
    {
        float _1382 = _1368 * _1368;
        _1344 = _1382;
    }
    float _1384 = _1344;
    if (!_1268)
    {
        _1364 = _1262;
    }
    float _1386 = _1364;
    float _1388 = _1386;
    if (_1268)
    {
        float _1390 = _1376 * _1376;
        _1388 = _1390;
    }
    float _1392 = _1388;
    float _1394 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1396 = fma(_1380, _1380, _1384);
    float _1398 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1400 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1402 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1394);
    float _1404 = _1396 + _1392;
    float _1406 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1408 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1398);
    float _1410 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1402);
    float _1412 = fma(_1032, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1414 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1406);
    float _1416 = rsqrt(_1404);
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1420 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1414);
    float _1422 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1408);
    float _1424 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1400);
    float _1426 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1428 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1432 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1430);
    float _1434 = precise::clamp(_1432, 0.0, 1.0);
    float _1436 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1424);
    float _1438 = _1422 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1440 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1426);
    float _1442 = -_1434;
    float _1444 = _1442 + 1.0;
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1448 = floor(_1412);
    float _1450 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1440);
    float _1452 = _1416 * _1368;
    float _1454 = _1416 * _1380;
    float _1456 = _1416 * _1376;
    float _1458 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1450);
    float _1460 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1462 = fma(_1026, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1464 = abs(_1444);
    float _1466 = log2(_1464);
    float _1468 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1470 = -_1460;
    float _1472 = fma(_1454, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1470);
    float _1474 = -_1456;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1472);
    float _1478 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1480 = floor(_1462);
    float _1482 = fma(_1476, -0.5, 0.5);
    float _1484 = fma(_1476, 0.5, 0.5);
    float _1486 = -_1448;
    float _1488 = _1412 + _1486;
    float _1490 = -_1478;
    float _1492 = fma(_1490, _1246, 1.0);
    float _1494 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1496 = fma(_1484, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1498 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1500 = sqrt(_1482);
    float _1502 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1494);
    float _1504 = fma(_1484, _1496, -0.212114393711090087890625);
    float _1506 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1468);
    float _1508 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1502);
    float _1510 = fma(_1484, _1504, 1.570728778839111328125);
    float _1512 = -_1480;
    float _1514 = _1462 + _1512;
    float _1516 = 1.0 / _1458;
    float _1518 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1506);
    float _1520 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1508);
    float _1522 = _1454 + 1.0;
    float _1524 = exp2(_1498);
    float _1526 = _1500 * 0.636619746685028076171875;
    float _1528 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1518);
    float _1530 = log2(_1492);
    float _1532 = _1520 * _1516;
    float _1534 = _1528 * _1516;
    float _1536 = -_1510;
    float _1538 = fma(_1526, _1536, 1.0);
    float2 _4691 = float2(_1488, _1514);
    float _1540 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4691, float2(0.0), isnan(_4691)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4691, float2(0.0), isnan(_4691)), level(0.0)).x;
    float _1542 = fma(_1532, 0.5, 0.5);
    float _1544 = -_1454;
    float _1546 = fma(_1524, _1522, _1544);
    float _1548 = fma(_1546, 0.5, 0.5);
    float _1550 = fma(_1534, -0.5, 0.5);
    float _1552 = _1530 * 0.693147182464599609375;
    float _1554 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4721 = float3(_1542, _1550, _1554);
    float _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4721, float3(0.0), isnan(_4721)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4721, float3(0.0), isnan(_4721)), level(0.0)).x;
    float3 _4732 = float3(_1542, _1550, _1554);
    float4 _1559 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4732, float3(0.0), isnan(_4732)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4732, float3(0.0), isnan(_4732)), level(0.0)).xyzw;
    float _1561 = _1559.x;
    float _1563 = _1559.y;
    float _1565 = _1559.z;
    float _1567 = _1559.w;
    float2 _4748 = float2(_1538, _1548);
    float3 _1571 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4748, float2(0.0), isnan(_4748)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4748, float2(0.0), isnan(_4748)), level(0.0)).xyz;
    float _1573 = _1571.x;
    float _1575 = _1571.y;
    float _1577 = _1571.z;
    float _1579 = in.m_63.w;
    float _1581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1583 = _234 > 0.5;
    float _1585 = in.m_63.x;
    int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1589 = _1587 != 0;
    float _1591 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1595 = _1593 != 0;
    float _1597 = in.m_63.y;
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1601 = _1599 != 0;
    float _1603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1605 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1607 = in.m_63.z;
    float _1609 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1611 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1605);
    float _1613 = in.m_55.w;
    float _1615 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1609);
    if (_1589)
    {
        bool _1617 = _240 > 0.5;
        _666 = _1617;
    }
    bool _1619 = _666;
    float _1621 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1611);
    float _1623 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1615);
    float _1625 = in.m_65.x;
    float _1627 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_67.w = _1579;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1633 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1635 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1637 = in.m_65.y;
    float _1639 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1641 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1643 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1585;
    float _1645 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1649 = _1647 != 0;
    out.m_67.y = _1597;
    bool _1651 = _1613 > 0.5;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_67.z = _1607;
    float _1655 = _1653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1657 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_69.x = _1639;
    out.m_69.y = _1641;
    out.m_69.z = _1643;
    out.m_69.w = _1635;
    float _1659 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1663 = 1.0 / _1627;
    float _1665 = _1621 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1669 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    bool _1671 = _1649;
    float _1673 = _1661;
    int _1675 = as_type<int>(_1645);
    float _1677 = _1625;
    float _1679 = _1657;
    if (_1595)
    {
        float _1681 = in.m_55.x;
        _1669 = _1681;
    }
    float _1683 = _1669;
    float _1685 = -_1637;
    float _1687 = _1685 + 1.0;
    float _1689 = _1665 + _1627;
    float _1691 = _1667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1693 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1591);
    out.m_71.x = _1236;
    out.m_71.y = _1232;
    out.m_71.z = _1240;
    int _1697 = _1583 ? as_type<int>(_1687) : as_type<int>(_1637);
    float _1699 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1695);
    bool _1701 = _870 != 0.0;
    bool _1703 = isnan(_870);
    bool _1705 = _1701 || _1703;
    bool _1707 = isnan(0.0);
    bool _1709 = _1705 || _1707;
    out.m_73.x = _1691;
    out.m_73.y = _1693;
    out.m_73.z = _1655;
    out.m_73.w = _1661;
    float _1711 = _1689 * _1663;
    float _1713 = _1711 * 0.5;
    bool _1715 = _868 == 0.0;
    bool _1717 = !_1709;
    bool _1719 = _1715 && _1717;
    float _1721 = in.m_75.x;
    float _1723 = in.m_75.y;
    float _1725 = in.m_75.z;
    float _1727 = _1649 ? as_type<float>(_1697) : _1637;
    float _1729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1731 = _1637;
    float _1733 = _1691;
    if (_1601)
    {
        float _1735 = _1651 ? _1687 : _1637;
        _1731 = _1735;
    }
    float _1737 = _1731;
    float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1741 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1739);
    bool _1743 = _872 == 0.0;
    bool _1745 = _1743 && _1719;
    float _1747 = fma(_1645, _1727, -0.5);
    float _1749 = fma(_1657, _1737, -0.5);
    if (_1595)
    {
        bool _1751 = _1683 > 0.5;
        _1671 = _1751;
    }
    bool _1753 = _1671;
    float _1755 = 1.0 / _1741;
    if (!_1595)
    {
        _1673 = _1625;
    }
    float _1757 = _1673;
    float _1759 = -_444;
    float _1761 = fma(_792, _1747, _1759);
    float _1763 = -_690;
    float _1765 = fma(_676, _1749, _1763);
    float _1767 = in.m_77.x;
    float _1769 = in.m_77.y;
    float _1771 = in.m_77.z;
    float _1773 = in.m_77.w;
    float _1775 = _1757;
    if (!_1595)
    {
        _1733 = _1757;
    }
    float _1777 = _1733;
    float _1779 = _962 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1781 = _1777;
    if (_1595)
    {
        _1775 = _1625;
    }
    float _1783 = _1775;
    float _1785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1787 = _1783;
    if (_1595)
    {
        float _1789 = -_1783;
        float _1791 = _1789 + 1.0;
        _668 = as_type<int>(_1791);
    }
    int _1793 = _668;
    float _1795 = as_type<float>(_1793);
    if (_1589)
    {
        float _1797 = -_1783;
        float _1799 = _1797 + 1.0;
        _1675 = as_type<int>(_1799);
    }
    int _1801 = _1675;
    float _1803 = _1721;
    if (_1745)
    {
        _1677 = _1723;
    }
    float _1805 = _1677;
    float _1807 = _1805;
    if (_1745)
    {
        _1679 = _1721;
    }
    float _1809 = _1679;
    float _1811 = _1809;
    if (_1595)
    {
        float _1813 = _1753 ? as_type<float>(_1793) : _1783;
        _1781 = _1813;
    }
    float _1815 = _1781;
    if (_1745)
    {
        _1795 = _1805;
    }
    float _1817 = _1795;
    float _1819 = _1817;
    if (!_1745)
    {
        _1807 = _1723;
    }
    float _1821 = _1807;
    float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1825 = _1755 * _1823;
    float _1827 = _1729 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1589)
    {
        float _1829 = _1619 ? as_type<float>(_1801) : _1783;
        _1787 = _1829;
    }
    float _1831 = _1787;
    float _1833 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1835 = abs(_1825);
    float _1837 = log2(_1835);
    if (_1745)
    {
        _804 = _1809;
    }
    float _1839 = _804;
    float _1841 = fma(_1827, _1815, -0.5);
    float _1843 = _1839;
    if (!_1745)
    {
        _1811 = _1721;
    }
    float _1845 = _1811;
    float _1847 = fma(_1833, _1831, -0.5);
    if (!_1745)
    {
        float _1849 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1821);
        _1819 = _1849;
    }
    float _1851 = _1819;
    float _1853 = _1769 * _1725;
    float _1855 = fma(_784, _1841, _440);
    if (!_1745)
    {
        float _1857 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1845);
        _1843 = _1857;
    }
    float _1859 = _1843;
    float _1861 = fma(_662, _1847, _686);
    float _1863 = _1767 * _1821;
    float _1865 = _1771 * _1845;
    float _1867 = _1761 + 0.5;
    float _1869 = _1861 + 0.5;
    float _1871 = -_1863;
    float _1873 = fma(_1769, _1845, _1871);
    float _1875 = -_1865;
    float _1877 = fma(_1767, _1725, _1875);
    float _1879 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1881 = -_1853;
    float _1883 = fma(_1771, _1821, _1881);
    if (_1745)
    {
        _1803 = _1725;
    }
    float _1885 = _1803;
    float _1887 = _1885;
    if (!_1745)
    {
        float _1889 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1725);
        _1887 = _1889;
    }
    float _1891 = _1887;
    float _1893 = exp2(_1879);
    float _1895 = _1877 * _1773;
    float _1897 = _1883 * _1773;
    float _1899 = _1873 * _1773;
    float _1901 = _962 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1903 = _1765 + 0.5;
    float _1905 = _962 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1907 = -_948;
    float _1909 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1779);
    float _1911 = -_948;
    float _1913 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1901);
    float _1915 = _1855 + 0.5;
    float _1917 = _974 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1919 = _974 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1921 = _974 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1923 = -_948;
    float _1925 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1905);
    out.m_79.x = _1915;
    out.m_79.y = _1867;
    out.m_79.z = _1869;
    out.m_79.w = _1903;
    float _1927 = fma(_1893, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1929 = precise::clamp(_1927, 0.0, 1.0);
    float _1931 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1917);
    float _1933 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1919);
    float _1935 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1921);
    float _1937 = _988 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1939 = _988 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1941 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1913);
    float _1943 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1909);
    float _1945 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1925);
    float _1947 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1937);
    float _1949 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1939);
    float _1951 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1931);
    float _1953 = _1941 * _1769;
    float _1955 = _988 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1957 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1933);
    float _1959 = _1943 * _1769;
    float _1961 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1955);
    float _1963 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1935);
    float _1965 = _1945 * _1769;
    float _1967 = _1941 * _1851;
    float _1969 = _1895 * _1941;
    float _1971 = _1895 * _1943;
    float _1973 = _1895 * _1945;
    float _1975 = fma(_1929, -2.0, 3.0);
    float _1977 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1947);
    float _1979 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1961);
    float _1981 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1949);
    float _1983 = fma(_1951, _1767, _1953);
    float _1985 = fma(_1957, _1767, _1959);
    float _1987 = fma(_1963, _1767, _1965);
    float _1989 = _1943 * _1851;
    float _1991 = fma(_1951, _1859, _1967);
    float _1993 = fma(_1897, _1951, _1969);
    float _1995 = fma(_1977, _1771, _1983);
    float _1997 = fma(_1979, _1771, _1985);
    float _1999 = fma(_1981, _1771, _1987);
    float _2001 = fma(_1957, _1859, _1989);
    float _2003 = fma(_1897, _1957, _1971);
    float _2005 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2007 = _1929 * _1929;
    float _2009 = _1945 * _1851;
    float _2011 = fma(_1897, _1963, _1973);
    bool _2013 = _1825 <= 8000.0;
    bool _2015 = isnan(_1825);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan(8000.0);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    float _2025 = _2007 * _1975;
    float _2027 = exp2(_2005);
    float _2029 = fma(_1963, _1859, _2009);
    float _2031 = fma(_1899, _1977, _1993);
    float _2033 = -_2025;
    float _2035 = _2033 + 1.0;
    float _2037 = in.m_81.x;
    bool _2039 = _1252 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2041 = isnan(_1252);
    bool _2043 = _2039 || _2041;
    bool _2045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2047 = _2043 || _2045;
    float _2049 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2025);
    float _2051 = fma(_1899, _1979, _2003);
    float _2053 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1699);
    float _2055 = fma(_1899, _1981, _2011);
    float _2057 = _2023 * _2049;
    float _2059 = _2053 + _1458;
    float _2061 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2063 = -_2027;
    float _2065 = _2063 + 1.0;
    out.m_83.x = _2031;
    out.m_83.y = _2051;
    out.m_83.z = _2055;
    float _2067 = _2059 * 0.5;
    out.m_85.x = _1995;
    out.m_85.y = _1997;
    out.m_85.z = _1999;
    out.m_87.z = _2067;
    out.m_87.w = _1458;
    float _2069 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1520;
    out.gl_Position.y = _1528;
    out.gl_Position.z = _2053;
    out.gl_Position.w = _1458;
    float _2071 = fma(_1977, _1891, _1991);
    float _2073 = fma(_1979, _1891, _2001);
    float _2075 = fma(_1981, _1891, _2029);
    out.m_89.x = _2071;
    out.m_89.y = _2073;
    out.m_89.z = _2075;
    float _2077 = -_1540;
    float _2079 = _2077 + 1.0;
    float _2081 = _2079 * _2061;
    float _2083 = precise::clamp(_2081, 0.0, 1.0);
    float _2085 = -_2083;
    float _2087 = fma(_2085, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2089 = _2087 * _2037;
    float _2091 = _2089 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2093 = _2089;
    if (!_2047)
    {
        _2093 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2095 = _2093;
    float _2097 = _2069 * _1556;
    float _2099 = -_2069;
    float _2101 = _2099 + 1.0;
    out.m_91.x = _2091;
    float _2103 = _1567 * _2097;
    float _2105 = _1577 * _2097;
    float _2107 = _2097;
    float _2109 = _2105;
    float _2111 = _2095;
    float _2113 = _2095;
    if (!_2047)
    {
        _2107 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2115 = _2107;
    float _2117 = fma(_1573, _2103, _1561);
    float _2119 = fma(_1575, _2103, _1563);
    float _2121 = _1567 * _2101;
    float _2123 = fma(_1567, _2105, _1565);
    float _2125 = _2115;
    float _2127 = _2115;
    if (!_2047)
    {
        _2109 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2129 = _2109;
    out.m_93.x = _2117;
    out.m_93.y = _2119;
    out.m_93.z = _2123;
    out.m_93.w = _2121;
    bool _2131 = !_2047;
    float _2133 = _2129;
    float _2135 = _2129;
    if (!_2131)
    {
        bool _2137 = _1252 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2139 = isnan(_1252);
        bool _2141 = _2137 || _2139;
        bool _2143 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2145 = _2141 || _2143;
        if (!_2145)
        {
            float _2147 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2149 = _1252 + _2147;
            float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2153 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2151;
            float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2157 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2163 = 1.0 / _2153;
            float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2169 = _2149 * _2163;
            float _2171 = precise::clamp(_2169, 0.0, 1.0);
            float _2173 = fma(_2171, _2157, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2175 = fma(_2171, _2161, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2177 = fma(_2171, _2167, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2127 = _2175;
            _2135 = _2173;
            _2113 = _2177;
            _2179 = true;
        }
        else
        {
            bool _2181 = _1252 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2183 = isnan(_1252);
            bool _2185 = _2181 || _2183;
            bool _2187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2189 = _2185 || _2187;
            if (!_2189)
            {
                _2133 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2191 = _2133;
            _2135 = _2191;
            if (!_2189)
            {
                _2125 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2193 = _2125;
            _2127 = _2193;
            if (!_2189)
            {
                _2111 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2195 = _2111;
            bool _2197 = !_2189;
            _2113 = _2195;
            if (!_2197)
            {
                bool _2199 = _1252 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2201 = isnan(_1252);
                bool _2203 = _2199 || _2201;
                bool _2205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2207 = _2203 || _2205;
                if (!_2207)
                {
                    float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2211 = _1252 + _2209;
                    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2215 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2213;
                    float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2225 = 1.0 / _2215;
                    float _2227 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2229 = _2227 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2231 = _2211 * _2225;
                    float _2233 = precise::clamp(_2231, 0.0, 1.0);
                    float _2235 = fma(_2233, _2219, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2237 = fma(_2233, _2223, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2239 = fma(_2233, _2229, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2127 = _2237;
                    _2135 = _2235;
                    _2113 = _2239;
                    _2179 = true;
                }
                else
                {
                    _2127 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2135 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2113 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2179 = false;
    float _2241 = _2127;
    float _2243 = _2135;
    float _2245 = _2113;
    float _2247 = _2241 * 0.586610972881317138671875;
    bool _2249 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_95.x = 0.0;
    float _2251 = fma(_2243, 0.298911988735198974609375, _2247);
    float _2253 = fma(_2245, 0.114477999508380889892578125, _2251);
    float _2255 = -_2253;
    float _2257 = _2255 + _2243;
    float _2259 = -_2253;
    float _2261 = _2259 + _2241;
    float _2263 = -_2253;
    float _2265 = _2263 + _2245;
    float _2267 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2269 = fma(_2257, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2253);
    float _2271 = fma(_2261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2253);
    float _2273 = fma(_2265, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2253);
    out.m_49.x = _2267;
    out.m_97.x = _2269;
    out.m_97.y = _2271;
    out.m_97.z = _2273;
    if (!_2249)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2275 = -_1218;
    float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2279 = -_1220;
    float _2281 = _2279 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2283 = -_1222;
    float _2285 = _2283 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2287 = _2277 * _2277;
    float _2289 = fma(_2281, _2281, _2287);
    float _2291 = fma(_2285, _2285, _2289);
    float _2293 = sqrt(_2291);
    float _2295 = rsqrt(_2291);
    float _2297 = -_2293;
    float _2299 = _2297 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2301 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2303 = precise::clamp(_2301, 0.0, 1.0);
    float _2305 = _2281 * _2295;
    float _2307 = _2277 * _2295;
    float _2309 = abs(_2303);
    float _2311 = log2(_2309);
    float _2313 = _2285 * _2295;
    float _2315 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2317 = _2073 * _2307;
    float _2319 = -_2307;
    float _2321 = -_2315;
    float _2323 = fma(_2319, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2321);
    float _2325 = fma(_2071, _2305, _2317);
    float _2327 = -_2313;
    float _2329 = fma(_2327, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2323);
    float _2331 = fma(_2075, _2313, _2325);
    float _2333 = precise::clamp(_2331, 0.0, 1.0);
    float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2337 = _2329 + _2335;
    float _2339 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2343 = precise::clamp(_2341, 0.0, 1.0);
    float _2345 = exp2(_2339);
    float _2347 = _2345 * _2343;
    float _2349 = _2333 * _2347;
    float _2351 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2353 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2355 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2351;
    out.m_95.y = _2353;
    out.m_95.z = _2355;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

