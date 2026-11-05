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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_57 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_91 [[user(locn13)]];
    float4 m_89 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3840 = false;
    bool _696 = false;
    bool _580 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    float _126 = _124;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _128 = 0;
    if (!_118)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4141 = as_type<float>(_132);
        out.gl_Position.z = _4141;
    }
    if (!_118)
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
        float _156 = float(_114);
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
        float _4210 = as_type<float>(_170);
        out.gl_Position.z = _4210;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _174 = !_172;
    float _192;
    if (!_174)
    {
        float _176 = in.m_53.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        float _196 = float(_114);
        float _198 = 1.0 / _196;
        float _200 = _150 * _198;
        _192 = _200;
    }
    _194 = false;
    float _202 = _192;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = 1.0 / _206;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _228 = _226 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _230 = 1.0 / _210;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = _202 + _232;
    bool _236 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _238 = isnan(_202);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = 1.0 / _214;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _202 + _250;
    float _254 = _234 * _220;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = _202 + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _262 = _202 + _260;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _266 = 1.0 / _224;
    float _268 = _252 * _230;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _272 = _202 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _276 = _202 + _274;
    bool _278 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _280 = isnan(_202);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = 1.0 / _228;
    float _292 = _258 * _248;
    bool _294 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _296 = isnan(_202);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _306;
    float _310 = -_288;
    float _312 = _310 + 1.0;
    float _314 = fma(_308, _254, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _316 = 1.0 / _218;
    float _318 = _272 * _266;
    bool _320 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _322 = isnan(_202);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_304;
    float _334 = _332 + 1.0;
    float _336 = -_330;
    float _338 = _336 + 1.0;
    float _340 = _276 * _290;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = _288 * _334;
    float _348 = fma(_344, _254, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = _246 * _338;
    bool _352 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _354 = isnan(_202);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = _262 * _316;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _366;
    float _370 = -_246;
    float _372 = _370 + 1.0;
    float _374 = fma(_368, _254, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _376 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _378 = isnan(_202);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = _330 * _312;
    bool _390 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _392 = isnan(_202);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = _386 * _372;
    float _416 = -_400;
    float _418 = _416 + 1.0;
    float _420 = -_386;
    float _422 = _420 + 1.0;
    float _424 = fma(_408, _268, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _426 = _362 * _418;
    float _428 = -_362;
    float _430 = _428 + 1.0;
    float _432 = fma(_404, _268, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _434 = fma(_412, _268, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _436 = _374 * _426;
    float _438 = _348 * _426;
    float _440 = _314 * _426;
    float _442 = _400 * _422;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _464 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _466 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _468;
    float _472 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].z, _440);
    float _474 = fma(_454, _364, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _476 = fma(_458, _364, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _478 = fma(_462, _364, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _480 = fma(_446, _292, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _482 = fma(_450, _292, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _484 = fma(_470, _292, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _486 = fma(_424, _442, _464);
    float _488 = fma(_432, _442, _466);
    float _490 = fma(_434, _442, _472);
    float _492 = fma(_480, _414, _486);
    float _494 = fma(_482, _414, _488);
    float _496 = fma(_484, _414, _490);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _502;
    float _506 = fma(_474, _350, _492);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _508;
    float _512 = fma(_476, _350, _494);
    float _514 = fma(_478, _350, _496);
    float _516 = fma(_500, _318, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _518 = fma(_504, _318, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _524 = fma(_510, _318, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _534 = fma(_516, _388, _506);
    float _536 = fma(_522, _340, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _538 = fma(_528, _340, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _540 = fma(_532, _340, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _542 = fma(_518, _388, _512);
    float _544 = fma(_524, _388, _514);
    float _546 = fma(_536, _346, _534);
    float _548 = fma(_538, _346, _542);
    float _550 = fma(_540, _346, _544);
    float _552 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[149].x, _546);
    float _554 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[149].y, _548);
    float _556 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[149].z, _550);
    bool _558 = !_264;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _578;
    if (!_558)
    {
        float _562 = in.m_53.x;
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _566 = _562 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _570 = _568 * _564;
        float _572 = floor(_570);
        float _574 = -_572;
        float _576 = _570 + _574;
        _578 = _576;
        _580 = true;
    }
    else
    {
        float _582 = float(_114);
        float _584 = 1.0 / _582;
        float _586 = _150 * _584;
        _578 = _586;
    }
    _580 = false;
    float _588 = _578;
    float _590 = in.m_55.x;
    float _592 = in.m_55.y;
    float _594 = in.m_55.z;
    bool _596 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _598 = isnan(_588);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _612 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _614 = isnan(_588);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _588 + _628;
    float _632 = 1.0 / _610;
    float _634 = -_606;
    float _636 = _634 + 1.0;
    bool _638 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _640 = _622 * _636;
    float _642 = -_622;
    float _644 = _642 + 1.0;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _648 = _626 * _632;
    float _650 = _556 * _594;
    float _652 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _554 * _592;
    float _656 = fma(_648, _630, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _658 = _552 * _590;
    float _660 = _656 * _640;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _664 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[115].x, _660);
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _668 = _662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _670 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[116].x, _664);
    float _672 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _670 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _672;
    out.m_57.y = _668;
    out.m_57.z = _652;
    out.m_57.w = _674;
    bool _676 = !_638;
    float _694;
    if (!_676)
    {
        float _678 = in.m_53.x;
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _682 = _678 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _686 = _684 * _680;
        float _688 = floor(_686);
        float _690 = -_688;
        float _692 = _686 + _690;
        _694 = _692;
        _696 = true;
    }
    else
    {
        float _698 = float(_114);
        float _700 = 1.0 / _698;
        float _702 = _150 * _700;
        _694 = _702;
    }
    _696 = false;
    float _704 = _694;
    float _706 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _708 = int(_706);
    float _710 = in.m_53.x;
    float _712 = float(_114);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _716 = _704 + _714;
    float _718 = in.m_53.y;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _722 = _704 + _720;
    float _724 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _726 = int(_724);
    float _728 = in.m_59.y;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _738 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _740 = int(_738);
    float _742 = float(_708);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _748 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _750 = isnan(_704);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = 1.0 / _742;
    float _762 = float(_726);
    float _764 = _718 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _766 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _768 = int(_766);
    float _770 = float(uint(_740));
    float _772 = fma(_764, -2.0, _746);
    int _774 = ~_740;
    int _776 = _774 + 1;
    bool _778 = _740 == 0;
    float _780 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _772);
    float _782 = 1.0 / _762;
    float _784 = _760 * _150;
    float _786 = 1.0 / _770;
    float _788 = float(uint(_768));
    int _790 = ~_740;
    int _792 = _790 + 1;
    float _794 = trunc(_784);
    int _796 = int(_794);
    float _798 = _782 * _150;
    float _800 = 1.0 / _788;
    int _802 = as_type<int>(_786) + (-2);
    int _804 = ~_768;
    int _806 = _804 + 1;
    float _808 = trunc(_798);
    int _810 = int(_808);
    float _812 = float(uint(_796));
    float _814 = as_type<float>(_802) * _812;
    int _816 = as_type<int>(_800) + (-2);
    float _818 = 1.0 / _712;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _822 = _820 != 0;
    float _824 = float(uint(_810));
    float _826 = trunc(_814);
    float _828 = precise::max(_826, 0.0);
    uint _831 = uint(_828);
    float _833 = as_type<float>(_816) * _824;
    float _835 = 1.0 / _732;
    float _837 = _728;
    int _839 = _802;
    if (_822)
    {
        _122 = 1.0;
    }
    float _841 = _122;
    float _843 = _841;
    if (!_822)
    {
        _843 = 1.2345600128173828125;
    }
    float _845 = _843;
    float _847 = trunc(_833);
    float _849 = precise::max(_847, 0.0);
    uint _851 = uint(_849);
    int _853 = _792 * int(_831);
    int _855 = _853 + _796;
    float _857 = float(uint(_855));
    float _859 = 1.0 / _736;
    float _861 = as_type<float>(_802) * _857;
    float _863 = _857;
    if (_822)
    {
        _863 = _710;
    }
    float _865 = _863;
    float _867 = _865;
    if (!_822)
    {
        _867 = _718;
    }
    float _869 = _867;
    int _871 = _806 * int(_851);
    int _873 = _871 + _810;
    float _875 = trunc(_861);
    float _877 = precise::max(_875, 0.0);
    uint _879 = uint(_877);
    float _881 = float(uint(_873));
    float _883 = as_type<float>(_816) * _881;
    float _885 = _881;
    if (_822)
    {
        _885 = 1.0;
    }
    float _887 = _885;
    float _889 = _887;
    if (!_822)
    {
        _889 = 7.345489978790283203125;
    }
    float _891 = _889;
    float _893 = trunc(_883);
    float _895 = precise::max(_893, 0.0);
    uint _897 = uint(_895);
    int _899 = int(_831) + int(_879);
    float _901 = _891 * _710;
    float _903 = _869 * _845;
    float _905 = float(_740);
    float _907 = floor(_901);
    float _909 = float(_796);
    int _911 = ~_768;
    int _913 = _911 + 1;
    bool _915 = _909 >= _905;
    bool _917 = isnan(_909);
    bool _919 = _915 || _917;
    bool _921 = isnan(_905);
    bool _923 = _919 || _921;
    float _925 = float(_923);
    int _927 = int(_851) + int(_897);
    int _929 = _776 * _899;
    int _931 = _929 + _796;
    float _933 = floor(_903);
    float _935 = float(_768);
    int _937 = _913 * _927;
    int _939 = _937 + _810;
    bool _941 = uint(_931) >= uint(_740);
    float _943 = float(_810);
    float _945 = -_907;
    float _947 = _901 + _945;
    float _949 = trunc(_925);
    int _951 = int(_949);
    bool _953 = !_941;
    int _955 = _953 ? 0 : (-1);
    bool _957 = _943 >= _935;
    bool _959 = isnan(_943);
    bool _961 = _957 || _959;
    bool _963 = isnan(_935);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    bool _969 = uint(_939) >= uint(_768);
    int _971 = ~_899;
    int _973 = _971 + _955;
    int _975 = _973 + 1;
    float _977 = -_933;
    float _979 = _903 + _977;
    float _981 = _905 * _947;
    bool _983 = !_969;
    int _985 = _983 ? 0 : (-1);
    int _987 = _740 * _975;
    int _989 = _987 + _796;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _993 = _991 != 0;
    float _995 = trunc(_967);
    int _997 = int(_995);
    int _999 = ~_927;
    int _1001 = _999 + _985;
    int _1003 = _1001 + 1;
    float _1005 = _818 * _150;
    bool _1007 = !_778;
    int _1009 = _1007 ? _989 : (-1);
    float _1011 = _935 * _979;
    bool _1013 = _768 == 0;
    float _1015 = _905 * _1005;
    float _1017 = trunc(_981);
    int _1019 = int(_1017);
    bool _1021 = !_993;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = _935 * _1005;
    int _1027 = ~_951;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    int _1033 = abs(_1023);
    int _1035 = _768 * _1003;
    int _1037 = _1035 + _810;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1041 = _1039 != 0;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1045 = _1043 != 0;
    int _1047 = _1009 * _1031;
    int _1049 = _740 + (-1);
    float _1051 = trunc(_1015);
    int _1053 = int(_1051);
    bool _1055 = !_1013;
    int _1057 = _1055 ? _1037 : (-1);
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1061 = _1059 != 0;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1065 = _1063 != 0;
    int _1067 = _951 * _1049;
    int _1069 = _1067 + _1047;
    bool _1071 = !_1045;
    int _1073 = _1071 ? 0 : 1;
    int _1075 = _1019 * _1033;
    int _1077 = _1075 + _796;
    int _1079 = ~_997;
    int _1081 = _1079 + 1;
    int _1083 = _1081 + 1;
    float _1085 = trunc(_1011);
    int _1087 = int(_1085);
    bool _1089 = !_1065;
    int _1091 = _1089 ? 0 : 1;
    int _1093 = abs(_1073);
    int _1095 = _1057 * _1083;
    bool _1097 = !_1041;
    int _1099 = _1097 ? 0 : 1;
    int _1101 = abs(_1091);
    float _1103 = trunc(_1025);
    int _1105 = int(_1103);
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1109 = _1107 != 0;
    int _1111 = abs(_1099);
    int _1113 = _1069 * _1093;
    int _1115 = _768 + (-1);
    bool _1117 = !_1109;
    int _1119 = _1117 ? 0 : 1;
    int _1121 = _997 * _1115;
    int _1123 = _1121 + _1095;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1127 = _1125 != 0;
    float _1129 = in.m_53.z;
    int _1131 = _1053 * _1111;
    int _1133 = _1131 + _1113;
    int _1135 = abs(_1119);
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1139 = _1137 != 0;
    int _1141 = _1123 * _1101;
    bool _1143 = !_1127;
    int _1145 = _1143 ? 0 : 1;
    int _1147 = _1077 * _1135;
    int _1149 = _1147 + _1133;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1153 = _1151 != 0;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1157 = _1155 != 0;
    bool _1159 = !_1061;
    int _1161 = _1159 ? 0 : 1;
    bool _1163 = !_1139;
    int _1165 = _1163 ? 0 : 1;
    int _1167 = abs(_1145);
    int _1169 = abs(_1161);
    int _1171 = abs(_1165);
    bool _1173 = !_1153;
    int _1175 = _1173 ? 0 : 1;
    float _1177 = _1129 * 2.0;
    int _1179 = abs(_1175);
    int _1181 = _1019 * _1167;
    int _1183 = _1181 + _1149;
    bool _1185 = !_1157;
    int _1187 = _1185 ? 0 : 1;
    int _1189 = _1087 * _1171;
    int _1191 = _1189 + _810;
    float _1193 = floor(_1177);
    int _1195 = abs(_1187);
    int _1197 = _1105 * _1169;
    int _1199 = _1197 + _1141;
    float _1201 = float(uint(_1183));
    float _1203 = in.m_59.x;
    int _1205 = _1191 * _1179;
    int _1207 = _1205 + _1199;
    int _1209 = ~_740;
    int _1211 = _1209 + 1;
    float _1213 = as_type<float>(_802) * _1201;
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1217 = _1215 != 0;
    int _1219 = _1087 * _1195;
    int _1221 = _1219 + _1207;
    int _1223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1225 = _1223 != 0;
    bool _1227 = _740 == 0;
    float _1229 = trunc(_1213);
    float _1231 = precise::max(_1229, 0.0);
    uint _1233 = uint(_1231);
    float _1235 = float(uint(_1221));
    float _1237 = as_type<float>(_816) * _1235;
    int _1239 = ~_768;
    int _1241 = _1239 + 1;
    bool _1243 = _1061;
    int _1245 = _1087;
    if (_1217)
    {
        bool _1247 = _710 > 0.5;
        _1243 = _1247;
    }
    bool _1249 = _1243;
    float _1251 = trunc(_1237);
    float _1253 = precise::max(_1251, 0.0);
    uint _1255 = uint(_1253);
    float _1257 = _1203;
    if (!_1217)
    {
        _560 = _1203;
    }
    float _1259 = _560;
    float _1261 = _1259;
    if (_1225)
    {
        float _1263 = -_1203;
        float _1265 = _1263 + 1.0;
        _1245 = as_type<int>(_1265);
    }
    int _1267 = _1245;
    int _1269 = _1211 * int(_1233);
    int _1271 = _1269 + _1183;
    float _1273 = 0.0;
    if (!_1225)
    {
        _1273 = _1203;
    }
    float _1275 = _1273;
    float _1277 = float(uint(_1271));
    float _1279 = as_type<float>(_802) * _1277;
    int _1281 = _1241 * int(_1255);
    int _1283 = _1281 + _1221;
    float _1285 = trunc(_1279);
    float _1287 = precise::max(_1285, 0.0);
    uint _1289 = uint(_1287);
    float _1291 = float(uint(_1283));
    float _1293 = as_type<float>(_816) * _1291;
    int _1295 = as_type<int>(_1291);
    float _1297 = _1275;
    int _1299 = as_type<int>(_1293);
    if (_1217)
    {
        float _1301 = -_1203;
        float _1303 = _1301 + 1.0;
        _1295 = as_type<int>(_1303);
    }
    int _1305 = _1295;
    int _1307 = ~_768;
    int _1309 = _1307 + 1;
    float _1311 = trunc(_1293);
    float _1313 = precise::max(_1311, 0.0);
    uint _1315 = uint(_1313);
    if (_1217)
    {
        float _1317 = _1249 ? as_type<float>(_1305) : _1203;
        _1261 = _1317;
    }
    float _1319 = _1261;
    int _1321 = ~_740;
    int _1323 = _1321 + 1;
    int _1325 = int(_1233) + int(_1289);
    float _1327 = in.m_53.w;
    int _1329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1331 = _1329 != 0;
    int _1333 = _1323 * _1325;
    int _1335 = _1333 + _1183;
    bool _1337 = _1129 > 0.5;
    bool _1339 = uint(_1335) >= uint(_740);
    float _1341 = -_728;
    float _1343 = _1341 + 1.0;
    if (_1225)
    {
        float _1345 = _1337 ? as_type<float>(_1267) : _1203;
        _1297 = _1345;
    }
    float _1347 = _1297;
    int _1349 = int(_1255) + int(_1315);
    bool _1351 = !_1339;
    int _1353 = _1351 ? 0 : (-1);
    if (_1331)
    {
        float _1355 = -_1203;
        float _1357 = _1355 + 1.0;
        _1299 = as_type<int>(_1357);
    }
    int _1359 = _1299;
    bool _1361 = _718 > 0.5;
    int _1363 = ~_1325;
    int _1365 = _1363 + _1353;
    int _1367 = _1365 + 1;
    int _1369 = _1309 * _1349;
    int _1371 = _1369 + _1221;
    if (_1331)
    {
        float _1373 = _1361 ? as_type<float>(_1359) : _1203;
        _1257 = _1373;
    }
    float _1375 = _1257;
    int _1377 = _1361 ? as_type<int>(_1343) : as_type<int>(_728);
    int _1379 = _740 * _1367;
    int _1381 = _1379 + _1183;
    bool _1383 = uint(_1371) >= uint(_768);
    float _1385 = float(uint(_1077));
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1389 = _1387 != 0;
    bool _1391 = _1327 > 0.5;
    float _1393 = as_type<float>(_802) * _1385;
    bool _1395 = !_1227;
    int _1397 = _1395 ? _1381 : (-1);
    float _1399 = _1389 ? as_type<float>(_1377) : _728;
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1403 = _1401 != 0;
    float _1405 = trunc(_1393);
    float _1407 = precise::max(_1405, 0.0);
    uint _1409 = uint(_1407);
    int _1411 = _1391 ? as_type<int>(_1343) : as_type<int>(_728);
    bool _1413 = !_1383;
    int _1415 = _1413 ? 0 : (-1);
    int _1417 = _1397 & 3;
    float _1419 = _1403 ? as_type<float>(_1411) : _728;
    int _1421 = ~_1349;
    int _1423 = _1421 + _1415;
    int _1425 = _1423 + 1;
    bool _1427 = uint(_1417) > 1u;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1431 = _1429 != 0;
    int _1433 = _768 * _1425;
    int _1435 = _1433 + _1221;
    int _1437 = _1397 & 3;
    bool _1439 = _1437 != 0;
    int _1441 = ~_740;
    int _1443 = _1441 + 1;
    bool _1445 = _768 == 0;
    int _1447 = _1439 ? 0 : 1;
    bool _1449 = !_1445;
    int _1451 = _1449 ? _1435 : (-1);
    int _1453 = ~_1447;
    int _1455 = _1453 + 1;
    int _1457 = _1455 + 1;
    float _1459 = float(uint(_1191));
    int _1461 = _1457;
    if (!_1427)
    {
        int _1463 = ~_1447;
        int _1465 = _1463 + 1;
        _1461 = _1465;
    }
    int _1467 = _1461;
    int _1469 = _1443 * int(_1409);
    int _1471 = _1469 + _1077;
    int _1473 = _1451 & 3;
    float _1475 = as_type<float>(_816) * _1459;
    if (_1431)
    {
        float _1477 = _1337 ? _1343 : _728;
        _837 = _1477;
    }
    float _1479 = _837;
    float _1481 = _710 * 2.0;
    bool _1483 = _1417 != 3;
    float _1485 = trunc(_1475);
    float _1487 = precise::max(_1485, 0.0);
    uint _1489 = uint(_1487);
    bool _1491 = uint(_1417) >= 2u;
    bool _1493 = uint(_1473) > 1u;
    float _1495 = float(uint(_1471));
    int _1497 = _1491 ? 0 : 1;
    float _1499 = floor(_1481);
    int _1501 = _1451 & 3;
    bool _1503 = _1501 != 0;
    float _1505 = _718 * 2.0;
    int _1507 = ~_1497;
    int _1509 = _1507 + 1;
    int _1511 = _1509 + 1;
    float _1513 = as_type<float>(_802) * _1495;
    int _1515 = _1503 ? 0 : 1;
    int _1517 = _1511;
    int _1519 = _1497;
    if (_1483)
    {
        int _1521 = ~_1497;
        int _1523 = _1521 + 1;
        _1517 = _1523;
    }
    int _1525 = _1517;
    float _1527 = floor(_1505);
    int _1529 = ~_1515;
    int _1531 = _1529 + 1;
    int _1533 = _1531 + 1;
    int _1535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1537 = _1535 != 0;
    int _1539 = _1533;
    if (!_1493)
    {
        int _1541 = ~_1515;
        int _1543 = _1541 + 1;
        _1539 = _1543;
    }
    int _1545 = _1539;
    bool _1547 = _1473 != 3;
    float _1549 = trunc(_1513);
    float _1551 = precise::max(_1549, 0.0);
    uint _1553 = uint(_1551);
    bool _1555 = !_1537;
    int _1557 = _1555 ? 0 : 1;
    bool _1559 = uint(_1473) >= 2u;
    int _1561 = ~_768;
    int _1563 = _1561 + 1;
    int _1565 = _1559 ? 0 : 1;
    bool _1567 = _1499 > 0.0;
    int _1569 = _1563 * int(_1489);
    int _1571 = _1569 + _1191;
    int _1573 = ~_1565;
    int _1575 = _1573 + 1;
    int _1577 = _1575 + 1;
    int _1579 = _1577;
    if (_1547)
    {
        int _1581 = ~_1565;
        int _1583 = _1581 + 1;
        _1579 = _1583;
    }
    int _1585 = _1579;
    if (_822)
    {
        _839 = 0;
    }
    int _1587 = _839;
    bool _1589 = _1527 >= 0.0;
    bool _1591 = isnan(_1527);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan(0.0);
    bool _1597 = _1593 || _1595;
    int _1599 = _1587;
    float _1601 = _1527;
    if (!_822)
    {
        _1599 = 1;
    }
    int _1603 = _1599;
    float _1605 = float(uint(_1571));
    bool _1607 = _1499 >= 0.0;
    bool _1609 = isnan(_1499);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan(0.0);
    bool _1615 = _1611 || _1613;
    float _1617 = _1597 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1619 = as_type<float>(_816) * _1605;
    bool _1621 = _1603 != 1;
    int _1623 = _1615 ? 0 : 1;
    float _1625 = trunc(_1619);
    float _1627 = precise::max(_1625, 0.0);
    uint _1629 = uint(_1627);
    float _1631 = _1617;
    float _1633 = _1619;
    if (_822)
    {
        _1519 = 0;
    }
    int _1635 = _1519;
    bool _1637 = _1527 > 0.0;
    int _1639 = _1635;
    if (!_822)
    {
        _1639 = 2;
    }
    int _1641 = _1639;
    int _1643 = ~_1623;
    int _1645 = _1643 + 1;
    int _1647 = _1645 + 1;
    int _1649 = _1647;
    if (!_1567)
    {
        int _1651 = ~_1623;
        int _1653 = _1651 + 1;
        _1649 = _1653;
    }
    int _1655 = _1649;
    bool _1657 = _1641 != 2;
    int _1659 = int(_1409) + int(_1553);
    int _1661 = ~_740;
    int _1663 = _1661 + 1;
    float _1665 = as_type<float>(_1553);
    if (!_1621)
    {
        _1601 = _718;
    }
    float _1667 = _1601;
    int _1669 = ~as_type<int>(_1617);
    int _1671 = _1669 + 1;
    int _1673 = _1671 + 1;
    int _1675 = _1663 * _1659;
    int _1677 = _1675 + _1077;
    int _1679 = _1673;
    float _1681 = _1667;
    if (!_1637)
    {
        int _1683 = ~as_type<int>(_1617);
        int _1685 = _1683 + 1;
        _1679 = _1685;
    }
    int _1687 = _1679;
    float _1689 = 0.0;
    if (!_1621)
    {
        _1689 = _1129;
    }
    float _1691 = _1689;
    float _1693 = 0.0;
    float _1695 = _1691;
    if (!_1621)
    {
        _1693 = _1667;
    }
    float _1697 = _1693;
    float _1699 = _1697;
    if (!_1621)
    {
        _1631 = _1129;
    }
    float _1701 = _1631;
    float _1703 = _1701;
    if (_1621)
    {
        _1699 = _710;
    }
    float _1705 = _1699;
    if (_1621)
    {
        _1681 = _710;
    }
    float _1707 = _1681;
    if (_1621)
    {
        _1695 = _718;
    }
    float _1709 = _1695;
    if (_1621)
    {
        _1703 = _718;
    }
    float _1711 = _1703;
    bool _1713 = uint(_1677) >= uint(_740);
    float _1715 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1717 = in.m_46.x;
    float _1719 = in.m_46.y;
    float _1721 = in.m_46.z;
    int _1723 = int(_1489) + int(_1629);
    int _1725 = ~_768;
    int _1727 = _1725 + 1;
    float _1729 = as_type<float>(_1629);
    if (_1657)
    {
        _1729 = _1129;
    }
    float _1731 = _1729;
    float _1733 = _1731;
    if (_1657)
    {
        _1665 = _710;
    }
    float _1735 = _1665;
    int _1737 = _1727 * _1723;
    int _1739 = _1737 + _1191;
    float _1741 = _1735;
    if (_1657)
    {
        _1633 = _718;
    }
    float _1743 = _1633;
    float _1745 = _1743;
    if (!_1657)
    {
        _1733 = _718;
    }
    float _1747 = _1733;
    if (!_1657)
    {
        _1741 = _1129;
    }
    float _1749 = _1741;
    if (!_1657)
    {
        _1745 = _710;
    }
    float _1751 = _1745;
    bool _1753 = uint(_1739) >= uint(_768);
    float _1755 = _710 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1757 = !_1713;
    int _1759 = _1757 ? 0 : (-1);
    int _1761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1763 = _1761 != 0;
    int _1765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1767 = _1765 != 0;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1771 = _1769 != 0;
    float _1773 = -_744;
    float _1775 = fma(_1755, 2.0, _1773);
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1779 = _1777 != 0;
    float _1781 = _1719 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1783 = _1719 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1785 = _1719 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1787 = _718 + _1129;
    bool _1789 = !_1753;
    int _1791 = _1789 ? 0 : (-1);
    float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1793;
    bool _1797 = _1193 >= 0.0;
    bool _1799 = isnan(_1193);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    float _1807 = _1787 + (-1.0);
    float _1809 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1781);
    float _1811 = _1795 * _835;
    float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1815 = _1813 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1817 = fma(_1807, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1819 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1783);
    float _1821 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1785);
    bool _1823 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1825 = isnan(_704);
    bool _1827 = _1823 || _1825;
    bool _1829 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1831 = _1827 || _1829;
    float _1833 = float(_1831);
    float _1835 = _710 + _718;
    int _1837 = _1805 ? 0 : 1;
    float _1839 = _1815 * _859;
    bool _1841 = _1193 > 0.0;
    float _1843 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1809);
    float _1845 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1819);
    float _1847 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1821);
    float _1849 = _1835 + (-1.0);
    float _1851 = -_1833;
    float _1853 = _1851 + 1.0;
    bool _1855 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1857 = isnan(_704);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    float _1867 = fma(_1839, _716, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1869 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1871 = _758 * _1853;
    float _1873 = -_758;
    float _1875 = _1873 + 1.0;
    float _1877 = fma(_1811, _722, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1881 = !_1767;
    int _1883 = _1881 ? 0 : 1;
    float _1885 = _1865 * _1875;
    float _1887 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1889 = !_1763;
    int _1891 = _1889 ? 0 : 1;
    float _1893 = _1845 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1895 = _1877 * _1885;
    float _1897 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1887);
    float _1899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1901 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1897);
    int _1903 = abs(_1891);
    float _1905 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1907 = _1843 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1909 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1911 = -_1865;
    float _1913 = _1911 + 1.0;
    float _1915 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1905);
    float _1917 = -_150;
    float _1919 = fma(_1917, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1775);
    float _1921 = -_780;
    float _1923 = fma(_1901, _1909, _1921);
    float _1925 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1895);
    float _1927 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1915);
    float _1929 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1931 = fma(_1867, _1871, _1925);
    float _1933 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1935 = fma(_1927, _1929, _1919);
    int _1937 = abs(_1883);
    float _1939 = _1879 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1941 = fma(_1833, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1931);
    float _1943 = float(_1655);
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1947 = float(_1937);
    float _1949 = fma(_1939, _1479, -0.5);
    float _1951 = _1899 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1953 = _1947 * _1943;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    int _1957 = ~_1837;
    int _1959 = _1957 + 1;
    int _1961 = _1959 + 1;
    float _1963 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1965 = _1961;
    if (!_1841)
    {
        int _1967 = ~_1837;
        int _1969 = _1967 + 1;
        _1965 = _1969;
    }
    int _1971 = _1965;
    float _1973 = -_1945;
    float _1975 = fma(_1933, 2.0, _1973);
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1979 = fma(_1951, _1375, -0.5);
    float _1981 = float(_1971);
    float _1983 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1955);
    float _1985 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1963);
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1989 = _1893 + _1987;
    float _1991 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1977);
    float _1993 = _1847 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1995 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1997 = _1907 + _1995;
    float _1999 = _1989 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2003 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2005 = float(_1903);
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2009 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2011 = _1993 + _2009;
    float _2013 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1999);
    float _2015 = _2001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2017 = _2003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2019 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2021 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2023 = _1705 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2025 = _2005 * _1981;
    float _2027 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2013);
    float _2029 = in.m_61.x;
    float _2031 = in.m_61.y;
    float _2033 = in.m_61.z;
    float _2035 = -_2021;
    float _2037 = fma(_2023, 2.0, _2035);
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2041 = !_1439;
    int _2043 = _2041 ? 0 : 1;
    float _2045 = _2025 * (-2.0);
    int _2047 = _1397 >> 31;
    float _2049 = _1941 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2051 = _2027 >= 0.0;
    float _2053 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1983);
    int _2055 = _1451 >> 31;
    float _2057 = fma(_1715, -2.0, _2039);
    int _2059 = _2047 & 3;
    float _2061 = _2053 * (-0.15915493667125701904296875);
    int _2063 = _2055 & 3;
    out.m_63.x = _2015;
    out.m_63.y = _2017;
    out.m_63.z = _2019;
    out.m_63.w = _2049;
    int _2065 = _1397 + _2059;
    float _2067 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1985);
    int _2069 = _1451 + _2063;
    float _2071 = fma(_1869, _2045, _1869);
    int _2073 = _2065 >> 2;
    float _2075 = _2061 * 6.283185482025146484375;
    float _2077 = sin(_2075);
    int _2079 = _2069 >> 2;
    float _2081 = _1751 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2083 = _2073 << 4;
    int _2085 = _2083 + 368;
    float _2087 = fma(_2045, _2029, _2029);
    int _2089 = _2079 << 4;
    int _2091 = _2089 + 512;
    float _2093 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _2095 = _2061 * 6.283185482025146484375;
    float _2097 = cos(_2095);
    uint _2099 = uint(int(uint(_2085) >> uint(2)));
    uint _2101 = uint(int(uint(int(_2099)) >> uint(2)));
    int _2103 = int(_2099) & 3;
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[int(_2101)][_2103];
    int _2107 = int(_2099) + 1;
    uint _2109 = uint(int(uint(_2107) >> uint(2)));
    int _2111 = _2107 & 3;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[int(_2109)][_2111];
    float _2115 = -_150;
    float _2117 = fma(_2115, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2037);
    float _2119 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2121 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1991);
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2125 = fma(_2081, -2.0, _2119);
    uint _2127 = uint(int(uint(_2091) >> uint(2)));
    uint _2129 = uint(int(uint(int(_2127)) >> uint(2)));
    int _2131 = int(_2127) & 3;
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[int(_2129)][_2131];
    int _2135 = int(_2127) + 1;
    uint _2137 = uint(int(uint(_2135) >> uint(2)));
    int _2139 = _2135 & 3;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[int(_2137)][_2139];
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2145 = fma(_2067, _2093, _2117);
    float _2147 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2123);
    float _2149 = _2077 * _1949;
    int _2151 = ~_1659;
    int _2153 = _2151 + _1759;
    int _2155 = _2153 + 1;
    float _2157 = -_150;
    float _2159 = fma(_2157, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1975);
    float _2161 = _2097 * _1949;
    int _2163 = _2085 + 8;
    uint _2165 = uint(int(uint(_2163) >> uint(2)));
    uint _2167 = uint(int(uint(int(_2165)) >> uint(2)));
    int _2169 = int(_2165) & 3;
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[int(_2167)][_2169];
    int _2173 = int(_2165) + 1;
    uint _2175 = uint(int(uint(_2173) >> uint(2)));
    int _2177 = _2173 & 3;
    float _2179 = (*spvDescriptorSet0.vp_c9)._m0[int(_2175)][_2177];
    float _2181 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2147);
    float _2183 = -_2149;
    float _2185 = fma(_2097, _1979, _2183);
    float _2187 = fma(_2077, _1979, _2161);
    float _2189 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    int _2191 = _740 * _2155;
    int _2193 = _2191 + _1077;
    int _2195 = ~_1723;
    int _2197 = _2195 + _1791;
    int _2199 = _2197 + 1;
    float _2201 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2143);
    int _2203 = _2091 + 8;
    uint _2205 = uint(int(uint(_2203) >> uint(2)));
    uint _2207 = uint(int(uint(int(_2205)) >> uint(2)));
    int _2209 = int(_2205) & 3;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[int(_2207)][_2209];
    int _2213 = int(_2205) + 1;
    uint _2215 = uint(int(uint(_2213) >> uint(2)));
    int _2217 = _2213 & 3;
    float _2219 = (*spvDescriptorSet0.vp_c9)._m0[int(_2215)][_2217];
    bool _2221 = !_1503;
    int _2223 = _2221 ? 0 : 1;
    float _2225 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2057);
    int _2227 = abs(_1545);
    int _2229 = _768 * _2199;
    int _2231 = _2229 + _1191;
    bool _2233 = _1417 != 3;
    float _2235 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2201);
    int _2237 = abs(_1467);
    float _2239 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2125);
    int _2241 = abs(_2223);
    float _2243 = -_2225;
    float _2245 = fma(_2121, _2189, _2243);
    float _2247 = fma(_2181, _2185, _2159);
    int _2249 = abs(_2043);
    float _2251 = -_2239;
    float _2253 = fma(_2235, _2187, _2251);
    int _2255 = abs(_1525);
    float _2257 = _2247 + 0.5;
    int _2259 = ~_2237;
    int _2261 = _2259 + 1;
    int _2263 = _2261 + 1;
    float _2265 = _2253 + 0.5;
    int _2267 = ~_2227;
    int _2269 = _2267 + 1;
    int _2271 = _2269 + 1;
    float _2273 = _2187;
    float _2275 = _2225;
    float _2277 = _2145;
    float _2279 = _2149;
    if (_2051)
    {
        out.m_49.x = 0.0;
    }
    int _2281 = ~_2249;
    int _2283 = _2281 + 1;
    int _2285 = _2283 + 1;
    int _2287 = _2263 * as_type<int>(_2113);
    int _2289 = ~_2241;
    int _2291 = _2289 + 1;
    int _2293 = _2291 + 1;
    out.m_65.x = _2257;
    out.m_65.y = _2265;
    bool _2295 = !_2233;
    int _2297 = _2295 ? 0 : (-1);
    int _2299 = _2285 * as_type<int>(_2105);
    int _2301 = _2299 + _2287;
    bool _2303 = _1473 != 3;
    bool _2305 = !_1779;
    int _2307 = _2305 ? 0 : 1;
    int _2309 = _2271 * as_type<int>(_2141);
    int _2311 = ~_2255;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    int _2317 = abs(_2307);
    int _2319 = _2293 * as_type<int>(_2133);
    int _2321 = _2319 + _2309;
    int _2323 = abs(_2297);
    int _2325 = abs(_1557);
    int _2327 = _2315 * as_type<int>(_2171);
    int _2329 = _2327 + _2301;
    bool _2331 = !_2303;
    int _2333 = _2331 ? 0 : (-1);
    int _2335 = abs(_1585);
    int _2337 = abs(_2333);
    int _2339 = ~_2323;
    int _2341 = _2339 + 1;
    int _2343 = _2341 + 1;
    int _2345 = ~_2335;
    int _2347 = _2345 + 1;
    int _2349 = _2347 + 1;
    bool _2351 = _768 == 0;
    int _2353 = _2343 * as_type<int>(_2179);
    int _2355 = _2353 + _2329;
    float _2357 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2359 = log2(_2357);
    int _2361 = _2349 * as_type<int>(_2211);
    int _2363 = _2361 + _2321;
    float _2365 = _1989 * _1989;
    int _2367 = ~_2325;
    int _2369 = _2367 + 1;
    int _2371 = _2369 + 1;
    int _2373 = ~_2337;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    float _2379 = fma(_1997, _1997, _2365);
    int _2381 = _2355 * _2371;
    bool _2383 = !_2351;
    int _2385 = _2383 ? _2231 : (-1);
    int _2387 = _2377 * as_type<int>(_2219);
    int _2389 = _2387 + _2363;
    int _2391 = ~_2317;
    int _2393 = _2391 + 1;
    int _2395 = _2393 + 1;
    float _2397 = fma(_2011, _2011, _2379);
    bool _2399 = _740 == 0;
    float _2401 = _2245 + 0.5;
    float _2403 = _2359 * _150;
    int _2405 = _2389 * _2395;
    bool _2407 = !_2399;
    int _2409 = _2407 ? _2193 : (-1);
    float _2411 = rsqrt(_2397);
    float _2413 = _1923 + 0.5;
    int _2415 = _2385 * _2317;
    int _2417 = _2415 + _2405;
    float _2419 = as_type<float>(_2405);
    if (_2051)
    {
        _2419 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2421 = _2419;
    int _2423 = _2409 * _2325;
    int _2425 = _2423 + _2381;
    float _2427 = _1935 + 0.5;
    float _2429 = _2145 + 0.5;
    float _2431 = exp2(_2403);
    int _2433 = as_type<int>(_2421);
    if (_2051)
    {
        float _2435 = _2421 * 5.0;
        _2433 = as_type<int>(_2435);
    }
    int _2437 = _2433;
    float _2439 = float(_2425);
    float _2441 = float(_2417);
    out.m_67.x = _2427;
    out.m_67.y = _2413;
    out.m_67.z = _2429;
    out.m_67.w = _2401;
    bool _2443 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2445 = isnan(0.0);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2451 = _2447 || _2449;
    if (_2051)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7650 = as_type<float>(_2437);
        out.gl_Position.z = _7650;
    }
    bool _2453 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2455 = isnan(1.0);
    bool _2457 = _2453 || _2455;
    bool _2459 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2461 = _2457 || _2459;
    float _2463 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2465 = 1.0 + _2463;
    bool _2467 = !_1771;
    int _2469 = _2467 ? 0 : 1;
    out.m_69.x = _2439;
    out.m_69.y = _2441;
    float _2471 = _1989 * _2411;
    float _2473 = _1997 * _2411;
    if (_2051)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2475 = -_2471;
    float _2477 = fma(_2475, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1893);
    float _2479 = _2011 * _2411;
    float _2481 = -_2473;
    float _2483 = fma(_2481, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1907);
    float _2485 = 1.0 / _2465;
    float _2487 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2489 = _2477 + _2487;
    float _2491 = -_2479;
    float _2493 = fma(_2491, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1993);
    float _2495 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2497 = _2483 + _2495;
    float _2499 = -_2431;
    float _2501 = _2499 + 1.0;
    float _2503 = _2489 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2505 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2507 = _2493 + _2505;
    float _2509 = _710 + (-0.5);
    float _2511 = -_2471;
    float _2513 = fma(_2511, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1989);
    float _2515 = fma(_2497, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2503);
    float _2517 = _2451 ? _2501 : 0.0;
    float _2519 = -_2473;
    float _2521 = fma(_2519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1997);
    float _2523 = _2513 * _2513;
    float _2525 = fma(_2507, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2515);
    float _2527 = fma(_2509, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2087);
    float _2529 = -_2479;
    float _2531 = fma(_2529, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2011);
    float _2533 = _2525;
    if (_2461)
    {
        float _2535 = _2517 * _2485;
        _154 = _2535;
    }
    float _2537 = _154;
    float _2539 = fma(_2521, _2521, _2523);
    bool _2541 = _2525 >= 0.0;
    float _2543 = _1953 * (-2.0);
    float _2545 = fma(_2071, _2537, _2527);
    float _2547 = fma(_2531, _2531, _2539);
    float _2549 = _718 + (-0.5);
    float _2551 = fma(_2543, _2031, _2031);
    float _2553 = _2545 * 0.15915493667125701904296875;
    float _2555 = sqrt(_2547);
    int _2557 = abs(_2469);
    float _2559 = fma(_2549, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2551);
    float _2561 = fma(_1817, _2543, _1817);
    float _2563 = float(_1687);
    if (_2541)
    {
        out.m_49.x = 0.0;
    }
    if (_2541)
    {
        _2533 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2565 = _2533;
    float _2567 = _2553 * 6.283185482025146484375;
    float _2569 = sin(_2567);
    float _2571 = float(_2557);
    float _2573 = fma(_2561, _2537, _2559);
    int _2575 = as_type<int>(_2565);
    if (_2541)
    {
        float _2577 = _2565 * 5.0;
        _2575 = as_type<int>(_2577);
    }
    int _2579 = _2575;
    float _2581 = _2571 * _2563;
    float _2583 = _2553 * 6.283185482025146484375;
    float _2585 = cos(_2583);
    if (_2541)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7877 = as_type<float>(_2579);
        out.gl_Position.z = _7877;
    }
    if (_2541)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2587 = -_1893;
    float _2589 = _2587 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2591 = -_1907;
    float _2593 = _2591 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2595 = -_1993;
    float _2597 = _2595 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2599 = _710 + _1129;
    float _2601 = _2589 * _2589;
    float _2603 = _1129 + (-0.5);
    float _2605 = _2573 * 0.15915493667125701904296875;
    float _2607 = _2599 + (-1.0);
    float _2609 = fma(_2593, _2593, _2601);
    float _2611 = _2581 * (-2.0);
    float _2613 = _2605 * 6.283185482025146484375;
    float _2615 = sin(_2613);
    float _2617 = fma(_2607, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2619 = fma(_2597, _2597, _2609);
    float _2621 = fma(_2611, _2033, _2033);
    float _2623 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2625 = fma(_2617, _2611, _2617);
    float _2627 = fma(_2603, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2621);
    float _2629 = rsqrt(_2619);
    float _2631 = in.m_71.x;
    float _2633 = in.m_71.y;
    float _2635 = in.m_71.z;
    bool _2637 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2639 = isnan(0.5);
    bool _2641 = _2637 || _2639;
    bool _2643 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2645 = _2641 || _2643;
    float _2647 = fma(_2625, _2537, _2627);
    float _2649 = _2411 * _2555;
    float _2651 = _2647 * 0.15915493667125701904296875;
    float _2653 = _2605 * 6.283185482025146484375;
    float _2655 = cos(_2653);
    float _2657 = _2569 * _2615;
    float _2659 = _2593 * _2629;
    float _2661 = _2597 * _2629;
    float _2663 = _2589 * _2629;
    float _2665 = _2651 * 6.283185482025146484375;
    float _2667 = sin(_2665);
    float _2669 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2671 = _2659 * _2669;
    float _2673 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2675 = _2661 * _2673;
    float _2677 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2679 = _2663 * _2677;
    float _2681 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2683 = -_2671;
    float _2685 = fma(_2661, _2681, _2683);
    float _2687 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2689 = -_2675;
    float _2691 = fma(_2663, _2687, _2689);
    float _2693 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2695 = -_2679;
    float _2697 = fma(_2659, _2693, _2695);
    float _2699 = _2651 * 6.283185482025146484375;
    float _2701 = cos(_2699);
    float _2703 = _2685 * _2685;
    float _2705 = _2585 * _2655;
    float _2707 = _2569 * _2655;
    float _2709 = fma(_2691, _2691, _2703);
    float _2711 = _650 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2713 = _2585 * _2615;
    float _2715 = fma(_2667, _2705, _2657);
    float _2717 = fma(_2697, _2697, _2709);
    float _2719 = fma(_2667, _2657, _2705);
    float _2721 = _654 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2723 = _2649 * _2623;
    float _2725 = _2649 * _2711;
    float _2727 = -_2713;
    float _2729 = fma(_2667, _2707, _2727);
    float _2731 = rsqrt(_2717);
    float _2733 = _2649 * _2721;
    float _2735 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2633);
    float _2737 = _2585 * _2701;
    float _2739 = _2655 * _2701;
    float _2741 = _2569 * _2701;
    float _2743 = _2615 * _2701;
    float _2745 = _2735 * _2733;
    float _2747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2631);
    float _2749 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2635);
    float _2751 = -_2707;
    float _2753 = fma(_2667, _2713, _2751);
    float _2755 = _2737 * _2745;
    float _2757 = _2747 * _2723;
    float _2759 = _2749 * _2725;
    float _2761 = -_2745;
    float _2763 = _2667 * _2761;
    float _2765 = _2741 * _2745;
    float _2767 = _2691 * _2731;
    float _2769 = _2685 * _2731;
    float _2771 = fma(_2715, _2757, _2755);
    float _2773 = _2697 * _2731;
    float _2775 = _2663 * _2767;
    float _2777 = fma(_2739, _2757, _2763);
    float _2779 = _2661 * _2769;
    float _2781 = fma(_2753, _2759, _2771);
    float _2783 = -_2775;
    float _2785 = fma(_2659, _2769, _2783);
    float _2787 = fma(_2729, _2757, _2765);
    float _2789 = -_2779;
    float _2791 = fma(_2663, _2773, _2789);
    float _2793 = fma(_2743, _2759, _2777);
    float _2795 = _2785 * _2781;
    float _2797 = fma(_2719, _2759, _2787);
    float _2799 = _2791 * _2781;
    float _2801 = fma(_2773, _2793, _2795);
    float _2803 = fma(_2767, _2793, _2799);
    float _2805 = fma(_2661, _2797, _2801);
    float _2807 = fma(_2659, _2797, _2803);
    float _2809 = _1993 + _2805;
    float _2811 = _1907 + _2807;
    float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2815 = _2809 + _2813;
    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2819 = _2811 + _2817;
    float _2821 = _2815 * _2815;
    float _2823 = fma(_2819, _2819, _2821);
    float _2825 = _2659 * _2773;
    float _2827 = sqrt(_2823);
    float _2829 = -_2825;
    float _2831 = fma(_2661, _2767, _2829);
    float _2833 = _2831 * _2781;
    float _2835 = fma(_2769, _2793, _2833);
    float _2837 = fma(_2663, _2797, _2835);
    bool _2839 = _2827 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2841 = _1893 + _2837;
    float _2843 = _2833;
    float _2845 = _2835;
    float _2847 = _2811;
    if (!_2839)
    {
        _2843 = _2809;
    }
    float _2849 = _2843;
    float _2851 = _2849;
    if (!_2839)
    {
        _2845 = _2841;
    }
    float _2853 = _2845;
    bool _2855 = !_2839;
    float _2857 = _2853;
    if (!_2855)
    {
        float _2859 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2863 = _2827 + _2861;
        float _2865 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2867 = rsqrt(_2823);
        float _2869 = _2863 * _2859;
        float _2871 = _2869 * 0.15915493667125701904296875;
        float _2873 = _2871 * 6.283185482025146484375;
        float _2875 = cos(_2873);
        float _2877 = _2871 * 6.283185482025146484375;
        float _2879 = sin(_2877);
        float _2881 = _2875 + (-1.0);
        float _2883 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2885 = fma(_2879, _2865, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2887 = fma(_2841, _2875, _2883);
        float _2889 = _2867 * _2885;
        float _2891 = fma(_2819, _2889, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2893 = fma(_2815, _2889, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2847 = _2891;
        _2857 = _2887;
        _2851 = _2893;
    }
    float _2895 = _2847;
    float _2897 = _2857;
    float _2899 = _2851;
    float _2901 = -_2473;
    float _2903 = fma(_2901, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2895);
    float _2905 = -_2471;
    float _2907 = fma(_2905, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2897);
    float _2909 = -_2479;
    float _2911 = fma(_2909, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2899);
    float _2913 = _2907;
    float _2915 = _2903;
    float _2917 = _2911;
    float _2919 = _2897;
    if (!_2645)
    {
        float _2921 = _2489 * _2489;
        float _2923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2925 = fma(_2497, _2497, _2921);
        float _2927 = -_1993;
        float _2929 = _2927 + _2899;
        float _2931 = fma(_2507, _2507, _2925);
        float _2933 = 1.0 / _2649;
        float _2935 = sqrt(_2931);
        float _2937 = precise::min(_2935, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2939 = _2937 * _2923;
        float _2941 = -_1907;
        float _2943 = _2941 + _2895;
        float _2945 = _2939 * _2933;
        float _2947 = -_1893;
        float _2949 = _2947 + _2897;
        float _2951 = fma(_2943, _2945, _2483);
        float _2953 = fma(_2949, _2945, _2477);
        float _2955 = fma(_2929, _2945, _2493);
        _2913 = _2953;
        _2915 = _2951;
        _2917 = _2955;
    }
    float _2957 = _2913;
    float _2959 = _2915;
    float _2961 = _2917;
    float _2963 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2965 = _2957 + _2963;
    float _2967 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2969 = _2959 + _2967;
    float _2971 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2973 = _2961 + _2971;
    float _2975 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2977 = _2965 * _2965;
    float _2979 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2975);
    float _2981 = fma(_2969, _2969, _2977);
    float _2983 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2979);
    float _2985 = fma(_2973, _2973, _2981);
    float _2987 = _2983 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2989 = rsqrt(_2985);
    float _2991 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2993 = _2969 * _2991;
    float _2995 = _2973 * _2991;
    float _2997 = _2993 * _2993;
    float _2999 = _2995 * _2995;
    float _3001 = _2997 + _2999;
    float _3003 = sqrt(_3001);
    bool _3005 = _3003 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3009 = _3003 + _3007;
    float _3011 = _2973;
    float _3013 = _3001;
    float _3015 = _3009;
    float _3017 = _2991;
    float _3019 = _2995;
    if (_3005)
    {
        float _3021 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3011 = _3021;
    }
    float _3023 = _3011;
    if (_3005)
    {
        float _3025 = rsqrt(_3001);
        _3013 = _3025;
    }
    float _3027 = _3013;
    float _3029 = _3027;
    if (_3005)
    {
        float _3031 = _3009 * _3023;
        _3015 = _3031;
    }
    float _3033 = _3015;
    if (_3005)
    {
        float _3035 = _3033 * 0.15915493667125701904296875;
        _2919 = _3035;
    }
    float _3037 = _2919;
    float _3039 = _2479;
    float _3041 = _3037;
    if (_3005)
    {
        float _3043 = _3037 * 6.283185482025146484375;
        float _3045 = sin(_3043);
        _3039 = _3045;
    }
    float _3047 = _3039;
    float _3049 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3051 = precise::max(0.0, _3049);
    float _3053 = _2989;
    float _3055 = _3051;
    float _3057 = _3049;
    if (_3005)
    {
        float _3059 = _3037 * 6.283185482025146484375;
        float _3061 = cos(_3059);
        _3053 = _3061;
    }
    float _3063 = _3053;
    float _3065 = -_2991;
    float _3067 = -_3051;
    float _3069 = fma(_2965, _3065, _3067);
    float _3071 = _3069;
    if (_3005)
    {
        float _3073 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3055 = _3073;
    }
    float _3075 = _3055;
    float _3077 = _3075;
    if (!_3005)
    {
        _3041 = _2999;
    }
    float _3079 = _3041;
    float _3081 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3083 = _3047;
    float _3085 = _3079;
    if (_3005)
    {
        float _3087 = fma(_3047, _3075, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3083 = _3087;
    }
    float _3089 = _3083;
    float _3091 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3081);
    float _3093 = _3089;
    if (_3005)
    {
        float _3095 = _3063 + (-1.0);
        _3057 = _3095;
    }
    float _3097 = _3057;
    if (_3005)
    {
        float _3099 = _3027 * _3089;
        _3017 = _3099;
    }
    float _3101 = _3017;
    if (!_3005)
    {
        _3093 = _2993;
    }
    float _3103 = _3093;
    float _3105 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3091);
    float _3107 = _3103;
    if (_3005)
    {
        float _3109 = _3097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3077 = _3109;
    }
    float _3111 = _3077;
    if (_3005)
    {
        float _3113 = _2993 * _3101;
        _3107 = _3113;
    }
    float _3115 = _3107;
    float _3117 = sqrt(_2985);
    if (!_3005)
    {
        _3029 = _2997;
    }
    float _3119 = _3029;
    float _3121 = _3119;
    if (_3005)
    {
        float _3123 = fma(_3069, _3063, _3111);
        _3071 = _3123;
    }
    float _3125 = _3071;
    if (_3005)
    {
        float _3127 = _2995 * _3101;
        _3019 = _3127;
    }
    float _3129 = _3019;
    if (_3005)
    {
        float _3131 = _3115 * _3115;
        _3121 = _3131;
    }
    float _3133 = _3121;
    float _3135 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_3005)
    {
        float _3137 = _3129 * _3129;
        _3085 = _3137;
    }
    float _3139 = _3085;
    float _3141 = fma(_3125, _3125, _3133);
    float _3143 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3135);
    float _3145 = fma(_2483, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3147 = _3141 + _3139;
    float _3149 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3143);
    float _3151 = _3105 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3153 = floor(_3145);
    float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3157 = fma(_3117, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3155);
    float _3159 = precise::clamp(_3157, 0.0, 1.0);
    float _3161 = _3149 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3163 = _3151 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3165 = -_3159;
    float _3167 = _3165 + 1.0;
    float _3169 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3171 = rsqrt(_3147);
    float _3173 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3175 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3177 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3179 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3175);
    float _3181 = -_3169;
    float _3183 = fma(_3181, _3177, 1.0);
    float _3185 = abs(_3167);
    float _3187 = log2(_3185);
    float _3189 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3179);
    float _3191 = _3189 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3193 = _3171 * _3115;
    float _3195 = _3171 * _3125;
    float _3197 = _3171 * _3129;
    float _3199 = floor(_3173);
    float _3201 = _3193 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3203 = _3151 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3205 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3163);
    float _3207 = -_3201;
    float _3209 = fma(_3195, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3207);
    float _3211 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3203);
    float _3213 = _3187 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3215 = log2(_3183);
    float _3217 = -_3197;
    float _3219 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3209);
    float _3221 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3211);
    float _3223 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3205);
    float _3225 = fma(_3219, -0.5, 0.5);
    float _3227 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3221);
    float _3229 = fma(_3219, 0.5, 0.5);
    float _3231 = exp2(_3213);
    float _3233 = -_3153;
    float _3235 = _3145 + _3233;
    float _3237 = _3151 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3239 = _3195 + 1.0;
    float _3241 = -_3199;
    float _3243 = _3173 + _3241;
    float _3245 = fma(_3229, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3247 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3237);
    float _3249 = 1.0 / _3227;
    float _3251 = fma(_3229, _3245, -0.212114393711090087890625);
    float _3253 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3247);
    float _3255 = fma(_3229, _3251, 1.570728778839111328125);
    float _3257 = sqrt(_3225);
    float _3259 = -_3195;
    float _3261 = fma(_3231, _3239, _3259);
    float _3263 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3253);
    float _3265 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3223);
    float _3267 = _3215 * 0.693147182464599609375;
    float _3269 = fma(_3261, 0.5, 0.5);
    float _3271 = _3263 * _3249;
    float _3273 = _3265 * _3249;
    float _3275 = _3267 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3277 = fma(_3271, 0.5, 0.5);
    float _3279 = fma(_3273, -0.5, 0.5);
    float _3281 = _3257 * 0.636619746685028076171875;
    float2 _8990 = float2(_3235, _3243);
    float _3283 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8990, float2(0.0), isnan(_8990)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8990, float2(0.0), isnan(_8990)), level(0.0)).x;
    float3 _9001 = float3(_3277, _3279, _3275);
    float _3285 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9001, float3(0.0), isnan(_9001)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9001, float3(0.0), isnan(_9001)), level(0.0)).x;
    float _3287 = -_3255;
    float _3289 = fma(_3281, _3287, 1.0);
    float3 _9017 = float3(_3277, _3279, _3275);
    float4 _3292 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9017, float3(0.0), isnan(_9017)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9017, float3(0.0), isnan(_9017)), level(0.0)).xyzw;
    float _3294 = _3292.x;
    float _3296 = _3292.y;
    float _3298 = _3292.z;
    float _3300 = _3292.w;
    float2 _9033 = float2(_3289, _3269);
    float3 _3304 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9033, float2(0.0), isnan(_9033)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9033, float2(0.0), isnan(_9033)), level(0.0)).xyz;
    float _3306 = _3304.x;
    float _3308 = _3304.y;
    float _3310 = _3304.z;
    float _3312 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3314 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3316 = _2633 != 0.0;
    bool _3318 = isnan(_2633);
    bool _3320 = _3316 || _3318;
    bool _3322 = isnan(0.0);
    bool _3324 = _3320 || _3322;
    float _3326 = _3187 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3328 = fma(_2483, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3312);
    float _3330 = fma(_2483, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3314);
    bool _3332 = _2631 == 0.0;
    bool _3334 = !_3324;
    bool _3336 = _3332 && _3334;
    float _3338 = _3151 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3340 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3328);
    float _3342 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3330);
    float _3344 = in.m_73.x;
    float _3346 = in.m_73.y;
    float _3348 = in.m_73.z;
    bool _3350 = _2635 == 0.0;
    bool _3352 = _3350 && _3336;
    float _3354 = _3340 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3356 = _3342 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3358 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3360 = isnan(0.5);
    bool _3362 = _3358 || _3360;
    bool _3364 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3366 = _3362 || _3364;
    float _3368 = exp2(_3326);
    float _3370 = _3356 + _3354;
    float _3372 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3338);
    out.m_75.x = _2959;
    out.m_75.y = _2957;
    out.m_75.z = _2961;
    float _3374 = 1.0 / _3354;
    float _3376 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3372);
    float _3378 = _3265;
    float _3380 = _3263;
    if (!_3366)
    {
        _2273 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _3382 = _2273;
    float _3384 = -_3368;
    float _3386 = _3384 + 1.0;
    float _3388 = _3344;
    float _3390 = _3348;
    if (_3352)
    {
        _2275 = _3344;
    }
    float _3392 = _2275;
    float _3394 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3396 = _3392;
    if (_3352)
    {
        _2277 = _3346;
    }
    float _3398 = _2277;
    float _3400 = _3398;
    if (_3352)
    {
        _2279 = _3348;
    }
    float _3402 = _2279;
    float _3404 = _3370 * _3374;
    float _3406 = _3404 * 0.5;
    float _3408 = in.m_77.x;
    float _3410 = in.m_77.y;
    float _3412 = in.m_77.z;
    float _3414 = in.m_77.w;
    float _3416 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3418 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3416);
    float _3420 = 1.0 / _3418;
    float _3422 = _3418;
    float _3424 = _3402;
    if (_3352)
    {
        _3422 = _3392;
    }
    float _3426 = _3422;
    float _3428 = _3426;
    if (!_3352)
    {
        _3396 = _3344;
    }
    float _3430 = _3396;
    if (_3352)
    {
        _3388 = _3398;
    }
    float _3432 = _3388;
    float _3434 = _3432;
    if (!_3352)
    {
        _3400 = _3346;
    }
    float _3436 = _3400;
    float _3438 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3440 = _3420 * _3438;
    float _3442 = _3436;
    if (!_3352)
    {
        float _3444 = fma(_2631, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3430);
        _3428 = _3444;
    }
    float _3446 = _3428;
    float _3448 = _3412 * _3430;
    float _3450 = abs(_3440);
    float _3452 = log2(_3450);
    if (!_3352)
    {
        float _3454 = fma(_2633, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3436);
        _3434 = _3454;
    }
    float _3456 = _3434;
    float _3458 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3460 = _3452;
    if (_3352)
    {
        _3460 = _3402;
    }
    float _3462 = _3460;
    float _3464 = _3462;
    if (!_3352)
    {
        _3424 = _3348;
    }
    float _3466 = _3424;
    float _3468 = exp2(_3458);
    if (!_3366)
    {
        float _3470 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3472 = _3382 + _3470;
        _3390 = _3472;
    }
    float _3474 = _3390;
    float _3476 = _3408 * _3436;
    float _3478 = _3410 * _3466;
    if (!_3352)
    {
        float _3480 = fma(_2635, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3466);
        _3464 = _3480;
    }
    float _3482 = _3464;
    float _3484 = -_3476;
    float _3486 = fma(_3410, _3430, _3484);
    float _3488 = -_3448;
    float _3490 = fma(_3408, _3466, _3488);
    float _3492 = _3474;
    if (!_3366)
    {
        float _3494 = 1.0 / _3474;
        _3492 = _3494;
    }
    float _3496 = _3492;
    float _3498 = -_3478;
    float _3500 = fma(_3412, _3436, _3498);
    if (_3366)
    {
        _3442 = 1.0;
    }
    float _3502 = _3442;
    float _3504 = _2715 * _2791;
    float _3506 = _3490 * _3414;
    bool _3508 = _3117 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3510 = isnan(_3117);
    bool _3512 = _3508 || _3510;
    bool _3514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3516 = _3512 || _3514;
    float _3518 = fma(_3468, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3520 = precise::clamp(_3518, 0.0, 1.0);
    float _3522 = _3468;
    float _3524 = _3502;
    if (!_3366)
    {
        float _3526 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3528 = _3440 + _3526;
        _3522 = _3528;
    }
    float _3530 = _3522;
    float _3532 = fma(_3520, -2.0, 3.0);
    float _3534 = _3520 * _3520;
    float _3536 = _3500 * _3414;
    float _3538 = _3486 * _3414;
    if (!_3366)
    {
        float _3540 = _3530 * _3496;
        float _3542 = precise::clamp(_3540, 0.0, 1.0);
        _3524 = _3542;
    }
    float _3544 = _3524;
    float _3546 = _3534 * _3532;
    float _3548 = _2715 * _2831;
    float _3550 = _2715 * _2785;
    float _3552 = _2737 * _2791;
    float _3554 = _2737 * _2831;
    float _3556 = _2737 * _2785;
    float _3558 = _2753 * _2791;
    float _3560 = _2753 * _2785;
    float _3562 = _2753 * _2831;
    float _3564 = fma(_2739, _2767, _3504);
    float _3566 = fma(_2739, _2769, _3548);
    float _3568 = fma(_2739, _2773, _3550);
    float _3570 = -_2667;
    float _3572 = fma(_3570, _2767, _3552);
    float _3574 = -_2667;
    float _3576 = fma(_3574, _2769, _3554);
    float _3578 = -_3546;
    float _3580 = _3578 + 1.0;
    float _3582 = -_2667;
    float _3584 = fma(_3582, _2773, _3556);
    float _3586 = fma(_2743, _2767, _3558);
    float _3588 = fma(_2741, _2659, _3572);
    float _3590 = fma(_3580, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3546);
    float _3592 = fma(_2743, _2769, _3562);
    float _3594 = fma(_2743, _2773, _3560);
    float _3596 = fma(_2729, _2663, _3566);
    float _3598 = fma(_2741, _2663, _3576);
    bool _3600 = _3440 <= 8000.0;
    bool _3602 = isnan(_3440);
    bool _3604 = _3600 || _3602;
    bool _3606 = isnan(8000.0);
    bool _3608 = _3604 || _3606;
    float _3610 = float(_3608);
    float _3612 = fma(_2741, _2661, _3584);
    float _3614 = fma(_2729, _2659, _3564);
    float _3616 = _3588 * _3410;
    float _3618 = fma(_2729, _2661, _3568);
    float _3620 = fma(_2719, _2659, _3586);
    float _3622 = fma(_2719, _2663, _3592);
    float _3624 = fma(_2719, _2661, _3594);
    float _3626 = _3598 * _3410;
    float _3628 = _3612 * _3410;
    float _3630 = _3588 * _3456;
    float _3632 = _3598 * _3456;
    float _3634 = _3612 * _3456;
    float _3636 = _3506 * _3598;
    float _3638 = fma(_3614, _3408, _3616);
    float _3640 = _3506 * _3588;
    float _3642 = _3506 * _3612;
    float _3644 = fma(_3596, _3408, _3626);
    float _3646 = fma(_3618, _3408, _3628);
    float _3648 = fma(_3536, _3596, _3636);
    float _3650 = fma(_3620, _3412, _3638);
    float _3652 = fma(_3614, _3446, _3630);
    float _3654 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3376);
    float _3656 = fma(_3536, _3614, _3640);
    float _3658 = fma(_3536, _3618, _3642);
    float _3660 = fma(_3622, _3412, _3644);
    float _3662 = fma(_3624, _3412, _3646);
    float _3664 = fma(_3538, _3622, _3648);
    float _3666 = _3654 + _3227;
    float _3668 = _3263 + _3227;
    float _3670 = _3227 * 0.5;
    float _3672 = fma(_3596, _3446, _3632);
    float _3674 = fma(_3538, _3620, _3656);
    float _3676 = _3666 * 0.5;
    float _3678 = _3668 * 0.5;
    float _3680 = fma(_3265, -0.5, _3670);
    float _3682 = fma(_3538, _3624, _3658);
    float _3684 = fma(_3618, _3446, _3634);
    float _3686 = in.m_79.x;
    float _3688 = _3610 * _3590;
    float _3690 = fma(_3620, _3482, _3652);
    float _3692 = fma(_3622, _3482, _3672);
    out.m_81.x = _3678;
    out.m_81.y = _3680;
    out.m_81.z = _3676;
    out.m_81.w = _3227;
    float _3694 = fma(_3624, _3482, _3684);
    float _3696 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _3674;
    out.m_83.y = _3664;
    out.m_83.z = _3682;
    out.m_85.x = _3650;
    out.m_85.y = _3660;
    out.m_85.z = _3662;
    out.m_87.x = _3690;
    out.m_87.y = _3692;
    out.m_87.z = _3694;
    float _3698 = -_3394;
    float _3700 = _3698 + 1.0;
    out.gl_Position.x = _3263;
    out.gl_Position.y = _3265;
    out.gl_Position.z = _3654;
    out.gl_Position.w = _3227;
    float _3702 = _3664;
    float _3704 = _3700;
    if (!_3516)
    {
        _3702 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3706 = _3702;
    float _3708 = _3544 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3710 = _3706;
    float _3712 = _3706;
    if (!_3516)
    {
        _3378 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3714 = _3378;
    float _3716 = _3714;
    float _3718 = _3714;
    if (!_3516)
    {
        _3380 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3720 = _3380;
    float _3722 = -_3283;
    float _3724 = _3722 + 1.0;
    float _3726 = _3394 * _3285;
    float _3728 = _3724 * _3696;
    float _3730 = precise::clamp(_3728, 0.0, 1.0);
    float _3732 = _3300 * _3726;
    float _3734 = _3300 * _3700;
    float _3736 = _3720;
    float _3738 = _3720;
    if (!_3516)
    {
        _3704 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3740 = _3704;
    float _3742 = -_3730;
    float _3744 = fma(_3742, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3746 = _3310 * _3726;
    float _3748 = fma(_3306, _3732, _3294);
    float _3750 = fma(_3308, _3732, _3296);
    float _3752 = _3744 * _3686;
    float _3754 = fma(_3300, _3746, _3298);
    float _3756 = _3752 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3758 = _3752;
    float _3760 = _3756;
    float _3762 = _3740;
    float _3764 = _3740;
    if (!_3516)
    {
        _3758 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3766 = _3758;
    out.m_89.x = _3748;
    out.m_89.y = _3750;
    out.m_89.z = _3754;
    out.m_89.w = _3734;
    out.m_91.x = _3756;
    float _3768 = _3766;
    float _3770 = _3766;
    if (!_3516)
    {
        _3760 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3772 = _3760;
    bool _3774 = !_3516;
    float _3776 = _3772;
    float _3778 = _3772;
    if (!_3774)
    {
        bool _3780 = _3117 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3782 = isnan(_3117);
        bool _3784 = _3780 || _3782;
        bool _3786 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3788 = _3784 || _3786;
        if (!_3788)
        {
            float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3792 = _3117 + _3790;
            float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3796 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3794;
            float _3798 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3800 = _3798 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3802 = 1.0 / _3796;
            float _3804 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3806 = _3804 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3810 = _3808 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3814 = _3812 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3816 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3818 = _3816 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3820 = _3792 * _3802;
            float _3822 = precise::clamp(_3820, 0.0, 1.0);
            float _3824 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3826 = _3824 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3828 = fma(_3822, _3800, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3830 = fma(_3822, _3826, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3832 = fma(_3822, _3806, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3834 = fma(_3822, _3810, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3836 = fma(_3822, _3814, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3838 = fma(_3822, _3818, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3738 = _3832;
            _3712 = _3836;
            _3718 = _3828;
            _3764 = _3834;
            _3770 = _3830;
            _3778 = _3838;
            _3840 = true;
        }
        else
        {
            bool _3842 = _3117 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3844 = isnan(_3117);
            bool _3846 = _3842 || _3844;
            bool _3848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3850 = _3846 || _3848;
            if (!_3850)
            {
                _3716 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3852 = _3716;
            _3718 = _3852;
            if (!_3850)
            {
                _3736 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3854 = _3736;
            _3738 = _3854;
            if (!_3850)
            {
                _3768 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3856 = _3768;
            _3770 = _3856;
            if (!_3850)
            {
                _3762 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3858 = _3762;
            _3764 = _3858;
            if (!_3850)
            {
                _3710 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3860 = _3710;
            _3712 = _3860;
            if (!_3850)
            {
                _3776 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3862 = _3776;
            bool _3864 = !_3850;
            _3778 = _3862;
            if (!_3864)
            {
                bool _3866 = _3117 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3868 = isnan(_3117);
                bool _3870 = _3866 || _3868;
                bool _3872 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3874 = _3870 || _3872;
                if (!_3874)
                {
                    float _3876 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3878 = _3117 + _3876;
                    float _3880 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3882 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3880;
                    float _3884 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3886 = _3884 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3888 = 1.0 / _3882;
                    float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3892 = _3890 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3896 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3902 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3904 = _3902 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3906 = _3878 * _3888;
                    float _3908 = precise::clamp(_3906, 0.0, 1.0);
                    float _3910 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3912 = _3910 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3914 = fma(_3908, _3886, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3916 = fma(_3908, _3912, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3918 = fma(_3908, _3892, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3920 = fma(_3908, _3896, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3922 = fma(_3908, _3900, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3924 = fma(_3908, _3904, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3738 = _3918;
                    _3712 = _3922;
                    _3718 = _3914;
                    _3764 = _3920;
                    _3770 = _3916;
                    _3778 = _3924;
                    _3840 = true;
                }
                else
                {
                    _3738 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3712 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3718 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3764 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3770 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3778 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3840 = false;
    float _3926 = _3738;
    float _3928 = _3712;
    float _3930 = _3718;
    float _3932 = _3764;
    float _3934 = _3770;
    float _3936 = _3778;
    float _3938 = fma(_3692, -0.5, 0.5);
    float _3940 = precise::clamp(_3938, 0.0, 1.0);
    float _3942 = -_3926;
    float _3944 = _3942 + _3928;
    float _3946 = _3708 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3948 = -_3930;
    float _3950 = _3948 + _3932;
    float _3952 = fma(_3940, _3944, _3926);
    out.m_93.x = 0.0;
    float _3954 = -_3934;
    float _3956 = _3954 + _3936;
    float _3958 = fma(_3940, _3950, _3930);
    float _3960 = _3952 * 0.586610972881317138671875;
    out.m_49.x = _3946;
    bool _3962 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3964 = fma(_3940, _3956, _3934);
    float _3966 = fma(_3958, 0.298911988735198974609375, _3960);
    bool _3968 = _3544 > 0.0;
    bool _3970 = isnan(_3544);
    bool _3972 = _3968 || _3970;
    bool _3974 = isnan(0.0);
    bool _3976 = _3972 || _3974;
    float _3978 = fma(_3964, 0.114477999508380889892578125, _3966);
    float _3980 = -_3978;
    float _3982 = _3958 + _3980;
    float _3984 = -_3978;
    float _3986 = _3952 + _3984;
    float _3988 = -_3978;
    float _3990 = _3964 + _3988;
    float _3992 = fma(_3982, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3978);
    float _3994 = fma(_3986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3978);
    float _3996 = fma(_3990, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3978);
    bool _3998 = !_3962;
    if (!_3998)
    {
        float _4000 = -_2957;
        float _4002 = _4000 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4004 = -_2959;
        float _4006 = _4004 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4008 = -_2961;
        float _4010 = _4008 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4012 = _4002 * _4002;
        float _4014 = fma(_4006, _4006, _4012);
        float _4016 = fma(_4010, _4010, _4014);
        float _4018 = sqrt(_4016);
        float _4020 = rsqrt(_4016);
        float _4022 = -_4018;
        float _4024 = _4022 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4026 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4028 = precise::clamp(_4026, 0.0, 1.0);
        float _4030 = _4006 * _4020;
        float _4032 = _4002 * _4020;
        float _4034 = abs(_4028);
        float _4036 = log2(_4034);
        float _4038 = _4010 * _4020;
        float _4040 = _4030 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4042 = _3692 * _4032;
        float _4044 = -_4032;
        float _4046 = -_4040;
        float _4048 = fma(_4044, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4046);
        float _4050 = fma(_3690, _4030, _4042);
        float _4052 = -_4038;
        float _4054 = fma(_4052, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4048);
        float _4056 = fma(_3694, _4038, _4050);
        float _4058 = precise::clamp(_4056, 0.0, 1.0);
        float _4060 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4062 = _4054 + _4060;
        float _4064 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4066 = _4062 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4068 = precise::clamp(_4066, 0.0, 1.0);
        float _4070 = exp2(_4064);
        float _4072 = _4070 * _4068;
        float _4074 = _4058 * _4072;
        float _4076 = _4074 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4078 = _4074 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4080 = _4074 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _4076;
        out.m_93.y = _4078;
        out.m_93.z = _4080;
    }
    out.m_95.x = _3992;
    out.m_95.y = _3994;
    out.m_95.z = _3996;
    if (_3976)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4082 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4082;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3840 = false;
    bool _696 = false;
    bool _580 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    float _126 = _124;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _128 = 0;
    if (!_118)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4141 = as_type<float>(_132);
        out.gl_Position.z = _4141;
    }
    if (!_118)
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
        float _156 = float(_114);
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
        float _4210 = as_type<float>(_170);
        out.gl_Position.z = _4210;
    }
    if (_164)
    {
        return out;
    }
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _174 = !_172;
    float _192;
    if (!_174)
    {
        float _176 = in.m_53.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        float _196 = float(_114);
        float _198 = 1.0 / _196;
        float _200 = _150 * _198;
        _192 = _200;
    }
    _194 = false;
    float _202 = _192;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = 1.0 / _206;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _228 = _226 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _230 = 1.0 / _210;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = _202 + _232;
    bool _236 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _238 = isnan(_202);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = 1.0 / _214;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _202 + _250;
    float _254 = _234 * _220;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = _202 + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _262 = _202 + _260;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _266 = 1.0 / _224;
    float _268 = _252 * _230;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _272 = _202 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _276 = _202 + _274;
    bool _278 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _280 = isnan(_202);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = 1.0 / _228;
    float _292 = _258 * _248;
    bool _294 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _296 = isnan(_202);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _306;
    float _310 = -_288;
    float _312 = _310 + 1.0;
    float _314 = fma(_308, _254, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _316 = 1.0 / _218;
    float _318 = _272 * _266;
    bool _320 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _322 = isnan(_202);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_304;
    float _334 = _332 + 1.0;
    float _336 = -_330;
    float _338 = _336 + 1.0;
    float _340 = _276 * _290;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = _288 * _334;
    float _348 = fma(_344, _254, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = _246 * _338;
    bool _352 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _354 = isnan(_202);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = _262 * _316;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _366;
    float _370 = -_246;
    float _372 = _370 + 1.0;
    float _374 = fma(_368, _254, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _376 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _378 = isnan(_202);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = _330 * _312;
    bool _390 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _392 = isnan(_202);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = _386 * _372;
    float _416 = -_400;
    float _418 = _416 + 1.0;
    float _420 = -_386;
    float _422 = _420 + 1.0;
    float _424 = fma(_408, _268, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _426 = _362 * _418;
    float _428 = -_362;
    float _430 = _428 + 1.0;
    float _432 = fma(_404, _268, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _434 = fma(_412, _268, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _436 = _374 * _426;
    float _438 = _348 * _426;
    float _440 = _314 * _426;
    float _442 = _400 * _422;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _464 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _466 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _468;
    float _472 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].z, _440);
    float _474 = fma(_454, _364, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _476 = fma(_458, _364, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _478 = fma(_462, _364, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _480 = fma(_446, _292, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _482 = fma(_450, _292, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _484 = fma(_470, _292, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _486 = fma(_424, _442, _464);
    float _488 = fma(_432, _442, _466);
    float _490 = fma(_434, _442, _472);
    float _492 = fma(_480, _414, _486);
    float _494 = fma(_482, _414, _488);
    float _496 = fma(_484, _414, _490);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _502;
    float _506 = fma(_474, _350, _492);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _508;
    float _512 = fma(_476, _350, _494);
    float _514 = fma(_478, _350, _496);
    float _516 = fma(_500, _318, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _518 = fma(_504, _318, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _524 = fma(_510, _318, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _534 = fma(_516, _388, _506);
    float _536 = fma(_522, _340, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _538 = fma(_528, _340, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _540 = fma(_532, _340, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _542 = fma(_518, _388, _512);
    float _544 = fma(_524, _388, _514);
    float _546 = fma(_536, _346, _534);
    float _548 = fma(_538, _346, _542);
    float _550 = fma(_540, _346, _544);
    float _552 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[149].x, _546);
    float _554 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[149].y, _548);
    float _556 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[149].z, _550);
    bool _558 = !_264;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _578;
    if (!_558)
    {
        float _562 = in.m_53.x;
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _566 = _562 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _570 = _568 * _564;
        float _572 = floor(_570);
        float _574 = -_572;
        float _576 = _570 + _574;
        _578 = _576;
        _580 = true;
    }
    else
    {
        float _582 = float(_114);
        float _584 = 1.0 / _582;
        float _586 = _150 * _584;
        _578 = _586;
    }
    _580 = false;
    float _588 = _578;
    float _590 = in.m_55.x;
    float _592 = in.m_55.y;
    float _594 = in.m_55.z;
    bool _596 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _598 = isnan(_588);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _612 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _614 = isnan(_588);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _588 + _628;
    float _632 = 1.0 / _610;
    float _634 = -_606;
    float _636 = _634 + 1.0;
    bool _638 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _640 = _622 * _636;
    float _642 = -_622;
    float _644 = _642 + 1.0;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _648 = _626 * _632;
    float _650 = _556 * _594;
    float _652 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _554 * _592;
    float _656 = fma(_648, _630, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _658 = _552 * _590;
    float _660 = _656 * _640;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _664 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[115].x, _660);
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _668 = _662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _670 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[116].x, _664);
    float _672 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _670 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _672;
    out.m_57.y = _668;
    out.m_57.z = _652;
    out.m_57.w = _674;
    bool _676 = !_638;
    float _694;
    if (!_676)
    {
        float _678 = in.m_53.x;
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _682 = _678 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _686 = _684 * _680;
        float _688 = floor(_686);
        float _690 = -_688;
        float _692 = _686 + _690;
        _694 = _692;
        _696 = true;
    }
    else
    {
        float _698 = float(_114);
        float _700 = 1.0 / _698;
        float _702 = _150 * _700;
        _694 = _702;
    }
    _696 = false;
    float _704 = _694;
    float _706 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _708 = int(_706);
    float _710 = in.m_53.x;
    float _712 = float(_114);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _716 = _704 + _714;
    float _718 = in.m_53.y;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _722 = _704 + _720;
    float _724 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _726 = int(_724);
    float _728 = in.m_59.y;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _738 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _740 = int(_738);
    float _742 = float(_708);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _748 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _750 = isnan(_704);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = 1.0 / _742;
    float _762 = float(_726);
    float _764 = _718 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _766 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _768 = int(_766);
    float _770 = float(uint(_740));
    float _772 = fma(_764, -2.0, _746);
    int _774 = ~_740;
    int _776 = _774 + 1;
    bool _778 = _740 == 0;
    float _780 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _772);
    float _782 = 1.0 / _762;
    float _784 = _760 * _150;
    float _786 = 1.0 / _770;
    float _788 = float(uint(_768));
    int _790 = ~_740;
    int _792 = _790 + 1;
    float _794 = trunc(_784);
    int _796 = int(_794);
    float _798 = _782 * _150;
    float _800 = 1.0 / _788;
    int _802 = as_type<int>(_786) + (-2);
    int _804 = ~_768;
    int _806 = _804 + 1;
    float _808 = trunc(_798);
    int _810 = int(_808);
    float _812 = float(uint(_796));
    float _814 = as_type<float>(_802) * _812;
    int _816 = as_type<int>(_800) + (-2);
    float _818 = 1.0 / _712;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _822 = _820 != 0;
    float _824 = float(uint(_810));
    float _826 = trunc(_814);
    float _828 = precise::max(_826, 0.0);
    uint _831 = uint(_828);
    float _833 = as_type<float>(_816) * _824;
    float _835 = 1.0 / _732;
    float _837 = _728;
    int _839 = _802;
    if (_822)
    {
        _122 = 1.0;
    }
    float _841 = _122;
    float _843 = _841;
    if (!_822)
    {
        _843 = 1.2345600128173828125;
    }
    float _845 = _843;
    float _847 = trunc(_833);
    float _849 = precise::max(_847, 0.0);
    uint _851 = uint(_849);
    int _853 = _792 * int(_831);
    int _855 = _853 + _796;
    float _857 = float(uint(_855));
    float _859 = 1.0 / _736;
    float _861 = as_type<float>(_802) * _857;
    float _863 = _857;
    if (_822)
    {
        _863 = _710;
    }
    float _865 = _863;
    float _867 = _865;
    if (!_822)
    {
        _867 = _718;
    }
    float _869 = _867;
    int _871 = _806 * int(_851);
    int _873 = _871 + _810;
    float _875 = trunc(_861);
    float _877 = precise::max(_875, 0.0);
    uint _879 = uint(_877);
    float _881 = float(uint(_873));
    float _883 = as_type<float>(_816) * _881;
    float _885 = _881;
    if (_822)
    {
        _885 = 1.0;
    }
    float _887 = _885;
    float _889 = _887;
    if (!_822)
    {
        _889 = 7.345489978790283203125;
    }
    float _891 = _889;
    float _893 = trunc(_883);
    float _895 = precise::max(_893, 0.0);
    uint _897 = uint(_895);
    int _899 = int(_831) + int(_879);
    float _901 = _891 * _710;
    float _903 = _869 * _845;
    float _905 = float(_740);
    float _907 = floor(_901);
    float _909 = float(_796);
    int _911 = ~_768;
    int _913 = _911 + 1;
    bool _915 = _909 >= _905;
    bool _917 = isnan(_909);
    bool _919 = _915 || _917;
    bool _921 = isnan(_905);
    bool _923 = _919 || _921;
    float _925 = float(_923);
    int _927 = int(_851) + int(_897);
    int _929 = _776 * _899;
    int _931 = _929 + _796;
    float _933 = floor(_903);
    float _935 = float(_768);
    int _937 = _913 * _927;
    int _939 = _937 + _810;
    bool _941 = uint(_931) >= uint(_740);
    float _943 = float(_810);
    float _945 = -_907;
    float _947 = _901 + _945;
    float _949 = trunc(_925);
    int _951 = int(_949);
    bool _953 = !_941;
    int _955 = _953 ? 0 : (-1);
    bool _957 = _943 >= _935;
    bool _959 = isnan(_943);
    bool _961 = _957 || _959;
    bool _963 = isnan(_935);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    bool _969 = uint(_939) >= uint(_768);
    int _971 = ~_899;
    int _973 = _971 + _955;
    int _975 = _973 + 1;
    float _977 = -_933;
    float _979 = _903 + _977;
    float _981 = _905 * _947;
    bool _983 = !_969;
    int _985 = _983 ? 0 : (-1);
    int _987 = _740 * _975;
    int _989 = _987 + _796;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _993 = _991 != 0;
    float _995 = trunc(_967);
    int _997 = int(_995);
    int _999 = ~_927;
    int _1001 = _999 + _985;
    int _1003 = _1001 + 1;
    float _1005 = _818 * _150;
    bool _1007 = !_778;
    int _1009 = _1007 ? _989 : (-1);
    float _1011 = _935 * _979;
    bool _1013 = _768 == 0;
    float _1015 = _905 * _1005;
    float _1017 = trunc(_981);
    int _1019 = int(_1017);
    bool _1021 = !_993;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = _935 * _1005;
    int _1027 = ~_951;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    int _1033 = abs(_1023);
    int _1035 = _768 * _1003;
    int _1037 = _1035 + _810;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1041 = _1039 != 0;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1045 = _1043 != 0;
    int _1047 = _1009 * _1031;
    int _1049 = _740 + (-1);
    float _1051 = trunc(_1015);
    int _1053 = int(_1051);
    bool _1055 = !_1013;
    int _1057 = _1055 ? _1037 : (-1);
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1061 = _1059 != 0;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1065 = _1063 != 0;
    int _1067 = _951 * _1049;
    int _1069 = _1067 + _1047;
    bool _1071 = !_1045;
    int _1073 = _1071 ? 0 : 1;
    int _1075 = _1019 * _1033;
    int _1077 = _1075 + _796;
    int _1079 = ~_997;
    int _1081 = _1079 + 1;
    int _1083 = _1081 + 1;
    float _1085 = trunc(_1011);
    int _1087 = int(_1085);
    bool _1089 = !_1065;
    int _1091 = _1089 ? 0 : 1;
    int _1093 = abs(_1073);
    int _1095 = _1057 * _1083;
    bool _1097 = !_1041;
    int _1099 = _1097 ? 0 : 1;
    int _1101 = abs(_1091);
    float _1103 = trunc(_1025);
    int _1105 = int(_1103);
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1109 = _1107 != 0;
    int _1111 = abs(_1099);
    int _1113 = _1069 * _1093;
    int _1115 = _768 + (-1);
    bool _1117 = !_1109;
    int _1119 = _1117 ? 0 : 1;
    int _1121 = _997 * _1115;
    int _1123 = _1121 + _1095;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1127 = _1125 != 0;
    float _1129 = in.m_53.z;
    int _1131 = _1053 * _1111;
    int _1133 = _1131 + _1113;
    int _1135 = abs(_1119);
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1139 = _1137 != 0;
    int _1141 = _1123 * _1101;
    bool _1143 = !_1127;
    int _1145 = _1143 ? 0 : 1;
    int _1147 = _1077 * _1135;
    int _1149 = _1147 + _1133;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1153 = _1151 != 0;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1157 = _1155 != 0;
    bool _1159 = !_1061;
    int _1161 = _1159 ? 0 : 1;
    bool _1163 = !_1139;
    int _1165 = _1163 ? 0 : 1;
    int _1167 = abs(_1145);
    int _1169 = abs(_1161);
    int _1171 = abs(_1165);
    bool _1173 = !_1153;
    int _1175 = _1173 ? 0 : 1;
    float _1177 = _1129 * 2.0;
    int _1179 = abs(_1175);
    int _1181 = _1019 * _1167;
    int _1183 = _1181 + _1149;
    bool _1185 = !_1157;
    int _1187 = _1185 ? 0 : 1;
    int _1189 = _1087 * _1171;
    int _1191 = _1189 + _810;
    float _1193 = floor(_1177);
    int _1195 = abs(_1187);
    int _1197 = _1105 * _1169;
    int _1199 = _1197 + _1141;
    float _1201 = float(uint(_1183));
    float _1203 = in.m_59.x;
    int _1205 = _1191 * _1179;
    int _1207 = _1205 + _1199;
    int _1209 = ~_740;
    int _1211 = _1209 + 1;
    float _1213 = as_type<float>(_802) * _1201;
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1217 = _1215 != 0;
    int _1219 = _1087 * _1195;
    int _1221 = _1219 + _1207;
    int _1223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1225 = _1223 != 0;
    bool _1227 = _740 == 0;
    float _1229 = trunc(_1213);
    float _1231 = precise::max(_1229, 0.0);
    uint _1233 = uint(_1231);
    float _1235 = float(uint(_1221));
    float _1237 = as_type<float>(_816) * _1235;
    int _1239 = ~_768;
    int _1241 = _1239 + 1;
    bool _1243 = _1061;
    int _1245 = _1087;
    if (_1217)
    {
        bool _1247 = _710 > 0.5;
        _1243 = _1247;
    }
    bool _1249 = _1243;
    float _1251 = trunc(_1237);
    float _1253 = precise::max(_1251, 0.0);
    uint _1255 = uint(_1253);
    float _1257 = _1203;
    if (!_1217)
    {
        _560 = _1203;
    }
    float _1259 = _560;
    float _1261 = _1259;
    if (_1225)
    {
        float _1263 = -_1203;
        float _1265 = _1263 + 1.0;
        _1245 = as_type<int>(_1265);
    }
    int _1267 = _1245;
    int _1269 = _1211 * int(_1233);
    int _1271 = _1269 + _1183;
    float _1273 = 0.0;
    if (!_1225)
    {
        _1273 = _1203;
    }
    float _1275 = _1273;
    float _1277 = float(uint(_1271));
    float _1279 = as_type<float>(_802) * _1277;
    int _1281 = _1241 * int(_1255);
    int _1283 = _1281 + _1221;
    float _1285 = trunc(_1279);
    float _1287 = precise::max(_1285, 0.0);
    uint _1289 = uint(_1287);
    float _1291 = float(uint(_1283));
    float _1293 = as_type<float>(_816) * _1291;
    int _1295 = as_type<int>(_1291);
    float _1297 = _1275;
    int _1299 = as_type<int>(_1293);
    if (_1217)
    {
        float _1301 = -_1203;
        float _1303 = _1301 + 1.0;
        _1295 = as_type<int>(_1303);
    }
    int _1305 = _1295;
    int _1307 = ~_768;
    int _1309 = _1307 + 1;
    float _1311 = trunc(_1293);
    float _1313 = precise::max(_1311, 0.0);
    uint _1315 = uint(_1313);
    if (_1217)
    {
        float _1317 = _1249 ? as_type<float>(_1305) : _1203;
        _1261 = _1317;
    }
    float _1319 = _1261;
    int _1321 = ~_740;
    int _1323 = _1321 + 1;
    int _1325 = int(_1233) + int(_1289);
    float _1327 = in.m_53.w;
    int _1329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1331 = _1329 != 0;
    int _1333 = _1323 * _1325;
    int _1335 = _1333 + _1183;
    bool _1337 = _1129 > 0.5;
    bool _1339 = uint(_1335) >= uint(_740);
    float _1341 = -_728;
    float _1343 = _1341 + 1.0;
    if (_1225)
    {
        float _1345 = _1337 ? as_type<float>(_1267) : _1203;
        _1297 = _1345;
    }
    float _1347 = _1297;
    int _1349 = int(_1255) + int(_1315);
    bool _1351 = !_1339;
    int _1353 = _1351 ? 0 : (-1);
    if (_1331)
    {
        float _1355 = -_1203;
        float _1357 = _1355 + 1.0;
        _1299 = as_type<int>(_1357);
    }
    int _1359 = _1299;
    bool _1361 = _718 > 0.5;
    int _1363 = ~_1325;
    int _1365 = _1363 + _1353;
    int _1367 = _1365 + 1;
    int _1369 = _1309 * _1349;
    int _1371 = _1369 + _1221;
    if (_1331)
    {
        float _1373 = _1361 ? as_type<float>(_1359) : _1203;
        _1257 = _1373;
    }
    float _1375 = _1257;
    int _1377 = _1361 ? as_type<int>(_1343) : as_type<int>(_728);
    int _1379 = _740 * _1367;
    int _1381 = _1379 + _1183;
    bool _1383 = uint(_1371) >= uint(_768);
    float _1385 = float(uint(_1077));
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1389 = _1387 != 0;
    bool _1391 = _1327 > 0.5;
    float _1393 = as_type<float>(_802) * _1385;
    bool _1395 = !_1227;
    int _1397 = _1395 ? _1381 : (-1);
    float _1399 = _1389 ? as_type<float>(_1377) : _728;
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1403 = _1401 != 0;
    float _1405 = trunc(_1393);
    float _1407 = precise::max(_1405, 0.0);
    uint _1409 = uint(_1407);
    int _1411 = _1391 ? as_type<int>(_1343) : as_type<int>(_728);
    bool _1413 = !_1383;
    int _1415 = _1413 ? 0 : (-1);
    int _1417 = _1397 & 3;
    float _1419 = _1403 ? as_type<float>(_1411) : _728;
    int _1421 = ~_1349;
    int _1423 = _1421 + _1415;
    int _1425 = _1423 + 1;
    bool _1427 = uint(_1417) > 1u;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1431 = _1429 != 0;
    int _1433 = _768 * _1425;
    int _1435 = _1433 + _1221;
    int _1437 = _1397 & 3;
    bool _1439 = _1437 != 0;
    int _1441 = ~_740;
    int _1443 = _1441 + 1;
    bool _1445 = _768 == 0;
    int _1447 = _1439 ? 0 : 1;
    bool _1449 = !_1445;
    int _1451 = _1449 ? _1435 : (-1);
    int _1453 = ~_1447;
    int _1455 = _1453 + 1;
    int _1457 = _1455 + 1;
    float _1459 = float(uint(_1191));
    int _1461 = _1457;
    if (!_1427)
    {
        int _1463 = ~_1447;
        int _1465 = _1463 + 1;
        _1461 = _1465;
    }
    int _1467 = _1461;
    int _1469 = _1443 * int(_1409);
    int _1471 = _1469 + _1077;
    int _1473 = _1451 & 3;
    float _1475 = as_type<float>(_816) * _1459;
    if (_1431)
    {
        float _1477 = _1337 ? _1343 : _728;
        _837 = _1477;
    }
    float _1479 = _837;
    float _1481 = _710 * 2.0;
    bool _1483 = _1417 != 3;
    float _1485 = trunc(_1475);
    float _1487 = precise::max(_1485, 0.0);
    uint _1489 = uint(_1487);
    bool _1491 = uint(_1417) >= 2u;
    bool _1493 = uint(_1473) > 1u;
    float _1495 = float(uint(_1471));
    int _1497 = _1491 ? 0 : 1;
    float _1499 = floor(_1481);
    int _1501 = _1451 & 3;
    bool _1503 = _1501 != 0;
    float _1505 = _718 * 2.0;
    int _1507 = ~_1497;
    int _1509 = _1507 + 1;
    int _1511 = _1509 + 1;
    float _1513 = as_type<float>(_802) * _1495;
    int _1515 = _1503 ? 0 : 1;
    int _1517 = _1511;
    int _1519 = _1497;
    if (_1483)
    {
        int _1521 = ~_1497;
        int _1523 = _1521 + 1;
        _1517 = _1523;
    }
    int _1525 = _1517;
    float _1527 = floor(_1505);
    int _1529 = ~_1515;
    int _1531 = _1529 + 1;
    int _1533 = _1531 + 1;
    int _1535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1537 = _1535 != 0;
    int _1539 = _1533;
    if (!_1493)
    {
        int _1541 = ~_1515;
        int _1543 = _1541 + 1;
        _1539 = _1543;
    }
    int _1545 = _1539;
    bool _1547 = _1473 != 3;
    float _1549 = trunc(_1513);
    float _1551 = precise::max(_1549, 0.0);
    uint _1553 = uint(_1551);
    bool _1555 = !_1537;
    int _1557 = _1555 ? 0 : 1;
    bool _1559 = uint(_1473) >= 2u;
    int _1561 = ~_768;
    int _1563 = _1561 + 1;
    int _1565 = _1559 ? 0 : 1;
    bool _1567 = _1499 > 0.0;
    int _1569 = _1563 * int(_1489);
    int _1571 = _1569 + _1191;
    int _1573 = ~_1565;
    int _1575 = _1573 + 1;
    int _1577 = _1575 + 1;
    int _1579 = _1577;
    if (_1547)
    {
        int _1581 = ~_1565;
        int _1583 = _1581 + 1;
        _1579 = _1583;
    }
    int _1585 = _1579;
    if (_822)
    {
        _839 = 0;
    }
    int _1587 = _839;
    bool _1589 = _1527 >= 0.0;
    bool _1591 = isnan(_1527);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan(0.0);
    bool _1597 = _1593 || _1595;
    int _1599 = _1587;
    float _1601 = _1527;
    if (!_822)
    {
        _1599 = 1;
    }
    int _1603 = _1599;
    float _1605 = float(uint(_1571));
    bool _1607 = _1499 >= 0.0;
    bool _1609 = isnan(_1499);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan(0.0);
    bool _1615 = _1611 || _1613;
    float _1617 = _1597 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1619 = as_type<float>(_816) * _1605;
    bool _1621 = _1603 != 1;
    int _1623 = _1615 ? 0 : 1;
    float _1625 = trunc(_1619);
    float _1627 = precise::max(_1625, 0.0);
    uint _1629 = uint(_1627);
    float _1631 = _1617;
    float _1633 = _1619;
    if (_822)
    {
        _1519 = 0;
    }
    int _1635 = _1519;
    bool _1637 = _1527 > 0.0;
    int _1639 = _1635;
    if (!_822)
    {
        _1639 = 2;
    }
    int _1641 = _1639;
    int _1643 = ~_1623;
    int _1645 = _1643 + 1;
    int _1647 = _1645 + 1;
    int _1649 = _1647;
    if (!_1567)
    {
        int _1651 = ~_1623;
        int _1653 = _1651 + 1;
        _1649 = _1653;
    }
    int _1655 = _1649;
    bool _1657 = _1641 != 2;
    int _1659 = int(_1409) + int(_1553);
    int _1661 = ~_740;
    int _1663 = _1661 + 1;
    float _1665 = as_type<float>(_1553);
    if (!_1621)
    {
        _1601 = _718;
    }
    float _1667 = _1601;
    int _1669 = ~as_type<int>(_1617);
    int _1671 = _1669 + 1;
    int _1673 = _1671 + 1;
    int _1675 = _1663 * _1659;
    int _1677 = _1675 + _1077;
    int _1679 = _1673;
    float _1681 = _1667;
    if (!_1637)
    {
        int _1683 = ~as_type<int>(_1617);
        int _1685 = _1683 + 1;
        _1679 = _1685;
    }
    int _1687 = _1679;
    float _1689 = 0.0;
    if (!_1621)
    {
        _1689 = _1129;
    }
    float _1691 = _1689;
    float _1693 = 0.0;
    float _1695 = _1691;
    if (!_1621)
    {
        _1693 = _1667;
    }
    float _1697 = _1693;
    float _1699 = _1697;
    if (!_1621)
    {
        _1631 = _1129;
    }
    float _1701 = _1631;
    float _1703 = _1701;
    if (_1621)
    {
        _1699 = _710;
    }
    float _1705 = _1699;
    if (_1621)
    {
        _1681 = _710;
    }
    float _1707 = _1681;
    if (_1621)
    {
        _1695 = _718;
    }
    float _1709 = _1695;
    if (_1621)
    {
        _1703 = _718;
    }
    float _1711 = _1703;
    bool _1713 = uint(_1677) >= uint(_740);
    float _1715 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1717 = in.m_46.x;
    float _1719 = in.m_46.y;
    float _1721 = in.m_46.z;
    int _1723 = int(_1489) + int(_1629);
    int _1725 = ~_768;
    int _1727 = _1725 + 1;
    float _1729 = as_type<float>(_1629);
    if (_1657)
    {
        _1729 = _1129;
    }
    float _1731 = _1729;
    float _1733 = _1731;
    if (_1657)
    {
        _1665 = _710;
    }
    float _1735 = _1665;
    int _1737 = _1727 * _1723;
    int _1739 = _1737 + _1191;
    float _1741 = _1735;
    if (_1657)
    {
        _1633 = _718;
    }
    float _1743 = _1633;
    float _1745 = _1743;
    if (!_1657)
    {
        _1733 = _718;
    }
    float _1747 = _1733;
    if (!_1657)
    {
        _1741 = _1129;
    }
    float _1749 = _1741;
    if (!_1657)
    {
        _1745 = _710;
    }
    float _1751 = _1745;
    bool _1753 = uint(_1739) >= uint(_768);
    float _1755 = _710 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1757 = !_1713;
    int _1759 = _1757 ? 0 : (-1);
    int _1761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1763 = _1761 != 0;
    int _1765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1767 = _1765 != 0;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1771 = _1769 != 0;
    float _1773 = -_744;
    float _1775 = fma(_1755, 2.0, _1773);
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1779 = _1777 != 0;
    float _1781 = _1719 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1783 = _1719 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1785 = _1719 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1787 = _718 + _1129;
    bool _1789 = !_1753;
    int _1791 = _1789 ? 0 : (-1);
    float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1793;
    bool _1797 = _1193 >= 0.0;
    bool _1799 = isnan(_1193);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    float _1807 = _1787 + (-1.0);
    float _1809 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1781);
    float _1811 = _1795 * _835;
    float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1815 = _1813 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1817 = fma(_1807, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1819 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1783);
    float _1821 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1785);
    bool _1823 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1825 = isnan(_704);
    bool _1827 = _1823 || _1825;
    bool _1829 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1831 = _1827 || _1829;
    float _1833 = float(_1831);
    float _1835 = _710 + _718;
    int _1837 = _1805 ? 0 : 1;
    float _1839 = _1815 * _859;
    bool _1841 = _1193 > 0.0;
    float _1843 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1809);
    float _1845 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1819);
    float _1847 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1821);
    float _1849 = _1835 + (-1.0);
    float _1851 = -_1833;
    float _1853 = _1851 + 1.0;
    bool _1855 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1857 = isnan(_704);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    float _1867 = fma(_1839, _716, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1869 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1871 = _758 * _1853;
    float _1873 = -_758;
    float _1875 = _1873 + 1.0;
    float _1877 = fma(_1811, _722, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1881 = !_1767;
    int _1883 = _1881 ? 0 : 1;
    float _1885 = _1865 * _1875;
    float _1887 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1889 = !_1763;
    int _1891 = _1889 ? 0 : 1;
    float _1893 = _1845 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1895 = _1877 * _1885;
    float _1897 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1887);
    float _1899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1901 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1897);
    int _1903 = abs(_1891);
    float _1905 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1907 = _1843 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1909 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1911 = -_1865;
    float _1913 = _1911 + 1.0;
    float _1915 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1905);
    float _1917 = -_150;
    float _1919 = fma(_1917, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1775);
    float _1921 = -_780;
    float _1923 = fma(_1901, _1909, _1921);
    float _1925 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1895);
    float _1927 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1915);
    float _1929 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1931 = fma(_1867, _1871, _1925);
    float _1933 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1935 = fma(_1927, _1929, _1919);
    int _1937 = abs(_1883);
    float _1939 = _1879 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1941 = fma(_1833, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1931);
    float _1943 = float(_1655);
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1947 = float(_1937);
    float _1949 = fma(_1939, _1479, -0.5);
    float _1951 = _1899 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1953 = _1947 * _1943;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    int _1957 = ~_1837;
    int _1959 = _1957 + 1;
    int _1961 = _1959 + 1;
    float _1963 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1965 = _1961;
    if (!_1841)
    {
        int _1967 = ~_1837;
        int _1969 = _1967 + 1;
        _1965 = _1969;
    }
    int _1971 = _1965;
    float _1973 = -_1945;
    float _1975 = fma(_1933, 2.0, _1973);
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1979 = fma(_1951, _1375, -0.5);
    float _1981 = float(_1971);
    float _1983 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1955);
    float _1985 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1963);
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1989 = _1893 + _1987;
    float _1991 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1977);
    float _1993 = _1847 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1995 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1997 = _1907 + _1995;
    float _1999 = _1989 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2003 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2005 = float(_1903);
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2009 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2011 = _1993 + _2009;
    float _2013 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1999);
    float _2015 = _2001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2017 = _2003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2019 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2021 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2023 = _1705 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2025 = _2005 * _1981;
    float _2027 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2013);
    float _2029 = in.m_61.x;
    float _2031 = in.m_61.y;
    float _2033 = in.m_61.z;
    float _2035 = -_2021;
    float _2037 = fma(_2023, 2.0, _2035);
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2041 = !_1439;
    int _2043 = _2041 ? 0 : 1;
    float _2045 = _2025 * (-2.0);
    int _2047 = _1397 >> 31;
    float _2049 = _1941 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2051 = _2027 >= 0.0;
    float _2053 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1983);
    int _2055 = _1451 >> 31;
    float _2057 = fma(_1715, -2.0, _2039);
    int _2059 = _2047 & 3;
    float _2061 = _2053 * (-0.15915493667125701904296875);
    int _2063 = _2055 & 3;
    out.m_63.x = _2015;
    out.m_63.y = _2017;
    out.m_63.z = _2019;
    out.m_63.w = _2049;
    int _2065 = _1397 + _2059;
    float _2067 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1985);
    int _2069 = _1451 + _2063;
    float _2071 = fma(_1869, _2045, _1869);
    int _2073 = _2065 >> 2;
    float _2075 = _2061 * 6.283185482025146484375;
    float _2077 = sin(_2075);
    int _2079 = _2069 >> 2;
    float _2081 = _1751 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2083 = _2073 << 4;
    int _2085 = _2083 + 368;
    float _2087 = fma(_2045, _2029, _2029);
    int _2089 = _2079 << 4;
    int _2091 = _2089 + 512;
    float _2093 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _2095 = _2061 * 6.283185482025146484375;
    float _2097 = cos(_2095);
    uint _2099 = uint(int(uint(_2085) >> uint(2)));
    uint _2101 = uint(int(uint(int(_2099)) >> uint(2)));
    int _2103 = int(_2099) & 3;
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[int(_2101)][_2103];
    int _2107 = int(_2099) + 1;
    uint _2109 = uint(int(uint(_2107) >> uint(2)));
    int _2111 = _2107 & 3;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[int(_2109)][_2111];
    float _2115 = -_150;
    float _2117 = fma(_2115, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2037);
    float _2119 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2121 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1991);
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2125 = fma(_2081, -2.0, _2119);
    uint _2127 = uint(int(uint(_2091) >> uint(2)));
    uint _2129 = uint(int(uint(int(_2127)) >> uint(2)));
    int _2131 = int(_2127) & 3;
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[int(_2129)][_2131];
    int _2135 = int(_2127) + 1;
    uint _2137 = uint(int(uint(_2135) >> uint(2)));
    int _2139 = _2135 & 3;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[int(_2137)][_2139];
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2145 = fma(_2067, _2093, _2117);
    float _2147 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2123);
    float _2149 = _2077 * _1949;
    int _2151 = ~_1659;
    int _2153 = _2151 + _1759;
    int _2155 = _2153 + 1;
    float _2157 = -_150;
    float _2159 = fma(_2157, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1975);
    float _2161 = _2097 * _1949;
    int _2163 = _2085 + 8;
    uint _2165 = uint(int(uint(_2163) >> uint(2)));
    uint _2167 = uint(int(uint(int(_2165)) >> uint(2)));
    int _2169 = int(_2165) & 3;
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[int(_2167)][_2169];
    int _2173 = int(_2165) + 1;
    uint _2175 = uint(int(uint(_2173) >> uint(2)));
    int _2177 = _2173 & 3;
    float _2179 = (*spvDescriptorSet0.vp_c9)._m0[int(_2175)][_2177];
    float _2181 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2147);
    float _2183 = -_2149;
    float _2185 = fma(_2097, _1979, _2183);
    float _2187 = fma(_2077, _1979, _2161);
    float _2189 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    int _2191 = _740 * _2155;
    int _2193 = _2191 + _1077;
    int _2195 = ~_1723;
    int _2197 = _2195 + _1791;
    int _2199 = _2197 + 1;
    float _2201 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2143);
    int _2203 = _2091 + 8;
    uint _2205 = uint(int(uint(_2203) >> uint(2)));
    uint _2207 = uint(int(uint(int(_2205)) >> uint(2)));
    int _2209 = int(_2205) & 3;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[int(_2207)][_2209];
    int _2213 = int(_2205) + 1;
    uint _2215 = uint(int(uint(_2213) >> uint(2)));
    int _2217 = _2213 & 3;
    float _2219 = (*spvDescriptorSet0.vp_c9)._m0[int(_2215)][_2217];
    bool _2221 = !_1503;
    int _2223 = _2221 ? 0 : 1;
    float _2225 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2057);
    int _2227 = abs(_1545);
    int _2229 = _768 * _2199;
    int _2231 = _2229 + _1191;
    bool _2233 = _1417 != 3;
    float _2235 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2201);
    int _2237 = abs(_1467);
    float _2239 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2125);
    int _2241 = abs(_2223);
    float _2243 = -_2225;
    float _2245 = fma(_2121, _2189, _2243);
    float _2247 = fma(_2181, _2185, _2159);
    int _2249 = abs(_2043);
    float _2251 = -_2239;
    float _2253 = fma(_2235, _2187, _2251);
    int _2255 = abs(_1525);
    float _2257 = _2247 + 0.5;
    int _2259 = ~_2237;
    int _2261 = _2259 + 1;
    int _2263 = _2261 + 1;
    float _2265 = _2253 + 0.5;
    int _2267 = ~_2227;
    int _2269 = _2267 + 1;
    int _2271 = _2269 + 1;
    float _2273 = _2187;
    float _2275 = _2225;
    float _2277 = _2145;
    float _2279 = _2149;
    if (_2051)
    {
        out.m_49.x = 0.0;
    }
    int _2281 = ~_2249;
    int _2283 = _2281 + 1;
    int _2285 = _2283 + 1;
    int _2287 = _2263 * as_type<int>(_2113);
    int _2289 = ~_2241;
    int _2291 = _2289 + 1;
    int _2293 = _2291 + 1;
    out.m_65.x = _2257;
    out.m_65.y = _2265;
    bool _2295 = !_2233;
    int _2297 = _2295 ? 0 : (-1);
    int _2299 = _2285 * as_type<int>(_2105);
    int _2301 = _2299 + _2287;
    bool _2303 = _1473 != 3;
    bool _2305 = !_1779;
    int _2307 = _2305 ? 0 : 1;
    int _2309 = _2271 * as_type<int>(_2141);
    int _2311 = ~_2255;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    int _2317 = abs(_2307);
    int _2319 = _2293 * as_type<int>(_2133);
    int _2321 = _2319 + _2309;
    int _2323 = abs(_2297);
    int _2325 = abs(_1557);
    int _2327 = _2315 * as_type<int>(_2171);
    int _2329 = _2327 + _2301;
    bool _2331 = !_2303;
    int _2333 = _2331 ? 0 : (-1);
    int _2335 = abs(_1585);
    int _2337 = abs(_2333);
    int _2339 = ~_2323;
    int _2341 = _2339 + 1;
    int _2343 = _2341 + 1;
    int _2345 = ~_2335;
    int _2347 = _2345 + 1;
    int _2349 = _2347 + 1;
    bool _2351 = _768 == 0;
    int _2353 = _2343 * as_type<int>(_2179);
    int _2355 = _2353 + _2329;
    float _2357 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2359 = log2(_2357);
    int _2361 = _2349 * as_type<int>(_2211);
    int _2363 = _2361 + _2321;
    float _2365 = _1989 * _1989;
    int _2367 = ~_2325;
    int _2369 = _2367 + 1;
    int _2371 = _2369 + 1;
    int _2373 = ~_2337;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    float _2379 = fma(_1997, _1997, _2365);
    int _2381 = _2355 * _2371;
    bool _2383 = !_2351;
    int _2385 = _2383 ? _2231 : (-1);
    int _2387 = _2377 * as_type<int>(_2219);
    int _2389 = _2387 + _2363;
    int _2391 = ~_2317;
    int _2393 = _2391 + 1;
    int _2395 = _2393 + 1;
    float _2397 = fma(_2011, _2011, _2379);
    bool _2399 = _740 == 0;
    float _2401 = _2245 + 0.5;
    float _2403 = _2359 * _150;
    int _2405 = _2389 * _2395;
    bool _2407 = !_2399;
    int _2409 = _2407 ? _2193 : (-1);
    float _2411 = rsqrt(_2397);
    float _2413 = _1923 + 0.5;
    int _2415 = _2385 * _2317;
    int _2417 = _2415 + _2405;
    float _2419 = as_type<float>(_2405);
    if (_2051)
    {
        _2419 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2421 = _2419;
    int _2423 = _2409 * _2325;
    int _2425 = _2423 + _2381;
    float _2427 = _1935 + 0.5;
    float _2429 = _2145 + 0.5;
    float _2431 = exp2(_2403);
    int _2433 = as_type<int>(_2421);
    if (_2051)
    {
        float _2435 = _2421 * 5.0;
        _2433 = as_type<int>(_2435);
    }
    int _2437 = _2433;
    float _2439 = float(_2425);
    float _2441 = float(_2417);
    out.m_67.x = _2427;
    out.m_67.y = _2413;
    out.m_67.z = _2429;
    out.m_67.w = _2401;
    bool _2443 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2445 = isnan(0.0);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2451 = _2447 || _2449;
    if (_2051)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7650 = as_type<float>(_2437);
        out.gl_Position.z = _7650;
    }
    bool _2453 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2455 = isnan(1.0);
    bool _2457 = _2453 || _2455;
    bool _2459 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2461 = _2457 || _2459;
    float _2463 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2465 = 1.0 + _2463;
    bool _2467 = !_1771;
    int _2469 = _2467 ? 0 : 1;
    out.m_69.x = _2439;
    out.m_69.y = _2441;
    float _2471 = _1989 * _2411;
    float _2473 = _1997 * _2411;
    if (_2051)
    {
        return out;
    }
    float _2475 = -_2471;
    float _2477 = fma(_2475, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1893);
    float _2479 = _2011 * _2411;
    float _2481 = -_2473;
    float _2483 = fma(_2481, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1907);
    float _2485 = 1.0 / _2465;
    float _2487 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2489 = _2477 + _2487;
    float _2491 = -_2479;
    float _2493 = fma(_2491, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1993);
    float _2495 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2497 = _2483 + _2495;
    float _2499 = -_2431;
    float _2501 = _2499 + 1.0;
    float _2503 = _2489 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2505 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2507 = _2493 + _2505;
    float _2509 = _710 + (-0.5);
    float _2511 = -_2471;
    float _2513 = fma(_2511, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1989);
    float _2515 = fma(_2497, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2503);
    float _2517 = _2451 ? _2501 : 0.0;
    float _2519 = -_2473;
    float _2521 = fma(_2519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1997);
    float _2523 = _2513 * _2513;
    float _2525 = fma(_2507, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2515);
    float _2527 = fma(_2509, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2087);
    float _2529 = -_2479;
    float _2531 = fma(_2529, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2011);
    float _2533 = _2525;
    if (_2461)
    {
        float _2535 = _2517 * _2485;
        _154 = _2535;
    }
    float _2537 = _154;
    float _2539 = fma(_2521, _2521, _2523);
    bool _2541 = _2525 >= 0.0;
    float _2543 = _1953 * (-2.0);
    float _2545 = fma(_2071, _2537, _2527);
    float _2547 = fma(_2531, _2531, _2539);
    float _2549 = _718 + (-0.5);
    float _2551 = fma(_2543, _2031, _2031);
    float _2553 = _2545 * 0.15915493667125701904296875;
    float _2555 = sqrt(_2547);
    int _2557 = abs(_2469);
    float _2559 = fma(_2549, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2551);
    float _2561 = fma(_1817, _2543, _1817);
    float _2563 = float(_1687);
    if (_2541)
    {
        out.m_49.x = 0.0;
    }
    if (_2541)
    {
        _2533 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2565 = _2533;
    float _2567 = _2553 * 6.283185482025146484375;
    float _2569 = sin(_2567);
    float _2571 = float(_2557);
    float _2573 = fma(_2561, _2537, _2559);
    int _2575 = as_type<int>(_2565);
    if (_2541)
    {
        float _2577 = _2565 * 5.0;
        _2575 = as_type<int>(_2577);
    }
    int _2579 = _2575;
    float _2581 = _2571 * _2563;
    float _2583 = _2553 * 6.283185482025146484375;
    float _2585 = cos(_2583);
    if (_2541)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7877 = as_type<float>(_2579);
        out.gl_Position.z = _7877;
    }
    if (_2541)
    {
        return out;
    }
    float _2587 = -_1893;
    float _2589 = _2587 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2591 = -_1907;
    float _2593 = _2591 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2595 = -_1993;
    float _2597 = _2595 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2599 = _710 + _1129;
    float _2601 = _2589 * _2589;
    float _2603 = _1129 + (-0.5);
    float _2605 = _2573 * 0.15915493667125701904296875;
    float _2607 = _2599 + (-1.0);
    float _2609 = fma(_2593, _2593, _2601);
    float _2611 = _2581 * (-2.0);
    float _2613 = _2605 * 6.283185482025146484375;
    float _2615 = sin(_2613);
    float _2617 = fma(_2607, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2619 = fma(_2597, _2597, _2609);
    float _2621 = fma(_2611, _2033, _2033);
    float _2623 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2625 = fma(_2617, _2611, _2617);
    float _2627 = fma(_2603, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2621);
    float _2629 = rsqrt(_2619);
    float _2631 = in.m_71.x;
    float _2633 = in.m_71.y;
    float _2635 = in.m_71.z;
    bool _2637 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2639 = isnan(0.5);
    bool _2641 = _2637 || _2639;
    bool _2643 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2645 = _2641 || _2643;
    float _2647 = fma(_2625, _2537, _2627);
    float _2649 = _2411 * _2555;
    float _2651 = _2647 * 0.15915493667125701904296875;
    float _2653 = _2605 * 6.283185482025146484375;
    float _2655 = cos(_2653);
    float _2657 = _2569 * _2615;
    float _2659 = _2593 * _2629;
    float _2661 = _2597 * _2629;
    float _2663 = _2589 * _2629;
    float _2665 = _2651 * 6.283185482025146484375;
    float _2667 = sin(_2665);
    float _2669 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2671 = _2659 * _2669;
    float _2673 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2675 = _2661 * _2673;
    float _2677 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2679 = _2663 * _2677;
    float _2681 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2683 = -_2671;
    float _2685 = fma(_2661, _2681, _2683);
    float _2687 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2689 = -_2675;
    float _2691 = fma(_2663, _2687, _2689);
    float _2693 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2695 = -_2679;
    float _2697 = fma(_2659, _2693, _2695);
    float _2699 = _2651 * 6.283185482025146484375;
    float _2701 = cos(_2699);
    float _2703 = _2685 * _2685;
    float _2705 = _2585 * _2655;
    float _2707 = _2569 * _2655;
    float _2709 = fma(_2691, _2691, _2703);
    float _2711 = _650 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2713 = _2585 * _2615;
    float _2715 = fma(_2667, _2705, _2657);
    float _2717 = fma(_2697, _2697, _2709);
    float _2719 = fma(_2667, _2657, _2705);
    float _2721 = _654 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2723 = _2649 * _2623;
    float _2725 = _2649 * _2711;
    float _2727 = -_2713;
    float _2729 = fma(_2667, _2707, _2727);
    float _2731 = rsqrt(_2717);
    float _2733 = _2649 * _2721;
    float _2735 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2633);
    float _2737 = _2585 * _2701;
    float _2739 = _2655 * _2701;
    float _2741 = _2569 * _2701;
    float _2743 = _2615 * _2701;
    float _2745 = _2735 * _2733;
    float _2747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2631);
    float _2749 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2635);
    float _2751 = -_2707;
    float _2753 = fma(_2667, _2713, _2751);
    float _2755 = _2737 * _2745;
    float _2757 = _2747 * _2723;
    float _2759 = _2749 * _2725;
    float _2761 = -_2745;
    float _2763 = _2667 * _2761;
    float _2765 = _2741 * _2745;
    float _2767 = _2691 * _2731;
    float _2769 = _2685 * _2731;
    float _2771 = fma(_2715, _2757, _2755);
    float _2773 = _2697 * _2731;
    float _2775 = _2663 * _2767;
    float _2777 = fma(_2739, _2757, _2763);
    float _2779 = _2661 * _2769;
    float _2781 = fma(_2753, _2759, _2771);
    float _2783 = -_2775;
    float _2785 = fma(_2659, _2769, _2783);
    float _2787 = fma(_2729, _2757, _2765);
    float _2789 = -_2779;
    float _2791 = fma(_2663, _2773, _2789);
    float _2793 = fma(_2743, _2759, _2777);
    float _2795 = _2785 * _2781;
    float _2797 = fma(_2719, _2759, _2787);
    float _2799 = _2791 * _2781;
    float _2801 = fma(_2773, _2793, _2795);
    float _2803 = fma(_2767, _2793, _2799);
    float _2805 = fma(_2661, _2797, _2801);
    float _2807 = fma(_2659, _2797, _2803);
    float _2809 = _1993 + _2805;
    float _2811 = _1907 + _2807;
    float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2815 = _2809 + _2813;
    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2819 = _2811 + _2817;
    float _2821 = _2815 * _2815;
    float _2823 = fma(_2819, _2819, _2821);
    float _2825 = _2659 * _2773;
    float _2827 = sqrt(_2823);
    float _2829 = -_2825;
    float _2831 = fma(_2661, _2767, _2829);
    float _2833 = _2831 * _2781;
    float _2835 = fma(_2769, _2793, _2833);
    float _2837 = fma(_2663, _2797, _2835);
    bool _2839 = _2827 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2841 = _1893 + _2837;
    float _2843 = _2833;
    float _2845 = _2835;
    float _2847 = _2811;
    if (!_2839)
    {
        _2843 = _2809;
    }
    float _2849 = _2843;
    float _2851 = _2849;
    if (!_2839)
    {
        _2845 = _2841;
    }
    float _2853 = _2845;
    bool _2855 = !_2839;
    float _2857 = _2853;
    if (!_2855)
    {
        float _2859 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2863 = _2827 + _2861;
        float _2865 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2867 = rsqrt(_2823);
        float _2869 = _2863 * _2859;
        float _2871 = _2869 * 0.15915493667125701904296875;
        float _2873 = _2871 * 6.283185482025146484375;
        float _2875 = cos(_2873);
        float _2877 = _2871 * 6.283185482025146484375;
        float _2879 = sin(_2877);
        float _2881 = _2875 + (-1.0);
        float _2883 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2885 = fma(_2879, _2865, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2887 = fma(_2841, _2875, _2883);
        float _2889 = _2867 * _2885;
        float _2891 = fma(_2819, _2889, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2893 = fma(_2815, _2889, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2847 = _2891;
        _2857 = _2887;
        _2851 = _2893;
    }
    float _2895 = _2847;
    float _2897 = _2857;
    float _2899 = _2851;
    float _2901 = -_2473;
    float _2903 = fma(_2901, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2895);
    float _2905 = -_2471;
    float _2907 = fma(_2905, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2897);
    float _2909 = -_2479;
    float _2911 = fma(_2909, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2899);
    float _2913 = _2907;
    float _2915 = _2903;
    float _2917 = _2911;
    float _2919 = _2897;
    if (!_2645)
    {
        float _2921 = _2489 * _2489;
        float _2923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2925 = fma(_2497, _2497, _2921);
        float _2927 = -_1993;
        float _2929 = _2927 + _2899;
        float _2931 = fma(_2507, _2507, _2925);
        float _2933 = 1.0 / _2649;
        float _2935 = sqrt(_2931);
        float _2937 = precise::min(_2935, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2939 = _2937 * _2923;
        float _2941 = -_1907;
        float _2943 = _2941 + _2895;
        float _2945 = _2939 * _2933;
        float _2947 = -_1893;
        float _2949 = _2947 + _2897;
        float _2951 = fma(_2943, _2945, _2483);
        float _2953 = fma(_2949, _2945, _2477);
        float _2955 = fma(_2929, _2945, _2493);
        _2913 = _2953;
        _2915 = _2951;
        _2917 = _2955;
    }
    float _2957 = _2913;
    float _2959 = _2915;
    float _2961 = _2917;
    float _2963 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2965 = _2957 + _2963;
    float _2967 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2969 = _2959 + _2967;
    float _2971 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2973 = _2961 + _2971;
    float _2975 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2977 = _2965 * _2965;
    float _2979 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2975);
    float _2981 = fma(_2969, _2969, _2977);
    float _2983 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2979);
    float _2985 = fma(_2973, _2973, _2981);
    float _2987 = _2983 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2989 = rsqrt(_2985);
    float _2991 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2993 = _2969 * _2991;
    float _2995 = _2973 * _2991;
    float _2997 = _2993 * _2993;
    float _2999 = _2995 * _2995;
    float _3001 = _2997 + _2999;
    float _3003 = sqrt(_3001);
    bool _3005 = _3003 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3009 = _3003 + _3007;
    float _3011 = _2973;
    float _3013 = _3001;
    float _3015 = _3009;
    float _3017 = _2991;
    float _3019 = _2995;
    if (_3005)
    {
        float _3021 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3011 = _3021;
    }
    float _3023 = _3011;
    if (_3005)
    {
        float _3025 = rsqrt(_3001);
        _3013 = _3025;
    }
    float _3027 = _3013;
    float _3029 = _3027;
    if (_3005)
    {
        float _3031 = _3009 * _3023;
        _3015 = _3031;
    }
    float _3033 = _3015;
    if (_3005)
    {
        float _3035 = _3033 * 0.15915493667125701904296875;
        _2919 = _3035;
    }
    float _3037 = _2919;
    float _3039 = _2479;
    float _3041 = _3037;
    if (_3005)
    {
        float _3043 = _3037 * 6.283185482025146484375;
        float _3045 = sin(_3043);
        _3039 = _3045;
    }
    float _3047 = _3039;
    float _3049 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3051 = precise::max(0.0, _3049);
    float _3053 = _2989;
    float _3055 = _3051;
    float _3057 = _3049;
    if (_3005)
    {
        float _3059 = _3037 * 6.283185482025146484375;
        float _3061 = cos(_3059);
        _3053 = _3061;
    }
    float _3063 = _3053;
    float _3065 = -_2991;
    float _3067 = -_3051;
    float _3069 = fma(_2965, _3065, _3067);
    float _3071 = _3069;
    if (_3005)
    {
        float _3073 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3055 = _3073;
    }
    float _3075 = _3055;
    float _3077 = _3075;
    if (!_3005)
    {
        _3041 = _2999;
    }
    float _3079 = _3041;
    float _3081 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3083 = _3047;
    float _3085 = _3079;
    if (_3005)
    {
        float _3087 = fma(_3047, _3075, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3083 = _3087;
    }
    float _3089 = _3083;
    float _3091 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3081);
    float _3093 = _3089;
    if (_3005)
    {
        float _3095 = _3063 + (-1.0);
        _3057 = _3095;
    }
    float _3097 = _3057;
    if (_3005)
    {
        float _3099 = _3027 * _3089;
        _3017 = _3099;
    }
    float _3101 = _3017;
    if (!_3005)
    {
        _3093 = _2993;
    }
    float _3103 = _3093;
    float _3105 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3091);
    float _3107 = _3103;
    if (_3005)
    {
        float _3109 = _3097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3077 = _3109;
    }
    float _3111 = _3077;
    if (_3005)
    {
        float _3113 = _2993 * _3101;
        _3107 = _3113;
    }
    float _3115 = _3107;
    float _3117 = sqrt(_2985);
    if (!_3005)
    {
        _3029 = _2997;
    }
    float _3119 = _3029;
    float _3121 = _3119;
    if (_3005)
    {
        float _3123 = fma(_3069, _3063, _3111);
        _3071 = _3123;
    }
    float _3125 = _3071;
    if (_3005)
    {
        float _3127 = _2995 * _3101;
        _3019 = _3127;
    }
    float _3129 = _3019;
    if (_3005)
    {
        float _3131 = _3115 * _3115;
        _3121 = _3131;
    }
    float _3133 = _3121;
    float _3135 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_3005)
    {
        float _3137 = _3129 * _3129;
        _3085 = _3137;
    }
    float _3139 = _3085;
    float _3141 = fma(_3125, _3125, _3133);
    float _3143 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3135);
    float _3145 = fma(_2483, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3147 = _3141 + _3139;
    float _3149 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3143);
    float _3151 = _3105 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3153 = floor(_3145);
    float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3157 = fma(_3117, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3155);
    float _3159 = precise::clamp(_3157, 0.0, 1.0);
    float _3161 = _3149 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3163 = _3151 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3165 = -_3159;
    float _3167 = _3165 + 1.0;
    float _3169 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3171 = rsqrt(_3147);
    float _3173 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3175 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3177 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3179 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3175);
    float _3181 = -_3169;
    float _3183 = fma(_3181, _3177, 1.0);
    float _3185 = abs(_3167);
    float _3187 = log2(_3185);
    float _3189 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3179);
    float _3191 = _3189 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3193 = _3171 * _3115;
    float _3195 = _3171 * _3125;
    float _3197 = _3171 * _3129;
    float _3199 = floor(_3173);
    float _3201 = _3193 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3203 = _3151 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3205 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3163);
    float _3207 = -_3201;
    float _3209 = fma(_3195, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3207);
    float _3211 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3203);
    float _3213 = _3187 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3215 = log2(_3183);
    float _3217 = -_3197;
    float _3219 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3209);
    float _3221 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3211);
    float _3223 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3205);
    float _3225 = fma(_3219, -0.5, 0.5);
    float _3227 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3221);
    float _3229 = fma(_3219, 0.5, 0.5);
    float _3231 = exp2(_3213);
    float _3233 = -_3153;
    float _3235 = _3145 + _3233;
    float _3237 = _3151 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3239 = _3195 + 1.0;
    float _3241 = -_3199;
    float _3243 = _3173 + _3241;
    float _3245 = fma(_3229, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3247 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3237);
    float _3249 = 1.0 / _3227;
    float _3251 = fma(_3229, _3245, -0.212114393711090087890625);
    float _3253 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3247);
    float _3255 = fma(_3229, _3251, 1.570728778839111328125);
    float _3257 = sqrt(_3225);
    float _3259 = -_3195;
    float _3261 = fma(_3231, _3239, _3259);
    float _3263 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3253);
    float _3265 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3223);
    float _3267 = _3215 * 0.693147182464599609375;
    float _3269 = fma(_3261, 0.5, 0.5);
    float _3271 = _3263 * _3249;
    float _3273 = _3265 * _3249;
    float _3275 = _3267 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3277 = fma(_3271, 0.5, 0.5);
    float _3279 = fma(_3273, -0.5, 0.5);
    float _3281 = _3257 * 0.636619746685028076171875;
    float2 _8990 = float2(_3235, _3243);
    float _3283 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8990, float2(0.0), isnan(_8990)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8990, float2(0.0), isnan(_8990)), level(0.0)).x;
    float3 _9001 = float3(_3277, _3279, _3275);
    float _3285 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9001, float3(0.0), isnan(_9001)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9001, float3(0.0), isnan(_9001)), level(0.0)).x;
    float _3287 = -_3255;
    float _3289 = fma(_3281, _3287, 1.0);
    float3 _9017 = float3(_3277, _3279, _3275);
    float4 _3292 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9017, float3(0.0), isnan(_9017)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9017, float3(0.0), isnan(_9017)), level(0.0)).xyzw;
    float _3294 = _3292.x;
    float _3296 = _3292.y;
    float _3298 = _3292.z;
    float _3300 = _3292.w;
    float2 _9033 = float2(_3289, _3269);
    float3 _3304 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9033, float2(0.0), isnan(_9033)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9033, float2(0.0), isnan(_9033)), level(0.0)).xyz;
    float _3306 = _3304.x;
    float _3308 = _3304.y;
    float _3310 = _3304.z;
    float _3312 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3314 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3316 = _2633 != 0.0;
    bool _3318 = isnan(_2633);
    bool _3320 = _3316 || _3318;
    bool _3322 = isnan(0.0);
    bool _3324 = _3320 || _3322;
    float _3326 = _3187 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3328 = fma(_2483, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3312);
    float _3330 = fma(_2483, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3314);
    bool _3332 = _2631 == 0.0;
    bool _3334 = !_3324;
    bool _3336 = _3332 && _3334;
    float _3338 = _3151 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3340 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3328);
    float _3342 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3330);
    float _3344 = in.m_73.x;
    float _3346 = in.m_73.y;
    float _3348 = in.m_73.z;
    bool _3350 = _2635 == 0.0;
    bool _3352 = _3350 && _3336;
    float _3354 = _3340 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3356 = _3342 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3358 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3360 = isnan(0.5);
    bool _3362 = _3358 || _3360;
    bool _3364 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3366 = _3362 || _3364;
    float _3368 = exp2(_3326);
    float _3370 = _3356 + _3354;
    float _3372 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3338);
    out.m_75.x = _2959;
    out.m_75.y = _2957;
    out.m_75.z = _2961;
    float _3374 = 1.0 / _3354;
    float _3376 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3372);
    float _3378 = _3265;
    float _3380 = _3263;
    if (!_3366)
    {
        _2273 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _3382 = _2273;
    float _3384 = -_3368;
    float _3386 = _3384 + 1.0;
    float _3388 = _3344;
    float _3390 = _3348;
    if (_3352)
    {
        _2275 = _3344;
    }
    float _3392 = _2275;
    float _3394 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3396 = _3392;
    if (_3352)
    {
        _2277 = _3346;
    }
    float _3398 = _2277;
    float _3400 = _3398;
    if (_3352)
    {
        _2279 = _3348;
    }
    float _3402 = _2279;
    float _3404 = _3370 * _3374;
    float _3406 = _3404 * 0.5;
    float _3408 = in.m_77.x;
    float _3410 = in.m_77.y;
    float _3412 = in.m_77.z;
    float _3414 = in.m_77.w;
    float _3416 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3418 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3416);
    float _3420 = 1.0 / _3418;
    float _3422 = _3418;
    float _3424 = _3402;
    if (_3352)
    {
        _3422 = _3392;
    }
    float _3426 = _3422;
    float _3428 = _3426;
    if (!_3352)
    {
        _3396 = _3344;
    }
    float _3430 = _3396;
    if (_3352)
    {
        _3388 = _3398;
    }
    float _3432 = _3388;
    float _3434 = _3432;
    if (!_3352)
    {
        _3400 = _3346;
    }
    float _3436 = _3400;
    float _3438 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3440 = _3420 * _3438;
    float _3442 = _3436;
    if (!_3352)
    {
        float _3444 = fma(_2631, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3430);
        _3428 = _3444;
    }
    float _3446 = _3428;
    float _3448 = _3412 * _3430;
    float _3450 = abs(_3440);
    float _3452 = log2(_3450);
    if (!_3352)
    {
        float _3454 = fma(_2633, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3436);
        _3434 = _3454;
    }
    float _3456 = _3434;
    float _3458 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3460 = _3452;
    if (_3352)
    {
        _3460 = _3402;
    }
    float _3462 = _3460;
    float _3464 = _3462;
    if (!_3352)
    {
        _3424 = _3348;
    }
    float _3466 = _3424;
    float _3468 = exp2(_3458);
    if (!_3366)
    {
        float _3470 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3472 = _3382 + _3470;
        _3390 = _3472;
    }
    float _3474 = _3390;
    float _3476 = _3408 * _3436;
    float _3478 = _3410 * _3466;
    if (!_3352)
    {
        float _3480 = fma(_2635, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3466);
        _3464 = _3480;
    }
    float _3482 = _3464;
    float _3484 = -_3476;
    float _3486 = fma(_3410, _3430, _3484);
    float _3488 = -_3448;
    float _3490 = fma(_3408, _3466, _3488);
    float _3492 = _3474;
    if (!_3366)
    {
        float _3494 = 1.0 / _3474;
        _3492 = _3494;
    }
    float _3496 = _3492;
    float _3498 = -_3478;
    float _3500 = fma(_3412, _3436, _3498);
    if (_3366)
    {
        _3442 = 1.0;
    }
    float _3502 = _3442;
    float _3504 = _2715 * _2791;
    float _3506 = _3490 * _3414;
    bool _3508 = _3117 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3510 = isnan(_3117);
    bool _3512 = _3508 || _3510;
    bool _3514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3516 = _3512 || _3514;
    float _3518 = fma(_3468, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3520 = precise::clamp(_3518, 0.0, 1.0);
    float _3522 = _3468;
    float _3524 = _3502;
    if (!_3366)
    {
        float _3526 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3528 = _3440 + _3526;
        _3522 = _3528;
    }
    float _3530 = _3522;
    float _3532 = fma(_3520, -2.0, 3.0);
    float _3534 = _3520 * _3520;
    float _3536 = _3500 * _3414;
    float _3538 = _3486 * _3414;
    if (!_3366)
    {
        float _3540 = _3530 * _3496;
        float _3542 = precise::clamp(_3540, 0.0, 1.0);
        _3524 = _3542;
    }
    float _3544 = _3524;
    float _3546 = _3534 * _3532;
    float _3548 = _2715 * _2831;
    float _3550 = _2715 * _2785;
    float _3552 = _2737 * _2791;
    float _3554 = _2737 * _2831;
    float _3556 = _2737 * _2785;
    float _3558 = _2753 * _2791;
    float _3560 = _2753 * _2785;
    float _3562 = _2753 * _2831;
    float _3564 = fma(_2739, _2767, _3504);
    float _3566 = fma(_2739, _2769, _3548);
    float _3568 = fma(_2739, _2773, _3550);
    float _3570 = -_2667;
    float _3572 = fma(_3570, _2767, _3552);
    float _3574 = -_2667;
    float _3576 = fma(_3574, _2769, _3554);
    float _3578 = -_3546;
    float _3580 = _3578 + 1.0;
    float _3582 = -_2667;
    float _3584 = fma(_3582, _2773, _3556);
    float _3586 = fma(_2743, _2767, _3558);
    float _3588 = fma(_2741, _2659, _3572);
    float _3590 = fma(_3580, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3546);
    float _3592 = fma(_2743, _2769, _3562);
    float _3594 = fma(_2743, _2773, _3560);
    float _3596 = fma(_2729, _2663, _3566);
    float _3598 = fma(_2741, _2663, _3576);
    bool _3600 = _3440 <= 8000.0;
    bool _3602 = isnan(_3440);
    bool _3604 = _3600 || _3602;
    bool _3606 = isnan(8000.0);
    bool _3608 = _3604 || _3606;
    float _3610 = float(_3608);
    float _3612 = fma(_2741, _2661, _3584);
    float _3614 = fma(_2729, _2659, _3564);
    float _3616 = _3588 * _3410;
    float _3618 = fma(_2729, _2661, _3568);
    float _3620 = fma(_2719, _2659, _3586);
    float _3622 = fma(_2719, _2663, _3592);
    float _3624 = fma(_2719, _2661, _3594);
    float _3626 = _3598 * _3410;
    float _3628 = _3612 * _3410;
    float _3630 = _3588 * _3456;
    float _3632 = _3598 * _3456;
    float _3634 = _3612 * _3456;
    float _3636 = _3506 * _3598;
    float _3638 = fma(_3614, _3408, _3616);
    float _3640 = _3506 * _3588;
    float _3642 = _3506 * _3612;
    float _3644 = fma(_3596, _3408, _3626);
    float _3646 = fma(_3618, _3408, _3628);
    float _3648 = fma(_3536, _3596, _3636);
    float _3650 = fma(_3620, _3412, _3638);
    float _3652 = fma(_3614, _3446, _3630);
    float _3654 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3376);
    float _3656 = fma(_3536, _3614, _3640);
    float _3658 = fma(_3536, _3618, _3642);
    float _3660 = fma(_3622, _3412, _3644);
    float _3662 = fma(_3624, _3412, _3646);
    float _3664 = fma(_3538, _3622, _3648);
    float _3666 = _3654 + _3227;
    float _3668 = _3263 + _3227;
    float _3670 = _3227 * 0.5;
    float _3672 = fma(_3596, _3446, _3632);
    float _3674 = fma(_3538, _3620, _3656);
    float _3676 = _3666 * 0.5;
    float _3678 = _3668 * 0.5;
    float _3680 = fma(_3265, -0.5, _3670);
    float _3682 = fma(_3538, _3624, _3658);
    float _3684 = fma(_3618, _3446, _3634);
    float _3686 = in.m_79.x;
    float _3688 = _3610 * _3590;
    float _3690 = fma(_3620, _3482, _3652);
    float _3692 = fma(_3622, _3482, _3672);
    out.m_81.x = _3678;
    out.m_81.y = _3680;
    out.m_81.z = _3676;
    out.m_81.w = _3227;
    float _3694 = fma(_3624, _3482, _3684);
    float _3696 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _3674;
    out.m_83.y = _3664;
    out.m_83.z = _3682;
    out.m_85.x = _3650;
    out.m_85.y = _3660;
    out.m_85.z = _3662;
    out.m_87.x = _3690;
    out.m_87.y = _3692;
    out.m_87.z = _3694;
    float _3698 = -_3394;
    float _3700 = _3698 + 1.0;
    out.gl_Position.x = _3263;
    out.gl_Position.y = _3265;
    out.gl_Position.z = _3654;
    out.gl_Position.w = _3227;
    float _3702 = _3664;
    float _3704 = _3700;
    if (!_3516)
    {
        _3702 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3706 = _3702;
    float _3708 = _3544 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3710 = _3706;
    float _3712 = _3706;
    if (!_3516)
    {
        _3378 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3714 = _3378;
    float _3716 = _3714;
    float _3718 = _3714;
    if (!_3516)
    {
        _3380 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3720 = _3380;
    float _3722 = -_3283;
    float _3724 = _3722 + 1.0;
    float _3726 = _3394 * _3285;
    float _3728 = _3724 * _3696;
    float _3730 = precise::clamp(_3728, 0.0, 1.0);
    float _3732 = _3300 * _3726;
    float _3734 = _3300 * _3700;
    float _3736 = _3720;
    float _3738 = _3720;
    if (!_3516)
    {
        _3704 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3740 = _3704;
    float _3742 = -_3730;
    float _3744 = fma(_3742, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3746 = _3310 * _3726;
    float _3748 = fma(_3306, _3732, _3294);
    float _3750 = fma(_3308, _3732, _3296);
    float _3752 = _3744 * _3686;
    float _3754 = fma(_3300, _3746, _3298);
    float _3756 = _3752 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3758 = _3752;
    float _3760 = _3756;
    float _3762 = _3740;
    float _3764 = _3740;
    if (!_3516)
    {
        _3758 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3766 = _3758;
    out.m_89.x = _3748;
    out.m_89.y = _3750;
    out.m_89.z = _3754;
    out.m_89.w = _3734;
    out.m_91.x = _3756;
    float _3768 = _3766;
    float _3770 = _3766;
    if (!_3516)
    {
        _3760 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3772 = _3760;
    bool _3774 = !_3516;
    float _3776 = _3772;
    float _3778 = _3772;
    if (!_3774)
    {
        bool _3780 = _3117 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3782 = isnan(_3117);
        bool _3784 = _3780 || _3782;
        bool _3786 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3788 = _3784 || _3786;
        if (!_3788)
        {
            float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3792 = _3117 + _3790;
            float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3796 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3794;
            float _3798 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3800 = _3798 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3802 = 1.0 / _3796;
            float _3804 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3806 = _3804 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3810 = _3808 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3814 = _3812 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3816 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3818 = _3816 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3820 = _3792 * _3802;
            float _3822 = precise::clamp(_3820, 0.0, 1.0);
            float _3824 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3826 = _3824 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3828 = fma(_3822, _3800, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3830 = fma(_3822, _3826, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3832 = fma(_3822, _3806, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3834 = fma(_3822, _3810, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3836 = fma(_3822, _3814, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3838 = fma(_3822, _3818, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3738 = _3832;
            _3712 = _3836;
            _3718 = _3828;
            _3764 = _3834;
            _3770 = _3830;
            _3778 = _3838;
            _3840 = true;
        }
        else
        {
            bool _3842 = _3117 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3844 = isnan(_3117);
            bool _3846 = _3842 || _3844;
            bool _3848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3850 = _3846 || _3848;
            if (!_3850)
            {
                _3716 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3852 = _3716;
            _3718 = _3852;
            if (!_3850)
            {
                _3736 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3854 = _3736;
            _3738 = _3854;
            if (!_3850)
            {
                _3768 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3856 = _3768;
            _3770 = _3856;
            if (!_3850)
            {
                _3762 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3858 = _3762;
            _3764 = _3858;
            if (!_3850)
            {
                _3710 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3860 = _3710;
            _3712 = _3860;
            if (!_3850)
            {
                _3776 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3862 = _3776;
            bool _3864 = !_3850;
            _3778 = _3862;
            if (!_3864)
            {
                bool _3866 = _3117 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3868 = isnan(_3117);
                bool _3870 = _3866 || _3868;
                bool _3872 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3874 = _3870 || _3872;
                if (!_3874)
                {
                    float _3876 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3878 = _3117 + _3876;
                    float _3880 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3882 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3880;
                    float _3884 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3886 = _3884 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3888 = 1.0 / _3882;
                    float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3892 = _3890 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3896 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3902 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3904 = _3902 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3906 = _3878 * _3888;
                    float _3908 = precise::clamp(_3906, 0.0, 1.0);
                    float _3910 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3912 = _3910 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3914 = fma(_3908, _3886, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3916 = fma(_3908, _3912, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3918 = fma(_3908, _3892, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3920 = fma(_3908, _3896, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3922 = fma(_3908, _3900, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3924 = fma(_3908, _3904, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3738 = _3918;
                    _3712 = _3922;
                    _3718 = _3914;
                    _3764 = _3920;
                    _3770 = _3916;
                    _3778 = _3924;
                    _3840 = true;
                }
                else
                {
                    _3738 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3712 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3718 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3764 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3770 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3778 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3840 = false;
    float _3926 = _3738;
    float _3928 = _3712;
    float _3930 = _3718;
    float _3932 = _3764;
    float _3934 = _3770;
    float _3936 = _3778;
    float _3938 = fma(_3692, -0.5, 0.5);
    float _3940 = precise::clamp(_3938, 0.0, 1.0);
    float _3942 = -_3926;
    float _3944 = _3942 + _3928;
    float _3946 = _3708 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3948 = -_3930;
    float _3950 = _3948 + _3932;
    float _3952 = fma(_3940, _3944, _3926);
    out.m_93.x = 0.0;
    float _3954 = -_3934;
    float _3956 = _3954 + _3936;
    float _3958 = fma(_3940, _3950, _3930);
    float _3960 = _3952 * 0.586610972881317138671875;
    out.m_49.x = _3946;
    bool _3962 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3964 = fma(_3940, _3956, _3934);
    float _3966 = fma(_3958, 0.298911988735198974609375, _3960);
    bool _3968 = _3544 > 0.0;
    bool _3970 = isnan(_3544);
    bool _3972 = _3968 || _3970;
    bool _3974 = isnan(0.0);
    bool _3976 = _3972 || _3974;
    float _3978 = fma(_3964, 0.114477999508380889892578125, _3966);
    float _3980 = -_3978;
    float _3982 = _3958 + _3980;
    float _3984 = -_3978;
    float _3986 = _3952 + _3984;
    float _3988 = -_3978;
    float _3990 = _3964 + _3988;
    float _3992 = fma(_3982, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3978);
    float _3994 = fma(_3986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3978);
    float _3996 = fma(_3990, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3978);
    bool _3998 = !_3962;
    if (!_3998)
    {
        float _4000 = -_2957;
        float _4002 = _4000 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4004 = -_2959;
        float _4006 = _4004 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4008 = -_2961;
        float _4010 = _4008 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4012 = _4002 * _4002;
        float _4014 = fma(_4006, _4006, _4012);
        float _4016 = fma(_4010, _4010, _4014);
        float _4018 = sqrt(_4016);
        float _4020 = rsqrt(_4016);
        float _4022 = -_4018;
        float _4024 = _4022 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4026 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4028 = precise::clamp(_4026, 0.0, 1.0);
        float _4030 = _4006 * _4020;
        float _4032 = _4002 * _4020;
        float _4034 = abs(_4028);
        float _4036 = log2(_4034);
        float _4038 = _4010 * _4020;
        float _4040 = _4030 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4042 = _3692 * _4032;
        float _4044 = -_4032;
        float _4046 = -_4040;
        float _4048 = fma(_4044, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4046);
        float _4050 = fma(_3690, _4030, _4042);
        float _4052 = -_4038;
        float _4054 = fma(_4052, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4048);
        float _4056 = fma(_3694, _4038, _4050);
        float _4058 = precise::clamp(_4056, 0.0, 1.0);
        float _4060 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4062 = _4054 + _4060;
        float _4064 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4066 = _4062 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4068 = precise::clamp(_4066, 0.0, 1.0);
        float _4070 = exp2(_4064);
        float _4072 = _4070 * _4068;
        float _4074 = _4058 * _4072;
        float _4076 = _4074 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4078 = _4074 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4080 = _4074 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _4076;
        out.m_93.y = _4078;
        out.m_93.z = _4080;
    }
    out.m_95.x = _3992;
    out.m_95.y = _3994;
    out.m_95.z = _3996;
    if (_3976)
    {
        return out;
    }
    float _4082 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4082;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3840 = false;
    bool _696 = false;
    bool _580 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    float _126 = _124;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _128 = 0;
    if (!_118)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4141 = as_type<float>(_132);
        out.gl_Position.z = _4141;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _156 = float(_114);
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
        float _4210 = as_type<float>(_170);
        out.gl_Position.z = _4210;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _174 = !_172;
    float _192;
    if (!_174)
    {
        float _176 = in.m_53.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        float _196 = float(_114);
        float _198 = 1.0 / _196;
        float _200 = _150 * _198;
        _192 = _200;
    }
    _194 = false;
    float _202 = _192;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = 1.0 / _206;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _228 = _226 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _230 = 1.0 / _210;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = _202 + _232;
    bool _236 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _238 = isnan(_202);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = 1.0 / _214;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _202 + _250;
    float _254 = _234 * _220;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = _202 + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _262 = _202 + _260;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _266 = 1.0 / _224;
    float _268 = _252 * _230;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _272 = _202 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _276 = _202 + _274;
    bool _278 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _280 = isnan(_202);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = 1.0 / _228;
    float _292 = _258 * _248;
    bool _294 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _296 = isnan(_202);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _306;
    float _310 = -_288;
    float _312 = _310 + 1.0;
    float _314 = fma(_308, _254, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _316 = 1.0 / _218;
    float _318 = _272 * _266;
    bool _320 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _322 = isnan(_202);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_304;
    float _334 = _332 + 1.0;
    float _336 = -_330;
    float _338 = _336 + 1.0;
    float _340 = _276 * _290;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = _288 * _334;
    float _348 = fma(_344, _254, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = _246 * _338;
    bool _352 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _354 = isnan(_202);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = _262 * _316;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _366;
    float _370 = -_246;
    float _372 = _370 + 1.0;
    float _374 = fma(_368, _254, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _376 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _378 = isnan(_202);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = _330 * _312;
    bool _390 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _392 = isnan(_202);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = _386 * _372;
    float _416 = -_400;
    float _418 = _416 + 1.0;
    float _420 = -_386;
    float _422 = _420 + 1.0;
    float _424 = fma(_408, _268, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _426 = _362 * _418;
    float _428 = -_362;
    float _430 = _428 + 1.0;
    float _432 = fma(_404, _268, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _434 = fma(_412, _268, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _436 = _374 * _426;
    float _438 = _348 * _426;
    float _440 = _314 * _426;
    float _442 = _400 * _422;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _464 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _466 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _468;
    float _472 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].z, _440);
    float _474 = fma(_454, _364, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _476 = fma(_458, _364, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _478 = fma(_462, _364, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _480 = fma(_446, _292, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _482 = fma(_450, _292, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _484 = fma(_470, _292, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _486 = fma(_424, _442, _464);
    float _488 = fma(_432, _442, _466);
    float _490 = fma(_434, _442, _472);
    float _492 = fma(_480, _414, _486);
    float _494 = fma(_482, _414, _488);
    float _496 = fma(_484, _414, _490);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _502;
    float _506 = fma(_474, _350, _492);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _508;
    float _512 = fma(_476, _350, _494);
    float _514 = fma(_478, _350, _496);
    float _516 = fma(_500, _318, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _518 = fma(_504, _318, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _524 = fma(_510, _318, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _534 = fma(_516, _388, _506);
    float _536 = fma(_522, _340, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _538 = fma(_528, _340, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _540 = fma(_532, _340, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _542 = fma(_518, _388, _512);
    float _544 = fma(_524, _388, _514);
    float _546 = fma(_536, _346, _534);
    float _548 = fma(_538, _346, _542);
    float _550 = fma(_540, _346, _544);
    float _552 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[149].x, _546);
    float _554 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[149].y, _548);
    float _556 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[149].z, _550);
    bool _558 = !_264;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _578;
    if (!_558)
    {
        float _562 = in.m_53.x;
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _566 = _562 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _570 = _568 * _564;
        float _572 = floor(_570);
        float _574 = -_572;
        float _576 = _570 + _574;
        _578 = _576;
        _580 = true;
    }
    else
    {
        float _582 = float(_114);
        float _584 = 1.0 / _582;
        float _586 = _150 * _584;
        _578 = _586;
    }
    _580 = false;
    float _588 = _578;
    float _590 = in.m_55.x;
    float _592 = in.m_55.y;
    float _594 = in.m_55.z;
    bool _596 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _598 = isnan(_588);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _612 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _614 = isnan(_588);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _588 + _628;
    float _632 = 1.0 / _610;
    float _634 = -_606;
    float _636 = _634 + 1.0;
    bool _638 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _640 = _622 * _636;
    float _642 = -_622;
    float _644 = _642 + 1.0;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _648 = _626 * _632;
    float _650 = _556 * _594;
    float _652 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _554 * _592;
    float _656 = fma(_648, _630, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _658 = _552 * _590;
    float _660 = _656 * _640;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _664 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[115].x, _660);
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _668 = _662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _670 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[116].x, _664);
    float _672 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _670 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _672;
    out.m_57.y = _668;
    out.m_57.z = _652;
    out.m_57.w = _674;
    bool _676 = !_638;
    float _694;
    if (!_676)
    {
        float _678 = in.m_53.x;
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _682 = _678 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _686 = _684 * _680;
        float _688 = floor(_686);
        float _690 = -_688;
        float _692 = _686 + _690;
        _694 = _692;
        _696 = true;
    }
    else
    {
        float _698 = float(_114);
        float _700 = 1.0 / _698;
        float _702 = _150 * _700;
        _694 = _702;
    }
    _696 = false;
    float _704 = _694;
    float _706 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _708 = int(_706);
    float _710 = in.m_53.x;
    float _712 = float(_114);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _716 = _704 + _714;
    float _718 = in.m_53.y;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _722 = _704 + _720;
    float _724 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _726 = int(_724);
    float _728 = in.m_59.y;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _738 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _740 = int(_738);
    float _742 = float(_708);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _748 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _750 = isnan(_704);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = 1.0 / _742;
    float _762 = float(_726);
    float _764 = _718 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _766 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _768 = int(_766);
    float _770 = float(uint(_740));
    float _772 = fma(_764, -2.0, _746);
    int _774 = ~_740;
    int _776 = _774 + 1;
    bool _778 = _740 == 0;
    float _780 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _772);
    float _782 = 1.0 / _762;
    float _784 = _760 * _150;
    float _786 = 1.0 / _770;
    float _788 = float(uint(_768));
    int _790 = ~_740;
    int _792 = _790 + 1;
    float _794 = trunc(_784);
    int _796 = int(_794);
    float _798 = _782 * _150;
    float _800 = 1.0 / _788;
    int _802 = as_type<int>(_786) + (-2);
    int _804 = ~_768;
    int _806 = _804 + 1;
    float _808 = trunc(_798);
    int _810 = int(_808);
    float _812 = float(uint(_796));
    float _814 = as_type<float>(_802) * _812;
    int _816 = as_type<int>(_800) + (-2);
    float _818 = 1.0 / _712;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _822 = _820 != 0;
    float _824 = float(uint(_810));
    float _826 = trunc(_814);
    float _828 = precise::max(_826, 0.0);
    uint _831 = uint(_828);
    float _833 = as_type<float>(_816) * _824;
    float _835 = 1.0 / _732;
    float _837 = _728;
    int _839 = _802;
    if (_822)
    {
        _122 = 1.0;
    }
    float _841 = _122;
    float _843 = _841;
    if (!_822)
    {
        _843 = 1.2345600128173828125;
    }
    float _845 = _843;
    float _847 = trunc(_833);
    float _849 = precise::max(_847, 0.0);
    uint _851 = uint(_849);
    int _853 = _792 * int(_831);
    int _855 = _853 + _796;
    float _857 = float(uint(_855));
    float _859 = 1.0 / _736;
    float _861 = as_type<float>(_802) * _857;
    float _863 = _857;
    if (_822)
    {
        _863 = _710;
    }
    float _865 = _863;
    float _867 = _865;
    if (!_822)
    {
        _867 = _718;
    }
    float _869 = _867;
    int _871 = _806 * int(_851);
    int _873 = _871 + _810;
    float _875 = trunc(_861);
    float _877 = precise::max(_875, 0.0);
    uint _879 = uint(_877);
    float _881 = float(uint(_873));
    float _883 = as_type<float>(_816) * _881;
    float _885 = _881;
    if (_822)
    {
        _885 = 1.0;
    }
    float _887 = _885;
    float _889 = _887;
    if (!_822)
    {
        _889 = 7.345489978790283203125;
    }
    float _891 = _889;
    float _893 = trunc(_883);
    float _895 = precise::max(_893, 0.0);
    uint _897 = uint(_895);
    int _899 = int(_831) + int(_879);
    float _901 = _891 * _710;
    float _903 = _869 * _845;
    float _905 = float(_740);
    float _907 = floor(_901);
    float _909 = float(_796);
    int _911 = ~_768;
    int _913 = _911 + 1;
    bool _915 = _909 >= _905;
    bool _917 = isnan(_909);
    bool _919 = _915 || _917;
    bool _921 = isnan(_905);
    bool _923 = _919 || _921;
    float _925 = float(_923);
    int _927 = int(_851) + int(_897);
    int _929 = _776 * _899;
    int _931 = _929 + _796;
    float _933 = floor(_903);
    float _935 = float(_768);
    int _937 = _913 * _927;
    int _939 = _937 + _810;
    bool _941 = uint(_931) >= uint(_740);
    float _943 = float(_810);
    float _945 = -_907;
    float _947 = _901 + _945;
    float _949 = trunc(_925);
    int _951 = int(_949);
    bool _953 = !_941;
    int _955 = _953 ? 0 : (-1);
    bool _957 = _943 >= _935;
    bool _959 = isnan(_943);
    bool _961 = _957 || _959;
    bool _963 = isnan(_935);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    bool _969 = uint(_939) >= uint(_768);
    int _971 = ~_899;
    int _973 = _971 + _955;
    int _975 = _973 + 1;
    float _977 = -_933;
    float _979 = _903 + _977;
    float _981 = _905 * _947;
    bool _983 = !_969;
    int _985 = _983 ? 0 : (-1);
    int _987 = _740 * _975;
    int _989 = _987 + _796;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _993 = _991 != 0;
    float _995 = trunc(_967);
    int _997 = int(_995);
    int _999 = ~_927;
    int _1001 = _999 + _985;
    int _1003 = _1001 + 1;
    float _1005 = _818 * _150;
    bool _1007 = !_778;
    int _1009 = _1007 ? _989 : (-1);
    float _1011 = _935 * _979;
    bool _1013 = _768 == 0;
    float _1015 = _905 * _1005;
    float _1017 = trunc(_981);
    int _1019 = int(_1017);
    bool _1021 = !_993;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = _935 * _1005;
    int _1027 = ~_951;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    int _1033 = abs(_1023);
    int _1035 = _768 * _1003;
    int _1037 = _1035 + _810;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1041 = _1039 != 0;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1045 = _1043 != 0;
    int _1047 = _1009 * _1031;
    int _1049 = _740 + (-1);
    float _1051 = trunc(_1015);
    int _1053 = int(_1051);
    bool _1055 = !_1013;
    int _1057 = _1055 ? _1037 : (-1);
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1061 = _1059 != 0;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1065 = _1063 != 0;
    int _1067 = _951 * _1049;
    int _1069 = _1067 + _1047;
    bool _1071 = !_1045;
    int _1073 = _1071 ? 0 : 1;
    int _1075 = _1019 * _1033;
    int _1077 = _1075 + _796;
    int _1079 = ~_997;
    int _1081 = _1079 + 1;
    int _1083 = _1081 + 1;
    float _1085 = trunc(_1011);
    int _1087 = int(_1085);
    bool _1089 = !_1065;
    int _1091 = _1089 ? 0 : 1;
    int _1093 = abs(_1073);
    int _1095 = _1057 * _1083;
    bool _1097 = !_1041;
    int _1099 = _1097 ? 0 : 1;
    int _1101 = abs(_1091);
    float _1103 = trunc(_1025);
    int _1105 = int(_1103);
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1109 = _1107 != 0;
    int _1111 = abs(_1099);
    int _1113 = _1069 * _1093;
    int _1115 = _768 + (-1);
    bool _1117 = !_1109;
    int _1119 = _1117 ? 0 : 1;
    int _1121 = _997 * _1115;
    int _1123 = _1121 + _1095;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1127 = _1125 != 0;
    float _1129 = in.m_53.z;
    int _1131 = _1053 * _1111;
    int _1133 = _1131 + _1113;
    int _1135 = abs(_1119);
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1139 = _1137 != 0;
    int _1141 = _1123 * _1101;
    bool _1143 = !_1127;
    int _1145 = _1143 ? 0 : 1;
    int _1147 = _1077 * _1135;
    int _1149 = _1147 + _1133;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1153 = _1151 != 0;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1157 = _1155 != 0;
    bool _1159 = !_1061;
    int _1161 = _1159 ? 0 : 1;
    bool _1163 = !_1139;
    int _1165 = _1163 ? 0 : 1;
    int _1167 = abs(_1145);
    int _1169 = abs(_1161);
    int _1171 = abs(_1165);
    bool _1173 = !_1153;
    int _1175 = _1173 ? 0 : 1;
    float _1177 = _1129 * 2.0;
    int _1179 = abs(_1175);
    int _1181 = _1019 * _1167;
    int _1183 = _1181 + _1149;
    bool _1185 = !_1157;
    int _1187 = _1185 ? 0 : 1;
    int _1189 = _1087 * _1171;
    int _1191 = _1189 + _810;
    float _1193 = floor(_1177);
    int _1195 = abs(_1187);
    int _1197 = _1105 * _1169;
    int _1199 = _1197 + _1141;
    float _1201 = float(uint(_1183));
    float _1203 = in.m_59.x;
    int _1205 = _1191 * _1179;
    int _1207 = _1205 + _1199;
    int _1209 = ~_740;
    int _1211 = _1209 + 1;
    float _1213 = as_type<float>(_802) * _1201;
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1217 = _1215 != 0;
    int _1219 = _1087 * _1195;
    int _1221 = _1219 + _1207;
    int _1223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1225 = _1223 != 0;
    bool _1227 = _740 == 0;
    float _1229 = trunc(_1213);
    float _1231 = precise::max(_1229, 0.0);
    uint _1233 = uint(_1231);
    float _1235 = float(uint(_1221));
    float _1237 = as_type<float>(_816) * _1235;
    int _1239 = ~_768;
    int _1241 = _1239 + 1;
    bool _1243 = _1061;
    int _1245 = _1087;
    if (_1217)
    {
        bool _1247 = _710 > 0.5;
        _1243 = _1247;
    }
    bool _1249 = _1243;
    float _1251 = trunc(_1237);
    float _1253 = precise::max(_1251, 0.0);
    uint _1255 = uint(_1253);
    float _1257 = _1203;
    if (!_1217)
    {
        _560 = _1203;
    }
    float _1259 = _560;
    float _1261 = _1259;
    if (_1225)
    {
        float _1263 = -_1203;
        float _1265 = _1263 + 1.0;
        _1245 = as_type<int>(_1265);
    }
    int _1267 = _1245;
    int _1269 = _1211 * int(_1233);
    int _1271 = _1269 + _1183;
    float _1273 = 0.0;
    if (!_1225)
    {
        _1273 = _1203;
    }
    float _1275 = _1273;
    float _1277 = float(uint(_1271));
    float _1279 = as_type<float>(_802) * _1277;
    int _1281 = _1241 * int(_1255);
    int _1283 = _1281 + _1221;
    float _1285 = trunc(_1279);
    float _1287 = precise::max(_1285, 0.0);
    uint _1289 = uint(_1287);
    float _1291 = float(uint(_1283));
    float _1293 = as_type<float>(_816) * _1291;
    int _1295 = as_type<int>(_1291);
    float _1297 = _1275;
    int _1299 = as_type<int>(_1293);
    if (_1217)
    {
        float _1301 = -_1203;
        float _1303 = _1301 + 1.0;
        _1295 = as_type<int>(_1303);
    }
    int _1305 = _1295;
    int _1307 = ~_768;
    int _1309 = _1307 + 1;
    float _1311 = trunc(_1293);
    float _1313 = precise::max(_1311, 0.0);
    uint _1315 = uint(_1313);
    if (_1217)
    {
        float _1317 = _1249 ? as_type<float>(_1305) : _1203;
        _1261 = _1317;
    }
    float _1319 = _1261;
    int _1321 = ~_740;
    int _1323 = _1321 + 1;
    int _1325 = int(_1233) + int(_1289);
    float _1327 = in.m_53.w;
    int _1329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1331 = _1329 != 0;
    int _1333 = _1323 * _1325;
    int _1335 = _1333 + _1183;
    bool _1337 = _1129 > 0.5;
    bool _1339 = uint(_1335) >= uint(_740);
    float _1341 = -_728;
    float _1343 = _1341 + 1.0;
    if (_1225)
    {
        float _1345 = _1337 ? as_type<float>(_1267) : _1203;
        _1297 = _1345;
    }
    float _1347 = _1297;
    int _1349 = int(_1255) + int(_1315);
    bool _1351 = !_1339;
    int _1353 = _1351 ? 0 : (-1);
    if (_1331)
    {
        float _1355 = -_1203;
        float _1357 = _1355 + 1.0;
        _1299 = as_type<int>(_1357);
    }
    int _1359 = _1299;
    bool _1361 = _718 > 0.5;
    int _1363 = ~_1325;
    int _1365 = _1363 + _1353;
    int _1367 = _1365 + 1;
    int _1369 = _1309 * _1349;
    int _1371 = _1369 + _1221;
    if (_1331)
    {
        float _1373 = _1361 ? as_type<float>(_1359) : _1203;
        _1257 = _1373;
    }
    float _1375 = _1257;
    int _1377 = _1361 ? as_type<int>(_1343) : as_type<int>(_728);
    int _1379 = _740 * _1367;
    int _1381 = _1379 + _1183;
    bool _1383 = uint(_1371) >= uint(_768);
    float _1385 = float(uint(_1077));
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1389 = _1387 != 0;
    bool _1391 = _1327 > 0.5;
    float _1393 = as_type<float>(_802) * _1385;
    bool _1395 = !_1227;
    int _1397 = _1395 ? _1381 : (-1);
    float _1399 = _1389 ? as_type<float>(_1377) : _728;
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1403 = _1401 != 0;
    float _1405 = trunc(_1393);
    float _1407 = precise::max(_1405, 0.0);
    uint _1409 = uint(_1407);
    int _1411 = _1391 ? as_type<int>(_1343) : as_type<int>(_728);
    bool _1413 = !_1383;
    int _1415 = _1413 ? 0 : (-1);
    int _1417 = _1397 & 3;
    float _1419 = _1403 ? as_type<float>(_1411) : _728;
    int _1421 = ~_1349;
    int _1423 = _1421 + _1415;
    int _1425 = _1423 + 1;
    bool _1427 = uint(_1417) > 1u;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1431 = _1429 != 0;
    int _1433 = _768 * _1425;
    int _1435 = _1433 + _1221;
    int _1437 = _1397 & 3;
    bool _1439 = _1437 != 0;
    int _1441 = ~_740;
    int _1443 = _1441 + 1;
    bool _1445 = _768 == 0;
    int _1447 = _1439 ? 0 : 1;
    bool _1449 = !_1445;
    int _1451 = _1449 ? _1435 : (-1);
    int _1453 = ~_1447;
    int _1455 = _1453 + 1;
    int _1457 = _1455 + 1;
    float _1459 = float(uint(_1191));
    int _1461 = _1457;
    if (!_1427)
    {
        int _1463 = ~_1447;
        int _1465 = _1463 + 1;
        _1461 = _1465;
    }
    int _1467 = _1461;
    int _1469 = _1443 * int(_1409);
    int _1471 = _1469 + _1077;
    int _1473 = _1451 & 3;
    float _1475 = as_type<float>(_816) * _1459;
    if (_1431)
    {
        float _1477 = _1337 ? _1343 : _728;
        _837 = _1477;
    }
    float _1479 = _837;
    float _1481 = _710 * 2.0;
    bool _1483 = _1417 != 3;
    float _1485 = trunc(_1475);
    float _1487 = precise::max(_1485, 0.0);
    uint _1489 = uint(_1487);
    bool _1491 = uint(_1417) >= 2u;
    bool _1493 = uint(_1473) > 1u;
    float _1495 = float(uint(_1471));
    int _1497 = _1491 ? 0 : 1;
    float _1499 = floor(_1481);
    int _1501 = _1451 & 3;
    bool _1503 = _1501 != 0;
    float _1505 = _718 * 2.0;
    int _1507 = ~_1497;
    int _1509 = _1507 + 1;
    int _1511 = _1509 + 1;
    float _1513 = as_type<float>(_802) * _1495;
    int _1515 = _1503 ? 0 : 1;
    int _1517 = _1511;
    int _1519 = _1497;
    if (_1483)
    {
        int _1521 = ~_1497;
        int _1523 = _1521 + 1;
        _1517 = _1523;
    }
    int _1525 = _1517;
    float _1527 = floor(_1505);
    int _1529 = ~_1515;
    int _1531 = _1529 + 1;
    int _1533 = _1531 + 1;
    int _1535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1537 = _1535 != 0;
    int _1539 = _1533;
    if (!_1493)
    {
        int _1541 = ~_1515;
        int _1543 = _1541 + 1;
        _1539 = _1543;
    }
    int _1545 = _1539;
    bool _1547 = _1473 != 3;
    float _1549 = trunc(_1513);
    float _1551 = precise::max(_1549, 0.0);
    uint _1553 = uint(_1551);
    bool _1555 = !_1537;
    int _1557 = _1555 ? 0 : 1;
    bool _1559 = uint(_1473) >= 2u;
    int _1561 = ~_768;
    int _1563 = _1561 + 1;
    int _1565 = _1559 ? 0 : 1;
    bool _1567 = _1499 > 0.0;
    int _1569 = _1563 * int(_1489);
    int _1571 = _1569 + _1191;
    int _1573 = ~_1565;
    int _1575 = _1573 + 1;
    int _1577 = _1575 + 1;
    int _1579 = _1577;
    if (_1547)
    {
        int _1581 = ~_1565;
        int _1583 = _1581 + 1;
        _1579 = _1583;
    }
    int _1585 = _1579;
    if (_822)
    {
        _839 = 0;
    }
    int _1587 = _839;
    bool _1589 = _1527 >= 0.0;
    bool _1591 = isnan(_1527);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan(0.0);
    bool _1597 = _1593 || _1595;
    int _1599 = _1587;
    float _1601 = _1527;
    if (!_822)
    {
        _1599 = 1;
    }
    int _1603 = _1599;
    float _1605 = float(uint(_1571));
    bool _1607 = _1499 >= 0.0;
    bool _1609 = isnan(_1499);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan(0.0);
    bool _1615 = _1611 || _1613;
    float _1617 = _1597 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1619 = as_type<float>(_816) * _1605;
    bool _1621 = _1603 != 1;
    int _1623 = _1615 ? 0 : 1;
    float _1625 = trunc(_1619);
    float _1627 = precise::max(_1625, 0.0);
    uint _1629 = uint(_1627);
    float _1631 = _1617;
    float _1633 = _1619;
    if (_822)
    {
        _1519 = 0;
    }
    int _1635 = _1519;
    bool _1637 = _1527 > 0.0;
    int _1639 = _1635;
    if (!_822)
    {
        _1639 = 2;
    }
    int _1641 = _1639;
    int _1643 = ~_1623;
    int _1645 = _1643 + 1;
    int _1647 = _1645 + 1;
    int _1649 = _1647;
    if (!_1567)
    {
        int _1651 = ~_1623;
        int _1653 = _1651 + 1;
        _1649 = _1653;
    }
    int _1655 = _1649;
    bool _1657 = _1641 != 2;
    int _1659 = int(_1409) + int(_1553);
    int _1661 = ~_740;
    int _1663 = _1661 + 1;
    float _1665 = as_type<float>(_1553);
    if (!_1621)
    {
        _1601 = _718;
    }
    float _1667 = _1601;
    int _1669 = ~as_type<int>(_1617);
    int _1671 = _1669 + 1;
    int _1673 = _1671 + 1;
    int _1675 = _1663 * _1659;
    int _1677 = _1675 + _1077;
    int _1679 = _1673;
    float _1681 = _1667;
    if (!_1637)
    {
        int _1683 = ~as_type<int>(_1617);
        int _1685 = _1683 + 1;
        _1679 = _1685;
    }
    int _1687 = _1679;
    float _1689 = 0.0;
    if (!_1621)
    {
        _1689 = _1129;
    }
    float _1691 = _1689;
    float _1693 = 0.0;
    float _1695 = _1691;
    if (!_1621)
    {
        _1693 = _1667;
    }
    float _1697 = _1693;
    float _1699 = _1697;
    if (!_1621)
    {
        _1631 = _1129;
    }
    float _1701 = _1631;
    float _1703 = _1701;
    if (_1621)
    {
        _1699 = _710;
    }
    float _1705 = _1699;
    if (_1621)
    {
        _1681 = _710;
    }
    float _1707 = _1681;
    if (_1621)
    {
        _1695 = _718;
    }
    float _1709 = _1695;
    if (_1621)
    {
        _1703 = _718;
    }
    float _1711 = _1703;
    bool _1713 = uint(_1677) >= uint(_740);
    float _1715 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1717 = in.m_46.x;
    float _1719 = in.m_46.y;
    float _1721 = in.m_46.z;
    int _1723 = int(_1489) + int(_1629);
    int _1725 = ~_768;
    int _1727 = _1725 + 1;
    float _1729 = as_type<float>(_1629);
    if (_1657)
    {
        _1729 = _1129;
    }
    float _1731 = _1729;
    float _1733 = _1731;
    if (_1657)
    {
        _1665 = _710;
    }
    float _1735 = _1665;
    int _1737 = _1727 * _1723;
    int _1739 = _1737 + _1191;
    float _1741 = _1735;
    if (_1657)
    {
        _1633 = _718;
    }
    float _1743 = _1633;
    float _1745 = _1743;
    if (!_1657)
    {
        _1733 = _718;
    }
    float _1747 = _1733;
    if (!_1657)
    {
        _1741 = _1129;
    }
    float _1749 = _1741;
    if (!_1657)
    {
        _1745 = _710;
    }
    float _1751 = _1745;
    bool _1753 = uint(_1739) >= uint(_768);
    float _1755 = _710 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1757 = !_1713;
    int _1759 = _1757 ? 0 : (-1);
    int _1761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1763 = _1761 != 0;
    int _1765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1767 = _1765 != 0;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1771 = _1769 != 0;
    float _1773 = -_744;
    float _1775 = fma(_1755, 2.0, _1773);
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1779 = _1777 != 0;
    float _1781 = _1719 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1783 = _1719 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1785 = _1719 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1787 = _718 + _1129;
    bool _1789 = !_1753;
    int _1791 = _1789 ? 0 : (-1);
    float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1793;
    bool _1797 = _1193 >= 0.0;
    bool _1799 = isnan(_1193);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    float _1807 = _1787 + (-1.0);
    float _1809 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1781);
    float _1811 = _1795 * _835;
    float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1815 = _1813 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1817 = fma(_1807, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1819 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1783);
    float _1821 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1785);
    bool _1823 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1825 = isnan(_704);
    bool _1827 = _1823 || _1825;
    bool _1829 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1831 = _1827 || _1829;
    float _1833 = float(_1831);
    float _1835 = _710 + _718;
    int _1837 = _1805 ? 0 : 1;
    float _1839 = _1815 * _859;
    bool _1841 = _1193 > 0.0;
    float _1843 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1809);
    float _1845 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1819);
    float _1847 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1821);
    float _1849 = _1835 + (-1.0);
    float _1851 = -_1833;
    float _1853 = _1851 + 1.0;
    bool _1855 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1857 = isnan(_704);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    float _1867 = fma(_1839, _716, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1869 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1871 = _758 * _1853;
    float _1873 = -_758;
    float _1875 = _1873 + 1.0;
    float _1877 = fma(_1811, _722, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1881 = !_1767;
    int _1883 = _1881 ? 0 : 1;
    float _1885 = _1865 * _1875;
    float _1887 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1889 = !_1763;
    int _1891 = _1889 ? 0 : 1;
    float _1893 = _1845 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1895 = _1877 * _1885;
    float _1897 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1887);
    float _1899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1901 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1897);
    int _1903 = abs(_1891);
    float _1905 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1907 = _1843 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1909 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1911 = -_1865;
    float _1913 = _1911 + 1.0;
    float _1915 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1905);
    float _1917 = -_150;
    float _1919 = fma(_1917, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1775);
    float _1921 = -_780;
    float _1923 = fma(_1901, _1909, _1921);
    float _1925 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1895);
    float _1927 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1915);
    float _1929 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1931 = fma(_1867, _1871, _1925);
    float _1933 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1935 = fma(_1927, _1929, _1919);
    int _1937 = abs(_1883);
    float _1939 = _1879 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1941 = fma(_1833, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1931);
    float _1943 = float(_1655);
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1947 = float(_1937);
    float _1949 = fma(_1939, _1479, -0.5);
    float _1951 = _1899 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1953 = _1947 * _1943;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    int _1957 = ~_1837;
    int _1959 = _1957 + 1;
    int _1961 = _1959 + 1;
    float _1963 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1965 = _1961;
    if (!_1841)
    {
        int _1967 = ~_1837;
        int _1969 = _1967 + 1;
        _1965 = _1969;
    }
    int _1971 = _1965;
    float _1973 = -_1945;
    float _1975 = fma(_1933, 2.0, _1973);
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1979 = fma(_1951, _1375, -0.5);
    float _1981 = float(_1971);
    float _1983 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1955);
    float _1985 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1963);
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1989 = _1893 + _1987;
    float _1991 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1977);
    float _1993 = _1847 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1995 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1997 = _1907 + _1995;
    float _1999 = _1989 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2003 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2005 = float(_1903);
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2009 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2011 = _1993 + _2009;
    float _2013 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1999);
    float _2015 = _2001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2017 = _2003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2019 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2021 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2023 = _1705 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2025 = _2005 * _1981;
    float _2027 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2013);
    float _2029 = in.m_61.x;
    float _2031 = in.m_61.y;
    float _2033 = in.m_61.z;
    float _2035 = -_2021;
    float _2037 = fma(_2023, 2.0, _2035);
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2041 = !_1439;
    int _2043 = _2041 ? 0 : 1;
    float _2045 = _2025 * (-2.0);
    int _2047 = _1397 >> 31;
    float _2049 = _1941 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2051 = _2027 >= 0.0;
    float _2053 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1983);
    int _2055 = _1451 >> 31;
    float _2057 = fma(_1715, -2.0, _2039);
    int _2059 = _2047 & 3;
    float _2061 = _2053 * (-0.15915493667125701904296875);
    int _2063 = _2055 & 3;
    out.m_63.x = _2015;
    out.m_63.y = _2017;
    out.m_63.z = _2019;
    out.m_63.w = _2049;
    int _2065 = _1397 + _2059;
    float _2067 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1985);
    int _2069 = _1451 + _2063;
    float _2071 = fma(_1869, _2045, _1869);
    int _2073 = _2065 >> 2;
    float _2075 = _2061 * 6.283185482025146484375;
    float _2077 = sin(_2075);
    int _2079 = _2069 >> 2;
    float _2081 = _1751 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2083 = _2073 << 4;
    int _2085 = _2083 + 368;
    float _2087 = fma(_2045, _2029, _2029);
    int _2089 = _2079 << 4;
    int _2091 = _2089 + 512;
    float _2093 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _2095 = _2061 * 6.283185482025146484375;
    float _2097 = cos(_2095);
    uint _2099 = uint(int(uint(_2085) >> uint(2)));
    uint _2101 = uint(int(uint(int(_2099)) >> uint(2)));
    int _2103 = int(_2099) & 3;
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[int(_2101)][_2103];
    int _2107 = int(_2099) + 1;
    uint _2109 = uint(int(uint(_2107) >> uint(2)));
    int _2111 = _2107 & 3;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[int(_2109)][_2111];
    float _2115 = -_150;
    float _2117 = fma(_2115, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2037);
    float _2119 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2121 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1991);
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2125 = fma(_2081, -2.0, _2119);
    uint _2127 = uint(int(uint(_2091) >> uint(2)));
    uint _2129 = uint(int(uint(int(_2127)) >> uint(2)));
    int _2131 = int(_2127) & 3;
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[int(_2129)][_2131];
    int _2135 = int(_2127) + 1;
    uint _2137 = uint(int(uint(_2135) >> uint(2)));
    int _2139 = _2135 & 3;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[int(_2137)][_2139];
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2145 = fma(_2067, _2093, _2117);
    float _2147 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2123);
    float _2149 = _2077 * _1949;
    int _2151 = ~_1659;
    int _2153 = _2151 + _1759;
    int _2155 = _2153 + 1;
    float _2157 = -_150;
    float _2159 = fma(_2157, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1975);
    float _2161 = _2097 * _1949;
    int _2163 = _2085 + 8;
    uint _2165 = uint(int(uint(_2163) >> uint(2)));
    uint _2167 = uint(int(uint(int(_2165)) >> uint(2)));
    int _2169 = int(_2165) & 3;
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[int(_2167)][_2169];
    int _2173 = int(_2165) + 1;
    uint _2175 = uint(int(uint(_2173) >> uint(2)));
    int _2177 = _2173 & 3;
    float _2179 = (*spvDescriptorSet0.vp_c9)._m0[int(_2175)][_2177];
    float _2181 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2147);
    float _2183 = -_2149;
    float _2185 = fma(_2097, _1979, _2183);
    float _2187 = fma(_2077, _1979, _2161);
    float _2189 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    int _2191 = _740 * _2155;
    int _2193 = _2191 + _1077;
    int _2195 = ~_1723;
    int _2197 = _2195 + _1791;
    int _2199 = _2197 + 1;
    float _2201 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2143);
    int _2203 = _2091 + 8;
    uint _2205 = uint(int(uint(_2203) >> uint(2)));
    uint _2207 = uint(int(uint(int(_2205)) >> uint(2)));
    int _2209 = int(_2205) & 3;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[int(_2207)][_2209];
    int _2213 = int(_2205) + 1;
    uint _2215 = uint(int(uint(_2213) >> uint(2)));
    int _2217 = _2213 & 3;
    float _2219 = (*spvDescriptorSet0.vp_c9)._m0[int(_2215)][_2217];
    bool _2221 = !_1503;
    int _2223 = _2221 ? 0 : 1;
    float _2225 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2057);
    int _2227 = abs(_1545);
    int _2229 = _768 * _2199;
    int _2231 = _2229 + _1191;
    bool _2233 = _1417 != 3;
    float _2235 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2201);
    int _2237 = abs(_1467);
    float _2239 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2125);
    int _2241 = abs(_2223);
    float _2243 = -_2225;
    float _2245 = fma(_2121, _2189, _2243);
    float _2247 = fma(_2181, _2185, _2159);
    int _2249 = abs(_2043);
    float _2251 = -_2239;
    float _2253 = fma(_2235, _2187, _2251);
    int _2255 = abs(_1525);
    float _2257 = _2247 + 0.5;
    int _2259 = ~_2237;
    int _2261 = _2259 + 1;
    int _2263 = _2261 + 1;
    float _2265 = _2253 + 0.5;
    int _2267 = ~_2227;
    int _2269 = _2267 + 1;
    int _2271 = _2269 + 1;
    float _2273 = _2187;
    float _2275 = _2225;
    float _2277 = _2145;
    float _2279 = _2149;
    if (_2051)
    {
        out.m_49.x = 0.0;
    }
    int _2281 = ~_2249;
    int _2283 = _2281 + 1;
    int _2285 = _2283 + 1;
    int _2287 = _2263 * as_type<int>(_2113);
    int _2289 = ~_2241;
    int _2291 = _2289 + 1;
    int _2293 = _2291 + 1;
    out.m_65.x = _2257;
    out.m_65.y = _2265;
    bool _2295 = !_2233;
    int _2297 = _2295 ? 0 : (-1);
    int _2299 = _2285 * as_type<int>(_2105);
    int _2301 = _2299 + _2287;
    bool _2303 = _1473 != 3;
    bool _2305 = !_1779;
    int _2307 = _2305 ? 0 : 1;
    int _2309 = _2271 * as_type<int>(_2141);
    int _2311 = ~_2255;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    int _2317 = abs(_2307);
    int _2319 = _2293 * as_type<int>(_2133);
    int _2321 = _2319 + _2309;
    int _2323 = abs(_2297);
    int _2325 = abs(_1557);
    int _2327 = _2315 * as_type<int>(_2171);
    int _2329 = _2327 + _2301;
    bool _2331 = !_2303;
    int _2333 = _2331 ? 0 : (-1);
    int _2335 = abs(_1585);
    int _2337 = abs(_2333);
    int _2339 = ~_2323;
    int _2341 = _2339 + 1;
    int _2343 = _2341 + 1;
    int _2345 = ~_2335;
    int _2347 = _2345 + 1;
    int _2349 = _2347 + 1;
    bool _2351 = _768 == 0;
    int _2353 = _2343 * as_type<int>(_2179);
    int _2355 = _2353 + _2329;
    float _2357 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2359 = log2(_2357);
    int _2361 = _2349 * as_type<int>(_2211);
    int _2363 = _2361 + _2321;
    float _2365 = _1989 * _1989;
    int _2367 = ~_2325;
    int _2369 = _2367 + 1;
    int _2371 = _2369 + 1;
    int _2373 = ~_2337;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    float _2379 = fma(_1997, _1997, _2365);
    int _2381 = _2355 * _2371;
    bool _2383 = !_2351;
    int _2385 = _2383 ? _2231 : (-1);
    int _2387 = _2377 * as_type<int>(_2219);
    int _2389 = _2387 + _2363;
    int _2391 = ~_2317;
    int _2393 = _2391 + 1;
    int _2395 = _2393 + 1;
    float _2397 = fma(_2011, _2011, _2379);
    bool _2399 = _740 == 0;
    float _2401 = _2245 + 0.5;
    float _2403 = _2359 * _150;
    int _2405 = _2389 * _2395;
    bool _2407 = !_2399;
    int _2409 = _2407 ? _2193 : (-1);
    float _2411 = rsqrt(_2397);
    float _2413 = _1923 + 0.5;
    int _2415 = _2385 * _2317;
    int _2417 = _2415 + _2405;
    float _2419 = as_type<float>(_2405);
    if (_2051)
    {
        _2419 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2421 = _2419;
    int _2423 = _2409 * _2325;
    int _2425 = _2423 + _2381;
    float _2427 = _1935 + 0.5;
    float _2429 = _2145 + 0.5;
    float _2431 = exp2(_2403);
    int _2433 = as_type<int>(_2421);
    if (_2051)
    {
        float _2435 = _2421 * 5.0;
        _2433 = as_type<int>(_2435);
    }
    int _2437 = _2433;
    float _2439 = float(_2425);
    float _2441 = float(_2417);
    out.m_67.x = _2427;
    out.m_67.y = _2413;
    out.m_67.z = _2429;
    out.m_67.w = _2401;
    bool _2443 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2445 = isnan(0.0);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2451 = _2447 || _2449;
    if (_2051)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7650 = as_type<float>(_2437);
        out.gl_Position.z = _7650;
    }
    bool _2453 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2455 = isnan(1.0);
    bool _2457 = _2453 || _2455;
    bool _2459 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2461 = _2457 || _2459;
    float _2463 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2465 = 1.0 + _2463;
    bool _2467 = !_1771;
    int _2469 = _2467 ? 0 : 1;
    out.m_69.x = _2439;
    out.m_69.y = _2441;
    float _2471 = _1989 * _2411;
    float _2473 = _1997 * _2411;
    if (_2051)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2475 = -_2471;
    float _2477 = fma(_2475, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1893);
    float _2479 = _2011 * _2411;
    float _2481 = -_2473;
    float _2483 = fma(_2481, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1907);
    float _2485 = 1.0 / _2465;
    float _2487 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2489 = _2477 + _2487;
    float _2491 = -_2479;
    float _2493 = fma(_2491, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1993);
    float _2495 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2497 = _2483 + _2495;
    float _2499 = -_2431;
    float _2501 = _2499 + 1.0;
    float _2503 = _2489 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2505 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2507 = _2493 + _2505;
    float _2509 = _710 + (-0.5);
    float _2511 = -_2471;
    float _2513 = fma(_2511, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1989);
    float _2515 = fma(_2497, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2503);
    float _2517 = _2451 ? _2501 : 0.0;
    float _2519 = -_2473;
    float _2521 = fma(_2519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1997);
    float _2523 = _2513 * _2513;
    float _2525 = fma(_2507, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2515);
    float _2527 = fma(_2509, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2087);
    float _2529 = -_2479;
    float _2531 = fma(_2529, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2011);
    float _2533 = _2525;
    if (_2461)
    {
        float _2535 = _2517 * _2485;
        _154 = _2535;
    }
    float _2537 = _154;
    float _2539 = fma(_2521, _2521, _2523);
    bool _2541 = _2525 >= 0.0;
    float _2543 = _1953 * (-2.0);
    float _2545 = fma(_2071, _2537, _2527);
    float _2547 = fma(_2531, _2531, _2539);
    float _2549 = _718 + (-0.5);
    float _2551 = fma(_2543, _2031, _2031);
    float _2553 = _2545 * 0.15915493667125701904296875;
    float _2555 = sqrt(_2547);
    int _2557 = abs(_2469);
    float _2559 = fma(_2549, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2551);
    float _2561 = fma(_1817, _2543, _1817);
    float _2563 = float(_1687);
    if (_2541)
    {
        out.m_49.x = 0.0;
    }
    if (_2541)
    {
        _2533 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2565 = _2533;
    float _2567 = _2553 * 6.283185482025146484375;
    float _2569 = sin(_2567);
    float _2571 = float(_2557);
    float _2573 = fma(_2561, _2537, _2559);
    int _2575 = as_type<int>(_2565);
    if (_2541)
    {
        float _2577 = _2565 * 5.0;
        _2575 = as_type<int>(_2577);
    }
    int _2579 = _2575;
    float _2581 = _2571 * _2563;
    float _2583 = _2553 * 6.283185482025146484375;
    float _2585 = cos(_2583);
    if (_2541)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7877 = as_type<float>(_2579);
        out.gl_Position.z = _7877;
    }
    if (_2541)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2587 = -_1893;
    float _2589 = _2587 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2591 = -_1907;
    float _2593 = _2591 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2595 = -_1993;
    float _2597 = _2595 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2599 = _710 + _1129;
    float _2601 = _2589 * _2589;
    float _2603 = _1129 + (-0.5);
    float _2605 = _2573 * 0.15915493667125701904296875;
    float _2607 = _2599 + (-1.0);
    float _2609 = fma(_2593, _2593, _2601);
    float _2611 = _2581 * (-2.0);
    float _2613 = _2605 * 6.283185482025146484375;
    float _2615 = sin(_2613);
    float _2617 = fma(_2607, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2619 = fma(_2597, _2597, _2609);
    float _2621 = fma(_2611, _2033, _2033);
    float _2623 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2625 = fma(_2617, _2611, _2617);
    float _2627 = fma(_2603, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2621);
    float _2629 = rsqrt(_2619);
    float _2631 = in.m_71.x;
    float _2633 = in.m_71.y;
    float _2635 = in.m_71.z;
    bool _2637 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2639 = isnan(0.5);
    bool _2641 = _2637 || _2639;
    bool _2643 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2645 = _2641 || _2643;
    float _2647 = fma(_2625, _2537, _2627);
    float _2649 = _2411 * _2555;
    float _2651 = _2647 * 0.15915493667125701904296875;
    float _2653 = _2605 * 6.283185482025146484375;
    float _2655 = cos(_2653);
    float _2657 = _2569 * _2615;
    float _2659 = _2593 * _2629;
    float _2661 = _2597 * _2629;
    float _2663 = _2589 * _2629;
    float _2665 = _2651 * 6.283185482025146484375;
    float _2667 = sin(_2665);
    float _2669 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2671 = _2659 * _2669;
    float _2673 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2675 = _2661 * _2673;
    float _2677 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2679 = _2663 * _2677;
    float _2681 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2683 = -_2671;
    float _2685 = fma(_2661, _2681, _2683);
    float _2687 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2689 = -_2675;
    float _2691 = fma(_2663, _2687, _2689);
    float _2693 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2695 = -_2679;
    float _2697 = fma(_2659, _2693, _2695);
    float _2699 = _2651 * 6.283185482025146484375;
    float _2701 = cos(_2699);
    float _2703 = _2685 * _2685;
    float _2705 = _2585 * _2655;
    float _2707 = _2569 * _2655;
    float _2709 = fma(_2691, _2691, _2703);
    float _2711 = _650 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2713 = _2585 * _2615;
    float _2715 = fma(_2667, _2705, _2657);
    float _2717 = fma(_2697, _2697, _2709);
    float _2719 = fma(_2667, _2657, _2705);
    float _2721 = _654 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2723 = _2649 * _2623;
    float _2725 = _2649 * _2711;
    float _2727 = -_2713;
    float _2729 = fma(_2667, _2707, _2727);
    float _2731 = rsqrt(_2717);
    float _2733 = _2649 * _2721;
    float _2735 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2633);
    float _2737 = _2585 * _2701;
    float _2739 = _2655 * _2701;
    float _2741 = _2569 * _2701;
    float _2743 = _2615 * _2701;
    float _2745 = _2735 * _2733;
    float _2747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2631);
    float _2749 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2635);
    float _2751 = -_2707;
    float _2753 = fma(_2667, _2713, _2751);
    float _2755 = _2737 * _2745;
    float _2757 = _2747 * _2723;
    float _2759 = _2749 * _2725;
    float _2761 = -_2745;
    float _2763 = _2667 * _2761;
    float _2765 = _2741 * _2745;
    float _2767 = _2691 * _2731;
    float _2769 = _2685 * _2731;
    float _2771 = fma(_2715, _2757, _2755);
    float _2773 = _2697 * _2731;
    float _2775 = _2663 * _2767;
    float _2777 = fma(_2739, _2757, _2763);
    float _2779 = _2661 * _2769;
    float _2781 = fma(_2753, _2759, _2771);
    float _2783 = -_2775;
    float _2785 = fma(_2659, _2769, _2783);
    float _2787 = fma(_2729, _2757, _2765);
    float _2789 = -_2779;
    float _2791 = fma(_2663, _2773, _2789);
    float _2793 = fma(_2743, _2759, _2777);
    float _2795 = _2785 * _2781;
    float _2797 = fma(_2719, _2759, _2787);
    float _2799 = _2791 * _2781;
    float _2801 = fma(_2773, _2793, _2795);
    float _2803 = fma(_2767, _2793, _2799);
    float _2805 = fma(_2661, _2797, _2801);
    float _2807 = fma(_2659, _2797, _2803);
    float _2809 = _1993 + _2805;
    float _2811 = _1907 + _2807;
    float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2815 = _2809 + _2813;
    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2819 = _2811 + _2817;
    float _2821 = _2815 * _2815;
    float _2823 = fma(_2819, _2819, _2821);
    float _2825 = _2659 * _2773;
    float _2827 = sqrt(_2823);
    float _2829 = -_2825;
    float _2831 = fma(_2661, _2767, _2829);
    float _2833 = _2831 * _2781;
    float _2835 = fma(_2769, _2793, _2833);
    float _2837 = fma(_2663, _2797, _2835);
    bool _2839 = _2827 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2841 = _1893 + _2837;
    float _2843 = _2833;
    float _2845 = _2835;
    float _2847 = _2811;
    if (!_2839)
    {
        _2843 = _2809;
    }
    float _2849 = _2843;
    float _2851 = _2849;
    if (!_2839)
    {
        _2845 = _2841;
    }
    float _2853 = _2845;
    bool _2855 = !_2839;
    float _2857 = _2853;
    if (!_2855)
    {
        float _2859 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2863 = _2827 + _2861;
        float _2865 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2867 = rsqrt(_2823);
        float _2869 = _2863 * _2859;
        float _2871 = _2869 * 0.15915493667125701904296875;
        float _2873 = _2871 * 6.283185482025146484375;
        float _2875 = cos(_2873);
        float _2877 = _2871 * 6.283185482025146484375;
        float _2879 = sin(_2877);
        float _2881 = _2875 + (-1.0);
        float _2883 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2885 = fma(_2879, _2865, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2887 = fma(_2841, _2875, _2883);
        float _2889 = _2867 * _2885;
        float _2891 = fma(_2819, _2889, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2893 = fma(_2815, _2889, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2847 = _2891;
        _2857 = _2887;
        _2851 = _2893;
    }
    float _2895 = _2847;
    float _2897 = _2857;
    float _2899 = _2851;
    float _2901 = -_2473;
    float _2903 = fma(_2901, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2895);
    float _2905 = -_2471;
    float _2907 = fma(_2905, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2897);
    float _2909 = -_2479;
    float _2911 = fma(_2909, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2899);
    float _2913 = _2907;
    float _2915 = _2903;
    float _2917 = _2911;
    float _2919 = _2897;
    if (!_2645)
    {
        float _2921 = _2489 * _2489;
        float _2923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2925 = fma(_2497, _2497, _2921);
        float _2927 = -_1993;
        float _2929 = _2927 + _2899;
        float _2931 = fma(_2507, _2507, _2925);
        float _2933 = 1.0 / _2649;
        float _2935 = sqrt(_2931);
        float _2937 = precise::min(_2935, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2939 = _2937 * _2923;
        float _2941 = -_1907;
        float _2943 = _2941 + _2895;
        float _2945 = _2939 * _2933;
        float _2947 = -_1893;
        float _2949 = _2947 + _2897;
        float _2951 = fma(_2943, _2945, _2483);
        float _2953 = fma(_2949, _2945, _2477);
        float _2955 = fma(_2929, _2945, _2493);
        _2913 = _2953;
        _2915 = _2951;
        _2917 = _2955;
    }
    float _2957 = _2913;
    float _2959 = _2915;
    float _2961 = _2917;
    float _2963 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2965 = _2957 + _2963;
    float _2967 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2969 = _2959 + _2967;
    float _2971 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2973 = _2961 + _2971;
    float _2975 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2977 = _2965 * _2965;
    float _2979 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2975);
    float _2981 = fma(_2969, _2969, _2977);
    float _2983 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2979);
    float _2985 = fma(_2973, _2973, _2981);
    float _2987 = _2983 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2989 = rsqrt(_2985);
    float _2991 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2993 = _2969 * _2991;
    float _2995 = _2973 * _2991;
    float _2997 = _2993 * _2993;
    float _2999 = _2995 * _2995;
    float _3001 = _2997 + _2999;
    float _3003 = sqrt(_3001);
    bool _3005 = _3003 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3009 = _3003 + _3007;
    float _3011 = _2973;
    float _3013 = _3001;
    float _3015 = _3009;
    float _3017 = _2991;
    float _3019 = _2995;
    if (_3005)
    {
        float _3021 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3011 = _3021;
    }
    float _3023 = _3011;
    if (_3005)
    {
        float _3025 = rsqrt(_3001);
        _3013 = _3025;
    }
    float _3027 = _3013;
    float _3029 = _3027;
    if (_3005)
    {
        float _3031 = _3009 * _3023;
        _3015 = _3031;
    }
    float _3033 = _3015;
    if (_3005)
    {
        float _3035 = _3033 * 0.15915493667125701904296875;
        _2919 = _3035;
    }
    float _3037 = _2919;
    float _3039 = _2479;
    float _3041 = _3037;
    if (_3005)
    {
        float _3043 = _3037 * 6.283185482025146484375;
        float _3045 = sin(_3043);
        _3039 = _3045;
    }
    float _3047 = _3039;
    float _3049 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3051 = precise::max(0.0, _3049);
    float _3053 = _2989;
    float _3055 = _3051;
    float _3057 = _3049;
    if (_3005)
    {
        float _3059 = _3037 * 6.283185482025146484375;
        float _3061 = cos(_3059);
        _3053 = _3061;
    }
    float _3063 = _3053;
    float _3065 = -_2991;
    float _3067 = -_3051;
    float _3069 = fma(_2965, _3065, _3067);
    float _3071 = _3069;
    if (_3005)
    {
        float _3073 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3055 = _3073;
    }
    float _3075 = _3055;
    float _3077 = _3075;
    if (!_3005)
    {
        _3041 = _2999;
    }
    float _3079 = _3041;
    float _3081 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3083 = _3047;
    float _3085 = _3079;
    if (_3005)
    {
        float _3087 = fma(_3047, _3075, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3083 = _3087;
    }
    float _3089 = _3083;
    float _3091 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3081);
    float _3093 = _3089;
    if (_3005)
    {
        float _3095 = _3063 + (-1.0);
        _3057 = _3095;
    }
    float _3097 = _3057;
    if (_3005)
    {
        float _3099 = _3027 * _3089;
        _3017 = _3099;
    }
    float _3101 = _3017;
    if (!_3005)
    {
        _3093 = _2993;
    }
    float _3103 = _3093;
    float _3105 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3091);
    float _3107 = _3103;
    if (_3005)
    {
        float _3109 = _3097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3077 = _3109;
    }
    float _3111 = _3077;
    if (_3005)
    {
        float _3113 = _2993 * _3101;
        _3107 = _3113;
    }
    float _3115 = _3107;
    float _3117 = sqrt(_2985);
    if (!_3005)
    {
        _3029 = _2997;
    }
    float _3119 = _3029;
    float _3121 = _3119;
    if (_3005)
    {
        float _3123 = fma(_3069, _3063, _3111);
        _3071 = _3123;
    }
    float _3125 = _3071;
    if (_3005)
    {
        float _3127 = _2995 * _3101;
        _3019 = _3127;
    }
    float _3129 = _3019;
    if (_3005)
    {
        float _3131 = _3115 * _3115;
        _3121 = _3131;
    }
    float _3133 = _3121;
    float _3135 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_3005)
    {
        float _3137 = _3129 * _3129;
        _3085 = _3137;
    }
    float _3139 = _3085;
    float _3141 = fma(_3125, _3125, _3133);
    float _3143 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3135);
    float _3145 = fma(_2483, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3147 = _3141 + _3139;
    float _3149 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3143);
    float _3151 = _3105 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3153 = floor(_3145);
    float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3157 = fma(_3117, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3155);
    float _3159 = precise::clamp(_3157, 0.0, 1.0);
    float _3161 = _3149 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3163 = _3151 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3165 = -_3159;
    float _3167 = _3165 + 1.0;
    float _3169 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3171 = rsqrt(_3147);
    float _3173 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3175 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3177 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3179 = fma(_2959, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3175);
    float _3181 = -_3169;
    float _3183 = fma(_3181, _3177, 1.0);
    float _3185 = abs(_3167);
    float _3187 = log2(_3185);
    float _3189 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3179);
    float _3191 = _3189 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3193 = _3171 * _3115;
    float _3195 = _3171 * _3125;
    float _3197 = _3171 * _3129;
    float _3199 = floor(_3173);
    float _3201 = _3193 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3203 = _3151 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3205 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3163);
    float _3207 = -_3201;
    float _3209 = fma(_3195, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3207);
    float _3211 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3203);
    float _3213 = _3187 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3215 = log2(_3183);
    float _3217 = -_3197;
    float _3219 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3209);
    float _3221 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3211);
    float _3223 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3205);
    float _3225 = fma(_3219, -0.5, 0.5);
    float _3227 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3221);
    float _3229 = fma(_3219, 0.5, 0.5);
    float _3231 = exp2(_3213);
    float _3233 = -_3153;
    float _3235 = _3145 + _3233;
    float _3237 = _3151 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3239 = _3195 + 1.0;
    float _3241 = -_3199;
    float _3243 = _3173 + _3241;
    float _3245 = fma(_3229, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3247 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3237);
    float _3249 = 1.0 / _3227;
    float _3251 = fma(_3229, _3245, -0.212114393711090087890625);
    float _3253 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3247);
    float _3255 = fma(_3229, _3251, 1.570728778839111328125);
    float _3257 = sqrt(_3225);
    float _3259 = -_3195;
    float _3261 = fma(_3231, _3239, _3259);
    float _3263 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3253);
    float _3265 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3223);
    float _3267 = _3215 * 0.693147182464599609375;
    float _3269 = fma(_3261, 0.5, 0.5);
    float _3271 = _3263 * _3249;
    float _3273 = _3265 * _3249;
    float _3275 = _3267 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3277 = fma(_3271, 0.5, 0.5);
    float _3279 = fma(_3273, -0.5, 0.5);
    float _3281 = _3257 * 0.636619746685028076171875;
    float2 _8990 = float2(_3235, _3243);
    float _3283 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8990, float2(0.0), isnan(_8990)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8990, float2(0.0), isnan(_8990)), level(0.0)).x;
    float3 _9001 = float3(_3277, _3279, _3275);
    float _3285 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9001, float3(0.0), isnan(_9001)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9001, float3(0.0), isnan(_9001)), level(0.0)).x;
    float _3287 = -_3255;
    float _3289 = fma(_3281, _3287, 1.0);
    float3 _9017 = float3(_3277, _3279, _3275);
    float4 _3292 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9017, float3(0.0), isnan(_9017)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9017, float3(0.0), isnan(_9017)), level(0.0)).xyzw;
    float _3294 = _3292.x;
    float _3296 = _3292.y;
    float _3298 = _3292.z;
    float _3300 = _3292.w;
    float2 _9033 = float2(_3289, _3269);
    float3 _3304 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9033, float2(0.0), isnan(_9033)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9033, float2(0.0), isnan(_9033)), level(0.0)).xyz;
    float _3306 = _3304.x;
    float _3308 = _3304.y;
    float _3310 = _3304.z;
    float _3312 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3314 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3316 = _2633 != 0.0;
    bool _3318 = isnan(_2633);
    bool _3320 = _3316 || _3318;
    bool _3322 = isnan(0.0);
    bool _3324 = _3320 || _3322;
    float _3326 = _3187 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3328 = fma(_2483, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3312);
    float _3330 = fma(_2483, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3314);
    bool _3332 = _2631 == 0.0;
    bool _3334 = !_3324;
    bool _3336 = _3332 && _3334;
    float _3338 = _3151 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3340 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3328);
    float _3342 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3330);
    float _3344 = in.m_73.x;
    float _3346 = in.m_73.y;
    float _3348 = in.m_73.z;
    bool _3350 = _2635 == 0.0;
    bool _3352 = _3350 && _3336;
    float _3354 = _3340 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3356 = _3342 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3358 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3360 = isnan(0.5);
    bool _3362 = _3358 || _3360;
    bool _3364 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3366 = _3362 || _3364;
    float _3368 = exp2(_3326);
    float _3370 = _3356 + _3354;
    float _3372 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3338);
    out.m_75.x = _2959;
    out.m_75.y = _2957;
    out.m_75.z = _2961;
    float _3374 = 1.0 / _3354;
    float _3376 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3372);
    float _3378 = _3265;
    float _3380 = _3263;
    if (!_3366)
    {
        _2273 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _3382 = _2273;
    float _3384 = -_3368;
    float _3386 = _3384 + 1.0;
    float _3388 = _3344;
    float _3390 = _3348;
    if (_3352)
    {
        _2275 = _3344;
    }
    float _3392 = _2275;
    float _3394 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3396 = _3392;
    if (_3352)
    {
        _2277 = _3346;
    }
    float _3398 = _2277;
    float _3400 = _3398;
    if (_3352)
    {
        _2279 = _3348;
    }
    float _3402 = _2279;
    float _3404 = _3370 * _3374;
    float _3406 = _3404 * 0.5;
    float _3408 = in.m_77.x;
    float _3410 = in.m_77.y;
    float _3412 = in.m_77.z;
    float _3414 = in.m_77.w;
    float _3416 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3418 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3416);
    float _3420 = 1.0 / _3418;
    float _3422 = _3418;
    float _3424 = _3402;
    if (_3352)
    {
        _3422 = _3392;
    }
    float _3426 = _3422;
    float _3428 = _3426;
    if (!_3352)
    {
        _3396 = _3344;
    }
    float _3430 = _3396;
    if (_3352)
    {
        _3388 = _3398;
    }
    float _3432 = _3388;
    float _3434 = _3432;
    if (!_3352)
    {
        _3400 = _3346;
    }
    float _3436 = _3400;
    float _3438 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3440 = _3420 * _3438;
    float _3442 = _3436;
    if (!_3352)
    {
        float _3444 = fma(_2631, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3430);
        _3428 = _3444;
    }
    float _3446 = _3428;
    float _3448 = _3412 * _3430;
    float _3450 = abs(_3440);
    float _3452 = log2(_3450);
    if (!_3352)
    {
        float _3454 = fma(_2633, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3436);
        _3434 = _3454;
    }
    float _3456 = _3434;
    float _3458 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3460 = _3452;
    if (_3352)
    {
        _3460 = _3402;
    }
    float _3462 = _3460;
    float _3464 = _3462;
    if (!_3352)
    {
        _3424 = _3348;
    }
    float _3466 = _3424;
    float _3468 = exp2(_3458);
    if (!_3366)
    {
        float _3470 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3472 = _3382 + _3470;
        _3390 = _3472;
    }
    float _3474 = _3390;
    float _3476 = _3408 * _3436;
    float _3478 = _3410 * _3466;
    if (!_3352)
    {
        float _3480 = fma(_2635, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3466);
        _3464 = _3480;
    }
    float _3482 = _3464;
    float _3484 = -_3476;
    float _3486 = fma(_3410, _3430, _3484);
    float _3488 = -_3448;
    float _3490 = fma(_3408, _3466, _3488);
    float _3492 = _3474;
    if (!_3366)
    {
        float _3494 = 1.0 / _3474;
        _3492 = _3494;
    }
    float _3496 = _3492;
    float _3498 = -_3478;
    float _3500 = fma(_3412, _3436, _3498);
    if (_3366)
    {
        _3442 = 1.0;
    }
    float _3502 = _3442;
    float _3504 = _2715 * _2791;
    float _3506 = _3490 * _3414;
    bool _3508 = _3117 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3510 = isnan(_3117);
    bool _3512 = _3508 || _3510;
    bool _3514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3516 = _3512 || _3514;
    float _3518 = fma(_3468, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3520 = precise::clamp(_3518, 0.0, 1.0);
    float _3522 = _3468;
    float _3524 = _3502;
    if (!_3366)
    {
        float _3526 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3528 = _3440 + _3526;
        _3522 = _3528;
    }
    float _3530 = _3522;
    float _3532 = fma(_3520, -2.0, 3.0);
    float _3534 = _3520 * _3520;
    float _3536 = _3500 * _3414;
    float _3538 = _3486 * _3414;
    if (!_3366)
    {
        float _3540 = _3530 * _3496;
        float _3542 = precise::clamp(_3540, 0.0, 1.0);
        _3524 = _3542;
    }
    float _3544 = _3524;
    float _3546 = _3534 * _3532;
    float _3548 = _2715 * _2831;
    float _3550 = _2715 * _2785;
    float _3552 = _2737 * _2791;
    float _3554 = _2737 * _2831;
    float _3556 = _2737 * _2785;
    float _3558 = _2753 * _2791;
    float _3560 = _2753 * _2785;
    float _3562 = _2753 * _2831;
    float _3564 = fma(_2739, _2767, _3504);
    float _3566 = fma(_2739, _2769, _3548);
    float _3568 = fma(_2739, _2773, _3550);
    float _3570 = -_2667;
    float _3572 = fma(_3570, _2767, _3552);
    float _3574 = -_2667;
    float _3576 = fma(_3574, _2769, _3554);
    float _3578 = -_3546;
    float _3580 = _3578 + 1.0;
    float _3582 = -_2667;
    float _3584 = fma(_3582, _2773, _3556);
    float _3586 = fma(_2743, _2767, _3558);
    float _3588 = fma(_2741, _2659, _3572);
    float _3590 = fma(_3580, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3546);
    float _3592 = fma(_2743, _2769, _3562);
    float _3594 = fma(_2743, _2773, _3560);
    float _3596 = fma(_2729, _2663, _3566);
    float _3598 = fma(_2741, _2663, _3576);
    bool _3600 = _3440 <= 8000.0;
    bool _3602 = isnan(_3440);
    bool _3604 = _3600 || _3602;
    bool _3606 = isnan(8000.0);
    bool _3608 = _3604 || _3606;
    float _3610 = float(_3608);
    float _3612 = fma(_2741, _2661, _3584);
    float _3614 = fma(_2729, _2659, _3564);
    float _3616 = _3588 * _3410;
    float _3618 = fma(_2729, _2661, _3568);
    float _3620 = fma(_2719, _2659, _3586);
    float _3622 = fma(_2719, _2663, _3592);
    float _3624 = fma(_2719, _2661, _3594);
    float _3626 = _3598 * _3410;
    float _3628 = _3612 * _3410;
    float _3630 = _3588 * _3456;
    float _3632 = _3598 * _3456;
    float _3634 = _3612 * _3456;
    float _3636 = _3506 * _3598;
    float _3638 = fma(_3614, _3408, _3616);
    float _3640 = _3506 * _3588;
    float _3642 = _3506 * _3612;
    float _3644 = fma(_3596, _3408, _3626);
    float _3646 = fma(_3618, _3408, _3628);
    float _3648 = fma(_3536, _3596, _3636);
    float _3650 = fma(_3620, _3412, _3638);
    float _3652 = fma(_3614, _3446, _3630);
    float _3654 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3376);
    float _3656 = fma(_3536, _3614, _3640);
    float _3658 = fma(_3536, _3618, _3642);
    float _3660 = fma(_3622, _3412, _3644);
    float _3662 = fma(_3624, _3412, _3646);
    float _3664 = fma(_3538, _3622, _3648);
    float _3666 = _3654 + _3227;
    float _3668 = _3263 + _3227;
    float _3670 = _3227 * 0.5;
    float _3672 = fma(_3596, _3446, _3632);
    float _3674 = fma(_3538, _3620, _3656);
    float _3676 = _3666 * 0.5;
    float _3678 = _3668 * 0.5;
    float _3680 = fma(_3265, -0.5, _3670);
    float _3682 = fma(_3538, _3624, _3658);
    float _3684 = fma(_3618, _3446, _3634);
    float _3686 = in.m_79.x;
    float _3688 = _3610 * _3590;
    float _3690 = fma(_3620, _3482, _3652);
    float _3692 = fma(_3622, _3482, _3672);
    out.m_81.x = _3678;
    out.m_81.y = _3680;
    out.m_81.z = _3676;
    out.m_81.w = _3227;
    float _3694 = fma(_3624, _3482, _3684);
    float _3696 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _3674;
    out.m_83.y = _3664;
    out.m_83.z = _3682;
    out.m_85.x = _3650;
    out.m_85.y = _3660;
    out.m_85.z = _3662;
    out.m_87.x = _3690;
    out.m_87.y = _3692;
    out.m_87.z = _3694;
    float _3698 = -_3394;
    float _3700 = _3698 + 1.0;
    out.gl_Position.x = _3263;
    out.gl_Position.y = _3265;
    out.gl_Position.z = _3654;
    out.gl_Position.w = _3227;
    float _3702 = _3664;
    float _3704 = _3700;
    if (!_3516)
    {
        _3702 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3706 = _3702;
    float _3708 = _3544 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3710 = _3706;
    float _3712 = _3706;
    if (!_3516)
    {
        _3378 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3714 = _3378;
    float _3716 = _3714;
    float _3718 = _3714;
    if (!_3516)
    {
        _3380 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3720 = _3380;
    float _3722 = -_3283;
    float _3724 = _3722 + 1.0;
    float _3726 = _3394 * _3285;
    float _3728 = _3724 * _3696;
    float _3730 = precise::clamp(_3728, 0.0, 1.0);
    float _3732 = _3300 * _3726;
    float _3734 = _3300 * _3700;
    float _3736 = _3720;
    float _3738 = _3720;
    if (!_3516)
    {
        _3704 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3740 = _3704;
    float _3742 = -_3730;
    float _3744 = fma(_3742, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3746 = _3310 * _3726;
    float _3748 = fma(_3306, _3732, _3294);
    float _3750 = fma(_3308, _3732, _3296);
    float _3752 = _3744 * _3686;
    float _3754 = fma(_3300, _3746, _3298);
    float _3756 = _3752 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3758 = _3752;
    float _3760 = _3756;
    float _3762 = _3740;
    float _3764 = _3740;
    if (!_3516)
    {
        _3758 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3766 = _3758;
    out.m_89.x = _3748;
    out.m_89.y = _3750;
    out.m_89.z = _3754;
    out.m_89.w = _3734;
    out.m_91.x = _3756;
    float _3768 = _3766;
    float _3770 = _3766;
    if (!_3516)
    {
        _3760 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3772 = _3760;
    bool _3774 = !_3516;
    float _3776 = _3772;
    float _3778 = _3772;
    if (!_3774)
    {
        bool _3780 = _3117 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3782 = isnan(_3117);
        bool _3784 = _3780 || _3782;
        bool _3786 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3788 = _3784 || _3786;
        if (!_3788)
        {
            float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3792 = _3117 + _3790;
            float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3796 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3794;
            float _3798 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3800 = _3798 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3802 = 1.0 / _3796;
            float _3804 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3806 = _3804 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3810 = _3808 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3814 = _3812 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3816 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3818 = _3816 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3820 = _3792 * _3802;
            float _3822 = precise::clamp(_3820, 0.0, 1.0);
            float _3824 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3826 = _3824 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3828 = fma(_3822, _3800, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3830 = fma(_3822, _3826, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3832 = fma(_3822, _3806, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3834 = fma(_3822, _3810, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3836 = fma(_3822, _3814, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3838 = fma(_3822, _3818, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3738 = _3832;
            _3712 = _3836;
            _3718 = _3828;
            _3764 = _3834;
            _3770 = _3830;
            _3778 = _3838;
            _3840 = true;
        }
        else
        {
            bool _3842 = _3117 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3844 = isnan(_3117);
            bool _3846 = _3842 || _3844;
            bool _3848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3850 = _3846 || _3848;
            if (!_3850)
            {
                _3716 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3852 = _3716;
            _3718 = _3852;
            if (!_3850)
            {
                _3736 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3854 = _3736;
            _3738 = _3854;
            if (!_3850)
            {
                _3768 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3856 = _3768;
            _3770 = _3856;
            if (!_3850)
            {
                _3762 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3858 = _3762;
            _3764 = _3858;
            if (!_3850)
            {
                _3710 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3860 = _3710;
            _3712 = _3860;
            if (!_3850)
            {
                _3776 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3862 = _3776;
            bool _3864 = !_3850;
            _3778 = _3862;
            if (!_3864)
            {
                bool _3866 = _3117 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3868 = isnan(_3117);
                bool _3870 = _3866 || _3868;
                bool _3872 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3874 = _3870 || _3872;
                if (!_3874)
                {
                    float _3876 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3878 = _3117 + _3876;
                    float _3880 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3882 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3880;
                    float _3884 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3886 = _3884 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3888 = 1.0 / _3882;
                    float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3892 = _3890 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3896 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3902 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3904 = _3902 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3906 = _3878 * _3888;
                    float _3908 = precise::clamp(_3906, 0.0, 1.0);
                    float _3910 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3912 = _3910 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3914 = fma(_3908, _3886, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3916 = fma(_3908, _3912, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3918 = fma(_3908, _3892, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3920 = fma(_3908, _3896, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3922 = fma(_3908, _3900, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3924 = fma(_3908, _3904, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3738 = _3918;
                    _3712 = _3922;
                    _3718 = _3914;
                    _3764 = _3920;
                    _3770 = _3916;
                    _3778 = _3924;
                    _3840 = true;
                }
                else
                {
                    _3738 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3712 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3718 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3764 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3770 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3778 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3840 = false;
    float _3926 = _3738;
    float _3928 = _3712;
    float _3930 = _3718;
    float _3932 = _3764;
    float _3934 = _3770;
    float _3936 = _3778;
    float _3938 = fma(_3692, -0.5, 0.5);
    float _3940 = precise::clamp(_3938, 0.0, 1.0);
    float _3942 = -_3926;
    float _3944 = _3942 + _3928;
    float _3946 = _3708 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3948 = -_3930;
    float _3950 = _3948 + _3932;
    float _3952 = fma(_3940, _3944, _3926);
    out.m_93.x = 0.0;
    float _3954 = -_3934;
    float _3956 = _3954 + _3936;
    float _3958 = fma(_3940, _3950, _3930);
    float _3960 = _3952 * 0.586610972881317138671875;
    out.m_49.x = _3946;
    bool _3962 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3964 = fma(_3940, _3956, _3934);
    float _3966 = fma(_3958, 0.298911988735198974609375, _3960);
    bool _3968 = _3544 > 0.0;
    bool _3970 = isnan(_3544);
    bool _3972 = _3968 || _3970;
    bool _3974 = isnan(0.0);
    bool _3976 = _3972 || _3974;
    float _3978 = fma(_3964, 0.114477999508380889892578125, _3966);
    float _3980 = -_3978;
    float _3982 = _3958 + _3980;
    float _3984 = -_3978;
    float _3986 = _3952 + _3984;
    float _3988 = -_3978;
    float _3990 = _3964 + _3988;
    float _3992 = fma(_3982, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3978);
    float _3994 = fma(_3986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3978);
    float _3996 = fma(_3990, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3978);
    bool _3998 = !_3962;
    if (!_3998)
    {
        float _4000 = -_2957;
        float _4002 = _4000 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4004 = -_2959;
        float _4006 = _4004 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4008 = -_2961;
        float _4010 = _4008 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4012 = _4002 * _4002;
        float _4014 = fma(_4006, _4006, _4012);
        float _4016 = fma(_4010, _4010, _4014);
        float _4018 = sqrt(_4016);
        float _4020 = rsqrt(_4016);
        float _4022 = -_4018;
        float _4024 = _4022 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4026 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4028 = precise::clamp(_4026, 0.0, 1.0);
        float _4030 = _4006 * _4020;
        float _4032 = _4002 * _4020;
        float _4034 = abs(_4028);
        float _4036 = log2(_4034);
        float _4038 = _4010 * _4020;
        float _4040 = _4030 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4042 = _3692 * _4032;
        float _4044 = -_4032;
        float _4046 = -_4040;
        float _4048 = fma(_4044, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4046);
        float _4050 = fma(_3690, _4030, _4042);
        float _4052 = -_4038;
        float _4054 = fma(_4052, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4048);
        float _4056 = fma(_3694, _4038, _4050);
        float _4058 = precise::clamp(_4056, 0.0, 1.0);
        float _4060 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4062 = _4054 + _4060;
        float _4064 = _4036 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4066 = _4062 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4068 = precise::clamp(_4066, 0.0, 1.0);
        float _4070 = exp2(_4064);
        float _4072 = _4070 * _4068;
        float _4074 = _4058 * _4072;
        float _4076 = _4074 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4078 = _4074 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4080 = _4074 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _4076;
        out.m_93.y = _4078;
        out.m_93.z = _4080;
    }
    out.m_95.x = _3992;
    out.m_95.y = _3994;
    out.m_95.z = _3996;
    if (_3976)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4082 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4082;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

