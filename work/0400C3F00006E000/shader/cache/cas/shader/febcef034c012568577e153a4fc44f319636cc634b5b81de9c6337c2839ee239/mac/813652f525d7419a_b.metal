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
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_69 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2449 = false;
    bool _1748 = false;
    bool _466 = false;
    bool _306 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2748 = as_type<float>(_126);
        out.gl_Position.z = _2748;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = _144;
    if (_140)
    {
        float _148 = float(_110);
        _120 = _148;
    }
    float _150 = _120;
    bool _152 = _144 >= _150;
    bool _154 = !_140;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2818 = as_type<float>(_164);
        out.gl_Position.z = _2818;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    bool _218 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _220 = isnan(_196);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -_212;
    float _232 = _230 + 1.0;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    float _238 = 1.0 / _216;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _242 = _228 * _232;
    float _244 = -_228;
    float _246 = _244 + 1.0;
    float _248 = _200 * _238;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _250;
    float _254 = fma(_236, _248, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _256;
    float _260 = fma(_252, _248, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _262 = _254 * _242;
    float _264 = fma(_258, _248, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _266 = _260 * _242;
    float _268 = _264 * _242;
    float _270 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].x, _262);
    float _272 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].y, _268);
    float _274 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].z, _266);
    float _276 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].x, _270);
    float _278 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].y, _272);
    float _280 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].z, _274);
    bool _282 = !_240;
    float _284 = _276;
    float _286 = _278;
    float _304;
    if (!_282)
    {
        float _288 = in.m_55.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        float _308 = float(_110);
        float _310 = 1.0 / _308;
        float _312 = _144 * _310;
        _304 = _312;
    }
    _306 = false;
    float _314 = _304;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _318 = _314 + _316;
    float _320 = in.m_57.x;
    float _322 = in.m_57.y;
    float _324 = in.m_57.z;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _330 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _332 = isnan(_314);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _346 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _348 = isnan(_314);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _358;
    bool _362 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _364 = isnan(_314);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = 1.0 / _328;
    float _376 = -_340;
    float _378 = _376 + 1.0;
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _382 = _356 * _378;
    float _384 = -_356;
    float _386 = _384 + 1.0;
    float _388 = 1.0 / _344;
    float _390 = _360 * _374;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _396 = _280 * _324;
    float _398 = fma(_390, _318, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _400 = _394 * _388;
    float _402 = _398 * _382;
    float _404 = -_372;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _410 = _314 + _408;
    float _412 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[115].x, _402);
    float _414 = _340 * _406;
    float _416 = fma(_400, _410, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _420 = fma(_416, _414, _412);
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _424 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[117].x, _420);
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _430 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _426 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _434 = _278 * _322;
    float _436 = _428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _276 * _320;
    out.m_59.x = _424;
    out.m_59.y = _436;
    out.m_59.z = _430;
    out.m_59.w = _432;
    bool _440 = !_380;
    int _442 = as_type<int>(_436);
    int _444 = as_type<int>(_424);
    float _446 = _320;
    float _464;
    if (!_440)
    {
        float _448 = in.m_55.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        float _468 = float(_110);
        float _470 = 1.0 / _468;
        float _472 = _144 * _470;
        _464 = _472;
    }
    _466 = false;
    float _474 = _464;
    float _476 = in.m_55.z;
    float _478 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _480 = log2(_478);
    float _482 = in.m_55.y;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _486 = _484 != 0;
    float _488 = in.m_55.w;
    float _490 = in.m_61.y;
    float _492 = 0.0;
    if (_486)
    {
        float _494 = in.m_55.x;
        _492 = _494;
    }
    float _496 = _492;
    float _498 = _490;
    if (_486)
    {
        _442 = 0;
        _444 = 0;
    }
    int _500 = _442;
    int _502 = _444;
    float _504 = _476 * 2.0;
    bool _506 = _476 > 0.5;
    float _508 = _482 * 2.0;
    float _510 = floor(_504);
    bool _512 = _482 > 0.5;
    bool _514 = _488 > 0.5;
    int _516 = _500;
    int _518 = _502;
    if (_486)
    {
        _284 = _482;
    }
    float _520 = _284;
    float _522 = -_490;
    float _524 = _522 + 1.0;
    float _526 = floor(_508);
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _538 = _536 != 0;
    int _540 = _506 ? as_type<int>(_524) : as_type<int>(_490);
    int _542 = _514 ? as_type<int>(_524) : as_type<int>(_490);
    int _544 = _512 ? as_type<int>(_524) : as_type<int>(_490);
    float _546 = _534 ? as_type<float>(_542) : _490;
    float _548 = _530 ? as_type<float>(_544) : _490;
    float _550 = _538 ? as_type<float>(_540) : _490;
    float _552 = _496;
    float _554 = _520;
    if (_486)
    {
        _446 = _496;
    }
    float _556 = _446;
    float _558 = _556;
    if (!_486)
    {
        float _560 = in.m_55.x;
        float _562 = _482 * 3.1415927410125732421875;
        float _564 = _562 * 0.15915493667125701904296875;
        float _566 = _564 * 6.283185482025146484375;
        float _568 = sin(_566);
        float _570 = _560 * 3.1415927410125732421875;
        float _572 = _570 * 0.15915493667125701904296875;
        float _574 = _572 * 6.283185482025146484375;
        float _576 = sin(_574);
        _552 = _560;
        _558 = _576;
        _516 = 1;
        _518 = 2;
        _554 = _568;
    }
    float _578 = _552;
    float _580 = _558;
    int _582 = _516;
    int _584 = _518;
    float _586 = _554;
    float _588 = _578 * 2.0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _592 = _590 != 0;
    float _594 = _480 * _144;
    float _596 = _578 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _598 = _592 ? as_type<float>(_540) : _490;
    float _600 = floor(_588);
    bool _602 = _510 >= 0.0;
    bool _604 = isnan(_510);
    bool _606 = _602 || _604;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    float _612 = _580 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _614 = _482 + _476;
    bool _616 = _510 > 0.0;
    float _618 = exp2(_594);
    bool _620 = _526 > 0.0;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    bool _622 = _526 >= 0.0;
    bool _624 = isnan(_526);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = _614 + (-1.0);
    float _634 = _610 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _638 = _600 >= 0.0;
    bool _640 = isnan(_600);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    bool _648 = _600 > 0.0;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _654 = 1.0 + _652;
    float _656 = _646 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _658 = _482 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _660 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _662 = isnan(1.0);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _668 = _664 || _666;
    float _670 = 1.0 / _654;
    float _672 = _630 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _674 = fma(_658, -2.0, _650);
    bool _676 = _582 != 1;
    int _678 = ~as_type<int>(_634);
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _674);
    int _686 = _682;
    float _688 = _672;
    float _690 = _634;
    float _692 = _658;
    float _694 = _580;
    float _696 = _656;
    int _698 = as_type<int>(_632);
    if (!_616)
    {
        int _700 = ~as_type<int>(_634);
        int _702 = _700 + 1;
        _686 = _702;
    }
    int _704 = _686;
    bool _706 = _584 != 2;
    float _708 = -_618;
    float _710 = _708 + 1.0;
    int _712 = ~as_type<int>(_672);
    int _714 = _712 + 1;
    int _716 = _714 + 1;
    int _718 = _716;
    if (!_620)
    {
        int _720 = ~as_type<int>(_672);
        int _722 = _720 + 1;
        _718 = _722;
    }
    int _724 = _718;
    if (!_676)
    {
        _688 = _482;
    }
    float _726 = _688;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _730 = _726;
    if (!_676)
    {
        _690 = _726;
    }
    float _732 = _690;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _736 = -_728;
    float _738 = fma(_596, 2.0, _736);
    float _740 = _732;
    if (!_676)
    {
        _286 = _732;
    }
    float _742 = _286;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _746 = _742;
    if (_706)
    {
        _692 = _578;
    }
    float _748 = _692;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _752 = _748;
    if (_676)
    {
        _740 = _578;
    }
    float _754 = _740;
    float _756 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[93].z, _734);
    float _758 = -_744;
    float _760 = fma(_612, 2.0, _758);
    if (_676)
    {
        _730 = _482;
    }
    float _762 = _730;
    float _764 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[83].z, _750);
    float _766 = _762;
    if (!_706)
    {
        _752 = _476;
    }
    float _768 = _752;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    if (_676)
    {
        _746 = _578;
    }
    float _772 = _746;
    float _774 = -_144;
    float _776 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[91].x, _760);
    float _778 = _768 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _780 = _772 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _784 = ~as_type<int>(_656);
    int _786 = _784 + 1;
    int _788 = _786 + 1;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _792 = _788;
    if (!_648)
    {
        int _794 = ~as_type<int>(_656);
        int _796 = _794 + 1;
        _792 = _796;
    }
    int _798 = _792;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_676)
    {
        _694 = _476;
    }
    float _802 = _694;
    float _804 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[93].w, _770);
    bool _806 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _814 = _810 || _812;
    float _816 = _586 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _818 = _802;
    if (_676)
    {
        _818 = _762;
    }
    float _820 = _818;
    float _822 = -_782;
    float _824 = fma(_778, 2.0, _822);
    float _826 = -_800;
    float _828 = fma(_780, 2.0, _826);
    float _830 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[83].w, _790);
    float _832 = -_144;
    float _834 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[86].x, _824);
    if (!_676)
    {
        _498 = _476;
    }
    float _836 = _498;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _840 = _836;
    if (_706)
    {
        _696 = _476;
    }
    float _842 = _696;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _846 = _842;
    if (_676)
    {
        _840 = _762;
    }
    float _848 = _840;
    float _850 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[92].w, _804);
    if (!_706)
    {
        _846 = _762;
    }
    float _852 = _846;
    float _854 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[78].w, _844);
    float _856 = _814 ? _710 : 0.0;
    float _858 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _830);
    if (!_706)
    {
        _766 = _578;
    }
    float _860 = _766;
    float _862 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[89].z, _838);
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _866 = _864 != 0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _874 = _872 != 0;
    float _876 = _848 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _878 = _860 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _880 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _854);
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _890 = fma(_816, -2.0, _882);
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _894 = fma(_876, -2.0, _884);
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _898 = fma(_878, -2.0, _886);
    float _900 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[88].w, _888);
    float _902 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[78].z, _892);
    float _904 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[88].z, _896);
    float _906 = -_144;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[76].x, _738);
    float _910 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _764);
    float _912 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _900);
    float _914 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _902);
    float _916 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _904);
    float _918 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[92].z, _756);
    float _920 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[91].y, _890);
    float _922 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[89].x, _862);
    float _924 = -_144;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[81].x, _828);
    float _928 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _894);
    float _930 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _898);
    if (_668)
    {
        float _932 = _856 * _670;
        _146 = _932;
    }
    float _934 = _146;
    float _936 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _938 = in.m_48.x;
    float _940 = in.m_48.y;
    float _942 = in.m_48.z;
    float _944 = _396 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _946 = in.m_65.x;
    float _948 = in.m_65.y;
    float _950 = in.m_65.z;
    float _952 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _958 = !_866;
    int _960 = _958 ? 0 : 1;
    float _962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _964 = !_870;
    int _966 = _964 ? 0 : 1;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _970 = _968 != 0;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _974 = _972 != 0;
    float _976 = 1.0 / _956;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _984 = _982 != 0;
    bool _986 = !_874;
    int _988 = _986 ? 0 : 1;
    float _990 = _940 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _992 = _940 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _994 = _940 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _996;
    float _1000 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[4].x, _990);
    float _1002 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[5].x, _992);
    float _1004 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[6].x, _994);
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _946);
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _948);
    float _1010 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _950);
    float _1012 = _998 * _976;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1018 = _1006 * _936;
    float _1020 = in.m_67.x;
    float _1022 = in.m_67.y;
    float _1024 = in.m_67.z;
    float _1026 = _1008 * _952;
    float _1028 = _1010 * _944;
    bool _1030 = _948 != 0.0;
    bool _1032 = isnan(_948);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan(0.0);
    bool _1038 = _1034 || _1036;
    float _1040 = in.m_69.x;
    float _1042 = in.m_69.y;
    float _1044 = in.m_69.z;
    float _1046 = 1.0 / _1016;
    int _1048 = abs(_960);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1054 = _946 == 0.0;
    bool _1056 = !_1038;
    bool _1058 = _1054 && _1056;
    float _1060 = _482 + _578;
    float _1062 = float(_704);
    float _1064 = _482 + (-0.5);
    bool _1066 = _950 == 0.0;
    bool _1068 = _1066 && _1058;
    float _1070 = _1060 + (-1.0);
    float _1072 = float(_1048);
    int _1074 = abs(_988);
    float _1076 = _1072 * _1062;
    float _1078 = _1052 * _1046;
    float _1080 = _1076 * (-2.0);
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1084 = _1024;
    float _1086 = _1022;
    float _1088 = _1020;
    bool _1090 = _1068;
    float _1092 = _1012;
    float _1094 = _1078;
    float _1096 = _1026;
    if (!_1068)
    {
        float _1098 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1024);
        _1084 = _1098;
    }
    float _1100 = _1084;
    float _1102 = float(_724);
    float _1104 = _476 + _578;
    float _1106 = float(_1074);
    float _1108 = fma(_1080, _1040, _1040);
    float _1110 = _578 + (-0.5);
    int _1112 = abs(_966);
    if (!_1068)
    {
        float _1114 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1022);
        _1086 = _1114;
    }
    float _1116 = _1086;
    float _1118 = fma(_1082, _1080, _1082);
    float _1120 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1108);
    float _1122 = float(_1112);
    float _1124 = as_type<float>(_966);
    if (_970)
    {
        float _1126 = in.m_55.x;
        _1124 = _1126;
    }
    float _1128 = _1124;
    float _1130 = float(_798);
    if (!_1068)
    {
        float _1132 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1020);
        _1088 = _1132;
    }
    float _1134 = _1088;
    float _1136 = _1106 * _1102;
    float _1138 = _1104 + (-1.0);
    float _1140 = _1122 * _1130;
    float _1142 = fma(_1118, _934, _1120);
    float _1144 = in.m_61.x;
    float _1146 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1148 = _1136 * (-2.0);
    float _1150 = _1140 * (-2.0);
    float _1152 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1156 = fma(_1146, _1148, _1146);
    float _1158 = fma(_1150, _1042, _1042);
    float _1160 = fma(_1152, _1150, _1152);
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1164 = _474 + _1162;
    float _1166 = fma(_1148, _1044, _1044);
    float _1168 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1158);
    float _1170 = _476 + (-0.5);
    float _1172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1174 = _1142 * 0.15915493667125701904296875;
    float _1176 = fma(_1160, _934, _1168);
    float _1178 = _1134;
    if (_970)
    {
        bool _1180 = _1128 > 0.5;
        _1090 = _1180;
    }
    bool _1182 = _1090;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1186 = _474 + _1184;
    float _1188 = fma(_1012, _1164, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1190 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1166);
    float _1192 = _636 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1194 = fma(_1078, _1186, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1196 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1002);
    float _1198 = fma(_1156, _934, _1190);
    if (!_970)
    {
        _1092 = _1144;
    }
    float _1200 = _1092;
    float _1202 = _1176 * 0.15915493667125701904296875;
    float _1204 = fma(_548, _1192, -0.5);
    float _1206 = _1198 * 0.15915493667125701904296875;
    float _1208 = _1200;
    int _1210 = as_type<int>(_1202);
    if (!_970)
    {
        _1094 = _1200;
    }
    float _1212 = _1094;
    float _1214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1216 = _1212;
    if (_970)
    {
        _1208 = _1144;
    }
    float _1218 = _1208;
    float _1220 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1000);
    bool _1222 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1224 = isnan(_474);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1004);
    bool _1236 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1238 = isnan(_474);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1250 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1252 = isnan(_474);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1258 = _1254 || _1256;
    float _1260 = float(_1258);
    float _1262 = -_1232;
    float _1264 = _1262 + 1.0;
    float _1266 = _1174 * 6.283185482025146484375;
    float _1268 = sin(_1266);
    float _1270 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1272 = -_684;
    float _1274 = fma(_880, _1204, _1272);
    float _1276 = _1260 * _1264;
    float _1278 = -_1260;
    float _1280 = _1278 + 1.0;
    float _1282 = fma(_550, _1248, -0.5);
    float _1284 = fma(_598, _1270, -0.5);
    float _1286 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1288 = _1174 * 6.283185482025146484375;
    float _1290 = cos(_1288);
    float _1292 = _1246 * _1280;
    int _1294 = as_type<int>(_1270);
    int _1296 = as_type<int>(_1214);
    float _1298 = _1280;
    if (_974)
    {
        float _1300 = -_1218;
        float _1302 = _1300 + 1.0;
        _1294 = as_type<int>(_1302);
    }
    int _1304 = _1294;
    if (_970)
    {
        float _1306 = -_1218;
        float _1308 = _1306 + 1.0;
        _1296 = as_type<int>(_1308);
    }
    int _1310 = _1296;
    float _1312 = fma(_546, _1286, -0.5);
    float _1314 = _1188 * _1292;
    if (!_974)
    {
        _1298 = _1218;
    }
    float _1316 = _1298;
    float _1318 = _1316;
    if (_984)
    {
        float _1320 = -_1218;
        float _1322 = _1320 + 1.0;
        _698 = as_type<int>(_1322);
    }
    int _1324 = _698;
    float _1326 = _1206 * 6.283185482025146484375;
    float _1328 = cos(_1326);
    if (_974)
    {
        float _1330 = _506 ? as_type<float>(_1304) : _1218;
        _1318 = _1330;
    }
    float _1332 = _1318;
    float _1334 = _922 * (-0.15915493667125701904296875);
    if (_970)
    {
        float _1336 = _1182 ? as_type<float>(_1310) : _1218;
        _1216 = _1336;
    }
    float _1338 = _1216;
    float _1340 = _1220 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1342 = _1234 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1344 = _1196 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1346 = -_920;
    float _1348 = fma(_850, _1284, _1346);
    float _1350 = _1202 * 6.283185482025146484375;
    float _1352 = sin(_1350);
    float _1354 = -_928;
    float _1356 = fma(_858, _1312, _1354);
    float _1358 = _1202 * 6.283185482025146484375;
    float _1360 = cos(_1358);
    float _1362 = _1290 * _1328;
    float _1364 = _1268 * _1328;
    float _1366 = _1362 * _1026;
    float _1368 = _1364 * _1026;
    float _1370 = _1206 * 6.283185482025146484375;
    float _1372 = sin(_1370);
    float _1374 = _1268 * _1352;
    float _1376 = _1352 * _1328;
    if (_980)
    {
        float _1378 = -_1218;
        float _1380 = _1378 + 1.0;
        _1210 = as_type<int>(_1380);
    }
    int _1382 = _1210;
    float _1384 = _1290 * _1360;
    float _1386 = _1268 * _1360;
    float _1388 = _1290 * _1352;
    float _1390 = _1360 * _1328;
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1394 = fma(_1372, _1384, _1374);
    float _1396 = fma(_1372, _1374, _1384);
    float _1398 = -_1388;
    float _1400 = fma(_1372, _1386, _1398);
    float _1402 = -_1026;
    float _1404 = _1372 * _1402;
    float _1406 = -_1386;
    float _1408 = fma(_1372, _1388, _1406);
    float _1410 = fma(_1394, _1018, _1366);
    float _1412 = fma(_1400, _1018, _1368);
    float _1414 = fma(_1390, _1018, _1404);
    if (!_980)
    {
        _1096 = _1218;
    }
    float _1416 = _1096;
    float _1418 = fma(_1408, _1028, _1410);
    float _1420 = -_1246;
    float _1422 = _1420 + 1.0;
    float _1424 = fma(_1376, _1028, _1414);
    float _1426 = fma(_1396, _1028, _1412);
    float _1428 = _1418 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1430 = _1418 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1432 = _1416;
    float _1434 = _1428;
    if (_980)
    {
        float _1436 = _512 ? as_type<float>(_1382) : _1218;
        _1432 = _1436;
    }
    float _1438 = _1432;
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1442 = fma(_1424, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1428);
    float _1444 = fma(_1424, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1430);
    if (!_984)
    {
        _1434 = _1218;
    }
    float _1446 = _1434;
    float _1448 = _962 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1450 = fma(_1426, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1442);
    float _1452 = fma(_1426, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1444);
    float _1454 = _1446;
    if (_984)
    {
        float _1456 = _512 ? as_type<float>(_1324) : _1218;
        _1454 = _1456;
    }
    float _1458 = _1454;
    float _1460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1462 = _1340 + _1450;
    float _1464 = _1342 + _1452;
    float _1466 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1314);
    float _1468 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1472 = _1462 + _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1476 = _1464 + _1474;
    float _1478 = fma(_1194, _1276, _1466);
    float _1480 = _1334 * 6.283185482025146484375;
    float _1482 = sin(_1480);
    float _1484 = _1472 * _1472;
    float _1486 = _1476 * _1476;
    float _1488 = fma(_1448, _1338, -0.5);
    float _1490 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1492 = -_1116;
    float _1494 = _1372 * _1492;
    float _1496 = _1484 + _1486;
    float _1498 = fma(_914, _1488, _908);
    float _1500 = _1334 * 6.283185482025146484375;
    float _1502 = cos(_1500);
    float _1504 = fma(_1490, _1438, -0.5);
    float _1506 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1508 = _1362 * _1116;
    float _1510 = _1364 * _1116;
    float _1512 = fma(_1468, _1332, -0.5);
    float _1514 = fma(_1506, _1458, -0.5);
    float _1516 = fma(_1390, _1134, _1494);
    float _1518 = sqrt(_1496);
    float _1520 = _1482 * _1282;
    float _1522 = fma(_1394, _1134, _1508);
    float _1524 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1478);
    float _1526 = fma(_918, _1514, _776);
    float _1528 = fma(_910, _1512, _926);
    float _1530 = fma(_1376, _1100, _1516);
    float _1532 = fma(_1408, _1100, _1522);
    float _1534 = _1502 * _1282;
    float _1536 = -_1520;
    float _1538 = fma(_1502, _1504, _1536);
    float _1540 = fma(_1482, _1504, _1534);
    float _1542 = fma(_916, _1538, _834);
    float _1544 = -_930;
    float _1546 = fma(_912, _1540, _1544);
    float _1548 = _1418 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1550 = _1518 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1552 = fma(_1424, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1548);
    float _1554 = fma(_1400, _1134, _1510);
    float _1556 = fma(_1426, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1552);
    float _1558 = fma(_1396, _1100, _1554);
    float _1560 = _1344 + _1556;
    float _1562 = _1486;
    float _1564 = _1484;
    float _1566 = _1462;
    float _1568 = _1464;
    if (!_1550)
    {
        _1178 = _1486;
    }
    float _1570 = _1178;
    float _1572 = _1570;
    if (!_1550)
    {
        _1562 = _1560;
    }
    float _1574 = _1562;
    bool _1576 = !_1550;
    float _1578 = _1574;
    if (!_1576)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1584 = _1518 + _1582;
        float _1586 = _1560 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1588 = rsqrt(_1496);
        float _1590 = _1584 * _1580;
        float _1592 = _1590 * 0.15915493667125701904296875;
        float _1594 = _1592 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        float _1598 = _1592 * 6.283185482025146484375;
        float _1600 = cos(_1598);
        float _1602 = fma(_1596, _1586, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1604 = _1588 * _1602;
        float _1606 = _1600 + (-1.0);
        float _1608 = fma(_1472, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1610 = fma(_1476, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1612 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1616 = _1608 + _1614;
        float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1620 = _1610 + _1618;
        float _1622 = fma(_1560, _1600, _1612);
        float _1624 = _1616 * _1616;
        float _1626 = _1620 * _1620;
        _1578 = _1622;
        _1564 = _1624;
        _1572 = _1626;
        _1566 = _1608;
        _1568 = _1610;
    }
    float _1628 = _1578;
    float _1630 = _1564;
    float _1632 = _1572;
    float _1634 = _1566;
    float _1636 = _1568;
    float _1638 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1640 = _1628 + _1638;
    float _1642 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1644 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1646 = fma(_1640, _1640, _1630);
    float _1648 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1650 = _1646 + _1632;
    float _1652 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1642);
    float _1654 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1644);
    float _1656 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1648);
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1662 = sqrt(_1650);
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1666 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1668 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1652);
    float _1670 = _1526 + 0.5;
    float _1672 = _1348 + 0.5;
    float _1674 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1654);
    float _1676 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1678 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1680 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1682 = _1274 + 0.5;
    float _1684 = _1498 + 0.5;
    float _1686 = _1528 + 0.5;
    float _1688 = _1356 + 0.5;
    float _1690 = _1542 + 0.5;
    float _1692 = _1546 + 0.5;
    float _1694 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1656);
    out.m_71.x = _1676;
    out.m_71.y = _1678;
    out.m_71.z = _1680;
    out.m_71.w = _1666;
    bool _1696 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1698 = isnan(_1662);
    bool _1700 = _1696 || _1698;
    bool _1702 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1704 = _1700 || _1702;
    out.m_73.x = _1670;
    out.m_73.y = _1672;
    out.m_75.x = _1684;
    out.m_75.y = _1682;
    out.m_75.z = _1686;
    out.m_75.w = _1688;
    out.m_77.x = _1690;
    out.m_77.y = _1692;
    float _1706 = _1658;
    float _1708 = _1690;
    float _1710 = _1692;
    float _1712 = _1636;
    if (!_1704)
    {
        _1706 = 1.0;
    }
    float _1714 = _1706;
    out.m_79.x = _1668;
    out.m_79.y = _1674;
    out.m_79.z = _1694;
    bool _1716 = !_1704;
    float _1718 = _1714;
    if (!_1716)
    {
        bool _1720 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1722 = isnan(_1662);
        bool _1724 = _1720 || _1722;
        bool _1726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1728 = _1724 || _1726;
        if (!_1728)
        {
            float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1732 = _1662 + _1730;
            float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1736 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1734;
            float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1740 = _1738 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1742 = 1.0 / _1736;
            float _1744 = _1732 * _1742;
            float _1746 = fma(_1744, _1740, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1718 = _1746;
            _1748 = true;
        }
        else
        {
            bool _1750 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1752 = isnan(_1662);
            bool _1754 = _1750 || _1752;
            bool _1756 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1758 = _1754 || _1756;
            if (!_1758)
            {
                float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1762 = _1662 + _1760;
                float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1766 = _1764 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1770 = _1768 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1772 = 1.0 / _1766;
                float _1774 = _1762 * _1772;
                float _1776 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1718 = _1776;
                _1748 = true;
            }
            else
            {
                _1718 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1748 = false;
    float _1778 = _1718;
    float _1780 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1782 = _1628 + _1780;
    float _1784 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1786 = _1634 + _1784;
    float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1790 = _1636 + _1788;
    float _1792 = fma(_1782, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1794 = fma(_1786, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1796 = fma(_1790, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1800 = _1792 + _1798;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1804 = _1794 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1808 = _1796 + _1806;
    float _1810 = _1800 * _1800;
    float _1812 = fma(_1804, _1804, _1810);
    float _1814 = fma(_1808, _1808, _1812);
    float _1816 = rsqrt(_1814);
    float _1818 = sqrt(_1814);
    float _1820 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1822 = _1804 * _1820;
    float _1824 = _1808 * _1820;
    float _1826 = _1822 * _1822;
    float _1828 = _1824 * _1824;
    float _1830 = _1826 + _1828;
    float _1832 = sqrt(_1830);
    bool _1834 = _1832 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1838 = _1832 + _1836;
    float _1840 = _1808;
    float _1842 = _1838;
    float _1844 = _1800;
    if (_1834)
    {
        float _1846 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1846;
    }
    float _1848 = _1840;
    if (_1834)
    {
        float _1850 = rsqrt(_1830);
        _1708 = _1850;
    }
    float _1852 = _1708;
    float _1854 = _1852;
    if (_1834)
    {
        float _1856 = _1838 * _1848;
        _1842 = _1856;
    }
    float _1858 = _1842;
    if (_1834)
    {
        float _1860 = _1858 * 0.15915493667125701904296875;
        _1710 = _1860;
    }
    float _1862 = _1710;
    float _1864 = _1816;
    if (_1834)
    {
        float _1866 = _1862 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        _1864 = _1868;
    }
    float _1870 = _1864;
    float _1872 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1874 = precise::max(0.0, _1872);
    float _1876 = _1848;
    float _1878 = _1874;
    if (_1834)
    {
        float _1880 = _1862 * 6.283185482025146484375;
        float _1882 = cos(_1880);
        _1876 = _1882;
    }
    float _1884 = _1876;
    float _1886 = -_1820;
    float _1888 = -_1874;
    float _1890 = fma(_1800, _1886, _1888);
    float _1892 = _1890;
    if (_1834)
    {
        float _1894 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1878 = _1894;
    }
    float _1896 = _1878;
    float _1898 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1900 = _1870;
    float _1902 = _1896;
    if (_1834)
    {
        float _1904 = fma(_1870, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1900 = _1904;
    }
    float _1906 = _1900;
    float _1908 = _1906;
    if (_1834)
    {
        float _1910 = _1884 + (-1.0);
        _1844 = _1910;
    }
    float _1912 = _1844;
    float _1914 = _1912;
    if (_1834)
    {
        float _1916 = _1852 * _1906;
        _1712 = _1916;
    }
    float _1918 = _1712;
    if (!_1834)
    {
        _1854 = _1822;
    }
    float _1920 = _1854;
    float _1922 = _1920;
    if (_1834)
    {
        float _1924 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1902 = _1924;
    }
    float _1926 = _1902;
    float _1928 = _1926;
    if (_1834)
    {
        float _1930 = _1822 * _1918;
        _1922 = _1930;
    }
    float _1932 = _1922;
    if (!_1834)
    {
        _1914 = _1824;
    }
    float _1934 = _1914;
    float _1936 = _1934;
    if (_1834)
    {
        float _1938 = _1824 * _1918;
        _1936 = _1938;
    }
    float _1940 = _1936;
    if (_1834)
    {
        float _1942 = fma(_1890, _1884, _1926);
        _1892 = _1942;
    }
    float _1944 = _1892;
    if (!_1834)
    {
        _1928 = _1826;
    }
    float _1946 = _1928;
    float _1948 = _1946;
    if (_1834)
    {
        float _1950 = _1932 * _1932;
        _1948 = _1950;
    }
    float _1952 = _1948;
    if (!_1834)
    {
        _1908 = _1828;
    }
    float _1954 = _1908;
    float _1956 = _1954;
    if (_1834)
    {
        float _1958 = _1940 * _1940;
        _1956 = _1958;
    }
    float _1960 = _1956;
    float _1962 = fma(_1944, _1944, _1952);
    float _1964 = _1962 + _1960;
    float _1966 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1898);
    float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1970 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1968);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1976 = rsqrt(_1964);
    float _1978 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1966);
    float _1980 = -_1972;
    float _1982 = _1980 + 1.0;
    float _1984 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1986 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1988 = abs(_1982);
    float _1990 = log2(_1988);
    float _1992 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1994 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1996 = fma(_1342, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1998 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2000 = -_1992;
    float _2002 = fma(_2000, _1974, 1.0);
    float _2004 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2006 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1994);
    float _2008 = _1976 * _1932;
    float _2010 = _1976 * _1944;
    float _2012 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2004);
    float _2014 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2006);
    float _2016 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2018 = floor(_1984);
    float _2020 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2012);
    float _2022 = _2014 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2024 = _1976 * _1940;
    float _2026 = -_2016;
    float _2028 = fma(_2010, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2026);
    float _2030 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1998);
    float _2032 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2036 = floor(_1996);
    float _2038 = -_2024;
    float _2040 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2028);
    float _2042 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2030);
    float _2044 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2034);
    float _2046 = _1990 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2048 = fma(_2040, -0.5, 0.5);
    float _2050 = fma(_2040, 0.5, 0.5);
    float _2052 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2044);
    float _2054 = log2(_2002);
    float _2056 = -_2018;
    float _2058 = _1984 + _2056;
    float _2060 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2062 = exp2(_2046);
    float _2064 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2066 = -_2036;
    float _2068 = _1996 + _2066;
    float _2070 = fma(_2050, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2072 = _2010 + 1.0;
    float _2074 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2052);
    float _2076 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2078 = fma(_2050, _2070, -0.212114393711090087890625);
    float _2080 = sqrt(_2048);
    float _2082 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2060);
    float _2084 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2076);
    float _2086 = _2054 * 0.693147182464599609375;
    float2 _5982 = float2(_2058, _2068);
    float _2088 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5982, float2(0.0), isnan(_5982)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5982, float2(0.0), isnan(_5982)), level(0.0)).x;
    float _2090 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2082);
    float _2092 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2084);
    float _2094 = fma(_2050, _2078, 1.570728778839111328125);
    float _2096 = 1.0 / _2074;
    float _2098 = -_2010;
    float _2100 = fma(_2062, _2072, _2098);
    float _2102 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2092);
    float _2104 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2090);
    float _2106 = _2086 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2108 = fma(_2100, 0.5, 0.5);
    float _2110 = _2080 * 0.636619746685028076171875;
    float _2112 = -_2094;
    float _2114 = fma(_2110, _2112, 1.0);
    float _2116 = _2102 * _2096;
    float _2118 = _2104 * _2096;
    float _2120 = fma(_2116, 0.5, 0.5);
    float _2122 = fma(_2118, -0.5, 0.5);
    float3 _6049 = float3(_2120, _2122, _2106);
    float _2124 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6049, float3(0.0), isnan(_6049)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6049, float3(0.0), isnan(_6049)), level(0.0)).x;
    float3 _6060 = float3(_2120, _2122, _2106);
    float4 _2127 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6060, float3(0.0), isnan(_6060)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6060, float3(0.0), isnan(_6060)), level(0.0)).xyzw;
    float _2129 = _2127.x;
    float _2131 = _2127.y;
    float _2133 = _2127.z;
    float _2135 = _2127.w;
    float2 _6076 = float2(_2114, _2108);
    float3 _2139 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6076, float2(0.0), isnan(_6076)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6076, float2(0.0), isnan(_6076)), level(0.0)).xyz;
    float _2141 = _2139.x;
    float _2143 = _2139.y;
    float _2145 = _2139.z;
    float _2147 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2149 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2151 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2153 = in.m_81.x;
    float _2155 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2147);
    float _2157 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2149);
    float _2159 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2151);
    float _2161 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2155);
    float _2163 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2157);
    float _2165 = _2161 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2167 = _2163 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2169 = 1.0 / _2165;
    float _2171 = _2167 + _2165;
    float _2173 = _2171 * _2169;
    float _2175 = _2173 * 0.5;
    float _2177 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2179 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2177);
    float _2181 = _1990 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2183 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2185 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2187 = _2183 || _2185;
    bool _2189 = isnan(0.5);
    bool _2191 = _2187 || _2189;
    float _2193 = 1.0 / _2179;
    float _2195 = exp2(_2181);
    float _2197 = _2165;
    float _2199 = _1990;
    float _2201 = _2120;
    float _2203 = _2074;
    float _2205 = _2104;
    if (!_2191)
    {
        _2197 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2207 = _2197;
    float _2209 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2211 = _2193 * _2209;
    float _2213 = _2193;
    if (!_2191)
    {
        float _2215 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2217 = _2207 + _2215;
        _2213 = _2217;
    }
    float _2219 = _2213;
    float _2221 = abs(_2211);
    float _2223 = log2(_2221);
    if (!_2191)
    {
        float _2225 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2227 = _2211 + _2225;
        _2199 = _2227;
    }
    float _2229 = _2199;
    float _2231 = -_2195;
    float _2233 = _2231 + 1.0;
    if (!_2191)
    {
        float _2235 = 1.0 / _2219;
        _2201 = _2235;
    }
    float _2237 = _2201;
    bool _2239 = _2211 <= 8000.0;
    bool _2241 = isnan(_2211);
    bool _2243 = _2239 || _2241;
    bool _2245 = isnan(8000.0);
    bool _2247 = _2243 || _2245;
    float _2249 = float(_2247);
    float _2251 = _2233 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2253 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2255 = exp2(_2253);
    float _2257 = fma(_2255, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2259 = precise::clamp(_2257, 0.0, 1.0);
    float _2261 = fma(_2259, -2.0, 3.0);
    float _2263 = _2259 * _2259;
    float _2265 = _2263 * _2261;
    float _2267 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2159);
    float _2269 = -_2265;
    float _2271 = _2269 + 1.0;
    float _2273 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2267);
    float _2275 = fma(_2271, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2265);
    float _2277 = _2273 + _2074;
    float _2279 = _2271;
    float _2281 = _2273;
    float _2283 = _2102;
    if (_2191)
    {
        _2279 = 1.0;
    }
    float _2285 = _2279;
    float _2287 = _2285;
    if (!_2191)
    {
        float _2289 = _2229 * _2237;
        float _2291 = precise::clamp(_2289, 0.0, 1.0);
        _2287 = _2291;
    }
    float _2293 = _2287;
    float _2295 = _2249 * _2275;
    float _2297 = _2277 * 0.5;
    bool _2299 = _1818 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2301 = isnan(_1818);
    bool _2303 = _2299 || _2301;
    bool _2305 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2307 = _2303 || _2305;
    out.gl_Position.x = _2102;
    out.gl_Position.y = _2104;
    out.gl_Position.z = _2273;
    out.gl_Position.w = _2074;
    float _2309 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.z = _2297;
    out.m_83.w = _2074;
    if (!_2307)
    {
        _2203 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2311 = _2203;
    float _2313 = _2311;
    float _2315 = _2311;
    if (!_2307)
    {
        _2281 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2317 = _2281;
    float _2319 = _2317;
    float _2321 = _2317;
    if (!_2307)
    {
        _2205 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2323 = _2205;
    float _2325 = _2323;
    float _2327 = _2323;
    if (!_2307)
    {
        _2283 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2329 = _2283;
    float _2331 = -_2088;
    float _2333 = _2331 + 1.0;
    float _2335 = _2333 * _2309;
    float _2337 = precise::clamp(_2335, 0.0, 1.0);
    float _2339 = -_2337;
    float _2341 = fma(_2339, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2343 = _2341 * _2153;
    float _2345 = _2251 * _2124;
    float _2347 = -_2251;
    float _2349 = _2347 + 1.0;
    float _2351 = _2135 * _2345;
    float _2353 = _2145 * _2345;
    float _2355 = _2135 * _2349;
    float _2357 = fma(_2141, _2351, _2129);
    float _2359 = fma(_2143, _2351, _2131);
    float _2361 = _2343 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2363 = fma(_2135, _2353, _2133);
    float _2365 = _2133;
    float _2367 = _2343;
    float _2369 = _2329;
    float _2371 = _2329;
    if (!_2307)
    {
        _2365 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2373 = _2365;
    float _2375 = _2293 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2377 = _2373;
    float _2379 = _2373;
    if (!_2307)
    {
        _2367 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2381 = _2367;
    out.m_85.x = _2361;
    out.m_87.x = _2357;
    out.m_87.y = _2359;
    out.m_87.z = _2363;
    out.m_87.w = _2355;
    bool _2383 = !_2307;
    float _2385 = _2381;
    float _2387 = _2381;
    if (!_2383)
    {
        bool _2389 = _1818 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2391 = isnan(_1818);
        bool _2393 = _2389 || _2391;
        bool _2395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2397 = _2393 || _2395;
        if (!_2397)
        {
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2401 = _1818 + _2399;
            float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2405 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2403;
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2415 = 1.0 / _2405;
            float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2419 = _2417 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2429 = _2401 * _2415;
            float _2431 = precise::clamp(_2429, 0.0, 1.0);
            float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2437 = fma(_2431, _2409, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2439 = fma(_2431, _2413, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2441 = fma(_2431, _2435, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2443 = fma(_2431, _2419, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2445 = fma(_2431, _2423, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2447 = fma(_2431, _2427, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2371 = _2437;
            _2315 = _2445;
            _2327 = _2439;
            _2379 = _2443;
            _2387 = _2441;
            _2321 = _2447;
            _2449 = true;
        }
        else
        {
            bool _2451 = _1818 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2453 = isnan(_1818);
            bool _2455 = _2451 || _2453;
            bool _2457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2459 = _2455 || _2457;
            if (!_2459)
            {
                _2377 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2461 = _2377;
            _2379 = _2461;
            if (!_2459)
            {
                _2313 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2463 = _2313;
            _2315 = _2463;
            if (!_2459)
            {
                _2319 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2465 = _2319;
            _2321 = _2465;
            if (!_2459)
            {
                _2325 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2467 = _2325;
            _2327 = _2467;
            if (!_2459)
            {
                _2369 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2469 = _2369;
            _2371 = _2469;
            if (!_2459)
            {
                _2385 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2471 = _2385;
            bool _2473 = !_2459;
            _2387 = _2471;
            if (!_2473)
            {
                bool _2475 = _1818 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2477 = isnan(_1818);
                bool _2479 = _2475 || _2477;
                bool _2481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2483 = _2479 || _2481;
                if (!_2483)
                {
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2487 = _1818 + _2485;
                    float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2491 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2489;
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2501 = 1.0 / _2491;
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2505 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2515 = _2487 * _2501;
                    float _2517 = precise::clamp(_2515, 0.0, 1.0);
                    float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2523 = fma(_2517, _2495, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2525 = fma(_2517, _2499, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2527 = fma(_2517, _2521, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2529 = fma(_2517, _2505, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2531 = fma(_2517, _2509, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2533 = fma(_2517, _2513, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2371 = _2523;
                    _2315 = _2531;
                    _2327 = _2525;
                    _2379 = _2529;
                    _2387 = _2527;
                    _2321 = _2533;
                    _2449 = true;
                }
                else
                {
                    _2371 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2315 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2327 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2379 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2387 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2321 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2449 = false;
    float _2535 = _2371;
    float _2537 = _2315;
    float _2539 = _2327;
    float _2541 = _2379;
    float _2543 = _2387;
    float _2545 = _2321;
    float _2547 = _2375 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2549 = fma(_1674, -0.5, 0.5);
    float _2551 = precise::clamp(_2549, 0.0, 1.0);
    float _2553 = -_2535;
    float _2555 = _2537 + _2553;
    float _2557 = -_2539;
    float _2559 = _2541 + _2557;
    out.m_51.x = _2547;
    float _2561 = -_2543;
    float _2563 = _2545 + _2561;
    float _2565 = fma(_2551, _2555, _2535);
    float _2567 = fma(_2551, _2559, _2539);
    bool _2569 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2571 = _2565 * 0.586610972881317138671875;
    float _2573 = fma(_2551, _2563, _2543);
    out.m_89.x = 0.0;
    bool _2575 = _2293 > 0.0;
    bool _2577 = isnan(_2293);
    bool _2579 = _2575 || _2577;
    bool _2581 = isnan(0.0);
    bool _2583 = _2579 || _2581;
    float _2585 = fma(_2567, 0.298911988735198974609375, _2571);
    float _2587 = fma(_2573, 0.114477999508380889892578125, _2585);
    float _2589 = -_2587;
    float _2591 = _2567 + _2589;
    float _2593 = -_2587;
    float _2595 = _2565 + _2593;
    float _2597 = -_2587;
    float _2599 = _2573 + _2597;
    float _2601 = fma(_2591, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2587);
    float _2603 = fma(_2595, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2587);
    float _2605 = fma(_2599, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2587);
    bool _2607 = !_2569;
    if (!_2607)
    {
        float _2609 = -_1792;
        float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2613 = -_1794;
        float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2617 = -_1796;
        float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2621 = _2611 * _2611;
        float _2623 = fma(_2615, _2615, _2621);
        float _2625 = fma(_2619, _2619, _2623);
        float _2627 = sqrt(_2625);
        float _2629 = rsqrt(_2625);
        float _2631 = -_2627;
        float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2635 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2637 = precise::clamp(_2635, 0.0, 1.0);
        float _2639 = _2615 * _2629;
        float _2641 = _2611 * _2629;
        float _2643 = abs(_2637);
        float _2645 = log2(_2643);
        float _2647 = _2619 * _2629;
        float _2649 = _2639 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2651 = _1674 * _2641;
        float _2653 = -_2641;
        float _2655 = -_2649;
        float _2657 = fma(_2653, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2655);
        float _2659 = fma(_1668, _2639, _2651);
        float _2661 = -_2647;
        float _2663 = fma(_2661, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2657);
        float _2665 = fma(_1694, _2647, _2659);
        float _2667 = precise::clamp(_2665, 0.0, 1.0);
        float _2669 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2671 = _2663 + _2669;
        float _2673 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2675 = _2671 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2677 = precise::clamp(_2675, 0.0, 1.0);
        float _2679 = exp2(_2673);
        float _2681 = _2679 * _2677;
        float _2683 = _2667 * _2681;
        float _2685 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2687 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2689 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2685;
        out.m_89.y = _2687;
        out.m_89.z = _2689;
    }
    out.m_91.x = _2601;
    out.m_91.y = _2603;
    out.m_91.z = _2605;
    if (_2583)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2691 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2691;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2449 = false;
    bool _1748 = false;
    bool _466 = false;
    bool _306 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2748 = as_type<float>(_126);
        out.gl_Position.z = _2748;
    }
    if (!_114)
    {
        return out;
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = _144;
    if (_140)
    {
        float _148 = float(_110);
        _120 = _148;
    }
    float _150 = _120;
    bool _152 = _144 >= _150;
    bool _154 = !_140;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2818 = as_type<float>(_164);
        out.gl_Position.z = _2818;
    }
    if (_156)
    {
        return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    bool _218 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _220 = isnan(_196);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -_212;
    float _232 = _230 + 1.0;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    float _238 = 1.0 / _216;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _242 = _228 * _232;
    float _244 = -_228;
    float _246 = _244 + 1.0;
    float _248 = _200 * _238;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _250;
    float _254 = fma(_236, _248, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _256;
    float _260 = fma(_252, _248, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _262 = _254 * _242;
    float _264 = fma(_258, _248, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _266 = _260 * _242;
    float _268 = _264 * _242;
    float _270 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].x, _262);
    float _272 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].y, _268);
    float _274 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].z, _266);
    float _276 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].x, _270);
    float _278 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].y, _272);
    float _280 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].z, _274);
    bool _282 = !_240;
    float _284 = _276;
    float _286 = _278;
    float _304;
    if (!_282)
    {
        float _288 = in.m_55.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        float _308 = float(_110);
        float _310 = 1.0 / _308;
        float _312 = _144 * _310;
        _304 = _312;
    }
    _306 = false;
    float _314 = _304;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _318 = _314 + _316;
    float _320 = in.m_57.x;
    float _322 = in.m_57.y;
    float _324 = in.m_57.z;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _330 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _332 = isnan(_314);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _346 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _348 = isnan(_314);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _358;
    bool _362 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _364 = isnan(_314);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = 1.0 / _328;
    float _376 = -_340;
    float _378 = _376 + 1.0;
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _382 = _356 * _378;
    float _384 = -_356;
    float _386 = _384 + 1.0;
    float _388 = 1.0 / _344;
    float _390 = _360 * _374;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _396 = _280 * _324;
    float _398 = fma(_390, _318, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _400 = _394 * _388;
    float _402 = _398 * _382;
    float _404 = -_372;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _410 = _314 + _408;
    float _412 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[115].x, _402);
    float _414 = _340 * _406;
    float _416 = fma(_400, _410, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _420 = fma(_416, _414, _412);
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _424 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[117].x, _420);
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _430 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _426 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _434 = _278 * _322;
    float _436 = _428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _276 * _320;
    out.m_59.x = _424;
    out.m_59.y = _436;
    out.m_59.z = _430;
    out.m_59.w = _432;
    bool _440 = !_380;
    int _442 = as_type<int>(_436);
    int _444 = as_type<int>(_424);
    float _446 = _320;
    float _464;
    if (!_440)
    {
        float _448 = in.m_55.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        float _468 = float(_110);
        float _470 = 1.0 / _468;
        float _472 = _144 * _470;
        _464 = _472;
    }
    _466 = false;
    float _474 = _464;
    float _476 = in.m_55.z;
    float _478 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _480 = log2(_478);
    float _482 = in.m_55.y;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _486 = _484 != 0;
    float _488 = in.m_55.w;
    float _490 = in.m_61.y;
    float _492 = 0.0;
    if (_486)
    {
        float _494 = in.m_55.x;
        _492 = _494;
    }
    float _496 = _492;
    float _498 = _490;
    if (_486)
    {
        _442 = 0;
        _444 = 0;
    }
    int _500 = _442;
    int _502 = _444;
    float _504 = _476 * 2.0;
    bool _506 = _476 > 0.5;
    float _508 = _482 * 2.0;
    float _510 = floor(_504);
    bool _512 = _482 > 0.5;
    bool _514 = _488 > 0.5;
    int _516 = _500;
    int _518 = _502;
    if (_486)
    {
        _284 = _482;
    }
    float _520 = _284;
    float _522 = -_490;
    float _524 = _522 + 1.0;
    float _526 = floor(_508);
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _538 = _536 != 0;
    int _540 = _506 ? as_type<int>(_524) : as_type<int>(_490);
    int _542 = _514 ? as_type<int>(_524) : as_type<int>(_490);
    int _544 = _512 ? as_type<int>(_524) : as_type<int>(_490);
    float _546 = _534 ? as_type<float>(_542) : _490;
    float _548 = _530 ? as_type<float>(_544) : _490;
    float _550 = _538 ? as_type<float>(_540) : _490;
    float _552 = _496;
    float _554 = _520;
    if (_486)
    {
        _446 = _496;
    }
    float _556 = _446;
    float _558 = _556;
    if (!_486)
    {
        float _560 = in.m_55.x;
        float _562 = _482 * 3.1415927410125732421875;
        float _564 = _562 * 0.15915493667125701904296875;
        float _566 = _564 * 6.283185482025146484375;
        float _568 = sin(_566);
        float _570 = _560 * 3.1415927410125732421875;
        float _572 = _570 * 0.15915493667125701904296875;
        float _574 = _572 * 6.283185482025146484375;
        float _576 = sin(_574);
        _552 = _560;
        _558 = _576;
        _516 = 1;
        _518 = 2;
        _554 = _568;
    }
    float _578 = _552;
    float _580 = _558;
    int _582 = _516;
    int _584 = _518;
    float _586 = _554;
    float _588 = _578 * 2.0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _592 = _590 != 0;
    float _594 = _480 * _144;
    float _596 = _578 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _598 = _592 ? as_type<float>(_540) : _490;
    float _600 = floor(_588);
    bool _602 = _510 >= 0.0;
    bool _604 = isnan(_510);
    bool _606 = _602 || _604;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    float _612 = _580 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _614 = _482 + _476;
    bool _616 = _510 > 0.0;
    float _618 = exp2(_594);
    bool _620 = _526 > 0.0;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    bool _622 = _526 >= 0.0;
    bool _624 = isnan(_526);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = _614 + (-1.0);
    float _634 = _610 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _638 = _600 >= 0.0;
    bool _640 = isnan(_600);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    bool _648 = _600 > 0.0;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _654 = 1.0 + _652;
    float _656 = _646 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _658 = _482 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _660 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _662 = isnan(1.0);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _668 = _664 || _666;
    float _670 = 1.0 / _654;
    float _672 = _630 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _674 = fma(_658, -2.0, _650);
    bool _676 = _582 != 1;
    int _678 = ~as_type<int>(_634);
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _674);
    int _686 = _682;
    float _688 = _672;
    float _690 = _634;
    float _692 = _658;
    float _694 = _580;
    float _696 = _656;
    int _698 = as_type<int>(_632);
    if (!_616)
    {
        int _700 = ~as_type<int>(_634);
        int _702 = _700 + 1;
        _686 = _702;
    }
    int _704 = _686;
    bool _706 = _584 != 2;
    float _708 = -_618;
    float _710 = _708 + 1.0;
    int _712 = ~as_type<int>(_672);
    int _714 = _712 + 1;
    int _716 = _714 + 1;
    int _718 = _716;
    if (!_620)
    {
        int _720 = ~as_type<int>(_672);
        int _722 = _720 + 1;
        _718 = _722;
    }
    int _724 = _718;
    if (!_676)
    {
        _688 = _482;
    }
    float _726 = _688;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _730 = _726;
    if (!_676)
    {
        _690 = _726;
    }
    float _732 = _690;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _736 = -_728;
    float _738 = fma(_596, 2.0, _736);
    float _740 = _732;
    if (!_676)
    {
        _286 = _732;
    }
    float _742 = _286;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _746 = _742;
    if (_706)
    {
        _692 = _578;
    }
    float _748 = _692;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _752 = _748;
    if (_676)
    {
        _740 = _578;
    }
    float _754 = _740;
    float _756 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[93].z, _734);
    float _758 = -_744;
    float _760 = fma(_612, 2.0, _758);
    if (_676)
    {
        _730 = _482;
    }
    float _762 = _730;
    float _764 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[83].z, _750);
    float _766 = _762;
    if (!_706)
    {
        _752 = _476;
    }
    float _768 = _752;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    if (_676)
    {
        _746 = _578;
    }
    float _772 = _746;
    float _774 = -_144;
    float _776 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[91].x, _760);
    float _778 = _768 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _780 = _772 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _784 = ~as_type<int>(_656);
    int _786 = _784 + 1;
    int _788 = _786 + 1;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _792 = _788;
    if (!_648)
    {
        int _794 = ~as_type<int>(_656);
        int _796 = _794 + 1;
        _792 = _796;
    }
    int _798 = _792;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_676)
    {
        _694 = _476;
    }
    float _802 = _694;
    float _804 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[93].w, _770);
    bool _806 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _814 = _810 || _812;
    float _816 = _586 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _818 = _802;
    if (_676)
    {
        _818 = _762;
    }
    float _820 = _818;
    float _822 = -_782;
    float _824 = fma(_778, 2.0, _822);
    float _826 = -_800;
    float _828 = fma(_780, 2.0, _826);
    float _830 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[83].w, _790);
    float _832 = -_144;
    float _834 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[86].x, _824);
    if (!_676)
    {
        _498 = _476;
    }
    float _836 = _498;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _840 = _836;
    if (_706)
    {
        _696 = _476;
    }
    float _842 = _696;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _846 = _842;
    if (_676)
    {
        _840 = _762;
    }
    float _848 = _840;
    float _850 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[92].w, _804);
    if (!_706)
    {
        _846 = _762;
    }
    float _852 = _846;
    float _854 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[78].w, _844);
    float _856 = _814 ? _710 : 0.0;
    float _858 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _830);
    if (!_706)
    {
        _766 = _578;
    }
    float _860 = _766;
    float _862 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[89].z, _838);
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _866 = _864 != 0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _874 = _872 != 0;
    float _876 = _848 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _878 = _860 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _880 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _854);
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _890 = fma(_816, -2.0, _882);
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _894 = fma(_876, -2.0, _884);
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _898 = fma(_878, -2.0, _886);
    float _900 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[88].w, _888);
    float _902 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[78].z, _892);
    float _904 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[88].z, _896);
    float _906 = -_144;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[76].x, _738);
    float _910 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _764);
    float _912 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _900);
    float _914 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _902);
    float _916 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _904);
    float _918 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[92].z, _756);
    float _920 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[91].y, _890);
    float _922 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[89].x, _862);
    float _924 = -_144;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[81].x, _828);
    float _928 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _894);
    float _930 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _898);
    if (_668)
    {
        float _932 = _856 * _670;
        _146 = _932;
    }
    float _934 = _146;
    float _936 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _938 = in.m_48.x;
    float _940 = in.m_48.y;
    float _942 = in.m_48.z;
    float _944 = _396 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _946 = in.m_65.x;
    float _948 = in.m_65.y;
    float _950 = in.m_65.z;
    float _952 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _958 = !_866;
    int _960 = _958 ? 0 : 1;
    float _962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _964 = !_870;
    int _966 = _964 ? 0 : 1;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _970 = _968 != 0;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _974 = _972 != 0;
    float _976 = 1.0 / _956;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _984 = _982 != 0;
    bool _986 = !_874;
    int _988 = _986 ? 0 : 1;
    float _990 = _940 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _992 = _940 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _994 = _940 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _996;
    float _1000 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[4].x, _990);
    float _1002 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[5].x, _992);
    float _1004 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[6].x, _994);
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _946);
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _948);
    float _1010 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _950);
    float _1012 = _998 * _976;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1018 = _1006 * _936;
    float _1020 = in.m_67.x;
    float _1022 = in.m_67.y;
    float _1024 = in.m_67.z;
    float _1026 = _1008 * _952;
    float _1028 = _1010 * _944;
    bool _1030 = _948 != 0.0;
    bool _1032 = isnan(_948);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan(0.0);
    bool _1038 = _1034 || _1036;
    float _1040 = in.m_69.x;
    float _1042 = in.m_69.y;
    float _1044 = in.m_69.z;
    float _1046 = 1.0 / _1016;
    int _1048 = abs(_960);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1054 = _946 == 0.0;
    bool _1056 = !_1038;
    bool _1058 = _1054 && _1056;
    float _1060 = _482 + _578;
    float _1062 = float(_704);
    float _1064 = _482 + (-0.5);
    bool _1066 = _950 == 0.0;
    bool _1068 = _1066 && _1058;
    float _1070 = _1060 + (-1.0);
    float _1072 = float(_1048);
    int _1074 = abs(_988);
    float _1076 = _1072 * _1062;
    float _1078 = _1052 * _1046;
    float _1080 = _1076 * (-2.0);
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1084 = _1024;
    float _1086 = _1022;
    float _1088 = _1020;
    bool _1090 = _1068;
    float _1092 = _1012;
    float _1094 = _1078;
    float _1096 = _1026;
    if (!_1068)
    {
        float _1098 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1024);
        _1084 = _1098;
    }
    float _1100 = _1084;
    float _1102 = float(_724);
    float _1104 = _476 + _578;
    float _1106 = float(_1074);
    float _1108 = fma(_1080, _1040, _1040);
    float _1110 = _578 + (-0.5);
    int _1112 = abs(_966);
    if (!_1068)
    {
        float _1114 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1022);
        _1086 = _1114;
    }
    float _1116 = _1086;
    float _1118 = fma(_1082, _1080, _1082);
    float _1120 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1108);
    float _1122 = float(_1112);
    float _1124 = as_type<float>(_966);
    if (_970)
    {
        float _1126 = in.m_55.x;
        _1124 = _1126;
    }
    float _1128 = _1124;
    float _1130 = float(_798);
    if (!_1068)
    {
        float _1132 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1020);
        _1088 = _1132;
    }
    float _1134 = _1088;
    float _1136 = _1106 * _1102;
    float _1138 = _1104 + (-1.0);
    float _1140 = _1122 * _1130;
    float _1142 = fma(_1118, _934, _1120);
    float _1144 = in.m_61.x;
    float _1146 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1148 = _1136 * (-2.0);
    float _1150 = _1140 * (-2.0);
    float _1152 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1156 = fma(_1146, _1148, _1146);
    float _1158 = fma(_1150, _1042, _1042);
    float _1160 = fma(_1152, _1150, _1152);
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1164 = _474 + _1162;
    float _1166 = fma(_1148, _1044, _1044);
    float _1168 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1158);
    float _1170 = _476 + (-0.5);
    float _1172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1174 = _1142 * 0.15915493667125701904296875;
    float _1176 = fma(_1160, _934, _1168);
    float _1178 = _1134;
    if (_970)
    {
        bool _1180 = _1128 > 0.5;
        _1090 = _1180;
    }
    bool _1182 = _1090;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1186 = _474 + _1184;
    float _1188 = fma(_1012, _1164, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1190 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1166);
    float _1192 = _636 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1194 = fma(_1078, _1186, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1196 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1002);
    float _1198 = fma(_1156, _934, _1190);
    if (!_970)
    {
        _1092 = _1144;
    }
    float _1200 = _1092;
    float _1202 = _1176 * 0.15915493667125701904296875;
    float _1204 = fma(_548, _1192, -0.5);
    float _1206 = _1198 * 0.15915493667125701904296875;
    float _1208 = _1200;
    int _1210 = as_type<int>(_1202);
    if (!_970)
    {
        _1094 = _1200;
    }
    float _1212 = _1094;
    float _1214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1216 = _1212;
    if (_970)
    {
        _1208 = _1144;
    }
    float _1218 = _1208;
    float _1220 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1000);
    bool _1222 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1224 = isnan(_474);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1004);
    bool _1236 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1238 = isnan(_474);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1250 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1252 = isnan(_474);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1258 = _1254 || _1256;
    float _1260 = float(_1258);
    float _1262 = -_1232;
    float _1264 = _1262 + 1.0;
    float _1266 = _1174 * 6.283185482025146484375;
    float _1268 = sin(_1266);
    float _1270 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1272 = -_684;
    float _1274 = fma(_880, _1204, _1272);
    float _1276 = _1260 * _1264;
    float _1278 = -_1260;
    float _1280 = _1278 + 1.0;
    float _1282 = fma(_550, _1248, -0.5);
    float _1284 = fma(_598, _1270, -0.5);
    float _1286 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1288 = _1174 * 6.283185482025146484375;
    float _1290 = cos(_1288);
    float _1292 = _1246 * _1280;
    int _1294 = as_type<int>(_1270);
    int _1296 = as_type<int>(_1214);
    float _1298 = _1280;
    if (_974)
    {
        float _1300 = -_1218;
        float _1302 = _1300 + 1.0;
        _1294 = as_type<int>(_1302);
    }
    int _1304 = _1294;
    if (_970)
    {
        float _1306 = -_1218;
        float _1308 = _1306 + 1.0;
        _1296 = as_type<int>(_1308);
    }
    int _1310 = _1296;
    float _1312 = fma(_546, _1286, -0.5);
    float _1314 = _1188 * _1292;
    if (!_974)
    {
        _1298 = _1218;
    }
    float _1316 = _1298;
    float _1318 = _1316;
    if (_984)
    {
        float _1320 = -_1218;
        float _1322 = _1320 + 1.0;
        _698 = as_type<int>(_1322);
    }
    int _1324 = _698;
    float _1326 = _1206 * 6.283185482025146484375;
    float _1328 = cos(_1326);
    if (_974)
    {
        float _1330 = _506 ? as_type<float>(_1304) : _1218;
        _1318 = _1330;
    }
    float _1332 = _1318;
    float _1334 = _922 * (-0.15915493667125701904296875);
    if (_970)
    {
        float _1336 = _1182 ? as_type<float>(_1310) : _1218;
        _1216 = _1336;
    }
    float _1338 = _1216;
    float _1340 = _1220 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1342 = _1234 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1344 = _1196 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1346 = -_920;
    float _1348 = fma(_850, _1284, _1346);
    float _1350 = _1202 * 6.283185482025146484375;
    float _1352 = sin(_1350);
    float _1354 = -_928;
    float _1356 = fma(_858, _1312, _1354);
    float _1358 = _1202 * 6.283185482025146484375;
    float _1360 = cos(_1358);
    float _1362 = _1290 * _1328;
    float _1364 = _1268 * _1328;
    float _1366 = _1362 * _1026;
    float _1368 = _1364 * _1026;
    float _1370 = _1206 * 6.283185482025146484375;
    float _1372 = sin(_1370);
    float _1374 = _1268 * _1352;
    float _1376 = _1352 * _1328;
    if (_980)
    {
        float _1378 = -_1218;
        float _1380 = _1378 + 1.0;
        _1210 = as_type<int>(_1380);
    }
    int _1382 = _1210;
    float _1384 = _1290 * _1360;
    float _1386 = _1268 * _1360;
    float _1388 = _1290 * _1352;
    float _1390 = _1360 * _1328;
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1394 = fma(_1372, _1384, _1374);
    float _1396 = fma(_1372, _1374, _1384);
    float _1398 = -_1388;
    float _1400 = fma(_1372, _1386, _1398);
    float _1402 = -_1026;
    float _1404 = _1372 * _1402;
    float _1406 = -_1386;
    float _1408 = fma(_1372, _1388, _1406);
    float _1410 = fma(_1394, _1018, _1366);
    float _1412 = fma(_1400, _1018, _1368);
    float _1414 = fma(_1390, _1018, _1404);
    if (!_980)
    {
        _1096 = _1218;
    }
    float _1416 = _1096;
    float _1418 = fma(_1408, _1028, _1410);
    float _1420 = -_1246;
    float _1422 = _1420 + 1.0;
    float _1424 = fma(_1376, _1028, _1414);
    float _1426 = fma(_1396, _1028, _1412);
    float _1428 = _1418 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1430 = _1418 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1432 = _1416;
    float _1434 = _1428;
    if (_980)
    {
        float _1436 = _512 ? as_type<float>(_1382) : _1218;
        _1432 = _1436;
    }
    float _1438 = _1432;
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1442 = fma(_1424, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1428);
    float _1444 = fma(_1424, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1430);
    if (!_984)
    {
        _1434 = _1218;
    }
    float _1446 = _1434;
    float _1448 = _962 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1450 = fma(_1426, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1442);
    float _1452 = fma(_1426, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1444);
    float _1454 = _1446;
    if (_984)
    {
        float _1456 = _512 ? as_type<float>(_1324) : _1218;
        _1454 = _1456;
    }
    float _1458 = _1454;
    float _1460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1462 = _1340 + _1450;
    float _1464 = _1342 + _1452;
    float _1466 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1314);
    float _1468 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1472 = _1462 + _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1476 = _1464 + _1474;
    float _1478 = fma(_1194, _1276, _1466);
    float _1480 = _1334 * 6.283185482025146484375;
    float _1482 = sin(_1480);
    float _1484 = _1472 * _1472;
    float _1486 = _1476 * _1476;
    float _1488 = fma(_1448, _1338, -0.5);
    float _1490 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1492 = -_1116;
    float _1494 = _1372 * _1492;
    float _1496 = _1484 + _1486;
    float _1498 = fma(_914, _1488, _908);
    float _1500 = _1334 * 6.283185482025146484375;
    float _1502 = cos(_1500);
    float _1504 = fma(_1490, _1438, -0.5);
    float _1506 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1508 = _1362 * _1116;
    float _1510 = _1364 * _1116;
    float _1512 = fma(_1468, _1332, -0.5);
    float _1514 = fma(_1506, _1458, -0.5);
    float _1516 = fma(_1390, _1134, _1494);
    float _1518 = sqrt(_1496);
    float _1520 = _1482 * _1282;
    float _1522 = fma(_1394, _1134, _1508);
    float _1524 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1478);
    float _1526 = fma(_918, _1514, _776);
    float _1528 = fma(_910, _1512, _926);
    float _1530 = fma(_1376, _1100, _1516);
    float _1532 = fma(_1408, _1100, _1522);
    float _1534 = _1502 * _1282;
    float _1536 = -_1520;
    float _1538 = fma(_1502, _1504, _1536);
    float _1540 = fma(_1482, _1504, _1534);
    float _1542 = fma(_916, _1538, _834);
    float _1544 = -_930;
    float _1546 = fma(_912, _1540, _1544);
    float _1548 = _1418 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1550 = _1518 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1552 = fma(_1424, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1548);
    float _1554 = fma(_1400, _1134, _1510);
    float _1556 = fma(_1426, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1552);
    float _1558 = fma(_1396, _1100, _1554);
    float _1560 = _1344 + _1556;
    float _1562 = _1486;
    float _1564 = _1484;
    float _1566 = _1462;
    float _1568 = _1464;
    if (!_1550)
    {
        _1178 = _1486;
    }
    float _1570 = _1178;
    float _1572 = _1570;
    if (!_1550)
    {
        _1562 = _1560;
    }
    float _1574 = _1562;
    bool _1576 = !_1550;
    float _1578 = _1574;
    if (!_1576)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1584 = _1518 + _1582;
        float _1586 = _1560 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1588 = rsqrt(_1496);
        float _1590 = _1584 * _1580;
        float _1592 = _1590 * 0.15915493667125701904296875;
        float _1594 = _1592 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        float _1598 = _1592 * 6.283185482025146484375;
        float _1600 = cos(_1598);
        float _1602 = fma(_1596, _1586, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1604 = _1588 * _1602;
        float _1606 = _1600 + (-1.0);
        float _1608 = fma(_1472, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1610 = fma(_1476, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1612 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1616 = _1608 + _1614;
        float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1620 = _1610 + _1618;
        float _1622 = fma(_1560, _1600, _1612);
        float _1624 = _1616 * _1616;
        float _1626 = _1620 * _1620;
        _1578 = _1622;
        _1564 = _1624;
        _1572 = _1626;
        _1566 = _1608;
        _1568 = _1610;
    }
    float _1628 = _1578;
    float _1630 = _1564;
    float _1632 = _1572;
    float _1634 = _1566;
    float _1636 = _1568;
    float _1638 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1640 = _1628 + _1638;
    float _1642 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1644 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1646 = fma(_1640, _1640, _1630);
    float _1648 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1650 = _1646 + _1632;
    float _1652 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1642);
    float _1654 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1644);
    float _1656 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1648);
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1662 = sqrt(_1650);
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1666 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1668 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1652);
    float _1670 = _1526 + 0.5;
    float _1672 = _1348 + 0.5;
    float _1674 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1654);
    float _1676 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1678 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1680 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1682 = _1274 + 0.5;
    float _1684 = _1498 + 0.5;
    float _1686 = _1528 + 0.5;
    float _1688 = _1356 + 0.5;
    float _1690 = _1542 + 0.5;
    float _1692 = _1546 + 0.5;
    float _1694 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1656);
    out.m_71.x = _1676;
    out.m_71.y = _1678;
    out.m_71.z = _1680;
    out.m_71.w = _1666;
    bool _1696 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1698 = isnan(_1662);
    bool _1700 = _1696 || _1698;
    bool _1702 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1704 = _1700 || _1702;
    out.m_73.x = _1670;
    out.m_73.y = _1672;
    out.m_75.x = _1684;
    out.m_75.y = _1682;
    out.m_75.z = _1686;
    out.m_75.w = _1688;
    out.m_77.x = _1690;
    out.m_77.y = _1692;
    float _1706 = _1658;
    float _1708 = _1690;
    float _1710 = _1692;
    float _1712 = _1636;
    if (!_1704)
    {
        _1706 = 1.0;
    }
    float _1714 = _1706;
    out.m_79.x = _1668;
    out.m_79.y = _1674;
    out.m_79.z = _1694;
    bool _1716 = !_1704;
    float _1718 = _1714;
    if (!_1716)
    {
        bool _1720 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1722 = isnan(_1662);
        bool _1724 = _1720 || _1722;
        bool _1726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1728 = _1724 || _1726;
        if (!_1728)
        {
            float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1732 = _1662 + _1730;
            float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1736 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1734;
            float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1740 = _1738 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1742 = 1.0 / _1736;
            float _1744 = _1732 * _1742;
            float _1746 = fma(_1744, _1740, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1718 = _1746;
            _1748 = true;
        }
        else
        {
            bool _1750 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1752 = isnan(_1662);
            bool _1754 = _1750 || _1752;
            bool _1756 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1758 = _1754 || _1756;
            if (!_1758)
            {
                float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1762 = _1662 + _1760;
                float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1766 = _1764 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1770 = _1768 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1772 = 1.0 / _1766;
                float _1774 = _1762 * _1772;
                float _1776 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1718 = _1776;
                _1748 = true;
            }
            else
            {
                _1718 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1748 = false;
    float _1778 = _1718;
    float _1780 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1782 = _1628 + _1780;
    float _1784 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1786 = _1634 + _1784;
    float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1790 = _1636 + _1788;
    float _1792 = fma(_1782, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1794 = fma(_1786, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1796 = fma(_1790, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1800 = _1792 + _1798;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1804 = _1794 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1808 = _1796 + _1806;
    float _1810 = _1800 * _1800;
    float _1812 = fma(_1804, _1804, _1810);
    float _1814 = fma(_1808, _1808, _1812);
    float _1816 = rsqrt(_1814);
    float _1818 = sqrt(_1814);
    float _1820 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1822 = _1804 * _1820;
    float _1824 = _1808 * _1820;
    float _1826 = _1822 * _1822;
    float _1828 = _1824 * _1824;
    float _1830 = _1826 + _1828;
    float _1832 = sqrt(_1830);
    bool _1834 = _1832 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1838 = _1832 + _1836;
    float _1840 = _1808;
    float _1842 = _1838;
    float _1844 = _1800;
    if (_1834)
    {
        float _1846 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1846;
    }
    float _1848 = _1840;
    if (_1834)
    {
        float _1850 = rsqrt(_1830);
        _1708 = _1850;
    }
    float _1852 = _1708;
    float _1854 = _1852;
    if (_1834)
    {
        float _1856 = _1838 * _1848;
        _1842 = _1856;
    }
    float _1858 = _1842;
    if (_1834)
    {
        float _1860 = _1858 * 0.15915493667125701904296875;
        _1710 = _1860;
    }
    float _1862 = _1710;
    float _1864 = _1816;
    if (_1834)
    {
        float _1866 = _1862 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        _1864 = _1868;
    }
    float _1870 = _1864;
    float _1872 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1874 = precise::max(0.0, _1872);
    float _1876 = _1848;
    float _1878 = _1874;
    if (_1834)
    {
        float _1880 = _1862 * 6.283185482025146484375;
        float _1882 = cos(_1880);
        _1876 = _1882;
    }
    float _1884 = _1876;
    float _1886 = -_1820;
    float _1888 = -_1874;
    float _1890 = fma(_1800, _1886, _1888);
    float _1892 = _1890;
    if (_1834)
    {
        float _1894 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1878 = _1894;
    }
    float _1896 = _1878;
    float _1898 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1900 = _1870;
    float _1902 = _1896;
    if (_1834)
    {
        float _1904 = fma(_1870, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1900 = _1904;
    }
    float _1906 = _1900;
    float _1908 = _1906;
    if (_1834)
    {
        float _1910 = _1884 + (-1.0);
        _1844 = _1910;
    }
    float _1912 = _1844;
    float _1914 = _1912;
    if (_1834)
    {
        float _1916 = _1852 * _1906;
        _1712 = _1916;
    }
    float _1918 = _1712;
    if (!_1834)
    {
        _1854 = _1822;
    }
    float _1920 = _1854;
    float _1922 = _1920;
    if (_1834)
    {
        float _1924 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1902 = _1924;
    }
    float _1926 = _1902;
    float _1928 = _1926;
    if (_1834)
    {
        float _1930 = _1822 * _1918;
        _1922 = _1930;
    }
    float _1932 = _1922;
    if (!_1834)
    {
        _1914 = _1824;
    }
    float _1934 = _1914;
    float _1936 = _1934;
    if (_1834)
    {
        float _1938 = _1824 * _1918;
        _1936 = _1938;
    }
    float _1940 = _1936;
    if (_1834)
    {
        float _1942 = fma(_1890, _1884, _1926);
        _1892 = _1942;
    }
    float _1944 = _1892;
    if (!_1834)
    {
        _1928 = _1826;
    }
    float _1946 = _1928;
    float _1948 = _1946;
    if (_1834)
    {
        float _1950 = _1932 * _1932;
        _1948 = _1950;
    }
    float _1952 = _1948;
    if (!_1834)
    {
        _1908 = _1828;
    }
    float _1954 = _1908;
    float _1956 = _1954;
    if (_1834)
    {
        float _1958 = _1940 * _1940;
        _1956 = _1958;
    }
    float _1960 = _1956;
    float _1962 = fma(_1944, _1944, _1952);
    float _1964 = _1962 + _1960;
    float _1966 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1898);
    float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1970 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1968);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1976 = rsqrt(_1964);
    float _1978 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1966);
    float _1980 = -_1972;
    float _1982 = _1980 + 1.0;
    float _1984 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1986 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1988 = abs(_1982);
    float _1990 = log2(_1988);
    float _1992 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1994 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1996 = fma(_1342, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1998 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2000 = -_1992;
    float _2002 = fma(_2000, _1974, 1.0);
    float _2004 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2006 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1994);
    float _2008 = _1976 * _1932;
    float _2010 = _1976 * _1944;
    float _2012 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2004);
    float _2014 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2006);
    float _2016 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2018 = floor(_1984);
    float _2020 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2012);
    float _2022 = _2014 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2024 = _1976 * _1940;
    float _2026 = -_2016;
    float _2028 = fma(_2010, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2026);
    float _2030 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1998);
    float _2032 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2036 = floor(_1996);
    float _2038 = -_2024;
    float _2040 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2028);
    float _2042 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2030);
    float _2044 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2034);
    float _2046 = _1990 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2048 = fma(_2040, -0.5, 0.5);
    float _2050 = fma(_2040, 0.5, 0.5);
    float _2052 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2044);
    float _2054 = log2(_2002);
    float _2056 = -_2018;
    float _2058 = _1984 + _2056;
    float _2060 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2062 = exp2(_2046);
    float _2064 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2066 = -_2036;
    float _2068 = _1996 + _2066;
    float _2070 = fma(_2050, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2072 = _2010 + 1.0;
    float _2074 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2052);
    float _2076 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2078 = fma(_2050, _2070, -0.212114393711090087890625);
    float _2080 = sqrt(_2048);
    float _2082 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2060);
    float _2084 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2076);
    float _2086 = _2054 * 0.693147182464599609375;
    float2 _5982 = float2(_2058, _2068);
    float _2088 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5982, float2(0.0), isnan(_5982)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5982, float2(0.0), isnan(_5982)), level(0.0)).x;
    float _2090 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2082);
    float _2092 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2084);
    float _2094 = fma(_2050, _2078, 1.570728778839111328125);
    float _2096 = 1.0 / _2074;
    float _2098 = -_2010;
    float _2100 = fma(_2062, _2072, _2098);
    float _2102 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2092);
    float _2104 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2090);
    float _2106 = _2086 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2108 = fma(_2100, 0.5, 0.5);
    float _2110 = _2080 * 0.636619746685028076171875;
    float _2112 = -_2094;
    float _2114 = fma(_2110, _2112, 1.0);
    float _2116 = _2102 * _2096;
    float _2118 = _2104 * _2096;
    float _2120 = fma(_2116, 0.5, 0.5);
    float _2122 = fma(_2118, -0.5, 0.5);
    float3 _6049 = float3(_2120, _2122, _2106);
    float _2124 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6049, float3(0.0), isnan(_6049)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6049, float3(0.0), isnan(_6049)), level(0.0)).x;
    float3 _6060 = float3(_2120, _2122, _2106);
    float4 _2127 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6060, float3(0.0), isnan(_6060)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6060, float3(0.0), isnan(_6060)), level(0.0)).xyzw;
    float _2129 = _2127.x;
    float _2131 = _2127.y;
    float _2133 = _2127.z;
    float _2135 = _2127.w;
    float2 _6076 = float2(_2114, _2108);
    float3 _2139 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6076, float2(0.0), isnan(_6076)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6076, float2(0.0), isnan(_6076)), level(0.0)).xyz;
    float _2141 = _2139.x;
    float _2143 = _2139.y;
    float _2145 = _2139.z;
    float _2147 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2149 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2151 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2153 = in.m_81.x;
    float _2155 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2147);
    float _2157 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2149);
    float _2159 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2151);
    float _2161 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2155);
    float _2163 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2157);
    float _2165 = _2161 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2167 = _2163 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2169 = 1.0 / _2165;
    float _2171 = _2167 + _2165;
    float _2173 = _2171 * _2169;
    float _2175 = _2173 * 0.5;
    float _2177 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2179 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2177);
    float _2181 = _1990 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2183 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2185 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2187 = _2183 || _2185;
    bool _2189 = isnan(0.5);
    bool _2191 = _2187 || _2189;
    float _2193 = 1.0 / _2179;
    float _2195 = exp2(_2181);
    float _2197 = _2165;
    float _2199 = _1990;
    float _2201 = _2120;
    float _2203 = _2074;
    float _2205 = _2104;
    if (!_2191)
    {
        _2197 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2207 = _2197;
    float _2209 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2211 = _2193 * _2209;
    float _2213 = _2193;
    if (!_2191)
    {
        float _2215 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2217 = _2207 + _2215;
        _2213 = _2217;
    }
    float _2219 = _2213;
    float _2221 = abs(_2211);
    float _2223 = log2(_2221);
    if (!_2191)
    {
        float _2225 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2227 = _2211 + _2225;
        _2199 = _2227;
    }
    float _2229 = _2199;
    float _2231 = -_2195;
    float _2233 = _2231 + 1.0;
    if (!_2191)
    {
        float _2235 = 1.0 / _2219;
        _2201 = _2235;
    }
    float _2237 = _2201;
    bool _2239 = _2211 <= 8000.0;
    bool _2241 = isnan(_2211);
    bool _2243 = _2239 || _2241;
    bool _2245 = isnan(8000.0);
    bool _2247 = _2243 || _2245;
    float _2249 = float(_2247);
    float _2251 = _2233 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2253 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2255 = exp2(_2253);
    float _2257 = fma(_2255, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2259 = precise::clamp(_2257, 0.0, 1.0);
    float _2261 = fma(_2259, -2.0, 3.0);
    float _2263 = _2259 * _2259;
    float _2265 = _2263 * _2261;
    float _2267 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2159);
    float _2269 = -_2265;
    float _2271 = _2269 + 1.0;
    float _2273 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2267);
    float _2275 = fma(_2271, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2265);
    float _2277 = _2273 + _2074;
    float _2279 = _2271;
    float _2281 = _2273;
    float _2283 = _2102;
    if (_2191)
    {
        _2279 = 1.0;
    }
    float _2285 = _2279;
    float _2287 = _2285;
    if (!_2191)
    {
        float _2289 = _2229 * _2237;
        float _2291 = precise::clamp(_2289, 0.0, 1.0);
        _2287 = _2291;
    }
    float _2293 = _2287;
    float _2295 = _2249 * _2275;
    float _2297 = _2277 * 0.5;
    bool _2299 = _1818 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2301 = isnan(_1818);
    bool _2303 = _2299 || _2301;
    bool _2305 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2307 = _2303 || _2305;
    out.gl_Position.x = _2102;
    out.gl_Position.y = _2104;
    out.gl_Position.z = _2273;
    out.gl_Position.w = _2074;
    float _2309 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.z = _2297;
    out.m_83.w = _2074;
    if (!_2307)
    {
        _2203 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2311 = _2203;
    float _2313 = _2311;
    float _2315 = _2311;
    if (!_2307)
    {
        _2281 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2317 = _2281;
    float _2319 = _2317;
    float _2321 = _2317;
    if (!_2307)
    {
        _2205 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2323 = _2205;
    float _2325 = _2323;
    float _2327 = _2323;
    if (!_2307)
    {
        _2283 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2329 = _2283;
    float _2331 = -_2088;
    float _2333 = _2331 + 1.0;
    float _2335 = _2333 * _2309;
    float _2337 = precise::clamp(_2335, 0.0, 1.0);
    float _2339 = -_2337;
    float _2341 = fma(_2339, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2343 = _2341 * _2153;
    float _2345 = _2251 * _2124;
    float _2347 = -_2251;
    float _2349 = _2347 + 1.0;
    float _2351 = _2135 * _2345;
    float _2353 = _2145 * _2345;
    float _2355 = _2135 * _2349;
    float _2357 = fma(_2141, _2351, _2129);
    float _2359 = fma(_2143, _2351, _2131);
    float _2361 = _2343 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2363 = fma(_2135, _2353, _2133);
    float _2365 = _2133;
    float _2367 = _2343;
    float _2369 = _2329;
    float _2371 = _2329;
    if (!_2307)
    {
        _2365 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2373 = _2365;
    float _2375 = _2293 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2377 = _2373;
    float _2379 = _2373;
    if (!_2307)
    {
        _2367 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2381 = _2367;
    out.m_85.x = _2361;
    out.m_87.x = _2357;
    out.m_87.y = _2359;
    out.m_87.z = _2363;
    out.m_87.w = _2355;
    bool _2383 = !_2307;
    float _2385 = _2381;
    float _2387 = _2381;
    if (!_2383)
    {
        bool _2389 = _1818 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2391 = isnan(_1818);
        bool _2393 = _2389 || _2391;
        bool _2395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2397 = _2393 || _2395;
        if (!_2397)
        {
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2401 = _1818 + _2399;
            float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2405 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2403;
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2415 = 1.0 / _2405;
            float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2419 = _2417 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2429 = _2401 * _2415;
            float _2431 = precise::clamp(_2429, 0.0, 1.0);
            float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2437 = fma(_2431, _2409, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2439 = fma(_2431, _2413, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2441 = fma(_2431, _2435, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2443 = fma(_2431, _2419, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2445 = fma(_2431, _2423, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2447 = fma(_2431, _2427, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2371 = _2437;
            _2315 = _2445;
            _2327 = _2439;
            _2379 = _2443;
            _2387 = _2441;
            _2321 = _2447;
            _2449 = true;
        }
        else
        {
            bool _2451 = _1818 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2453 = isnan(_1818);
            bool _2455 = _2451 || _2453;
            bool _2457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2459 = _2455 || _2457;
            if (!_2459)
            {
                _2377 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2461 = _2377;
            _2379 = _2461;
            if (!_2459)
            {
                _2313 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2463 = _2313;
            _2315 = _2463;
            if (!_2459)
            {
                _2319 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2465 = _2319;
            _2321 = _2465;
            if (!_2459)
            {
                _2325 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2467 = _2325;
            _2327 = _2467;
            if (!_2459)
            {
                _2369 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2469 = _2369;
            _2371 = _2469;
            if (!_2459)
            {
                _2385 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2471 = _2385;
            bool _2473 = !_2459;
            _2387 = _2471;
            if (!_2473)
            {
                bool _2475 = _1818 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2477 = isnan(_1818);
                bool _2479 = _2475 || _2477;
                bool _2481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2483 = _2479 || _2481;
                if (!_2483)
                {
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2487 = _1818 + _2485;
                    float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2491 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2489;
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2501 = 1.0 / _2491;
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2505 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2515 = _2487 * _2501;
                    float _2517 = precise::clamp(_2515, 0.0, 1.0);
                    float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2523 = fma(_2517, _2495, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2525 = fma(_2517, _2499, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2527 = fma(_2517, _2521, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2529 = fma(_2517, _2505, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2531 = fma(_2517, _2509, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2533 = fma(_2517, _2513, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2371 = _2523;
                    _2315 = _2531;
                    _2327 = _2525;
                    _2379 = _2529;
                    _2387 = _2527;
                    _2321 = _2533;
                    _2449 = true;
                }
                else
                {
                    _2371 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2315 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2327 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2379 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2387 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2321 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2449 = false;
    float _2535 = _2371;
    float _2537 = _2315;
    float _2539 = _2327;
    float _2541 = _2379;
    float _2543 = _2387;
    float _2545 = _2321;
    float _2547 = _2375 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2549 = fma(_1674, -0.5, 0.5);
    float _2551 = precise::clamp(_2549, 0.0, 1.0);
    float _2553 = -_2535;
    float _2555 = _2537 + _2553;
    float _2557 = -_2539;
    float _2559 = _2541 + _2557;
    out.m_51.x = _2547;
    float _2561 = -_2543;
    float _2563 = _2545 + _2561;
    float _2565 = fma(_2551, _2555, _2535);
    float _2567 = fma(_2551, _2559, _2539);
    bool _2569 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2571 = _2565 * 0.586610972881317138671875;
    float _2573 = fma(_2551, _2563, _2543);
    out.m_89.x = 0.0;
    bool _2575 = _2293 > 0.0;
    bool _2577 = isnan(_2293);
    bool _2579 = _2575 || _2577;
    bool _2581 = isnan(0.0);
    bool _2583 = _2579 || _2581;
    float _2585 = fma(_2567, 0.298911988735198974609375, _2571);
    float _2587 = fma(_2573, 0.114477999508380889892578125, _2585);
    float _2589 = -_2587;
    float _2591 = _2567 + _2589;
    float _2593 = -_2587;
    float _2595 = _2565 + _2593;
    float _2597 = -_2587;
    float _2599 = _2573 + _2597;
    float _2601 = fma(_2591, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2587);
    float _2603 = fma(_2595, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2587);
    float _2605 = fma(_2599, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2587);
    bool _2607 = !_2569;
    if (!_2607)
    {
        float _2609 = -_1792;
        float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2613 = -_1794;
        float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2617 = -_1796;
        float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2621 = _2611 * _2611;
        float _2623 = fma(_2615, _2615, _2621);
        float _2625 = fma(_2619, _2619, _2623);
        float _2627 = sqrt(_2625);
        float _2629 = rsqrt(_2625);
        float _2631 = -_2627;
        float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2635 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2637 = precise::clamp(_2635, 0.0, 1.0);
        float _2639 = _2615 * _2629;
        float _2641 = _2611 * _2629;
        float _2643 = abs(_2637);
        float _2645 = log2(_2643);
        float _2647 = _2619 * _2629;
        float _2649 = _2639 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2651 = _1674 * _2641;
        float _2653 = -_2641;
        float _2655 = -_2649;
        float _2657 = fma(_2653, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2655);
        float _2659 = fma(_1668, _2639, _2651);
        float _2661 = -_2647;
        float _2663 = fma(_2661, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2657);
        float _2665 = fma(_1694, _2647, _2659);
        float _2667 = precise::clamp(_2665, 0.0, 1.0);
        float _2669 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2671 = _2663 + _2669;
        float _2673 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2675 = _2671 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2677 = precise::clamp(_2675, 0.0, 1.0);
        float _2679 = exp2(_2673);
        float _2681 = _2679 * _2677;
        float _2683 = _2667 * _2681;
        float _2685 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2687 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2689 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2685;
        out.m_89.y = _2687;
        out.m_89.z = _2689;
    }
    out.m_91.x = _2601;
    out.m_91.y = _2603;
    out.m_91.z = _2605;
    if (_2583)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2691 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2691;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2449 = false;
    bool _1748 = false;
    bool _466 = false;
    bool _306 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2748 = as_type<float>(_126);
        out.gl_Position.z = _2748;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = _144;
    if (_140)
    {
        float _148 = float(_110);
        _120 = _148;
    }
    float _150 = _120;
    bool _152 = _144 >= _150;
    bool _154 = !_140;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2818 = as_type<float>(_164);
        out.gl_Position.z = _2818;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    bool _218 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _220 = isnan(_196);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -_212;
    float _232 = _230 + 1.0;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    float _238 = 1.0 / _216;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _242 = _228 * _232;
    float _244 = -_228;
    float _246 = _244 + 1.0;
    float _248 = _200 * _238;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _250;
    float _254 = fma(_236, _248, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _256;
    float _260 = fma(_252, _248, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _262 = _254 * _242;
    float _264 = fma(_258, _248, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _266 = _260 * _242;
    float _268 = _264 * _242;
    float _270 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].x, _262);
    float _272 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].y, _268);
    float _274 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].z, _266);
    float _276 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].x, _270);
    float _278 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].y, _272);
    float _280 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].z, _274);
    bool _282 = !_240;
    float _284 = _276;
    float _286 = _278;
    float _304;
    if (!_282)
    {
        float _288 = in.m_55.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        float _308 = float(_110);
        float _310 = 1.0 / _308;
        float _312 = _144 * _310;
        _304 = _312;
    }
    _306 = false;
    float _314 = _304;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _318 = _314 + _316;
    float _320 = in.m_57.x;
    float _322 = in.m_57.y;
    float _324 = in.m_57.z;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _330 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _332 = isnan(_314);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _346 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _348 = isnan(_314);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _358;
    bool _362 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _364 = isnan(_314);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = 1.0 / _328;
    float _376 = -_340;
    float _378 = _376 + 1.0;
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _382 = _356 * _378;
    float _384 = -_356;
    float _386 = _384 + 1.0;
    float _388 = 1.0 / _344;
    float _390 = _360 * _374;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _396 = _280 * _324;
    float _398 = fma(_390, _318, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _400 = _394 * _388;
    float _402 = _398 * _382;
    float _404 = -_372;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _410 = _314 + _408;
    float _412 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[115].x, _402);
    float _414 = _340 * _406;
    float _416 = fma(_400, _410, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _420 = fma(_416, _414, _412);
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _424 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[117].x, _420);
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _430 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _426 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _434 = _278 * _322;
    float _436 = _428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _276 * _320;
    out.m_59.x = _424;
    out.m_59.y = _436;
    out.m_59.z = _430;
    out.m_59.w = _432;
    bool _440 = !_380;
    int _442 = as_type<int>(_436);
    int _444 = as_type<int>(_424);
    float _446 = _320;
    float _464;
    if (!_440)
    {
        float _448 = in.m_55.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        float _468 = float(_110);
        float _470 = 1.0 / _468;
        float _472 = _144 * _470;
        _464 = _472;
    }
    _466 = false;
    float _474 = _464;
    float _476 = in.m_55.z;
    float _478 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _480 = log2(_478);
    float _482 = in.m_55.y;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _486 = _484 != 0;
    float _488 = in.m_55.w;
    float _490 = in.m_61.y;
    float _492 = 0.0;
    if (_486)
    {
        float _494 = in.m_55.x;
        _492 = _494;
    }
    float _496 = _492;
    float _498 = _490;
    if (_486)
    {
        _442 = 0;
        _444 = 0;
    }
    int _500 = _442;
    int _502 = _444;
    float _504 = _476 * 2.0;
    bool _506 = _476 > 0.5;
    float _508 = _482 * 2.0;
    float _510 = floor(_504);
    bool _512 = _482 > 0.5;
    bool _514 = _488 > 0.5;
    int _516 = _500;
    int _518 = _502;
    if (_486)
    {
        _284 = _482;
    }
    float _520 = _284;
    float _522 = -_490;
    float _524 = _522 + 1.0;
    float _526 = floor(_508);
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _538 = _536 != 0;
    int _540 = _506 ? as_type<int>(_524) : as_type<int>(_490);
    int _542 = _514 ? as_type<int>(_524) : as_type<int>(_490);
    int _544 = _512 ? as_type<int>(_524) : as_type<int>(_490);
    float _546 = _534 ? as_type<float>(_542) : _490;
    float _548 = _530 ? as_type<float>(_544) : _490;
    float _550 = _538 ? as_type<float>(_540) : _490;
    float _552 = _496;
    float _554 = _520;
    if (_486)
    {
        _446 = _496;
    }
    float _556 = _446;
    float _558 = _556;
    if (!_486)
    {
        float _560 = in.m_55.x;
        float _562 = _482 * 3.1415927410125732421875;
        float _564 = _562 * 0.15915493667125701904296875;
        float _566 = _564 * 6.283185482025146484375;
        float _568 = sin(_566);
        float _570 = _560 * 3.1415927410125732421875;
        float _572 = _570 * 0.15915493667125701904296875;
        float _574 = _572 * 6.283185482025146484375;
        float _576 = sin(_574);
        _552 = _560;
        _558 = _576;
        _516 = 1;
        _518 = 2;
        _554 = _568;
    }
    float _578 = _552;
    float _580 = _558;
    int _582 = _516;
    int _584 = _518;
    float _586 = _554;
    float _588 = _578 * 2.0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _592 = _590 != 0;
    float _594 = _480 * _144;
    float _596 = _578 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _598 = _592 ? as_type<float>(_540) : _490;
    float _600 = floor(_588);
    bool _602 = _510 >= 0.0;
    bool _604 = isnan(_510);
    bool _606 = _602 || _604;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    float _612 = _580 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _614 = _482 + _476;
    bool _616 = _510 > 0.0;
    float _618 = exp2(_594);
    bool _620 = _526 > 0.0;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    bool _622 = _526 >= 0.0;
    bool _624 = isnan(_526);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = _614 + (-1.0);
    float _634 = _610 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _638 = _600 >= 0.0;
    bool _640 = isnan(_600);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    bool _648 = _600 > 0.0;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _654 = 1.0 + _652;
    float _656 = _646 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _658 = _482 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _660 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _662 = isnan(1.0);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _668 = _664 || _666;
    float _670 = 1.0 / _654;
    float _672 = _630 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _674 = fma(_658, -2.0, _650);
    bool _676 = _582 != 1;
    int _678 = ~as_type<int>(_634);
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _674);
    int _686 = _682;
    float _688 = _672;
    float _690 = _634;
    float _692 = _658;
    float _694 = _580;
    float _696 = _656;
    int _698 = as_type<int>(_632);
    if (!_616)
    {
        int _700 = ~as_type<int>(_634);
        int _702 = _700 + 1;
        _686 = _702;
    }
    int _704 = _686;
    bool _706 = _584 != 2;
    float _708 = -_618;
    float _710 = _708 + 1.0;
    int _712 = ~as_type<int>(_672);
    int _714 = _712 + 1;
    int _716 = _714 + 1;
    int _718 = _716;
    if (!_620)
    {
        int _720 = ~as_type<int>(_672);
        int _722 = _720 + 1;
        _718 = _722;
    }
    int _724 = _718;
    if (!_676)
    {
        _688 = _482;
    }
    float _726 = _688;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _730 = _726;
    if (!_676)
    {
        _690 = _726;
    }
    float _732 = _690;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _736 = -_728;
    float _738 = fma(_596, 2.0, _736);
    float _740 = _732;
    if (!_676)
    {
        _286 = _732;
    }
    float _742 = _286;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _746 = _742;
    if (_706)
    {
        _692 = _578;
    }
    float _748 = _692;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _752 = _748;
    if (_676)
    {
        _740 = _578;
    }
    float _754 = _740;
    float _756 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[93].z, _734);
    float _758 = -_744;
    float _760 = fma(_612, 2.0, _758);
    if (_676)
    {
        _730 = _482;
    }
    float _762 = _730;
    float _764 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[83].z, _750);
    float _766 = _762;
    if (!_706)
    {
        _752 = _476;
    }
    float _768 = _752;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    if (_676)
    {
        _746 = _578;
    }
    float _772 = _746;
    float _774 = -_144;
    float _776 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[91].x, _760);
    float _778 = _768 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _780 = _772 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _784 = ~as_type<int>(_656);
    int _786 = _784 + 1;
    int _788 = _786 + 1;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _792 = _788;
    if (!_648)
    {
        int _794 = ~as_type<int>(_656);
        int _796 = _794 + 1;
        _792 = _796;
    }
    int _798 = _792;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_676)
    {
        _694 = _476;
    }
    float _802 = _694;
    float _804 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[93].w, _770);
    bool _806 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _814 = _810 || _812;
    float _816 = _586 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _818 = _802;
    if (_676)
    {
        _818 = _762;
    }
    float _820 = _818;
    float _822 = -_782;
    float _824 = fma(_778, 2.0, _822);
    float _826 = -_800;
    float _828 = fma(_780, 2.0, _826);
    float _830 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[83].w, _790);
    float _832 = -_144;
    float _834 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[86].x, _824);
    if (!_676)
    {
        _498 = _476;
    }
    float _836 = _498;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _840 = _836;
    if (_706)
    {
        _696 = _476;
    }
    float _842 = _696;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _846 = _842;
    if (_676)
    {
        _840 = _762;
    }
    float _848 = _840;
    float _850 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[92].w, _804);
    if (!_706)
    {
        _846 = _762;
    }
    float _852 = _846;
    float _854 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[78].w, _844);
    float _856 = _814 ? _710 : 0.0;
    float _858 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _830);
    if (!_706)
    {
        _766 = _578;
    }
    float _860 = _766;
    float _862 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[89].z, _838);
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _866 = _864 != 0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _874 = _872 != 0;
    float _876 = _848 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _878 = _860 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _880 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _854);
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _890 = fma(_816, -2.0, _882);
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _894 = fma(_876, -2.0, _884);
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _898 = fma(_878, -2.0, _886);
    float _900 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[88].w, _888);
    float _902 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[78].z, _892);
    float _904 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[88].z, _896);
    float _906 = -_144;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[76].x, _738);
    float _910 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _764);
    float _912 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _900);
    float _914 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _902);
    float _916 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _904);
    float _918 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[92].z, _756);
    float _920 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[91].y, _890);
    float _922 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[89].x, _862);
    float _924 = -_144;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[81].x, _828);
    float _928 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _894);
    float _930 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _898);
    if (_668)
    {
        float _932 = _856 * _670;
        _146 = _932;
    }
    float _934 = _146;
    float _936 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _938 = in.m_48.x;
    float _940 = in.m_48.y;
    float _942 = in.m_48.z;
    float _944 = _396 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _946 = in.m_65.x;
    float _948 = in.m_65.y;
    float _950 = in.m_65.z;
    float _952 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _958 = !_866;
    int _960 = _958 ? 0 : 1;
    float _962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _964 = !_870;
    int _966 = _964 ? 0 : 1;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _970 = _968 != 0;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _974 = _972 != 0;
    float _976 = 1.0 / _956;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _984 = _982 != 0;
    bool _986 = !_874;
    int _988 = _986 ? 0 : 1;
    float _990 = _940 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _992 = _940 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _994 = _940 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _996;
    float _1000 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[4].x, _990);
    float _1002 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[5].x, _992);
    float _1004 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[6].x, _994);
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _946);
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _948);
    float _1010 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _950);
    float _1012 = _998 * _976;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1018 = _1006 * _936;
    float _1020 = in.m_67.x;
    float _1022 = in.m_67.y;
    float _1024 = in.m_67.z;
    float _1026 = _1008 * _952;
    float _1028 = _1010 * _944;
    bool _1030 = _948 != 0.0;
    bool _1032 = isnan(_948);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan(0.0);
    bool _1038 = _1034 || _1036;
    float _1040 = in.m_69.x;
    float _1042 = in.m_69.y;
    float _1044 = in.m_69.z;
    float _1046 = 1.0 / _1016;
    int _1048 = abs(_960);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1054 = _946 == 0.0;
    bool _1056 = !_1038;
    bool _1058 = _1054 && _1056;
    float _1060 = _482 + _578;
    float _1062 = float(_704);
    float _1064 = _482 + (-0.5);
    bool _1066 = _950 == 0.0;
    bool _1068 = _1066 && _1058;
    float _1070 = _1060 + (-1.0);
    float _1072 = float(_1048);
    int _1074 = abs(_988);
    float _1076 = _1072 * _1062;
    float _1078 = _1052 * _1046;
    float _1080 = _1076 * (-2.0);
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1084 = _1024;
    float _1086 = _1022;
    float _1088 = _1020;
    bool _1090 = _1068;
    float _1092 = _1012;
    float _1094 = _1078;
    float _1096 = _1026;
    if (!_1068)
    {
        float _1098 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1024);
        _1084 = _1098;
    }
    float _1100 = _1084;
    float _1102 = float(_724);
    float _1104 = _476 + _578;
    float _1106 = float(_1074);
    float _1108 = fma(_1080, _1040, _1040);
    float _1110 = _578 + (-0.5);
    int _1112 = abs(_966);
    if (!_1068)
    {
        float _1114 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1022);
        _1086 = _1114;
    }
    float _1116 = _1086;
    float _1118 = fma(_1082, _1080, _1082);
    float _1120 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1108);
    float _1122 = float(_1112);
    float _1124 = as_type<float>(_966);
    if (_970)
    {
        float _1126 = in.m_55.x;
        _1124 = _1126;
    }
    float _1128 = _1124;
    float _1130 = float(_798);
    if (!_1068)
    {
        float _1132 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1020);
        _1088 = _1132;
    }
    float _1134 = _1088;
    float _1136 = _1106 * _1102;
    float _1138 = _1104 + (-1.0);
    float _1140 = _1122 * _1130;
    float _1142 = fma(_1118, _934, _1120);
    float _1144 = in.m_61.x;
    float _1146 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1148 = _1136 * (-2.0);
    float _1150 = _1140 * (-2.0);
    float _1152 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1156 = fma(_1146, _1148, _1146);
    float _1158 = fma(_1150, _1042, _1042);
    float _1160 = fma(_1152, _1150, _1152);
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1164 = _474 + _1162;
    float _1166 = fma(_1148, _1044, _1044);
    float _1168 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1158);
    float _1170 = _476 + (-0.5);
    float _1172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1174 = _1142 * 0.15915493667125701904296875;
    float _1176 = fma(_1160, _934, _1168);
    float _1178 = _1134;
    if (_970)
    {
        bool _1180 = _1128 > 0.5;
        _1090 = _1180;
    }
    bool _1182 = _1090;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1186 = _474 + _1184;
    float _1188 = fma(_1012, _1164, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1190 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1166);
    float _1192 = _636 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1194 = fma(_1078, _1186, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1196 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1002);
    float _1198 = fma(_1156, _934, _1190);
    if (!_970)
    {
        _1092 = _1144;
    }
    float _1200 = _1092;
    float _1202 = _1176 * 0.15915493667125701904296875;
    float _1204 = fma(_548, _1192, -0.5);
    float _1206 = _1198 * 0.15915493667125701904296875;
    float _1208 = _1200;
    int _1210 = as_type<int>(_1202);
    if (!_970)
    {
        _1094 = _1200;
    }
    float _1212 = _1094;
    float _1214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1216 = _1212;
    if (_970)
    {
        _1208 = _1144;
    }
    float _1218 = _1208;
    float _1220 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1000);
    bool _1222 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1224 = isnan(_474);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1004);
    bool _1236 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1238 = isnan(_474);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1250 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1252 = isnan(_474);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1258 = _1254 || _1256;
    float _1260 = float(_1258);
    float _1262 = -_1232;
    float _1264 = _1262 + 1.0;
    float _1266 = _1174 * 6.283185482025146484375;
    float _1268 = sin(_1266);
    float _1270 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1272 = -_684;
    float _1274 = fma(_880, _1204, _1272);
    float _1276 = _1260 * _1264;
    float _1278 = -_1260;
    float _1280 = _1278 + 1.0;
    float _1282 = fma(_550, _1248, -0.5);
    float _1284 = fma(_598, _1270, -0.5);
    float _1286 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1288 = _1174 * 6.283185482025146484375;
    float _1290 = cos(_1288);
    float _1292 = _1246 * _1280;
    int _1294 = as_type<int>(_1270);
    int _1296 = as_type<int>(_1214);
    float _1298 = _1280;
    if (_974)
    {
        float _1300 = -_1218;
        float _1302 = _1300 + 1.0;
        _1294 = as_type<int>(_1302);
    }
    int _1304 = _1294;
    if (_970)
    {
        float _1306 = -_1218;
        float _1308 = _1306 + 1.0;
        _1296 = as_type<int>(_1308);
    }
    int _1310 = _1296;
    float _1312 = fma(_546, _1286, -0.5);
    float _1314 = _1188 * _1292;
    if (!_974)
    {
        _1298 = _1218;
    }
    float _1316 = _1298;
    float _1318 = _1316;
    if (_984)
    {
        float _1320 = -_1218;
        float _1322 = _1320 + 1.0;
        _698 = as_type<int>(_1322);
    }
    int _1324 = _698;
    float _1326 = _1206 * 6.283185482025146484375;
    float _1328 = cos(_1326);
    if (_974)
    {
        float _1330 = _506 ? as_type<float>(_1304) : _1218;
        _1318 = _1330;
    }
    float _1332 = _1318;
    float _1334 = _922 * (-0.15915493667125701904296875);
    if (_970)
    {
        float _1336 = _1182 ? as_type<float>(_1310) : _1218;
        _1216 = _1336;
    }
    float _1338 = _1216;
    float _1340 = _1220 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1342 = _1234 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1344 = _1196 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1346 = -_920;
    float _1348 = fma(_850, _1284, _1346);
    float _1350 = _1202 * 6.283185482025146484375;
    float _1352 = sin(_1350);
    float _1354 = -_928;
    float _1356 = fma(_858, _1312, _1354);
    float _1358 = _1202 * 6.283185482025146484375;
    float _1360 = cos(_1358);
    float _1362 = _1290 * _1328;
    float _1364 = _1268 * _1328;
    float _1366 = _1362 * _1026;
    float _1368 = _1364 * _1026;
    float _1370 = _1206 * 6.283185482025146484375;
    float _1372 = sin(_1370);
    float _1374 = _1268 * _1352;
    float _1376 = _1352 * _1328;
    if (_980)
    {
        float _1378 = -_1218;
        float _1380 = _1378 + 1.0;
        _1210 = as_type<int>(_1380);
    }
    int _1382 = _1210;
    float _1384 = _1290 * _1360;
    float _1386 = _1268 * _1360;
    float _1388 = _1290 * _1352;
    float _1390 = _1360 * _1328;
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1394 = fma(_1372, _1384, _1374);
    float _1396 = fma(_1372, _1374, _1384);
    float _1398 = -_1388;
    float _1400 = fma(_1372, _1386, _1398);
    float _1402 = -_1026;
    float _1404 = _1372 * _1402;
    float _1406 = -_1386;
    float _1408 = fma(_1372, _1388, _1406);
    float _1410 = fma(_1394, _1018, _1366);
    float _1412 = fma(_1400, _1018, _1368);
    float _1414 = fma(_1390, _1018, _1404);
    if (!_980)
    {
        _1096 = _1218;
    }
    float _1416 = _1096;
    float _1418 = fma(_1408, _1028, _1410);
    float _1420 = -_1246;
    float _1422 = _1420 + 1.0;
    float _1424 = fma(_1376, _1028, _1414);
    float _1426 = fma(_1396, _1028, _1412);
    float _1428 = _1418 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1430 = _1418 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1432 = _1416;
    float _1434 = _1428;
    if (_980)
    {
        float _1436 = _512 ? as_type<float>(_1382) : _1218;
        _1432 = _1436;
    }
    float _1438 = _1432;
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1442 = fma(_1424, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1428);
    float _1444 = fma(_1424, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1430);
    if (!_984)
    {
        _1434 = _1218;
    }
    float _1446 = _1434;
    float _1448 = _962 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1450 = fma(_1426, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1442);
    float _1452 = fma(_1426, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1444);
    float _1454 = _1446;
    if (_984)
    {
        float _1456 = _512 ? as_type<float>(_1324) : _1218;
        _1454 = _1456;
    }
    float _1458 = _1454;
    float _1460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1462 = _1340 + _1450;
    float _1464 = _1342 + _1452;
    float _1466 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1314);
    float _1468 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1472 = _1462 + _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1476 = _1464 + _1474;
    float _1478 = fma(_1194, _1276, _1466);
    float _1480 = _1334 * 6.283185482025146484375;
    float _1482 = sin(_1480);
    float _1484 = _1472 * _1472;
    float _1486 = _1476 * _1476;
    float _1488 = fma(_1448, _1338, -0.5);
    float _1490 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1492 = -_1116;
    float _1494 = _1372 * _1492;
    float _1496 = _1484 + _1486;
    float _1498 = fma(_914, _1488, _908);
    float _1500 = _1334 * 6.283185482025146484375;
    float _1502 = cos(_1500);
    float _1504 = fma(_1490, _1438, -0.5);
    float _1506 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1508 = _1362 * _1116;
    float _1510 = _1364 * _1116;
    float _1512 = fma(_1468, _1332, -0.5);
    float _1514 = fma(_1506, _1458, -0.5);
    float _1516 = fma(_1390, _1134, _1494);
    float _1518 = sqrt(_1496);
    float _1520 = _1482 * _1282;
    float _1522 = fma(_1394, _1134, _1508);
    float _1524 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1478);
    float _1526 = fma(_918, _1514, _776);
    float _1528 = fma(_910, _1512, _926);
    float _1530 = fma(_1376, _1100, _1516);
    float _1532 = fma(_1408, _1100, _1522);
    float _1534 = _1502 * _1282;
    float _1536 = -_1520;
    float _1538 = fma(_1502, _1504, _1536);
    float _1540 = fma(_1482, _1504, _1534);
    float _1542 = fma(_916, _1538, _834);
    float _1544 = -_930;
    float _1546 = fma(_912, _1540, _1544);
    float _1548 = _1418 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1550 = _1518 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1552 = fma(_1424, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1548);
    float _1554 = fma(_1400, _1134, _1510);
    float _1556 = fma(_1426, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1552);
    float _1558 = fma(_1396, _1100, _1554);
    float _1560 = _1344 + _1556;
    float _1562 = _1486;
    float _1564 = _1484;
    float _1566 = _1462;
    float _1568 = _1464;
    if (!_1550)
    {
        _1178 = _1486;
    }
    float _1570 = _1178;
    float _1572 = _1570;
    if (!_1550)
    {
        _1562 = _1560;
    }
    float _1574 = _1562;
    bool _1576 = !_1550;
    float _1578 = _1574;
    if (!_1576)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1584 = _1518 + _1582;
        float _1586 = _1560 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1588 = rsqrt(_1496);
        float _1590 = _1584 * _1580;
        float _1592 = _1590 * 0.15915493667125701904296875;
        float _1594 = _1592 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        float _1598 = _1592 * 6.283185482025146484375;
        float _1600 = cos(_1598);
        float _1602 = fma(_1596, _1586, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1604 = _1588 * _1602;
        float _1606 = _1600 + (-1.0);
        float _1608 = fma(_1472, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1610 = fma(_1476, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1612 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1616 = _1608 + _1614;
        float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1620 = _1610 + _1618;
        float _1622 = fma(_1560, _1600, _1612);
        float _1624 = _1616 * _1616;
        float _1626 = _1620 * _1620;
        _1578 = _1622;
        _1564 = _1624;
        _1572 = _1626;
        _1566 = _1608;
        _1568 = _1610;
    }
    float _1628 = _1578;
    float _1630 = _1564;
    float _1632 = _1572;
    float _1634 = _1566;
    float _1636 = _1568;
    float _1638 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1640 = _1628 + _1638;
    float _1642 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1644 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1646 = fma(_1640, _1640, _1630);
    float _1648 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1650 = _1646 + _1632;
    float _1652 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1642);
    float _1654 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1644);
    float _1656 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1648);
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1662 = sqrt(_1650);
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1666 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1668 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1652);
    float _1670 = _1526 + 0.5;
    float _1672 = _1348 + 0.5;
    float _1674 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1654);
    float _1676 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1678 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1680 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1682 = _1274 + 0.5;
    float _1684 = _1498 + 0.5;
    float _1686 = _1528 + 0.5;
    float _1688 = _1356 + 0.5;
    float _1690 = _1542 + 0.5;
    float _1692 = _1546 + 0.5;
    float _1694 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1656);
    out.m_71.x = _1676;
    out.m_71.y = _1678;
    out.m_71.z = _1680;
    out.m_71.w = _1666;
    bool _1696 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1698 = isnan(_1662);
    bool _1700 = _1696 || _1698;
    bool _1702 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1704 = _1700 || _1702;
    out.m_73.x = _1670;
    out.m_73.y = _1672;
    out.m_75.x = _1684;
    out.m_75.y = _1682;
    out.m_75.z = _1686;
    out.m_75.w = _1688;
    out.m_77.x = _1690;
    out.m_77.y = _1692;
    float _1706 = _1658;
    float _1708 = _1690;
    float _1710 = _1692;
    float _1712 = _1636;
    if (!_1704)
    {
        _1706 = 1.0;
    }
    float _1714 = _1706;
    out.m_79.x = _1668;
    out.m_79.y = _1674;
    out.m_79.z = _1694;
    bool _1716 = !_1704;
    float _1718 = _1714;
    if (!_1716)
    {
        bool _1720 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1722 = isnan(_1662);
        bool _1724 = _1720 || _1722;
        bool _1726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1728 = _1724 || _1726;
        if (!_1728)
        {
            float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1732 = _1662 + _1730;
            float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1736 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1734;
            float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1740 = _1738 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1742 = 1.0 / _1736;
            float _1744 = _1732 * _1742;
            float _1746 = fma(_1744, _1740, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1718 = _1746;
            _1748 = true;
        }
        else
        {
            bool _1750 = _1662 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1752 = isnan(_1662);
            bool _1754 = _1750 || _1752;
            bool _1756 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1758 = _1754 || _1756;
            if (!_1758)
            {
                float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1762 = _1662 + _1760;
                float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1766 = _1764 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1770 = _1768 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1772 = 1.0 / _1766;
                float _1774 = _1762 * _1772;
                float _1776 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1718 = _1776;
                _1748 = true;
            }
            else
            {
                _1718 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1748 = false;
    float _1778 = _1718;
    float _1780 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1782 = _1628 + _1780;
    float _1784 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1786 = _1634 + _1784;
    float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1790 = _1636 + _1788;
    float _1792 = fma(_1782, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1794 = fma(_1786, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1796 = fma(_1790, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1800 = _1792 + _1798;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1804 = _1794 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1808 = _1796 + _1806;
    float _1810 = _1800 * _1800;
    float _1812 = fma(_1804, _1804, _1810);
    float _1814 = fma(_1808, _1808, _1812);
    float _1816 = rsqrt(_1814);
    float _1818 = sqrt(_1814);
    float _1820 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1822 = _1804 * _1820;
    float _1824 = _1808 * _1820;
    float _1826 = _1822 * _1822;
    float _1828 = _1824 * _1824;
    float _1830 = _1826 + _1828;
    float _1832 = sqrt(_1830);
    bool _1834 = _1832 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1838 = _1832 + _1836;
    float _1840 = _1808;
    float _1842 = _1838;
    float _1844 = _1800;
    if (_1834)
    {
        float _1846 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1846;
    }
    float _1848 = _1840;
    if (_1834)
    {
        float _1850 = rsqrt(_1830);
        _1708 = _1850;
    }
    float _1852 = _1708;
    float _1854 = _1852;
    if (_1834)
    {
        float _1856 = _1838 * _1848;
        _1842 = _1856;
    }
    float _1858 = _1842;
    if (_1834)
    {
        float _1860 = _1858 * 0.15915493667125701904296875;
        _1710 = _1860;
    }
    float _1862 = _1710;
    float _1864 = _1816;
    if (_1834)
    {
        float _1866 = _1862 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        _1864 = _1868;
    }
    float _1870 = _1864;
    float _1872 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1874 = precise::max(0.0, _1872);
    float _1876 = _1848;
    float _1878 = _1874;
    if (_1834)
    {
        float _1880 = _1862 * 6.283185482025146484375;
        float _1882 = cos(_1880);
        _1876 = _1882;
    }
    float _1884 = _1876;
    float _1886 = -_1820;
    float _1888 = -_1874;
    float _1890 = fma(_1800, _1886, _1888);
    float _1892 = _1890;
    if (_1834)
    {
        float _1894 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1878 = _1894;
    }
    float _1896 = _1878;
    float _1898 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1900 = _1870;
    float _1902 = _1896;
    if (_1834)
    {
        float _1904 = fma(_1870, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1900 = _1904;
    }
    float _1906 = _1900;
    float _1908 = _1906;
    if (_1834)
    {
        float _1910 = _1884 + (-1.0);
        _1844 = _1910;
    }
    float _1912 = _1844;
    float _1914 = _1912;
    if (_1834)
    {
        float _1916 = _1852 * _1906;
        _1712 = _1916;
    }
    float _1918 = _1712;
    if (!_1834)
    {
        _1854 = _1822;
    }
    float _1920 = _1854;
    float _1922 = _1920;
    if (_1834)
    {
        float _1924 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1902 = _1924;
    }
    float _1926 = _1902;
    float _1928 = _1926;
    if (_1834)
    {
        float _1930 = _1822 * _1918;
        _1922 = _1930;
    }
    float _1932 = _1922;
    if (!_1834)
    {
        _1914 = _1824;
    }
    float _1934 = _1914;
    float _1936 = _1934;
    if (_1834)
    {
        float _1938 = _1824 * _1918;
        _1936 = _1938;
    }
    float _1940 = _1936;
    if (_1834)
    {
        float _1942 = fma(_1890, _1884, _1926);
        _1892 = _1942;
    }
    float _1944 = _1892;
    if (!_1834)
    {
        _1928 = _1826;
    }
    float _1946 = _1928;
    float _1948 = _1946;
    if (_1834)
    {
        float _1950 = _1932 * _1932;
        _1948 = _1950;
    }
    float _1952 = _1948;
    if (!_1834)
    {
        _1908 = _1828;
    }
    float _1954 = _1908;
    float _1956 = _1954;
    if (_1834)
    {
        float _1958 = _1940 * _1940;
        _1956 = _1958;
    }
    float _1960 = _1956;
    float _1962 = fma(_1944, _1944, _1952);
    float _1964 = _1962 + _1960;
    float _1966 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1898);
    float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1970 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1968);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1976 = rsqrt(_1964);
    float _1978 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1966);
    float _1980 = -_1972;
    float _1982 = _1980 + 1.0;
    float _1984 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1986 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1988 = abs(_1982);
    float _1990 = log2(_1988);
    float _1992 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1994 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1996 = fma(_1342, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1998 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2000 = -_1992;
    float _2002 = fma(_2000, _1974, 1.0);
    float _2004 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2006 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1994);
    float _2008 = _1976 * _1932;
    float _2010 = _1976 * _1944;
    float _2012 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2004);
    float _2014 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2006);
    float _2016 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2018 = floor(_1984);
    float _2020 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2012);
    float _2022 = _2014 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2024 = _1976 * _1940;
    float _2026 = -_2016;
    float _2028 = fma(_2010, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2026);
    float _2030 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1998);
    float _2032 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2036 = floor(_1996);
    float _2038 = -_2024;
    float _2040 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2028);
    float _2042 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2030);
    float _2044 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2034);
    float _2046 = _1990 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2048 = fma(_2040, -0.5, 0.5);
    float _2050 = fma(_2040, 0.5, 0.5);
    float _2052 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2044);
    float _2054 = log2(_2002);
    float _2056 = -_2018;
    float _2058 = _1984 + _2056;
    float _2060 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2062 = exp2(_2046);
    float _2064 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2066 = -_2036;
    float _2068 = _1996 + _2066;
    float _2070 = fma(_2050, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2072 = _2010 + 1.0;
    float _2074 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2052);
    float _2076 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2078 = fma(_2050, _2070, -0.212114393711090087890625);
    float _2080 = sqrt(_2048);
    float _2082 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2060);
    float _2084 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2076);
    float _2086 = _2054 * 0.693147182464599609375;
    float2 _5982 = float2(_2058, _2068);
    float _2088 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5982, float2(0.0), isnan(_5982)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5982, float2(0.0), isnan(_5982)), level(0.0)).x;
    float _2090 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2082);
    float _2092 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2084);
    float _2094 = fma(_2050, _2078, 1.570728778839111328125);
    float _2096 = 1.0 / _2074;
    float _2098 = -_2010;
    float _2100 = fma(_2062, _2072, _2098);
    float _2102 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2092);
    float _2104 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2090);
    float _2106 = _2086 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2108 = fma(_2100, 0.5, 0.5);
    float _2110 = _2080 * 0.636619746685028076171875;
    float _2112 = -_2094;
    float _2114 = fma(_2110, _2112, 1.0);
    float _2116 = _2102 * _2096;
    float _2118 = _2104 * _2096;
    float _2120 = fma(_2116, 0.5, 0.5);
    float _2122 = fma(_2118, -0.5, 0.5);
    float3 _6049 = float3(_2120, _2122, _2106);
    float _2124 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6049, float3(0.0), isnan(_6049)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6049, float3(0.0), isnan(_6049)), level(0.0)).x;
    float3 _6060 = float3(_2120, _2122, _2106);
    float4 _2127 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6060, float3(0.0), isnan(_6060)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6060, float3(0.0), isnan(_6060)), level(0.0)).xyzw;
    float _2129 = _2127.x;
    float _2131 = _2127.y;
    float _2133 = _2127.z;
    float _2135 = _2127.w;
    float2 _6076 = float2(_2114, _2108);
    float3 _2139 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6076, float2(0.0), isnan(_6076)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6076, float2(0.0), isnan(_6076)), level(0.0)).xyz;
    float _2141 = _2139.x;
    float _2143 = _2139.y;
    float _2145 = _2139.z;
    float _2147 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2149 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2151 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2153 = in.m_81.x;
    float _2155 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2147);
    float _2157 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2149);
    float _2159 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2151);
    float _2161 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2155);
    float _2163 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2157);
    float _2165 = _2161 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2167 = _2163 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2169 = 1.0 / _2165;
    float _2171 = _2167 + _2165;
    float _2173 = _2171 * _2169;
    float _2175 = _2173 * 0.5;
    float _2177 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2179 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2177);
    float _2181 = _1990 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2183 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2185 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2187 = _2183 || _2185;
    bool _2189 = isnan(0.5);
    bool _2191 = _2187 || _2189;
    float _2193 = 1.0 / _2179;
    float _2195 = exp2(_2181);
    float _2197 = _2165;
    float _2199 = _1990;
    float _2201 = _2120;
    float _2203 = _2074;
    float _2205 = _2104;
    if (!_2191)
    {
        _2197 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2207 = _2197;
    float _2209 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2211 = _2193 * _2209;
    float _2213 = _2193;
    if (!_2191)
    {
        float _2215 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2217 = _2207 + _2215;
        _2213 = _2217;
    }
    float _2219 = _2213;
    float _2221 = abs(_2211);
    float _2223 = log2(_2221);
    if (!_2191)
    {
        float _2225 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2227 = _2211 + _2225;
        _2199 = _2227;
    }
    float _2229 = _2199;
    float _2231 = -_2195;
    float _2233 = _2231 + 1.0;
    if (!_2191)
    {
        float _2235 = 1.0 / _2219;
        _2201 = _2235;
    }
    float _2237 = _2201;
    bool _2239 = _2211 <= 8000.0;
    bool _2241 = isnan(_2211);
    bool _2243 = _2239 || _2241;
    bool _2245 = isnan(8000.0);
    bool _2247 = _2243 || _2245;
    float _2249 = float(_2247);
    float _2251 = _2233 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2253 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2255 = exp2(_2253);
    float _2257 = fma(_2255, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2259 = precise::clamp(_2257, 0.0, 1.0);
    float _2261 = fma(_2259, -2.0, 3.0);
    float _2263 = _2259 * _2259;
    float _2265 = _2263 * _2261;
    float _2267 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2159);
    float _2269 = -_2265;
    float _2271 = _2269 + 1.0;
    float _2273 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2267);
    float _2275 = fma(_2271, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2265);
    float _2277 = _2273 + _2074;
    float _2279 = _2271;
    float _2281 = _2273;
    float _2283 = _2102;
    if (_2191)
    {
        _2279 = 1.0;
    }
    float _2285 = _2279;
    float _2287 = _2285;
    if (!_2191)
    {
        float _2289 = _2229 * _2237;
        float _2291 = precise::clamp(_2289, 0.0, 1.0);
        _2287 = _2291;
    }
    float _2293 = _2287;
    float _2295 = _2249 * _2275;
    float _2297 = _2277 * 0.5;
    bool _2299 = _1818 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2301 = isnan(_1818);
    bool _2303 = _2299 || _2301;
    bool _2305 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2307 = _2303 || _2305;
    out.gl_Position.x = _2102;
    out.gl_Position.y = _2104;
    out.gl_Position.z = _2273;
    out.gl_Position.w = _2074;
    float _2309 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.z = _2297;
    out.m_83.w = _2074;
    if (!_2307)
    {
        _2203 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2311 = _2203;
    float _2313 = _2311;
    float _2315 = _2311;
    if (!_2307)
    {
        _2281 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2317 = _2281;
    float _2319 = _2317;
    float _2321 = _2317;
    if (!_2307)
    {
        _2205 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2323 = _2205;
    float _2325 = _2323;
    float _2327 = _2323;
    if (!_2307)
    {
        _2283 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2329 = _2283;
    float _2331 = -_2088;
    float _2333 = _2331 + 1.0;
    float _2335 = _2333 * _2309;
    float _2337 = precise::clamp(_2335, 0.0, 1.0);
    float _2339 = -_2337;
    float _2341 = fma(_2339, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2343 = _2341 * _2153;
    float _2345 = _2251 * _2124;
    float _2347 = -_2251;
    float _2349 = _2347 + 1.0;
    float _2351 = _2135 * _2345;
    float _2353 = _2145 * _2345;
    float _2355 = _2135 * _2349;
    float _2357 = fma(_2141, _2351, _2129);
    float _2359 = fma(_2143, _2351, _2131);
    float _2361 = _2343 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2363 = fma(_2135, _2353, _2133);
    float _2365 = _2133;
    float _2367 = _2343;
    float _2369 = _2329;
    float _2371 = _2329;
    if (!_2307)
    {
        _2365 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2373 = _2365;
    float _2375 = _2293 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2377 = _2373;
    float _2379 = _2373;
    if (!_2307)
    {
        _2367 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2381 = _2367;
    out.m_85.x = _2361;
    out.m_87.x = _2357;
    out.m_87.y = _2359;
    out.m_87.z = _2363;
    out.m_87.w = _2355;
    bool _2383 = !_2307;
    float _2385 = _2381;
    float _2387 = _2381;
    if (!_2383)
    {
        bool _2389 = _1818 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2391 = isnan(_1818);
        bool _2393 = _2389 || _2391;
        bool _2395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2397 = _2393 || _2395;
        if (!_2397)
        {
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2401 = _1818 + _2399;
            float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2405 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2403;
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2415 = 1.0 / _2405;
            float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2419 = _2417 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2429 = _2401 * _2415;
            float _2431 = precise::clamp(_2429, 0.0, 1.0);
            float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2437 = fma(_2431, _2409, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2439 = fma(_2431, _2413, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2441 = fma(_2431, _2435, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2443 = fma(_2431, _2419, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2445 = fma(_2431, _2423, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2447 = fma(_2431, _2427, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2371 = _2437;
            _2315 = _2445;
            _2327 = _2439;
            _2379 = _2443;
            _2387 = _2441;
            _2321 = _2447;
            _2449 = true;
        }
        else
        {
            bool _2451 = _1818 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2453 = isnan(_1818);
            bool _2455 = _2451 || _2453;
            bool _2457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2459 = _2455 || _2457;
            if (!_2459)
            {
                _2377 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2461 = _2377;
            _2379 = _2461;
            if (!_2459)
            {
                _2313 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2463 = _2313;
            _2315 = _2463;
            if (!_2459)
            {
                _2319 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2465 = _2319;
            _2321 = _2465;
            if (!_2459)
            {
                _2325 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2467 = _2325;
            _2327 = _2467;
            if (!_2459)
            {
                _2369 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2469 = _2369;
            _2371 = _2469;
            if (!_2459)
            {
                _2385 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2471 = _2385;
            bool _2473 = !_2459;
            _2387 = _2471;
            if (!_2473)
            {
                bool _2475 = _1818 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2477 = isnan(_1818);
                bool _2479 = _2475 || _2477;
                bool _2481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2483 = _2479 || _2481;
                if (!_2483)
                {
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2487 = _1818 + _2485;
                    float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2491 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2489;
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2501 = 1.0 / _2491;
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2505 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2515 = _2487 * _2501;
                    float _2517 = precise::clamp(_2515, 0.0, 1.0);
                    float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2523 = fma(_2517, _2495, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2525 = fma(_2517, _2499, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2527 = fma(_2517, _2521, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2529 = fma(_2517, _2505, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2531 = fma(_2517, _2509, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2533 = fma(_2517, _2513, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2371 = _2523;
                    _2315 = _2531;
                    _2327 = _2525;
                    _2379 = _2529;
                    _2387 = _2527;
                    _2321 = _2533;
                    _2449 = true;
                }
                else
                {
                    _2371 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2315 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2327 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2379 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2387 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2321 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2449 = false;
    float _2535 = _2371;
    float _2537 = _2315;
    float _2539 = _2327;
    float _2541 = _2379;
    float _2543 = _2387;
    float _2545 = _2321;
    float _2547 = _2375 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2549 = fma(_1674, -0.5, 0.5);
    float _2551 = precise::clamp(_2549, 0.0, 1.0);
    float _2553 = -_2535;
    float _2555 = _2537 + _2553;
    float _2557 = -_2539;
    float _2559 = _2541 + _2557;
    out.m_51.x = _2547;
    float _2561 = -_2543;
    float _2563 = _2545 + _2561;
    float _2565 = fma(_2551, _2555, _2535);
    float _2567 = fma(_2551, _2559, _2539);
    bool _2569 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2571 = _2565 * 0.586610972881317138671875;
    float _2573 = fma(_2551, _2563, _2543);
    out.m_89.x = 0.0;
    bool _2575 = _2293 > 0.0;
    bool _2577 = isnan(_2293);
    bool _2579 = _2575 || _2577;
    bool _2581 = isnan(0.0);
    bool _2583 = _2579 || _2581;
    float _2585 = fma(_2567, 0.298911988735198974609375, _2571);
    float _2587 = fma(_2573, 0.114477999508380889892578125, _2585);
    float _2589 = -_2587;
    float _2591 = _2567 + _2589;
    float _2593 = -_2587;
    float _2595 = _2565 + _2593;
    float _2597 = -_2587;
    float _2599 = _2573 + _2597;
    float _2601 = fma(_2591, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2587);
    float _2603 = fma(_2595, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2587);
    float _2605 = fma(_2599, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2587);
    bool _2607 = !_2569;
    if (!_2607)
    {
        float _2609 = -_1792;
        float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2613 = -_1794;
        float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2617 = -_1796;
        float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2621 = _2611 * _2611;
        float _2623 = fma(_2615, _2615, _2621);
        float _2625 = fma(_2619, _2619, _2623);
        float _2627 = sqrt(_2625);
        float _2629 = rsqrt(_2625);
        float _2631 = -_2627;
        float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2635 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2637 = precise::clamp(_2635, 0.0, 1.0);
        float _2639 = _2615 * _2629;
        float _2641 = _2611 * _2629;
        float _2643 = abs(_2637);
        float _2645 = log2(_2643);
        float _2647 = _2619 * _2629;
        float _2649 = _2639 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2651 = _1674 * _2641;
        float _2653 = -_2641;
        float _2655 = -_2649;
        float _2657 = fma(_2653, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2655);
        float _2659 = fma(_1668, _2639, _2651);
        float _2661 = -_2647;
        float _2663 = fma(_2661, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2657);
        float _2665 = fma(_1694, _2647, _2659);
        float _2667 = precise::clamp(_2665, 0.0, 1.0);
        float _2669 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2671 = _2663 + _2669;
        float _2673 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2675 = _2671 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2677 = precise::clamp(_2675, 0.0, 1.0);
        float _2679 = exp2(_2673);
        float _2681 = _2679 * _2677;
        float _2683 = _2667 * _2681;
        float _2685 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2687 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2689 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2685;
        out.m_89.y = _2687;
        out.m_89.z = _2689;
    }
    out.m_91.x = _2601;
    out.m_91.y = _2603;
    out.m_91.z = _2605;
    if (_2583)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2691 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2691;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

