#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_14Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_77 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_85 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_71 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3758 = false;
    bool _2467 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _4063 = as_type<float>(_130);
        out.gl_Position.z = _4063;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_63.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_144)
    {
        float _150 = float(_114);
        _124 = _150;
    }
    float _152 = _124;
    bool _154 = _148 >= _152;
    bool _156 = !_144;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_61.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4132 = as_type<float>(_166);
        out.gl_Position.z = _4132;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _170 = int(_168);
    float _172 = in.m_65.x;
    float _174 = in.m_67.x;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _178 = _176 != 0;
    float _180 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _182 = int(_180);
    float _184 = in.m_67.z;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _188 = _186 != 0;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _192 = _190 != 0;
    float _194 = in.m_67.y;
    int _196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _198 = _196 != 0;
    float _200 = float(_170);
    float _202 = in.m_65.y;
    float _204 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _206 = int(_204);
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _210 = _208 != 0;
    float _212 = in.m_69.x;
    float _214 = in.m_69.y;
    float _216 = in.m_69.z;
    float _218 = float(_114);
    float _220 = float(_182);
    float _222 = in.m_67.w;
    float _224 = 1.0 / _200;
    int _226 = _170;
    int _228 = _182;
    float _230 = _172;
    if (_178)
    {
        float _232 = -_172;
        float _234 = _232 + 1.0;
        _226 = as_type<int>(_234);
    }
    int _236 = _226;
    float _238 = 0.0;
    int _240 = _236;
    if (!_178)
    {
        _238 = _172;
    }
    float _242 = _238;
    float _244 = _242;
    if (_192)
    {
        float _246 = -_172;
        float _248 = _246 + 1.0;
        _228 = as_type<int>(_248);
    }
    int _250 = _228;
    bool _252 = false;
    if (_178)
    {
        bool _254 = _174 > 0.5;
        _252 = _254;
    }
    bool _256 = _252;
    float _258 = in.m_71.x;
    float _260 = in.m_71.y;
    float _262 = in.m_71.z;
    float _264 = 0.0;
    if (!_188)
    {
        _264 = _172;
    }
    float _266 = _264;
    float _268 = 1.0 / _220;
    float _270 = _266;
    if (_178)
    {
        float _272 = _256 ? as_type<float>(_236) : _172;
        _244 = _272;
    }
    float _274 = _244;
    if (_188)
    {
        float _276 = -_172;
        float _278 = _276 + 1.0;
        _240 = as_type<int>(_278);
    }
    int _280 = _240;
    bool _282 = _184 > 0.5;
    bool _284 = _194 > 0.5;
    if (_188)
    {
        float _286 = _282 ? as_type<float>(_280) : _172;
        _270 = _286;
    }
    float _288 = _270;
    float _290 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _292 = int(_290);
    float _294 = _148 * _224;
    float _296 = float(uint(_206));
    float _298 = -_202;
    float _300 = _298 + 1.0;
    float _302 = _202;
    if (_192)
    {
        float _304 = _284 ? as_type<float>(_250) : _172;
        _230 = _304;
    }
    float _306 = _230;
    float _308 = in.m_73.x;
    float _310 = in.m_73.y;
    float _312 = in.m_73.z;
    bool _314 = _214 != 0.0;
    bool _316 = isnan(_214);
    bool _318 = _314 || _316;
    bool _320 = isnan(0.0);
    bool _322 = _318 || _320;
    float _324 = 1.0 / _296;
    float _326 = _148 * _268;
    bool _328 = _222 > 0.5;
    bool _330 = _212 == 0.0;
    bool _332 = !_322;
    bool _334 = _330 && _332;
    float _336 = _258 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _338 = _328 ? as_type<int>(_300) : as_type<int>(_202);
    float _340 = _262 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = trunc(_294);
    int _344 = int(_342);
    float _346 = float(uint(_292));
    float _348 = _260 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _350 = _284 ? as_type<int>(_300) : as_type<int>(_202);
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _354 = _352 != 0;
    bool _356 = _216 == 0.0;
    bool _358 = _356 && _334;
    float _360 = 1.0 / _346;
    float _362 = _210 ? as_type<float>(_350) : _202;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _366 = _364 != 0;
    float _368 = _354 ? as_type<float>(_338) : _202;
    int _370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _372 = _370 != 0;
    float _374 = trunc(_326);
    int _376 = int(_374);
    float _378 = _312;
    float _380 = _310;
    float _382 = _308;
    if (!_358)
    {
        float _384 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[17].y, _312);
        _378 = _384;
    }
    float _386 = _378;
    int _388 = as_type<int>(_324) + (-2);
    if (!_358)
    {
        float _390 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[17].y, _310);
        _380 = _390;
    }
    float _392 = _380;
    float _394 = float(uint(_344));
    if (!_358)
    {
        float _396 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[17].y, _308);
        _382 = _396;
    }
    float _398 = _382;
    int _400 = as_type<int>(_360) + (-2);
    float _402 = as_type<float>(_388) * _394;
    int _404 = ~_206;
    int _406 = _404 + 1;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _216);
    float _410 = trunc(_402);
    float _412 = precise::max(_410, 0.0);
    uint _415 = uint(_412);
    float _417 = float(uint(_376));
    float _419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _214);
    float _421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _212);
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _425 = as_type<float>(_400) * _417;
    float _427 = 1.0 / _218;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _431 = _429 != 0;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _435 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _439 = _435;
    if (_198)
    {
        _437 = 1.0;
    }
    float _441 = _437;
    float _443 = _441;
    if (!_198)
    {
        _443 = 7.345489978790283203125;
    }
    float _445 = _443;
    float _447 = -_433;
    float _449 = fma(_435, 2.0, _447);
    float _451 = trunc(_425);
    float _453 = precise::max(_451, 0.0);
    uint _455 = uint(_453);
    float _457 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _459 = _406 * int(_415);
    int _461 = _459 + _344;
    float _463 = as_type<float>(_461);
    if (_198)
    {
        _439 = _174;
    }
    float _465 = _439;
    float _467 = _445 * _174;
    float _469 = fma(_457, -2.0, _423);
    int _471 = ~_292;
    int _473 = _471 + 1;
    float _475 = float(uint(_461));
    float _477 = floor(_467);
    float _479 = _465;
    if (_198)
    {
        _463 = 1.0;
    }
    float _481 = _463;
    float _483 = _481;
    if (!_198)
    {
        _479 = _194;
    }
    float _485 = _479;
    float _487 = as_type<float>(_388) * _475;
    int _489 = as_type<int>(_485);
    if (!_198)
    {
        _483 = 1.2345600128173828125;
    }
    float _491 = _483;
    int _493 = _473 * int(_455);
    int _495 = _493 + _376;
    if (_431)
    {
        float _497 = _282 ? _300 : _202;
        _302 = _497;
    }
    float _499 = _302;
    float _501 = trunc(_487);
    float _503 = precise::max(_501, 0.0);
    uint _505 = uint(_503);
    float _507 = float(_206);
    float _509 = _485 * _491;
    float _511 = float(_292);
    float _513 = float(uint(_495));
    float _515 = _148 * _507;
    float _517 = _148 * _511;
    bool _519 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _523 = _519 || _521;
    bool _525 = isnan(1.0);
    bool _527 = _523 || _525;
    float _529 = floor(_509);
    float _531 = as_type<float>(_400) * _513;
    if (_198)
    {
        _489 = 0;
    }
    int _533 = _489;
    float _535 = _515 * _427;
    int _537 = _533;
    if (!_198)
    {
        _537 = 1;
    }
    int _539 = _537;
    float _541 = _517 * _427;
    float _543 = -_477;
    float _545 = _467 + _543;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _549 = _547 != 0;
    float _551 = trunc(_531);
    float _553 = precise::max(_551, 0.0);
    uint _555 = uint(_553);
    bool _557 = _539 != 1;
    float _559 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _563 = _561 != 0;
    int _565 = int(_563);
    int _567 = _198 ? 2 : 0;
    int _569 = _565 | _567;
    int _571 = _549 ? 4 : 0;
    int _573 = _569 | _571;
    int _575 = _527 ? 8 : 0;
    int _577 = _573 | _575;
    int _579 = _557 ? 16 : 0;
    int _581 = _577 | _579;
    int _583 = _372 ? 32 : 0;
    int _585 = _581 | _583;
    int _587 = _366 ? 64 : 0;
    int _589 = _585 | _587;
    int _591 = _589 & 16;
    float _593 = 0.0;
    float _595 = _559;
    if (!_527)
    {
        float _597 = _559 * _559;
        float _599 = _597 * 0.5;
        _593 = _599;
    }
    float _601 = _593;
    int _603 = ~_206;
    int _605 = _603 + 1;
    int _607 = int(_415) + int(_505);
    float _609 = _601;
    if (!_527)
    {
        float _611 = _601 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _609 = _611;
    }
    float _613 = _609;
    bool _615 = !_527;
    int _617 = 0;
    float _619 = _613;
    if (!_615)
    {
        float _621 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _623 = log2(_621);
        float _625 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _627 = _625 + 1.0;
        float _629 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _631 = _559 * _623;
        float _633 = exp2(_631);
        float _635 = _629 * 0.693147182464599609375;
        float _637 = 1.0 / _635;
        float _639 = 1.0 / _627;
        float _641 = _633 + (-1.0);
        float _643 = -_641;
        float _645 = fma(_643, _637, _559);
        float _647 = _645 * _639;
        float _649 = _647 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _617 = as_type<int>(_647);
        _619 = _649;
    }
    int _651 = _617;
    float _653 = _619;
    bool _655 = !_527;
    int _657 = _651;
    if (!_655)
    {
        float _659 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _661 = log2(_659);
        float _663 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _665 = _663 + 1.0;
        float _667 = 1.0 / _665;
        float _669 = _559 * _661;
        float _671 = exp2(_669);
        float _673 = -_671;
        float _675 = _673 + 1.0;
        float _677 = _675 * _667;
        _595 = _677;
    }
    float _679 = _595;
    bool _681 = !_549;
    int _683 = _681 ? 0 : 1;
    int _685 = _605 * _607;
    int _687 = _685 + _344;
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _691 = _689 != 0;
    float _693 = -_529;
    float _695 = _509 + _693;
    float _697 = float(_344);
    float _699 = trunc(_535);
    int _701 = int(_699);
    bool _703 = !_691;
    int _705 = _703 ? 0 : 1;
    float _707 = _511 * _695;
    bool _709 = uint(_687) >= uint(_206);
    float _711 = _545 * _507;
    int _713 = int(_455) + int(_555);
    float _715 = _348 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _717 = ~_292;
    int _719 = _717 + 1;
    float _721 = trunc(_707);
    int _723 = int(_721);
    bool _725 = _697 >= _507;
    bool _727 = isnan(_697);
    bool _729 = _725 || _727;
    bool _731 = isnan(_507);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _741 = _739 != 0;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _745 = _743 != 0;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _749 = _747 != 0;
    int _751 = _719 * _713;
    int _753 = _751 + _376;
    float _755 = float(_376);
    bool _757 = !_563;
    int _759 = _757 ? 0 : 1;
    float _761 = trunc(_735);
    int _763 = int(_761);
    bool _765 = _755 >= _511;
    bool _767 = isnan(_755);
    bool _769 = _765 || _767;
    bool _771 = isnan(_511);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    bool _777 = !_745;
    int _779 = _777 ? 0 : 1;
    bool _781 = _591 != 0;
    bool _783 = !_741;
    int _785 = _783 ? 0 : 1;
    float _787 = trunc(_775);
    int _789 = int(_787);
    bool _791 = uint(_753) >= uint(_292);
    bool _793 = _206 == 0;
    bool _795 = !_709;
    int _797 = _795 ? 0 : (-1);
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _801 = _799 != 0;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _805 = _803 != 0;
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _809 = ~_607;
    int _811 = _809 + _797;
    int _813 = _811 + 1;
    bool _815 = !_791;
    int _817 = _815 ? 0 : (-1);
    float _819 = _679;
    if (_198)
    {
        _657 = 0;
    }
    int _821 = _657;
    int _823 = _206 * _813;
    int _825 = _823 + _344;
    int _827 = _821;
    if (!_198)
    {
        _827 = 2;
    }
    int _829 = _827;
    float _831 = trunc(_541);
    int _833 = int(_831);
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _837 = _835 != 0;
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _841 = _839 != 0;
    int _843 = ~_713;
    int _845 = _843 + _817;
    int _847 = _845 + 1;
    int _849 = abs(_683);
    bool _851 = !_841;
    int _853 = _851 ? 0 : 1;
    int _855 = _292 * _847;
    int _857 = _855 + _376;
    int _859 = ~_763;
    int _861 = _859 + 1;
    int _863 = _861 + 1;
    float _865 = trunc(_711);
    int _867 = int(_865);
    bool _869 = !_793;
    int _871 = _869 ? _825 : (-1);
    bool _873 = _292 == 0;
    int _875 = ~_789;
    int _877 = _875 + 1;
    int _879 = _877 + 1;
    int _881 = _871 * _863;
    bool _883 = !_873;
    int _885 = _883 ? _857 : (-1);
    int _887 = _206 + (-1);
    bool _889 = !_837;
    int _891 = _889 ? 0 : 1;
    int _893 = _879 * _885;
    int _895 = abs(_759);
    int _897 = _763 * _887;
    int _899 = _897 + _881;
    bool _901 = _829 != 2;
    int _903 = _867 * _849;
    int _905 = _903 + _344;
    int _907 = abs(_779);
    int _909 = _292 + (-1);
    int _911 = abs(_853);
    int _913 = _899 * _907;
    int _915 = abs(_785);
    int _917 = _789 * _909;
    int _919 = _917 + _893;
    bool _921 = !_801;
    int _923 = _921 ? 0 : 1;
    int _925 = _701 * _915;
    int _927 = _925 + _913;
    int _929 = _723 * _895;
    int _931 = _929 + _376;
    int _933 = abs(_891);
    float _935 = _807 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _937 = abs(_923);
    int _939 = _919 * _911;
    bool _941 = !_749;
    int _943 = _941 ? 0 : 1;
    float _945 = fma(_935, _499, -0.5);
    int _947 = _833 * _933;
    int _949 = _947 + _939;
    int _951 = abs(_943);
    float _953 = _392 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _955 = abs(_705);
    int _957 = _931 * _937;
    int _959 = _957 + _949;
    bool _961 = !_805;
    int _963 = _961 ? 0 : 1;
    int _965 = _905 * _951;
    int _967 = _965 + _927;
    float _969 = _392 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _971 = abs(_963);
    float _973 = _392 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _975 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[8].x, _953);
    int _977 = _867 * _955;
    int _979 = _977 + _967;
    float _981 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[9].x, _969);
    float _983 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[10].x, _973);
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _987 = float(uint(_979));
    int _989 = _723 * _971;
    int _991 = _989 + _959;
    float _993 = as_type<float>(_881);
    float _995 = as_type<float>(_895);
    float _997 = as_type<float>(_915);
    if (!_781)
    {
        _993 = _184;
    }
    float _999 = _993;
    float _1001 = as_type<float>(_388) * _987;
    float _1003 = float(uint(_991));
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1009 = as_type<float>(_400) * _1003;
    float _1011 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1005);
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1015 = ~_206;
    int _1017 = _1015 + 1;
    float _1019 = trunc(_1001);
    float _1021 = precise::max(_1019, 0.0);
    uint _1023 = uint(_1021);
    float _1025 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1011);
    float _1027 = _1011;
    float _1029 = _999;
    if (!_781)
    {
        _1027 = _999;
    }
    float _1031 = _1027;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1035 = _1031;
    if (_781)
    {
        _1029 = _184;
    }
    float _1037 = _1029;
    float _1039 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1013);
    if (!_781)
    {
        _995 = _174;
    }
    float _1041 = _995;
    float _1043 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1033);
    float _1045 = trunc(_1009);
    float _1047 = precise::max(_1045, 0.0);
    uint _1049 = uint(_1047);
    float _1051 = _985 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1053 = _1041;
    if (!_781)
    {
        _997 = _1041;
    }
    float _1055 = _997;
    float _1057 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1059 = _1055;
    if (_781)
    {
        _1053 = _174;
    }
    float _1061 = _1053;
    float _1063 = _1025 * (-0.15915493667125701904296875);
    int _1065 = _1017 * int(_1023);
    int _1067 = _1065 + _979;
    int _1069 = ~_292;
    int _1071 = _1069 + 1;
    float _1073 = _1063 * 6.283185482025146484375;
    float _1075 = sin(_1073);
    float _1077 = in.m_63.x;
    float _1079 = in.m_63.y;
    float _1081 = in.m_63.z;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1085 = float(uint(_1067));
    float _1087 = fma(_362, _1057, -0.5);
    int _1089 = _1071 * int(_1049);
    int _1091 = _1089 + _991;
    float _1093 = fma(_1051, _274, -0.5);
    float _1095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1097 = as_type<float>(_388) * _1085;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1101 = float(uint(_1091));
    float _1103 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1083);
    float _1105 = as_type<float>(_1091);
    float _1107 = _1083;
    float _1109 = as_type<float>(_1023);
    if (!_781)
    {
        _1105 = _194;
    }
    float _1111 = _1105;
    float _1113 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1043);
    float _1115 = _1111;
    if (_781)
    {
        _1059 = _1037;
    }
    float _1117 = _1059;
    float _1119 = _1063 * 6.283185482025146484375;
    float _1121 = cos(_1119);
    if (!_781)
    {
        _1107 = _1111;
    }
    float _1123 = _1107;
    float _1125 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1103);
    float _1127 = _1123;
    if (_781)
    {
        _1115 = _194;
    }
    float _1129 = _1115;
    float _1131 = 0.0;
    if (!_781)
    {
        _1131 = _1031;
    }
    float _1133 = _1131;
    float _1135 = _1133;
    if (_781)
    {
        _1135 = _1129;
    }
    float _1137 = _1135;
    float _1139 = trunc(_1097);
    float _1141 = precise::max(_1139, 0.0);
    uint _1143 = uint(_1141);
    float _1145 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1099);
    float _1147 = as_type<float>(_400) * _1101;
    float _1149 = _1075 * _1087;
    float _1151 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_781)
    {
        _1035 = _1129;
    }
    float _1153 = _1035;
    float _1155 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1157 = _1121 * _1087;
    float _1159 = trunc(_1147);
    float _1161 = precise::max(_1159, 0.0);
    uint _1163 = uint(_1161);
    float _1165 = -_1149;
    float _1167 = fma(_1121, _1093, _1165);
    float _1169 = fma(_1151, _306, -0.5);
    float _1171 = fma(_1075, _1093, _1157);
    float _1173 = _653 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1175 = _653 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _1177 = _653 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1179 = _1157;
    if (_901)
    {
        _1179 = _1061;
    }
    float _1181 = _1179;
    float _1183 = fma(_679, _1077, _1173);
    float _1185 = fma(_679, _1079, _1175);
    int _1187 = int(_1023) + int(_1143);
    float _1189 = fma(_679, _1081, _1177);
    int _1191 = ~_206;
    int _1193 = _1191 + 1;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1197 = float(uint(_905));
    float _1199 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1145);
    int _1201 = int(_1049) + int(_1163);
    int _1203 = _1193 * _1187;
    int _1205 = _1203 + _979;
    float _1207 = as_type<float>(_388) * _1197;
    float _1209 = _1181;
    if (_901)
    {
        _1109 = _1129;
    }
    float _1211 = _1109;
    float _1213 = fma(_1155, -2.0, _1195);
    float _1215 = _1211;
    if (!_901)
    {
        _1209 = _1037;
    }
    float _1217 = _1209;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    int _1221 = ~_292;
    int _1223 = _1221 + 1;
    float _1225 = trunc(_1207);
    float _1227 = precise::max(_1225, 0.0);
    uint _1229 = uint(_1227);
    if (!_901)
    {
        _1215 = _1061;
    }
    float _1231 = _1215;
    float _1233 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1219);
    bool _1235 = uint(_1205) >= uint(_206);
    int _1237 = _1223 * _1201;
    int _1239 = _1237 + _991;
    float _1241 = float(uint(_931));
    float _1243 = in.m_71.w;
    bool _1245 = !_1235;
    int _1247 = _1245 ? 0 : (-1);
    float _1249 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1251 = uint(_1239) >= uint(_292);
    float _1253 = as_type<float>(_400) * _1241;
    int _1255 = ~_1187;
    int _1257 = _1255 + _1247;
    int _1259 = _1257 + 1;
    float _1261 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1233);
    float _1263 = in.m_58.x;
    float _1265 = in.m_58.y;
    float _1267 = in.m_58.z;
    if (!_781)
    {
        _819 = _1123;
    }
    float _1269 = _819;
    float _1271 = trunc(_1253);
    float _1273 = precise::max(_1271, 0.0);
    uint _1275 = uint(_1273);
    bool _1277 = !_1251;
    int _1279 = _1277 ? 0 : (-1);
    int _1281 = _206 * _1259;
    int _1283 = _1281 + _979;
    float _1285 = _1269;
    if (_781)
    {
        _1285 = _1061;
    }
    float _1287 = _1285;
    if (_781)
    {
        _1127 = _1061;
    }
    float _1289 = _1127;
    int _1291 = ~_206;
    int _1293 = _1291 + 1;
    int _1295 = ~_1201;
    int _1297 = _1295 + _1279;
    int _1299 = _1297 + 1;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1303 = !_793;
    int _1305 = _1303 ? _1283 : (-1);
    int _1307 = _1293 * int(_1229);
    int _1309 = _1307 + _905;
    int _1311 = ~_292;
    int _1313 = _1311 + 1;
    float _1315 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1301);
    int _1317 = _1305 & 3;
    bool _1319 = _1317 != 0;
    int _1321 = _1305 & 3;
    bool _1323 = _1321 != 0;
    int _1325 = _1313 * int(_1275);
    int _1327 = _1325 + _931;
    float _1329 = float(uint(_1309));
    float _1331 = fma(_1185, _1243, _1265);
    int _1333 = _1319 ? 0 : 1;
    float _1335 = fma(_1183, _1243, _1263);
    bool _1337 = uint(_1321) > 1u;
    float _1339 = as_type<float>(_388) * _1329;
    int _1341 = _292 * _1299;
    int _1343 = _1341 + _991;
    float _1345 = float(uint(_1327));
    float _1347 = fma(_1189, _1243, _1267);
    int _1349 = ~_1333;
    int _1351 = _1349 + 1;
    int _1353 = _1351 + 1;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1357 = !_873;
    int _1359 = _1357 ? _1343 : (-1);
    float _1361 = as_type<float>(_400) * _1345;
    float _1363 = _1331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1365 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1355);
    float _1367 = _1331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1369 = _1353;
    if (!_1337)
    {
        int _1371 = ~_1333;
        int _1373 = _1371 + 1;
        _1369 = _1373;
    }
    int _1375 = _1369;
    float _1377 = trunc(_1339);
    float _1379 = precise::max(_1377, 0.0);
    uint _1381 = uint(_1379);
    int _1383 = _1359 & 3;
    bool _1385 = _1383 != 0;
    float _1387 = fma(_1335, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1363);
    float _1389 = _1331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1391 = fma(_1335, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1367);
    int _1393 = _1385 ? 0 : 1;
    float _1395 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1387);
    bool _1397 = uint(_1383) > 1u;
    float _1399 = trunc(_1361);
    float _1401 = precise::max(_1399, 0.0);
    uint _1403 = uint(_1401);
    float _1405 = fma(_1335, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1389);
    float _1407 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1391);
    float _1409 = _1395 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1411 = _1305 >> 31;
    float _1413 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1405);
    float _1415 = _1407 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1419 = _1409 + _1417;
    int _1421 = ~_1393;
    int _1423 = _1421 + 1;
    int _1425 = _1423 + 1;
    float _1427 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1315);
    int _1429 = int(_1229) + int(_1381);
    float _1431 = _1419 * _1419;
    int _1433 = _1411 & 3;
    float _1435 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1365);
    int _1437 = _1425;
    if (!_1397)
    {
        int _1439 = ~_1393;
        int _1441 = _1439 + 1;
        _1437 = _1441;
    }
    int _1443 = _1437;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1447 = _1415 + _1445;
    int _1449 = int(_1275) + int(_1403);
    float _1451 = _1413 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1453 = _1359 >> 31;
    float _1455 = fma(_1447, _1447, _1431);
    int _1457 = _1305 + _1433;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1461 = _1451 + _1459;
    int _1463 = _1453 & 3;
    float _1465 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1467 = ~_206;
    int _1469 = _1467 + 1;
    float _1471 = fma(_1461, _1461, _1455);
    int _1473 = ~_292;
    int _1475 = _1473 + 1;
    int _1477 = _1359 + _1463;
    int _1479 = _1469 * _1429;
    int _1481 = _1479 + _905;
    float _1483 = rsqrt(_1471);
    int _1485 = _1477 >> 2;
    int _1487 = _1475 * _1449;
    int _1489 = _1487 + _931;
    bool _1491 = uint(_1481) >= uint(_206);
    int _1493 = _1485 << 4;
    int _1495 = _1493 + 512;
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1499 = _1457 >> 2;
    bool _1501 = !_1491;
    int _1503 = _1501 ? 0 : (-1);
    uint _1505 = uint(int(uint(_1495) >> uint(2)));
    uint _1507 = uint(int(uint(int(_1505)) >> uint(2)));
    int _1509 = int(_1505) & 3;
    float _1511 = (*spvDescriptorSet0.vp_c9)._m0[int(_1507)][_1509];
    int _1513 = int(_1505) + 1;
    uint _1515 = uint(int(uint(_1513) >> uint(2)));
    int _1517 = _1513 & 3;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[int(_1515)][_1517];
    bool _1521 = uint(_1489) >= uint(_292);
    float _1523 = -_1497;
    float _1525 = fma(_1465, 2.0, _1523);
    int _1527 = _1499 << 4;
    int _1529 = _1527 + 368;
    float _1531 = _1419 * _1483;
    int _1533 = ~_1429;
    int _1535 = _1533 + _1503;
    int _1537 = _1535 + 1;
    float _1539 = -_148;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1525);
    bool _1543 = !_1521;
    int _1545 = _1543 ? 0 : (-1);
    uint _1547 = uint(int(uint(_1529) >> uint(2)));
    uint _1549 = uint(int(uint(int(_1547)) >> uint(2)));
    int _1551 = int(_1547) & 3;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[int(_1549)][_1551];
    int _1555 = int(_1547) + 1;
    uint _1557 = uint(int(uint(_1555) >> uint(2)));
    int _1559 = _1555 & 3;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[int(_1557)][_1559];
    bool _1563 = uint(_1321) >= 2u;
    int _1565 = _206 * _1537;
    int _1567 = _1565 + _905;
    int _1569 = ~_1449;
    int _1571 = _1569 + _1545;
    int _1573 = _1571 + 1;
    float _1575 = _1447 * _1483;
    int _1577 = _1563 ? 0 : 1;
    float _1579 = -_1531;
    float _1581 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1419);
    bool _1583 = _1321 != 3;
    int _1585 = _292 * _1573;
    int _1587 = _1585 + _931;
    float _1589 = -_1575;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1447);
    int _1593 = _1495 + 8;
    uint _1595 = uint(int(uint(_1593) >> uint(2)));
    uint _1597 = uint(int(uint(int(_1595)) >> uint(2)));
    int _1599 = int(_1595) & 3;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[int(_1597)][_1599];
    int _1603 = int(_1595) + 1;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    int _1607 = _1603 & 3;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[int(_1605)][_1607];
    int _1611 = ~_1577;
    int _1613 = _1611 + 1;
    int _1615 = _1613 + 1;
    float _1617 = _1581 * _1581;
    int _1619 = abs(_1375);
    bool _1621 = uint(_1383) >= 2u;
    float _1623 = fma(_1591, _1591, _1617);
    int _1625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1627 = _1625 != 0;
    int _1629 = _1529 + 8;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    uint _1633 = uint(int(uint(int(_1631)) >> uint(2)));
    int _1635 = int(_1631) & 3;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[int(_1633)][_1635];
    int _1639 = int(_1631) + 1;
    uint _1641 = uint(int(uint(_1639) >> uint(2)));
    int _1643 = _1639 & 3;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[int(_1641)][_1643];
    int _1647 = abs(_1443);
    int _1649 = _1615;
    if (_1583)
    {
        int _1651 = ~_1577;
        int _1653 = _1651 + 1;
        _1649 = _1653;
    }
    int _1655 = _1649;
    int _1657 = _1359 & 3;
    bool _1659 = _1657 != 0;
    float _1661 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1663 = int(_1661);
    bool _1665 = !_1323;
    int _1667 = _1665 ? 0 : 1;
    bool _1669 = !_1659;
    int _1671 = _1669 ? 0 : 1;
    bool _1673 = _1383 != 3;
    int _1675 = ~_1619;
    int _1677 = _1675 + 1;
    int _1679 = _1677 + 1;
    int _1681 = abs(_1671);
    int _1683 = ~_1647;
    int _1685 = _1683 + 1;
    int _1687 = _1685 + 1;
    int _1689 = _1621 ? 0 : 1;
    int _1691 = ~_1681;
    int _1693 = _1691 + 1;
    int _1695 = _1693 + 1;
    int _1697 = _1687 * as_type<int>(_1519);
    bool _1699 = _1321 != 3;
    int _1701 = abs(_1667);
    int _1703 = _1695 * as_type<int>(_1511);
    int _1705 = _1703 + _1697;
    int _1707 = ~_1689;
    int _1709 = _1707 + 1;
    int _1711 = _1709 + 1;
    int _1713 = _1679 * as_type<int>(_1561);
    int _1715 = _1711;
    if (_1673)
    {
        int _1717 = ~_1689;
        int _1719 = _1717 + 1;
        _1715 = _1719;
    }
    int _1721 = _1715;
    float _1723 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1725 = int(_1723);
    int _1727 = ~_1701;
    int _1729 = _1727 + 1;
    int _1731 = _1729 + 1;
    bool _1733 = !_1699;
    int _1735 = _1733 ? 0 : (-1);
    int _1737 = abs(_1655);
    int _1739 = _1731 * as_type<int>(_1553);
    int _1741 = _1739 + _1713;
    int _1743 = abs(_1735);
    float _1745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1747 = ~_1737;
    int _1749 = _1747 + 1;
    int _1751 = _1749 + 1;
    int _1753 = ~_1743;
    int _1755 = _1753 + 1;
    int _1757 = _1755 + 1;
    bool _1759 = _1383 != 3;
    int _1761 = abs(_1721);
    int _1763 = _1751 * as_type<int>(_1637);
    int _1765 = _1763 + _1741;
    float _1767 = float(uint(_1663));
    float _1769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1771 = !_1627;
    int _1773 = _1771 ? 0 : 1;
    int _1775 = _1757 * as_type<int>(_1645);
    int _1777 = _1775 + _1765;
    bool _1779 = !_1759;
    int _1781 = _1779 ? 0 : (-1);
    int _1783 = abs(_1663);
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1787 = _1785 != 0;
    float _1789 = 1.0 / _1767;
    int _1791 = ~_1761;
    int _1793 = _1791 + 1;
    int _1795 = _1793 + 1;
    int _1797 = abs(_1781);
    int _1799 = abs(_1725);
    int _1801 = _1795 * as_type<int>(_1601);
    int _1803 = _1801 + _1705;
    int _1805 = ~_1797;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    float _1811 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1813 = abs(_1773);
    int _1815 = _1809 * as_type<int>(_1609);
    int _1817 = _1815 + _1803;
    bool _1819 = !_1787;
    int _1821 = _1819 ? 0 : 1;
    float _1823 = float(uint(_1725));
    int _1825 = abs(_1821);
    float _1827 = _1461 * _1483;
    float _1829 = float(uint(_1783));
    float _1831 = 1.0 / _1823;
    int _1833 = ~_1813;
    int _1835 = _1833 + 1;
    int _1837 = _1835 + 1;
    bool _1839 = !_793;
    int _1841 = _1839 ? _1567 : (-1);
    bool _1843 = !_873;
    int _1845 = _1843 ? _1587 : (-1);
    int _1847 = _1777 * _1837;
    float _1849 = 1.0 / _1829;
    float _1851 = -_1827;
    float _1853 = fma(_1851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1461);
    int _1855 = ~_1825;
    int _1857 = _1855 + 1;
    int _1859 = _1857 + 1;
    float _1861 = float(uint(_1799));
    float _1863 = fma(_1853, _1853, _1623);
    int _1865 = as_type<int>(_1789) + (-2);
    int _1867 = _1859 * _1817;
    int _1869 = _1841 * _1813;
    int _1871 = _1869 + _1847;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1875 = sqrt(_1863);
    int _1877 = _1845 * _1825;
    int _1879 = _1877 + _1867;
    int _1881 = as_type<int>(_1831) + (-2);
    float _1883 = -_1873;
    float _1885 = fma(_1249, 2.0, _1883);
    float _1887 = float(uint(_1871));
    float _1889 = -_148;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1885);
    float _1893 = 1.0 / _1861;
    int _1895 = abs(_1871);
    float _1897 = as_type<float>(_1865) * _1887;
    float _1899 = float(uint(_1879));
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1903 = as_type<int>(_1849) + (-2);
    float _1905 = fma(_1113, _1169, _1891);
    float _1907 = as_type<float>(_1881) * _1899;
    float _1909 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1911 = abs(_1879);
    float _1913 = trunc(_1897);
    float _1915 = precise::max(_1913, 0.0);
    uint _1917 = uint(_1915);
    float _1919 = float(uint(_1895));
    float _1921 = fma(_1909, -2.0, _1901);
    float _1923 = _1483 * _1875;
    float _1925 = _1261 * (-0.15915493667125701904296875);
    int _1927 = as_type<int>(_1893) + (-2);
    float _1929 = as_type<float>(_1903) * _1919;
    float _1931 = _336 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1933 = float(uint(_1911));
    float _1935 = _715 * _1923;
    float _1937 = trunc(_1907);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    float _1943 = _1931 * _1923;
    float _1945 = _737 * _1923;
    float _1947 = as_type<float>(_1927) * _1933;
    int _1949 = ~_1799;
    int _1951 = _1949 + 1;
    float _1953 = _1935 * _419;
    int _1955 = ~_1663;
    int _1957 = _1955 + 1;
    float _1959 = _1943 * _421;
    float _1961 = trunc(_1947);
    float _1963 = precise::max(_1961, 0.0);
    uint _1965 = uint(_1963);
    int _1967 = ~_1725;
    int _1969 = _1967 + 1;
    float _1971 = _1945 * _408;
    int _1973 = _1957 * int(_1917);
    int _1975 = _1973 + _1871;
    int _1977 = ~_1783;
    int _1979 = _1977 + 1;
    float _1981 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _469);
    int _1983 = _1969 * int(_1941);
    int _1985 = _1983 + _1879;
    float _1987 = _1925 * 6.283185482025146484375;
    float _1989 = sin(_1987);
    float _1991 = _1953 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1993 = float(uint(_1975));
    float _1995 = float(uint(_1985));
    float _1997 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1991);
    int _1999 = _1951 * int(_1965);
    int _2001 = _1999 + _1911;
    float _2003 = _1925 * 6.283185482025146484375;
    float _2005 = cos(_2003);
    float _2007 = as_type<float>(_1881) * _1995;
    float _2009 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1997);
    float _2011 = as_type<float>(_1865) * _1993;
    float _2013 = float(uint(_2001));
    float _2015 = -_148;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[76].x, _449);
    float _2019 = trunc(_1929);
    float _2021 = precise::max(_2019, 0.0);
    uint _2023 = uint(_2021);
    float _2025 = _1953 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2027 = as_type<float>(_1927) * _2013;
    float _2029 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1039);
    float _2031 = _1451 + _2009;
    float _2033 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2025);
    float _2035 = _1953 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2037 = trunc(_2011);
    float _2039 = precise::max(_2037, 0.0);
    uint _2041 = uint(_2039);
    float _2043 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2033);
    float _2045 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1213);
    float _2047 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1921);
    float _2049 = _1745 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2051 = _1415 + _2043;
    float _2053 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2035);
    float _2055 = -_2047;
    float _2057 = fma(_1199, _945, _2055);
    float _2059 = trunc(_2007);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    int _2065 = _1979 * int(_2023);
    int _2067 = _2065 + _1895;
    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2071 = _2051 + _2069;
    float _2073 = fma(_2049, _288, -0.5);
    int _2075 = ~_1799;
    int _2077 = _2075 + 1;
    float _2079 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2053);
    float _2081 = _2071 * _2071;
    float _2083 = float(uint(_2067));
    float _2085 = trunc(_2027);
    float _2087 = precise::max(_2085, 0.0);
    uint _2089 = uint(_2087);
    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2093 = _2031 + _2091;
    int _2095 = int(_1917) + int(_2041);
    float _2097 = as_type<float>(_1903) * _2083;
    float _2099 = _2093 * _2093;
    float _2101 = fma(_368, _1811, -0.5);
    int _2103 = ~_1663;
    int _2105 = _2103 + 1;
    float _2107 = _2081 + _2099;
    float _2109 = trunc(_2097);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    float _2115 = _1989 * _2101;
    float _2117 = _2005 * _2101;
    int _2119 = int(_1941) + int(_2063);
    int _2121 = _2105 * _2095;
    int _2123 = _2121 + _1871;
    int _2125 = ~_1725;
    int _2127 = _2125 + 1;
    float _2129 = -_2115;
    float _2131 = fma(_2005, _2073, _2129);
    float _2133 = fma(_1989, _2073, _2117);
    float _2135 = sqrt(_2107);
    int _2137 = ~_1783;
    int _2139 = _2137 + 1;
    int _2141 = _2127 * _2119;
    int _2143 = _2141 + _1879;
    int _2145 = int(_1965) + int(_2089);
    bool _2147 = uint(_2123) >= uint(_1663);
    bool _2149 = uint(_2143) >= uint(_1725);
    int _2151 = _2077 * _2145;
    int _2153 = _2151 + _1911;
    int _2155 = int(_2023) + int(_2113);
    int _2157 = _2139 * _2155;
    int _2159 = _2157 + _1895;
    float _2161 = _1409 + _2079;
    bool _2163 = _2135 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _2165 = !_2163;
    float _2167 = _2161;
    float _2169 = _2081;
    float _2171 = _2099;
    float _2173 = _2031;
    float _2175 = _2051;
    int _2177 = _1663;
    int _2179 = as_type<int>(_2049);
    if (!_2165)
    {
        float _2181 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2185 = _2135 + _2183;
        float _2187 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2189 = rsqrt(_2107);
        float _2191 = _2185 * _2181;
        float _2193 = _2191 * 0.15915493667125701904296875;
        float _2195 = _2193 * 6.283185482025146484375;
        float _2197 = sin(_2195);
        float _2199 = _2193 * 6.283185482025146484375;
        float _2201 = cos(_2199);
        float _2203 = fma(_2197, _2187, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2205 = _2189 * _2203;
        float _2207 = _2201 + (-1.0);
        float _2209 = fma(_2071, _2205, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2211 = fma(_2093, _2205, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2213 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2215 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2217 = _2209 + _2215;
        float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2221 = _2211 + _2219;
        float _2223 = fma(_2161, _2201, _2213);
        float _2225 = _2217 * _2217;
        float _2227 = _2221 * _2221;
        _2167 = _2223;
        _2169 = _2225;
        _2171 = _2227;
        _2173 = _2211;
        _2175 = _2209;
    }
    float _2229 = _2167;
    float _2231 = _2169;
    float _2233 = _2171;
    float _2235 = _2173;
    float _2237 = _2175;
    bool _2239 = !_2147;
    int _2241 = _2239 ? 0 : (-1);
    float _2243 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[9].z, _981);
    bool _2245 = !_2149;
    int _2247 = _2245 ? 0 : (-1);
    float _2249 = _2057 + 0.5;
    bool _2251 = uint(_2159) >= uint(_1783);
    bool _2253 = uint(_2153) >= uint(_1799);
    int _2255 = _1871 ^ _1663;
    int _2257 = _1879 ^ _1725;
    int _2259 = ~_2095;
    int _2261 = _2259 + _2241;
    int _2263 = _2261 + 1;
    bool _2265 = !_2251;
    int _2267 = _2265 ? 0 : (-1);
    bool _2269 = !_2253;
    int _2271 = _2269 ? 0 : (-1);
    int _2273 = _1663 * _2263;
    int _2275 = _2273 + _1871;
    uint _2277 = uint(int(uint(_2255) >> uint(31)));
    uint _2279 = uint(int(uint(_2257) >> uint(31)));
    int _2281 = ~_2267;
    int _2283 = _2155 + _2281;
    int _2285 = _2283 + 1;
    int _2287 = ~_2271;
    int _2289 = _2145 + _2287;
    int _2291 = _2289 + 1;
    int _2293 = ~int(_2277);
    int _2295 = _2293 + 1;
    float _2297 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2299 = _2229 + _2297;
    int _2301 = ~int(_2279);
    int _2303 = _2301 + 1;
    int _2305 = ~_2119;
    int _2307 = _2305 + _2247;
    int _2309 = _2307 + 1;
    float _2311 = fma(_2299, _2299, _2231);
    int _2313 = _2285 ^ _2295;
    int _2315 = _2291 ^ _2303;
    int _2317 = _1725 * _2309;
    int _2319 = _2317 + _1879;
    bool _2321 = _1663 == 0;
    float _2323 = _2311 + _2233;
    bool _2325 = _1725 == 0;
    float _2327 = _1905 + 0.5;
    int _2329 = ~_2295;
    int _2331 = _2329 + _2313;
    int _2333 = _2331 + 1;
    int _2335 = ~_2303;
    int _2337 = _2335 + _2315;
    int _2339 = _2337 + 1;
    float _2341 = sqrt(_2323);
    bool _2343 = _1663 == 0;
    out.m_75.x = _2327;
    out.m_75.y = _2249;
    bool _2345 = _1725 == 0;
    bool _2347 = !_2321;
    int _2349 = _2347 ? _2333 : (-1);
    bool _2351 = !_2325;
    int _2353 = _2351 ? _2339 : (-1);
    bool _2355 = !_2343;
    int _2357 = _2355 ? _2275 : (-1);
    bool _2359 = !_2345;
    int _2361 = _2359 ? _2319 : (-1);
    float _2363 = float(_2349);
    float _2365 = float(_2353);
    float _2367 = float(_2357);
    float _2369 = -_1981;
    float _2371 = fma(_1057, _2363, _2369);
    float _2373 = float(_2361);
    float _2375 = -_2045;
    float _2377 = fma(_1811, _2365, _2375);
    float _2379 = fma(_1051, _2367, _2017);
    float _2381 = fma(_2049, _2373, _1541);
    float _2383 = fma(_1125, _1171, _2371);
    float _2385 = fma(_2029, _1167, _2379);
    float _2387 = fma(_1427, _2131, _2381);
    float _2389 = fma(_1435, _2133, _2377);
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2393 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2395 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2397 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2399 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2401 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2403 = _2393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2405 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2407 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[8].z, _975);
    float _2409 = _2385 + 0.5;
    float _2411 = _2387 + 0.5;
    float _2413 = _2383 + 0.5;
    float _2415 = _2389 + 0.5;
    float _2417 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[10].z, _983);
    out.m_77.x = _2401;
    out.m_77.y = _2403;
    out.m_77.z = _2405;
    out.m_77.w = _2399;
    bool _2419 = _2341 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2421 = isnan(_2341);
    bool _2423 = _2419 || _2421;
    bool _2425 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2427 = _2423 || _2425;
    out.m_79.w = _2397;
    out.m_81.x = _2409;
    out.m_81.y = _2413;
    out.m_81.z = _2411;
    out.m_81.w = _2415;
    out.m_83.x = _2407;
    out.m_83.y = _2243;
    out.m_83.z = _2417;
    float _2429 = _2385;
    float _2431 = _2413;
    if (!_2427)
    {
        _2429 = 1.0;
    }
    float _2433 = _2429;
    bool _2435 = !_2427;
    float _2437 = _2433;
    if (!_2435)
    {
        bool _2439 = _2341 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2441 = isnan(_2341);
        bool _2443 = _2439 || _2441;
        bool _2445 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2447 = _2443 || _2445;
        if (!_2447)
        {
            float _2449 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2451 = _2341 + _2449;
            float _2453 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2455 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2453;
            float _2457 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2461 = 1.0 / _2455;
            float _2463 = _2451 * _2461;
            float _2465 = fma(_2463, _2459, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2437 = _2465;
            _2467 = true;
        }
        else
        {
            bool _2469 = _2341 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2471 = isnan(_2341);
            bool _2473 = _2469 || _2471;
            bool _2475 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2477 = _2473 || _2475;
            if (!_2477)
            {
                float _2479 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2481 = _2341 + _2479;
                float _2483 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2485 = _2483 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2487 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2489 = _2487 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2491 = 1.0 / _2485;
                float _2493 = _2481 * _2491;
                float _2495 = fma(_2493, _2489, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2437 = _2495;
                _2467 = true;
            }
            else
            {
                _2437 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2467 = false;
    float _2497 = _2437;
    float _2499 = -_1531;
    float _2501 = fma(_2499, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1409);
    float _2503 = -_1575;
    float _2505 = fma(_2503, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1415);
    float _2507 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2509 = _2235 + _2507;
    float _2511 = -_1827;
    float _2513 = fma(_2511, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
    float _2515 = _2501 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2517 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2519 = _2229 + _2517;
    float _2521 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2523 = _2237 + _2521;
    float _2525 = fma(_2509, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2527 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2515);
    float _2529 = fma(_2519, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2531 = fma(_2523, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2533 = -_1827;
    float _2535 = fma(_2533, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2525);
    float _2537 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2527);
    float _2539 = _2501 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2541 = -_1531;
    float _2543 = fma(_2541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2529);
    float _2545 = -_1575;
    float _2547 = fma(_2545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2531);
    float _2549 = _2537 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2551 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2539);
    float _2553 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2555 = _2543 + _2553;
    float _2557 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2559 = _2547 + _2557;
    float _2561 = 1.0 / _2549;
    float _2563 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2551);
    float _2565 = _2555 * _2555;
    float _2567 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2569 = _2535 + _2567;
    float _2571 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2573 = fma(_2559, _2559, _2565);
    float _2575 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2577 = _2571 + _2549;
    float _2579 = fma(_2569, _2569, _2573);
    float _2581 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2583 = rsqrt(_2579);
    float _2585 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2575);
    float _2587 = _2577 * _2561;
    float _2589 = _2587 * 0.5;
    float _2591 = _2501 + _2581;
    float _2593 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2595 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2593);
    float _2597 = sqrt(_2579);
    float _2599 = fma(_2505, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2601 = 1.0 / _2595;
    float _2603 = _2583 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2605 = _2559 * _2603;
    float _2607 = _2569 * _2603;
    float _2609 = floor(_2599);
    float _2611 = _2605 * _2605;
    float _2613 = _2607 * _2607;
    float _2615 = _2611 + _2613;
    float _2617 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2619 = _2601 * _2617;
    float _2621 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2623 = sqrt(_2615);
    bool _2625 = _2619 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2627 = fma(_2505, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2621);
    bool _2629 = _2619 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2631 = -_2609;
    float _2633 = _2599 + _2631;
    float _2635 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2627);
    bool _2637 = !_2625;
    int _2639 = _2637 ? 0 : 1;
    float _2641 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _2643 = 2;
    float _2645 = _2605;
    float _2647 = _2607;
    float _2649 = _2611;
    float _2651 = _2613;
    float _2653 = _2609;
    float _2655 = _2555;
    if (!_2625)
    {
        _2643 = 1;
    }
    int _2657 = _2643;
    float _2659 = trunc(_2641);
    int _2661 = int(_2659);
    int _2663 = _2657;
    if (!_2629)
    {
        _2663 = _2639;
    }
    int _2665 = _2663;
    float _2667 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _2669 = _2623 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2671 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2673 = _2623 + _2671;
    int _2675 = _2665 << 6;
    float _2677 = fma(_2505, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2667);
    int _2679 = _2675 + 96;
    uint _2681 = uint(int(uint(_2679) >> uint(2)));
    uint _2683 = uint(int(uint(int(_2681)) >> uint(2)));
    int _2685 = int(_2681) & 3;
    float _2687 = (*spvDescriptorSet0.vp_c15)._m0[int(_2683)][_2685];
    int _2689 = int(_2681) + 1;
    uint _2691 = uint(int(uint(_2689) >> uint(2)));
    int _2693 = _2689 & 3;
    float _2695 = (*spvDescriptorSet0.vp_c15)._m0[int(_2691)][_2693];
    float _2697 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2677);
    float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2701 = _2327;
    float _2703 = _2673;
    if (_2669)
    {
        float _2705 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2701 = _2705;
    }
    float _2707 = _2701;
    int _2709 = _2675 + 104;
    uint _2711 = uint(int(uint(_2709) >> uint(2)));
    uint _2713 = uint(int(uint(int(_2711)) >> uint(2)));
    int _2715 = int(_2711) & 3;
    float _2717 = (*spvDescriptorSet0.vp_c15)._m0[int(_2713)][_2715];
    int _2719 = int(_2711) + 1;
    uint _2721 = uint(int(uint(_2719) >> uint(2)));
    int _2723 = _2719 & 3;
    float _2725 = (*spvDescriptorSet0.vp_c15)._m0[int(_2721)][_2723];
    int _2727 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2729 = _2661 + _2727;
    int _2731 = _2729 + 1;
    bool _2733 = _2731 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2735 = trunc(_2699);
    int _2737 = int(_2735);
    float _2739 = _2707;
    int _2741 = _2731;
    if (_2669)
    {
        float _2743 = _2673 * _2707;
        _2703 = _2743;
    }
    float _2745 = _2703;
    if (_2669)
    {
        float _2747 = _2745 * 0.15915493667125701904296875;
        _2739 = _2747;
    }
    float _2749 = _2739;
    float _2751 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2753 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2755 = _2737 + _2753;
    int _2757 = _2755 + 1;
    float _2759 = _2749;
    if (_2669)
    {
        float _2761 = _2749 * 6.283185482025146484375;
        float _2763 = sin(_2761);
        _2431 = _2763;
    }
    float _2765 = _2431;
    float _2767 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2751);
    int _2769 = _2731 | _2757;
    float _2771 = fma(_2535, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2767);
    bool _2773 = _2769 < 0;
    bool _2775 = _2773 || _2733;
    float _2777 = as_type<float>(_2737);
    if (_2669)
    {
        float _2779 = _2749 * 6.283185482025146484375;
        float _2781 = cos(_2779);
        _2777 = _2781;
    }
    float _2783 = _2777;
    float _2785 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2787 = _2771 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2789 = _2757 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2791 = _2789 || _2775;
    float _2793 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2795 = precise::max(0.0, _2785);
    float _2797 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2799 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_2669)
    {
        float _2801 = rsqrt(_2615);
        _2799 = _2801;
    }
    float _2803 = _2799;
    float _2805 = -_2603;
    float _2807 = -_2795;
    float _2809 = fma(_2555, _2805, _2807);
    float _2811 = _2591 * _2695;
    float _2813 = -_2797;
    float _2815 = fma(_2813, _2793, 1.0);
    float _2817 = _2695;
    float _2819 = _2809;
    if (_2669)
    {
        float _2821 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2759 = _2821;
    }
    float _2823 = _2759;
    float _2825 = _2823;
    if (_2669)
    {
        float _2827 = _2783 + (-1.0);
        _2817 = _2827;
    }
    float _2829 = _2817;
    float _2831 = fma(_2505, _2687, _2811);
    float _2833 = _2829;
    if (!_2791)
    {
        int _2835 = _2757 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2837 = _2835 + _2731;
        _2741 = _2837;
    }
    int _2839 = _2741;
    if (_2669)
    {
        float _2841 = fma(_2765, _2823, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2825 = _2841;
    }
    float _2843 = _2825;
    if (_2669)
    {
        float _2845 = _2829 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2833 = _2845;
    }
    float _2847 = _2833;
    float _2849 = fma(_2513, _2717, _2831);
    int _2851 = _2675 + 56;
    uint _2853 = uint(int(uint(_2851) >> uint(2)));
    uint _2855 = uint(int(uint(int(_2853)) >> uint(2)));
    int _2857 = int(_2853) & 3;
    float _2859 = (*spvDescriptorSet0.vp_c15)._m0[int(_2855)][_2857];
    int _2861 = int(_2853) + 1;
    uint _2863 = uint(int(uint(_2861) >> uint(2)));
    int _2865 = _2861 & 3;
    float _2867 = (*spvDescriptorSet0.vp_c15)._m0[int(_2863)][_2865];
    float _2869 = _2717;
    if (_2669)
    {
        float _2871 = fma(_2809, _2783, _2847);
        _2819 = _2871;
    }
    float _2873 = _2819;
    if (_2669)
    {
        float _2875 = _2803 * _2843;
        _2869 = _2875;
    }
    float _2877 = _2869;
    float _2879 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (!_2791)
    {
        int _2881 = _2839 << 2;
        _2177 = _2881;
    }
    int _2883 = _2177;
    float _2885 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _2887 = _2883;
    if (_2669)
    {
        float _2889 = _2605 * _2877;
        _2645 = _2889;
    }
    float _2891 = _2645;
    int _2893 = _2675 + 48;
    uint _2895 = uint(int(uint(_2893) >> uint(2)));
    uint _2897 = uint(int(uint(int(_2895)) >> uint(2)));
    int _2899 = int(_2895) & 3;
    float _2901 = (*spvDescriptorSet0.vp_c15)._m0[int(_2897)][_2899];
    int _2903 = int(_2895) + 1;
    uint _2905 = uint(int(uint(_2903) >> uint(2)));
    int _2907 = _2903 & 3;
    float _2909 = (*spvDescriptorSet0.vp_c15)._m0[int(_2905)][_2907];
    if (_2669)
    {
        float _2911 = _2607 * _2877;
        _2647 = _2911;
    }
    float _2913 = _2647;
    if (_2669)
    {
        float _2915 = _2891 * _2891;
        _2649 = _2915;
    }
    float _2917 = _2649;
    if (!_2791)
    {
        uint _2919 = uint(int(uint(_2839) >> uint(2)));
        _2179 = int(_2919);
    }
    int _2921 = _2179;
    if (_2669)
    {
        float _2923 = _2913 * _2913;
        _2651 = _2923;
    }
    float _2925 = _2651;
    if (!_2791)
    {
        int _2927 = 12 & _2883;
        _2887 = _2927;
    }
    int _2929 = _2887;
    float _2931 = fma(_2873, _2873, _2917);
    int _2933 = _2675 + 64;
    uint _2935 = uint(int(uint(_2933) >> uint(2)));
    uint _2937 = uint(int(uint(int(_2935)) >> uint(2)));
    int _2939 = int(_2935) & 3;
    float _2941 = (*spvDescriptorSet0.vp_c15)._m0[int(_2937)][_2939];
    int _2943 = int(_2935) + 1;
    uint _2945 = uint(int(uint(_2943) >> uint(2)));
    int _2947 = _2943 & 3;
    float _2949 = (*spvDescriptorSet0.vp_c15)._m0[int(_2945)][_2947];
    float _2951 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _2953 = _2929;
    if (!_2791)
    {
        int _2955 = _2921 << 4;
        int _2957 = _2955 + _2929;
        _2953 = _2957;
    }
    int _2959 = _2953;
    float _2961 = _2931 + _2925;
    float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2965 = fma(_2597, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2963);
    float _2967 = precise::clamp(_2965, 0.0, 1.0);
    float _2969 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2951);
    float _2971 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2879);
    float _2973 = _2849 + _2725;
    int _2975 = _2675 + 72;
    uint _2977 = uint(int(uint(_2975) >> uint(2)));
    uint _2979 = uint(int(uint(int(_2977)) >> uint(2)));
    int _2981 = int(_2977) & 3;
    float _2983 = (*spvDescriptorSet0.vp_c15)._m0[int(_2979)][_2981];
    int _2985 = int(_2977) + 1;
    uint _2987 = uint(int(uint(_2985) >> uint(2)));
    int _2989 = _2985 & 3;
    float _2991 = (*spvDescriptorSet0.vp_c15)._m0[int(_2987)][_2989];
    float _2993 = fma(_2535, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2969);
    float _2995 = fma(_2535, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2971);
    float _2997 = -_2967;
    float _2999 = _2997 + 1.0;
    float _3001 = fma(_2535, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2585);
    float _3003 = _2993 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3005 = _2995 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3007 = rsqrt(_2961);
    int _3009 = _2675 + 80;
    uint _3011 = uint(int(uint(_3009) >> uint(2)));
    uint _3013 = uint(int(uint(int(_3011)) >> uint(2)));
    int _3015 = int(_3011) & 3;
    float _3017 = (*spvDescriptorSet0.vp_c15)._m0[int(_3013)][_3015];
    int _3019 = int(_3011) + 1;
    uint _3021 = uint(int(uint(_3019) >> uint(2)));
    int _3023 = _3019 & 3;
    float _3025 = (*spvDescriptorSet0.vp_c15)._m0[int(_3021)][_3023];
    float _3027 = _3003 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3029 = _3001 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3031 = fma(_3005, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3027);
    float _3033 = 1.0 / _2973;
    int _3035 = _2675 + 88;
    uint _3037 = uint(int(uint(_3035) >> uint(2)));
    uint _3039 = uint(int(uint(int(_3037)) >> uint(2)));
    int _3041 = int(_3037) & 3;
    float _3043 = (*spvDescriptorSet0.vp_c15)._m0[int(_3039)][_3041];
    int _3045 = int(_3037) + 1;
    uint _3047 = uint(int(uint(_3045) >> uint(2)));
    int _3049 = _3045 & 3;
    float _3051 = (*spvDescriptorSet0.vp_c15)._m0[int(_3047)][_3049];
    float _3053 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3031);
    float _3055 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3053);
    float _3057 = _3007 * _2891;
    float _3059 = _3031;
    if (!_2791)
    {
        int _3061 = _2959 + 400;
        uint _3063 = uint(int(uint(_3061) >> uint(2)));
        uint _3065 = uint(int(uint(int(_3063)) >> uint(2)));
        int _3067 = int(_3063) & 3;
        float _3069 = (*spvDescriptorSet0.vp_c15)._m0[int(_3065)][_3067];
        _3059 = _3069;
    }
    float _3071 = _3059;
    float _3073 = _3007 * _2873;
    float _3075 = floor(_2885);
    float _3077 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3079 = _3007 * _2913;
    float _3081 = _2591 * _2909;
    float _3083 = abs(_2999);
    float _3085 = log2(_3083);
    float _3087 = fma(_2505, _2901, _3081);
    float _3089 = _2591 * _2949;
    float _3091 = fma(_2513, _2859, _3087);
    float _3093 = -_3075;
    float _3095 = _2885 + _3093;
    float _3097 = fma(_2505, _2941, _3089);
    float _3099 = _3091 + _2867;
    float _3101 = -_3077;
    float _3103 = fma(_3073, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3101);
    float _3105 = log2(_2815);
    float _3107 = fma(_2513, _2983, _3097);
    float _3109 = _3099 * _3033;
    float _3111 = -_3079;
    float _3113 = fma(_3111, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3103);
    float _3115 = _3085 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3117 = _3107 + _2991;
    bool _3119 = _3109 >= 0.0;
    float _3121 = _3097;
    if (!_2791)
    {
        float _3123 = floor(_2699);
        _3121 = _3123;
    }
    float _3125 = _3121;
    float _3127 = _3117 * _3033;
    float _3129 = _2591 * _3025;
    bool _3131 = _3109 <= 1.0;
    bool _3133 = _3131 && _3119;
    float _3135 = fma(_3113, -0.5, 0.5);
    float _3137 = fma(_3113, 0.5, 0.5);
    float _3139 = fma(_2505, _3017, _3129);
    bool _3141 = _3127 >= 0.0;
    bool _3143 = _3141 && _3133;
    float _3145 = sqrt(_3135);
    float _3147 = _3003 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3149 = fma(_2513, _3043, _3139);
    bool _3151 = _3127 <= 1.0;
    bool _3153 = _3151 && _3143;
    float _3155 = fma(_3137, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3157 = _3105 * 0.693147182464599609375;
    float _3159 = exp2(_3115);
    float _3161 = _3149 + _3051;
    float _3163 = _3003 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3165 = _3147;
    if (!_2791)
    {
        float _3167 = -_3125;
        float _3169 = _2699 + _3167;
        _2653 = _3169;
    }
    float _3171 = _2653;
    float _3173 = fma(_3005, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3147);
    float _3175 = fma(_3137, _3155, -0.212114393711090087890625);
    float _3177 = fma(_3005, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3163);
    float _3179 = _3073 + 1.0;
    float _3181 = _3129;
    float _3183 = _3179;
    if (!_2791)
    {
        float _3185 = floor(_2641);
        _3181 = _3185;
    }
    float _3187 = _3181;
    if (_3153)
    {
        float _3189 = float(_2665);
        _3165 = _3189;
    }
    float _3191 = _3165;
    float _3193 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3177);
    float _3195 = fma(_3137, _3175, 1.570728778839111328125);
    float _3197 = _3145 * 0.636619746685028076171875;
    float _3199 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3173);
    float _3201 = 1.0 / _3055;
    float _3203 = -_3195;
    float _3205 = fma(_3197, _3203, 1.0);
    float _3207 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3199);
    float _3209 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3193);
    float _3211 = -_3073;
    float _3213 = fma(_3159, _3179, _3211);
    float _3215 = _3157 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3217 = _3043;
    float _3219 = _3209;
    if (!_2791)
    {
        float _3221 = rint(_3071);
        float _3223 = precise::max(_3221, 0.0);
        uint _3225 = uint(_3223);
        uint _3227 = clamp(_3225, 0u, 65535u);
        _3217 = as_type<float>(_3227);
    }
    float _3229 = _3217;
    if (!_2791)
    {
        float _3231 = -_3187;
        float _3233 = _2641 + _3231;
        _3183 = _3233;
    }
    float _3235 = _3183;
    float _3237 = fma(_3213, 0.5, 0.5);
    float _3239 = _3177;
    if (_3153)
    {
        float _3241 = rint(_3191);
        float _3243 = precise::max(_3241, 0.0);
        uint _3245 = uint(_3243);
        uint _3247 = clamp(_3245, 0u, 65535u);
        _3239 = as_type<float>(_3247);
    }
    float _3249 = _3239;
    float _3251 = _3207 * _3201;
    float _3253 = _3209 * _3201;
    float _3255 = _3161 * _3033;
    float2 _8858 = float2(_2633, _3095);
    float _3257 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8858, float2(0.0), isnan(_8858)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8858, float2(0.0), isnan(_8858)), level(0.0)).x;
    float _3259 = fma(_3251, 0.5, 0.5);
    float _3261 = fma(_3253, -0.5, 0.5);
    float _3263 = _3171;
    if (!_2791)
    {
        float3 _8879 = float3(_3235, _3171, float(as_type<int>(_3229)));
        float3 _8883 = select(_8879, float3(0.0), isnan(_8879));
        float _3265 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8883.xy, uint(rint(_8883.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8883.xy, uint(rint(_8883.z)), level(0.0)).x;
        _3263 = _3265;
    }
    float _3267 = _3263;
    float _3269 = _3249;
    if (_3153)
    {
        float3 _8898 = float3(_3109, _3127, float(as_type<int>(_3249)));
        float3 _8900 = select(_8898, float3(0.0), isnan(_8898));
        float _3271 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8900.xy, uint(rint(_8900.z)), _3255, level(0.0));
        _3269 = _3271;
    }
    float _3273 = _3269;
    float3 _8910 = float3(_3259, _3261, _3215);
    float _3275 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8910, float3(0.0), isnan(_8910)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8910, float3(0.0), isnan(_8910)), level(0.0)).x;
    float3 _8919 = float3(_3259, _3261, _3215);
    float4 _3278 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8919, float3(0.0), isnan(_8919)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8919, float3(0.0), isnan(_8919)), level(0.0)).xyzw;
    float _3280 = _3278.x;
    float _3282 = _3278.y;
    float _3284 = _3278.z;
    float _3286 = _3278.w;
    float2 _8935 = float2(_3205, _3237);
    float3 _3290 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8935, float2(0.0), isnan(_8935)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8935, float2(0.0), isnan(_8935)), level(0.0)).xyz;
    float _3292 = _3290.x;
    float _3294 = _3290.y;
    float _3296 = _3290.z;
    float _3298 = abs(_2619);
    float _3300 = log2(_3298);
    float _3302 = _3003 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3304 = _3085 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_85.x = _2559;
    out.m_85.y = _2555;
    out.m_85.z = _2569;
    float _3306 = fma(_3005, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3302);
    float _3308 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3306);
    float _3310 = _3207 + _3055;
    float _3312 = _3055 * 0.5;
    float _3314 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3308);
    float _3316 = _3310 * 0.5;
    float _3318 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3320 = _3314 + _3055;
    float _3322 = exp2(_3304);
    bool _3324 = _2619 <= 8000.0;
    bool _3326 = isnan(_2619);
    bool _3328 = _3324 || _3326;
    bool _3330 = isnan(8000.0);
    bool _3332 = _3328 || _3330;
    float _3334 = float(_3332);
    float _3336 = _3320 * 0.5;
    float _3338 = fma(_3209, -0.5, _3312);
    out.gl_Position.x = _3207;
    out.gl_Position.y = _3209;
    out.gl_Position.z = _3314;
    out.gl_Position.w = _3055;
    float _3340 = exp2(_3318);
    out.m_87.x = _3316;
    out.m_87.y = _3338;
    out.m_87.z = _3336;
    out.m_87.w = _3055;
    bool _3342 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3344 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3346 = _3342 || _3344;
    bool _3348 = isnan(0.5);
    bool _3350 = _3346 || _3348;
    float _3352 = _3334;
    float _3354 = _3314;
    if (_3350)
    {
        _2655 = 1.0;
    }
    float _3356 = _2655;
    float _3358 = fma(_3340, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3360 = precise::clamp(_3358, 0.0, 1.0);
    float _3362 = fma(_3360, -2.0, 3.0);
    float _3364 = _3360 * _3360;
    float _3366 = _3364 * _3362;
    float _3368 = -_3366;
    float _3370 = _3368 + 1.0;
    float _3372 = fma(_3370, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3366);
    float _3374 = _3334 * _3372;
    float _3376 = _3356;
    if (_3350)
    {
        _3352 = 1.0;
    }
    float _3378 = _3352;
    float _3380 = _3378;
    if (!_3350)
    {
        float _3382 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3384 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3386 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3384;
        float _3388 = _3382 * 0.15915493667125701904296875;
        float _3390 = _3388 * 6.283185482025146484375;
        float _3392 = cos(_3390);
        float _3394 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3396 = _3394 * 0.15915493667125701904296875;
        float _3398 = _3388 * 6.283185482025146484375;
        float _3400 = sin(_3398);
        float _3402 = 1.0 / _3392;
        float _3404 = _3396 * 6.283185482025146484375;
        float _3406 = cos(_3404);
        float _3408 = _3400 * _3402;
        float _3410 = _3396 * 6.283185482025146484375;
        float _3412 = sin(_3410);
        float _3414 = _3406 * _3408;
        float _3416 = 1.0 / _3386;
        float _3418 = 1.0 / _3414;
        float _3420 = _3412 * _3418;
        float _3422 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3424 = fma(_2619, _3420, _3422);
        float _3426 = _3424 * _3416;
        float _3428 = precise::clamp(_3426, 0.0, 1.0);
        _3219 = _3414;
        _3376 = _3428;
        _3354 = _3424;
    }
    float _3430 = _3219;
    float _3432 = _3376;
    float _3434 = _3354;
    float _3436 = _3430;
    float _3438 = _3434;
    if (!_3350)
    {
        float _3440 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3442 = _3440 * 0.15915493667125701904296875;
        float _3444 = _3442 * 6.283185482025146484375;
        float _3446 = cos(_3444);
        float _3448 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3450 = _3448 * 0.15915493667125701904296875;
        float _3452 = _3442 * 6.283185482025146484375;
        float _3454 = sin(_3452);
        float _3456 = 1.0 / _3446;
        float _3458 = _3450 * 6.283185482025146484375;
        float _3460 = cos(_3458);
        float _3462 = _3454 * _3456;
        float _3464 = _3450 * 6.283185482025146484375;
        float _3466 = sin(_3464);
        float _3468 = _3460 * _3462;
        float _3470 = 1.0 / _3468;
        float _3472 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3474 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3472;
        float _3476 = 1.0 / _3474;
        float _3478 = _3466 * _3470;
        float _3480 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3482 = fma(_2619, _3478, _3480);
        float _3484 = _3482 * _3476;
        float _3486 = precise::clamp(_3484, 0.0, 1.0);
        float _3488 = -_3486;
        float _3490 = _3488 + 1.0;
        _3436 = _3474;
        _3380 = _3490;
        _3438 = _3450;
    }
    float _3492 = _3436;
    float _3494 = _3380;
    float _3496 = _3438;
    float _3498 = -_3322;
    float _3500 = _3498 + 1.0;
    float _3502 = _3374 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3504 = -_3257;
    float _3506 = _3504 + 1.0;
    float _3508 = _3492;
    float _3510 = _3500;
    float _3512 = _3496;
    if (!_3153)
    {
        _3508 = 1.0;
    }
    float _3514 = _3508;
    float _3516 = _3500 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3518 = _3514;
    float _3520 = _3516;
    if (_3153)
    {
        bool _3522 = _3273 >= _3255;
        bool _3524 = isnan(_3273);
        bool _3526 = _3522 || _3524;
        bool _3528 = isnan(_3255);
        bool _3530 = _3526 || _3528;
        float _3532 = float(_3530);
        _3518 = _3532;
    }
    float _3534 = _3518;
    float _3536 = _3506 * _3502;
    float _3538 = precise::clamp(_3536, 0.0, 1.0);
    float _3540 = _3534;
    if (_2791)
    {
        _3510 = 1.0;
    }
    float _3542 = _3510;
    float _3544 = _3542;
    if (!_2791)
    {
        int _3546 = _2839 << 4;
        int _3548 = _3546 + 2048;
        uint _3550 = uint(int(uint(_3548) >> uint(2)));
        uint _3552 = uint(int(uint(int(_3550)) >> uint(2)));
        int _3554 = int(_3550) & 3;
        float _3556 = (*spvDescriptorSet0.vp_c15)._m0[int(_3552)][_3554];
        int _3558 = int(_3550) + 1;
        uint _3560 = uint(int(uint(_3558) >> uint(2)));
        int _3562 = _3558 & 3;
        float _3564 = (*spvDescriptorSet0.vp_c15)._m0[int(_3560)][_3562];
        int _3566 = _3548 + 8;
        uint _3568 = uint(int(uint(_3566) >> uint(2)));
        uint _3570 = uint(int(uint(int(_3568)) >> uint(2)));
        int _3572 = int(_3568) & 3;
        float _3574 = (*spvDescriptorSet0.vp_c15)._m0[int(_3570)][_3572];
        int _3576 = int(_3568) + 1;
        uint _3578 = uint(int(uint(_3576) >> uint(2)));
        int _3580 = _3576 & 3;
        float _3582 = (*spvDescriptorSet0.vp_c15)._m0[int(_3578)][_3580];
        float _3584 = _2591 * _3564;
        float _3586 = fma(_2505, _3556, _3584);
        float _3588 = fma(_2513, _3574, _3586);
        float _3590 = _3588 + _3582;
        float _3592 = precise::clamp(_3590, 0.0, 1.0);
        float _3594 = -_3592;
        float _3596 = _3594 + _3267;
        float _3598 = fma(_3596, 500.0, 1.5);
        float _3600 = exp2(_3598);
        float _3602 = 0.0 + _3600;
        float _3604 = precise::clamp(_3602, 0.0, 1.0);
        _3544 = _3604;
    }
    float _3606 = _3544;
    float _3608 = _3516 * _3275;
    float _3610 = _3534 * _3606;
    float _3612 = -_3538;
    float _3614 = fma(_3612, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3616 = -_3516;
    float _3618 = _3616 + 1.0;
    float _3620 = _3286 * _3608;
    float _3622 = _3296 * _3608;
    float _3624 = -_3610;
    float _3626 = fma(_3624, _3614, 1.0);
    float _3628 = precise::clamp(_3626, 0.0, 1.0);
    bool _3630 = _2597 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3632 = isnan(_2597);
    bool _3634 = _3630 || _3632;
    bool _3636 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3638 = _3634 || _3636;
    float _3640 = fma(_3292, _3620, _3280);
    float _3642 = fma(_3294, _3620, _3282);
    float _3644 = _3286 * _3618;
    float _3646 = _3628 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3648 = fma(_3286, _3622, _3284);
    float _3650 = _3432 * _3494;
    out.m_89.x = _3646;
    float _3652 = _3650 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_91.x = _3640;
    out.m_91.y = _3642;
    out.m_91.z = _3648;
    out.m_91.w = _3644;
    float _3654 = _3614;
    float _3656 = _3618;
    float _3658 = _3628;
    if (!_3638)
    {
        _3512 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3660 = _3512;
    float _3662 = _3660;
    float _3664 = _3660;
    if (!_3638)
    {
        _3520 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3666 = _3520;
    float _3668 = _3666;
    float _3670 = _3666;
    if (!_3638)
    {
        _3654 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3672 = _3654;
    float _3674 = _3672;
    float _3676 = _3672;
    if (!_3638)
    {
        _3540 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3678 = _3540;
    float _3680 = _3678;
    float _3682 = _3678;
    if (!_3638)
    {
        _3656 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3684 = _3656;
    float _3686 = _3684;
    float _3688 = _3684;
    if (!_3638)
    {
        _3658 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3690 = _3658;
    bool _3692 = !_3638;
    float _3694 = _3690;
    float _3696 = _3690;
    if (!_3692)
    {
        bool _3698 = _2597 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3700 = isnan(_2597);
        bool _3702 = _3698 || _3700;
        bool _3704 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3706 = _3702 || _3704;
        if (!_3706)
        {
            float _3708 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3710 = _2597 + _3708;
            float _3712 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3714 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3712;
            float _3716 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3718 = _3716 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3720 = 1.0 / _3714;
            float _3722 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3724 = _3722 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3726 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3728 = _3726 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3730 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3732 = _3730 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3734 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3736 = _3734 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3738 = _3710 * _3720;
            float _3740 = precise::clamp(_3738, 0.0, 1.0);
            float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3744 = _3742 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3746 = fma(_3740, _3718, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3748 = fma(_3740, _3744, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3750 = fma(_3740, _3724, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3752 = fma(_3740, _3728, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3754 = fma(_3740, _3732, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3756 = fma(_3740, _3736, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3670 = _3746;
            _3688 = _3754;
            _3664 = _3750;
            _3682 = _3752;
            _3676 = _3748;
            _3696 = _3756;
            _3758 = true;
        }
        else
        {
            bool _3760 = _2597 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3762 = isnan(_2597);
            bool _3764 = _3760 || _3762;
            bool _3766 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3768 = _3764 || _3766;
            if (!_3768)
            {
                _3662 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3770 = _3662;
            _3664 = _3770;
            if (!_3768)
            {
                _3668 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3772 = _3668;
            _3670 = _3772;
            if (!_3768)
            {
                _3674 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3774 = _3674;
            _3676 = _3774;
            if (!_3768)
            {
                _3680 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3776 = _3680;
            _3682 = _3776;
            if (!_3768)
            {
                _3686 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3778 = _3686;
            _3688 = _3778;
            if (!_3768)
            {
                _3694 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3780 = _3694;
            bool _3782 = !_3768;
            _3696 = _3780;
            if (!_3782)
            {
                bool _3784 = _2597 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3786 = isnan(_2597);
                bool _3788 = _3784 || _3786;
                bool _3790 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3792 = _3788 || _3790;
                if (!_3792)
                {
                    float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3796 = _2597 + _3794;
                    float _3798 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3800 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3798;
                    float _3802 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3804 = _3802 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3806 = 1.0 / _3800;
                    float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3810 = _3808 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3814 = _3812 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3816 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3818 = _3816 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3820 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3822 = _3820 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3824 = _3796 * _3806;
                    float _3826 = precise::clamp(_3824, 0.0, 1.0);
                    float _3828 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3830 = _3828 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3832 = fma(_3826, _3804, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3834 = fma(_3826, _3830, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3836 = fma(_3826, _3810, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3838 = fma(_3826, _3814, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3840 = fma(_3826, _3818, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3842 = fma(_3826, _3822, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3670 = _3832;
                    _3688 = _3840;
                    _3664 = _3836;
                    _3682 = _3838;
                    _3676 = _3834;
                    _3696 = _3842;
                    _3758 = true;
                }
                else
                {
                    _3670 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3688 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3664 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3682 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3676 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3696 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3758 = false;
    float _3844 = _3670;
    float _3846 = _3688;
    float _3848 = _3664;
    float _3850 = _3682;
    float _3852 = _3676;
    float _3854 = _3696;
    float _3856 = fma(_2243, -0.5, 0.5);
    float _3858 = precise::clamp(_3856, 0.0, 1.0);
    float _3860 = -_3844;
    float _3862 = _3860 + _3846;
    float _3864 = _3652 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3866 = -_3848;
    float _3868 = _3866 + _3850;
    out.m_93.x = 0.0;
    float _3870 = fma(_3858, _3862, _3844);
    float _3872 = fma(_3858, _3868, _3848);
    out.m_61.x = _3864;
    float _3874 = -_3852;
    float _3876 = _3874 + _3854;
    float _3878 = _3870 * 0.586610972881317138671875;
    bool _3880 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3882 = fma(_3858, _3876, _3852);
    float _3884 = fma(_3872, 0.298911988735198974609375, _3878);
    bool _3886 = _3432 > 0.0;
    bool _3888 = isnan(_3432);
    bool _3890 = _3886 || _3888;
    bool _3892 = isnan(0.0);
    bool _3894 = _3890 || _3892;
    float _3896 = fma(_3882, 0.114477999508380889892578125, _3884);
    bool _3898 = _3494 <= 0.0;
    bool _3900 = !_3894;
    bool _3902 = _3898 || _3900;
    float _3904 = -_3896;
    float _3906 = _3872 + _3904;
    float _3908 = -_3896;
    float _3910 = _3870 + _3908;
    float _3912 = -_3896;
    float _3914 = _3882 + _3912;
    float _3916 = fma(_3906, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3896);
    float _3918 = fma(_3910, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3896);
    float _3920 = fma(_3914, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3896);
    bool _3922 = !_3880;
    if (!_3922)
    {
        float _3924 = -_2543;
        float _3926 = _3924 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3928 = -_2547;
        float _3930 = _3928 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3932 = -_2535;
        float _3934 = _3932 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3936 = _3926 * _3926;
        float _3938 = fma(_3930, _3930, _3936);
        float _3940 = fma(_3934, _3934, _3938);
        float _3942 = sqrt(_3940);
        float _3944 = rsqrt(_3940);
        float _3946 = -_3942;
        float _3948 = _3946 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3950 = _3948 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3952 = precise::clamp(_3950, 0.0, 1.0);
        float _3954 = _3930 * _3944;
        float _3956 = _3926 * _3944;
        float _3958 = abs(_3952);
        float _3960 = log2(_3958);
        float _3962 = _3934 * _3944;
        float _3964 = _3954 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3966 = _2243 * _3956;
        float _3968 = -_3956;
        float _3970 = -_3964;
        float _3972 = fma(_3968, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3970);
        float _3974 = fma(_2407, _3954, _3966);
        float _3976 = -_3962;
        float _3978 = fma(_3976, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3972);
        float _3980 = fma(_2417, _3962, _3974);
        float _3982 = precise::clamp(_3980, 0.0, 1.0);
        float _3984 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3986 = _3978 + _3984;
        float _3988 = _3960 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3990 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3992 = precise::clamp(_3990, 0.0, 1.0);
        float _3994 = exp2(_3988);
        float _3996 = _3994 * _3992;
        float _3998 = _3982 * _3996;
        float _4000 = _3998 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4002 = _3998 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4004 = _3998 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _4000;
        out.m_93.y = _4002;
        out.m_93.z = _4004;
    }
    out.m_95.x = _3916;
    out.m_95.y = _3918;
    out.m_95.z = _3920;
    if (!_3902)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _4006 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4006;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3758 = false;
    bool _2467 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _4063 = as_type<float>(_130);
        out.gl_Position.z = _4063;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_63.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_144)
    {
        float _150 = float(_114);
        _124 = _150;
    }
    float _152 = _124;
    bool _154 = _148 >= _152;
    bool _156 = !_144;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_61.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4132 = as_type<float>(_166);
        out.gl_Position.z = _4132;
    }
    if (_158)
    {
        return out;
    }
    float _168 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _170 = int(_168);
    float _172 = in.m_65.x;
    float _174 = in.m_67.x;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _178 = _176 != 0;
    float _180 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _182 = int(_180);
    float _184 = in.m_67.z;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _188 = _186 != 0;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _192 = _190 != 0;
    float _194 = in.m_67.y;
    int _196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _198 = _196 != 0;
    float _200 = float(_170);
    float _202 = in.m_65.y;
    float _204 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _206 = int(_204);
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _210 = _208 != 0;
    float _212 = in.m_69.x;
    float _214 = in.m_69.y;
    float _216 = in.m_69.z;
    float _218 = float(_114);
    float _220 = float(_182);
    float _222 = in.m_67.w;
    float _224 = 1.0 / _200;
    int _226 = _170;
    int _228 = _182;
    float _230 = _172;
    if (_178)
    {
        float _232 = -_172;
        float _234 = _232 + 1.0;
        _226 = as_type<int>(_234);
    }
    int _236 = _226;
    float _238 = 0.0;
    int _240 = _236;
    if (!_178)
    {
        _238 = _172;
    }
    float _242 = _238;
    float _244 = _242;
    if (_192)
    {
        float _246 = -_172;
        float _248 = _246 + 1.0;
        _228 = as_type<int>(_248);
    }
    int _250 = _228;
    bool _252 = false;
    if (_178)
    {
        bool _254 = _174 > 0.5;
        _252 = _254;
    }
    bool _256 = _252;
    float _258 = in.m_71.x;
    float _260 = in.m_71.y;
    float _262 = in.m_71.z;
    float _264 = 0.0;
    if (!_188)
    {
        _264 = _172;
    }
    float _266 = _264;
    float _268 = 1.0 / _220;
    float _270 = _266;
    if (_178)
    {
        float _272 = _256 ? as_type<float>(_236) : _172;
        _244 = _272;
    }
    float _274 = _244;
    if (_188)
    {
        float _276 = -_172;
        float _278 = _276 + 1.0;
        _240 = as_type<int>(_278);
    }
    int _280 = _240;
    bool _282 = _184 > 0.5;
    bool _284 = _194 > 0.5;
    if (_188)
    {
        float _286 = _282 ? as_type<float>(_280) : _172;
        _270 = _286;
    }
    float _288 = _270;
    float _290 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _292 = int(_290);
    float _294 = _148 * _224;
    float _296 = float(uint(_206));
    float _298 = -_202;
    float _300 = _298 + 1.0;
    float _302 = _202;
    if (_192)
    {
        float _304 = _284 ? as_type<float>(_250) : _172;
        _230 = _304;
    }
    float _306 = _230;
    float _308 = in.m_73.x;
    float _310 = in.m_73.y;
    float _312 = in.m_73.z;
    bool _314 = _214 != 0.0;
    bool _316 = isnan(_214);
    bool _318 = _314 || _316;
    bool _320 = isnan(0.0);
    bool _322 = _318 || _320;
    float _324 = 1.0 / _296;
    float _326 = _148 * _268;
    bool _328 = _222 > 0.5;
    bool _330 = _212 == 0.0;
    bool _332 = !_322;
    bool _334 = _330 && _332;
    float _336 = _258 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _338 = _328 ? as_type<int>(_300) : as_type<int>(_202);
    float _340 = _262 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = trunc(_294);
    int _344 = int(_342);
    float _346 = float(uint(_292));
    float _348 = _260 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _350 = _284 ? as_type<int>(_300) : as_type<int>(_202);
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _354 = _352 != 0;
    bool _356 = _216 == 0.0;
    bool _358 = _356 && _334;
    float _360 = 1.0 / _346;
    float _362 = _210 ? as_type<float>(_350) : _202;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _366 = _364 != 0;
    float _368 = _354 ? as_type<float>(_338) : _202;
    int _370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _372 = _370 != 0;
    float _374 = trunc(_326);
    int _376 = int(_374);
    float _378 = _312;
    float _380 = _310;
    float _382 = _308;
    if (!_358)
    {
        float _384 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[17].y, _312);
        _378 = _384;
    }
    float _386 = _378;
    int _388 = as_type<int>(_324) + (-2);
    if (!_358)
    {
        float _390 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[17].y, _310);
        _380 = _390;
    }
    float _392 = _380;
    float _394 = float(uint(_344));
    if (!_358)
    {
        float _396 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[17].y, _308);
        _382 = _396;
    }
    float _398 = _382;
    int _400 = as_type<int>(_360) + (-2);
    float _402 = as_type<float>(_388) * _394;
    int _404 = ~_206;
    int _406 = _404 + 1;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _216);
    float _410 = trunc(_402);
    float _412 = precise::max(_410, 0.0);
    uint _415 = uint(_412);
    float _417 = float(uint(_376));
    float _419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _214);
    float _421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _212);
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _425 = as_type<float>(_400) * _417;
    float _427 = 1.0 / _218;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _431 = _429 != 0;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _435 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _439 = _435;
    if (_198)
    {
        _437 = 1.0;
    }
    float _441 = _437;
    float _443 = _441;
    if (!_198)
    {
        _443 = 7.345489978790283203125;
    }
    float _445 = _443;
    float _447 = -_433;
    float _449 = fma(_435, 2.0, _447);
    float _451 = trunc(_425);
    float _453 = precise::max(_451, 0.0);
    uint _455 = uint(_453);
    float _457 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _459 = _406 * int(_415);
    int _461 = _459 + _344;
    float _463 = as_type<float>(_461);
    if (_198)
    {
        _439 = _174;
    }
    float _465 = _439;
    float _467 = _445 * _174;
    float _469 = fma(_457, -2.0, _423);
    int _471 = ~_292;
    int _473 = _471 + 1;
    float _475 = float(uint(_461));
    float _477 = floor(_467);
    float _479 = _465;
    if (_198)
    {
        _463 = 1.0;
    }
    float _481 = _463;
    float _483 = _481;
    if (!_198)
    {
        _479 = _194;
    }
    float _485 = _479;
    float _487 = as_type<float>(_388) * _475;
    int _489 = as_type<int>(_485);
    if (!_198)
    {
        _483 = 1.2345600128173828125;
    }
    float _491 = _483;
    int _493 = _473 * int(_455);
    int _495 = _493 + _376;
    if (_431)
    {
        float _497 = _282 ? _300 : _202;
        _302 = _497;
    }
    float _499 = _302;
    float _501 = trunc(_487);
    float _503 = precise::max(_501, 0.0);
    uint _505 = uint(_503);
    float _507 = float(_206);
    float _509 = _485 * _491;
    float _511 = float(_292);
    float _513 = float(uint(_495));
    float _515 = _148 * _507;
    float _517 = _148 * _511;
    bool _519 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _523 = _519 || _521;
    bool _525 = isnan(1.0);
    bool _527 = _523 || _525;
    float _529 = floor(_509);
    float _531 = as_type<float>(_400) * _513;
    if (_198)
    {
        _489 = 0;
    }
    int _533 = _489;
    float _535 = _515 * _427;
    int _537 = _533;
    if (!_198)
    {
        _537 = 1;
    }
    int _539 = _537;
    float _541 = _517 * _427;
    float _543 = -_477;
    float _545 = _467 + _543;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _549 = _547 != 0;
    float _551 = trunc(_531);
    float _553 = precise::max(_551, 0.0);
    uint _555 = uint(_553);
    bool _557 = _539 != 1;
    float _559 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _563 = _561 != 0;
    int _565 = int(_563);
    int _567 = _198 ? 2 : 0;
    int _569 = _565 | _567;
    int _571 = _549 ? 4 : 0;
    int _573 = _569 | _571;
    int _575 = _527 ? 8 : 0;
    int _577 = _573 | _575;
    int _579 = _557 ? 16 : 0;
    int _581 = _577 | _579;
    int _583 = _372 ? 32 : 0;
    int _585 = _581 | _583;
    int _587 = _366 ? 64 : 0;
    int _589 = _585 | _587;
    int _591 = _589 & 16;
    float _593 = 0.0;
    float _595 = _559;
    if (!_527)
    {
        float _597 = _559 * _559;
        float _599 = _597 * 0.5;
        _593 = _599;
    }
    float _601 = _593;
    int _603 = ~_206;
    int _605 = _603 + 1;
    int _607 = int(_415) + int(_505);
    float _609 = _601;
    if (!_527)
    {
        float _611 = _601 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _609 = _611;
    }
    float _613 = _609;
    bool _615 = !_527;
    int _617 = 0;
    float _619 = _613;
    if (!_615)
    {
        float _621 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _623 = log2(_621);
        float _625 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _627 = _625 + 1.0;
        float _629 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _631 = _559 * _623;
        float _633 = exp2(_631);
        float _635 = _629 * 0.693147182464599609375;
        float _637 = 1.0 / _635;
        float _639 = 1.0 / _627;
        float _641 = _633 + (-1.0);
        float _643 = -_641;
        float _645 = fma(_643, _637, _559);
        float _647 = _645 * _639;
        float _649 = _647 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _617 = as_type<int>(_647);
        _619 = _649;
    }
    int _651 = _617;
    float _653 = _619;
    bool _655 = !_527;
    int _657 = _651;
    if (!_655)
    {
        float _659 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _661 = log2(_659);
        float _663 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _665 = _663 + 1.0;
        float _667 = 1.0 / _665;
        float _669 = _559 * _661;
        float _671 = exp2(_669);
        float _673 = -_671;
        float _675 = _673 + 1.0;
        float _677 = _675 * _667;
        _595 = _677;
    }
    float _679 = _595;
    bool _681 = !_549;
    int _683 = _681 ? 0 : 1;
    int _685 = _605 * _607;
    int _687 = _685 + _344;
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _691 = _689 != 0;
    float _693 = -_529;
    float _695 = _509 + _693;
    float _697 = float(_344);
    float _699 = trunc(_535);
    int _701 = int(_699);
    bool _703 = !_691;
    int _705 = _703 ? 0 : 1;
    float _707 = _511 * _695;
    bool _709 = uint(_687) >= uint(_206);
    float _711 = _545 * _507;
    int _713 = int(_455) + int(_555);
    float _715 = _348 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _717 = ~_292;
    int _719 = _717 + 1;
    float _721 = trunc(_707);
    int _723 = int(_721);
    bool _725 = _697 >= _507;
    bool _727 = isnan(_697);
    bool _729 = _725 || _727;
    bool _731 = isnan(_507);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _741 = _739 != 0;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _745 = _743 != 0;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _749 = _747 != 0;
    int _751 = _719 * _713;
    int _753 = _751 + _376;
    float _755 = float(_376);
    bool _757 = !_563;
    int _759 = _757 ? 0 : 1;
    float _761 = trunc(_735);
    int _763 = int(_761);
    bool _765 = _755 >= _511;
    bool _767 = isnan(_755);
    bool _769 = _765 || _767;
    bool _771 = isnan(_511);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    bool _777 = !_745;
    int _779 = _777 ? 0 : 1;
    bool _781 = _591 != 0;
    bool _783 = !_741;
    int _785 = _783 ? 0 : 1;
    float _787 = trunc(_775);
    int _789 = int(_787);
    bool _791 = uint(_753) >= uint(_292);
    bool _793 = _206 == 0;
    bool _795 = !_709;
    int _797 = _795 ? 0 : (-1);
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _801 = _799 != 0;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _805 = _803 != 0;
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _809 = ~_607;
    int _811 = _809 + _797;
    int _813 = _811 + 1;
    bool _815 = !_791;
    int _817 = _815 ? 0 : (-1);
    float _819 = _679;
    if (_198)
    {
        _657 = 0;
    }
    int _821 = _657;
    int _823 = _206 * _813;
    int _825 = _823 + _344;
    int _827 = _821;
    if (!_198)
    {
        _827 = 2;
    }
    int _829 = _827;
    float _831 = trunc(_541);
    int _833 = int(_831);
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _837 = _835 != 0;
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _841 = _839 != 0;
    int _843 = ~_713;
    int _845 = _843 + _817;
    int _847 = _845 + 1;
    int _849 = abs(_683);
    bool _851 = !_841;
    int _853 = _851 ? 0 : 1;
    int _855 = _292 * _847;
    int _857 = _855 + _376;
    int _859 = ~_763;
    int _861 = _859 + 1;
    int _863 = _861 + 1;
    float _865 = trunc(_711);
    int _867 = int(_865);
    bool _869 = !_793;
    int _871 = _869 ? _825 : (-1);
    bool _873 = _292 == 0;
    int _875 = ~_789;
    int _877 = _875 + 1;
    int _879 = _877 + 1;
    int _881 = _871 * _863;
    bool _883 = !_873;
    int _885 = _883 ? _857 : (-1);
    int _887 = _206 + (-1);
    bool _889 = !_837;
    int _891 = _889 ? 0 : 1;
    int _893 = _879 * _885;
    int _895 = abs(_759);
    int _897 = _763 * _887;
    int _899 = _897 + _881;
    bool _901 = _829 != 2;
    int _903 = _867 * _849;
    int _905 = _903 + _344;
    int _907 = abs(_779);
    int _909 = _292 + (-1);
    int _911 = abs(_853);
    int _913 = _899 * _907;
    int _915 = abs(_785);
    int _917 = _789 * _909;
    int _919 = _917 + _893;
    bool _921 = !_801;
    int _923 = _921 ? 0 : 1;
    int _925 = _701 * _915;
    int _927 = _925 + _913;
    int _929 = _723 * _895;
    int _931 = _929 + _376;
    int _933 = abs(_891);
    float _935 = _807 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _937 = abs(_923);
    int _939 = _919 * _911;
    bool _941 = !_749;
    int _943 = _941 ? 0 : 1;
    float _945 = fma(_935, _499, -0.5);
    int _947 = _833 * _933;
    int _949 = _947 + _939;
    int _951 = abs(_943);
    float _953 = _392 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _955 = abs(_705);
    int _957 = _931 * _937;
    int _959 = _957 + _949;
    bool _961 = !_805;
    int _963 = _961 ? 0 : 1;
    int _965 = _905 * _951;
    int _967 = _965 + _927;
    float _969 = _392 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _971 = abs(_963);
    float _973 = _392 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _975 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[8].x, _953);
    int _977 = _867 * _955;
    int _979 = _977 + _967;
    float _981 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[9].x, _969);
    float _983 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[10].x, _973);
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _987 = float(uint(_979));
    int _989 = _723 * _971;
    int _991 = _989 + _959;
    float _993 = as_type<float>(_881);
    float _995 = as_type<float>(_895);
    float _997 = as_type<float>(_915);
    if (!_781)
    {
        _993 = _184;
    }
    float _999 = _993;
    float _1001 = as_type<float>(_388) * _987;
    float _1003 = float(uint(_991));
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1009 = as_type<float>(_400) * _1003;
    float _1011 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1005);
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1015 = ~_206;
    int _1017 = _1015 + 1;
    float _1019 = trunc(_1001);
    float _1021 = precise::max(_1019, 0.0);
    uint _1023 = uint(_1021);
    float _1025 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1011);
    float _1027 = _1011;
    float _1029 = _999;
    if (!_781)
    {
        _1027 = _999;
    }
    float _1031 = _1027;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1035 = _1031;
    if (_781)
    {
        _1029 = _184;
    }
    float _1037 = _1029;
    float _1039 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1013);
    if (!_781)
    {
        _995 = _174;
    }
    float _1041 = _995;
    float _1043 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1033);
    float _1045 = trunc(_1009);
    float _1047 = precise::max(_1045, 0.0);
    uint _1049 = uint(_1047);
    float _1051 = _985 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1053 = _1041;
    if (!_781)
    {
        _997 = _1041;
    }
    float _1055 = _997;
    float _1057 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1059 = _1055;
    if (_781)
    {
        _1053 = _174;
    }
    float _1061 = _1053;
    float _1063 = _1025 * (-0.15915493667125701904296875);
    int _1065 = _1017 * int(_1023);
    int _1067 = _1065 + _979;
    int _1069 = ~_292;
    int _1071 = _1069 + 1;
    float _1073 = _1063 * 6.283185482025146484375;
    float _1075 = sin(_1073);
    float _1077 = in.m_63.x;
    float _1079 = in.m_63.y;
    float _1081 = in.m_63.z;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1085 = float(uint(_1067));
    float _1087 = fma(_362, _1057, -0.5);
    int _1089 = _1071 * int(_1049);
    int _1091 = _1089 + _991;
    float _1093 = fma(_1051, _274, -0.5);
    float _1095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1097 = as_type<float>(_388) * _1085;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1101 = float(uint(_1091));
    float _1103 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1083);
    float _1105 = as_type<float>(_1091);
    float _1107 = _1083;
    float _1109 = as_type<float>(_1023);
    if (!_781)
    {
        _1105 = _194;
    }
    float _1111 = _1105;
    float _1113 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1043);
    float _1115 = _1111;
    if (_781)
    {
        _1059 = _1037;
    }
    float _1117 = _1059;
    float _1119 = _1063 * 6.283185482025146484375;
    float _1121 = cos(_1119);
    if (!_781)
    {
        _1107 = _1111;
    }
    float _1123 = _1107;
    float _1125 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1103);
    float _1127 = _1123;
    if (_781)
    {
        _1115 = _194;
    }
    float _1129 = _1115;
    float _1131 = 0.0;
    if (!_781)
    {
        _1131 = _1031;
    }
    float _1133 = _1131;
    float _1135 = _1133;
    if (_781)
    {
        _1135 = _1129;
    }
    float _1137 = _1135;
    float _1139 = trunc(_1097);
    float _1141 = precise::max(_1139, 0.0);
    uint _1143 = uint(_1141);
    float _1145 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1099);
    float _1147 = as_type<float>(_400) * _1101;
    float _1149 = _1075 * _1087;
    float _1151 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_781)
    {
        _1035 = _1129;
    }
    float _1153 = _1035;
    float _1155 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1157 = _1121 * _1087;
    float _1159 = trunc(_1147);
    float _1161 = precise::max(_1159, 0.0);
    uint _1163 = uint(_1161);
    float _1165 = -_1149;
    float _1167 = fma(_1121, _1093, _1165);
    float _1169 = fma(_1151, _306, -0.5);
    float _1171 = fma(_1075, _1093, _1157);
    float _1173 = _653 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1175 = _653 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _1177 = _653 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1179 = _1157;
    if (_901)
    {
        _1179 = _1061;
    }
    float _1181 = _1179;
    float _1183 = fma(_679, _1077, _1173);
    float _1185 = fma(_679, _1079, _1175);
    int _1187 = int(_1023) + int(_1143);
    float _1189 = fma(_679, _1081, _1177);
    int _1191 = ~_206;
    int _1193 = _1191 + 1;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1197 = float(uint(_905));
    float _1199 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1145);
    int _1201 = int(_1049) + int(_1163);
    int _1203 = _1193 * _1187;
    int _1205 = _1203 + _979;
    float _1207 = as_type<float>(_388) * _1197;
    float _1209 = _1181;
    if (_901)
    {
        _1109 = _1129;
    }
    float _1211 = _1109;
    float _1213 = fma(_1155, -2.0, _1195);
    float _1215 = _1211;
    if (!_901)
    {
        _1209 = _1037;
    }
    float _1217 = _1209;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    int _1221 = ~_292;
    int _1223 = _1221 + 1;
    float _1225 = trunc(_1207);
    float _1227 = precise::max(_1225, 0.0);
    uint _1229 = uint(_1227);
    if (!_901)
    {
        _1215 = _1061;
    }
    float _1231 = _1215;
    float _1233 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1219);
    bool _1235 = uint(_1205) >= uint(_206);
    int _1237 = _1223 * _1201;
    int _1239 = _1237 + _991;
    float _1241 = float(uint(_931));
    float _1243 = in.m_71.w;
    bool _1245 = !_1235;
    int _1247 = _1245 ? 0 : (-1);
    float _1249 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1251 = uint(_1239) >= uint(_292);
    float _1253 = as_type<float>(_400) * _1241;
    int _1255 = ~_1187;
    int _1257 = _1255 + _1247;
    int _1259 = _1257 + 1;
    float _1261 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1233);
    float _1263 = in.m_58.x;
    float _1265 = in.m_58.y;
    float _1267 = in.m_58.z;
    if (!_781)
    {
        _819 = _1123;
    }
    float _1269 = _819;
    float _1271 = trunc(_1253);
    float _1273 = precise::max(_1271, 0.0);
    uint _1275 = uint(_1273);
    bool _1277 = !_1251;
    int _1279 = _1277 ? 0 : (-1);
    int _1281 = _206 * _1259;
    int _1283 = _1281 + _979;
    float _1285 = _1269;
    if (_781)
    {
        _1285 = _1061;
    }
    float _1287 = _1285;
    if (_781)
    {
        _1127 = _1061;
    }
    float _1289 = _1127;
    int _1291 = ~_206;
    int _1293 = _1291 + 1;
    int _1295 = ~_1201;
    int _1297 = _1295 + _1279;
    int _1299 = _1297 + 1;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1303 = !_793;
    int _1305 = _1303 ? _1283 : (-1);
    int _1307 = _1293 * int(_1229);
    int _1309 = _1307 + _905;
    int _1311 = ~_292;
    int _1313 = _1311 + 1;
    float _1315 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1301);
    int _1317 = _1305 & 3;
    bool _1319 = _1317 != 0;
    int _1321 = _1305 & 3;
    bool _1323 = _1321 != 0;
    int _1325 = _1313 * int(_1275);
    int _1327 = _1325 + _931;
    float _1329 = float(uint(_1309));
    float _1331 = fma(_1185, _1243, _1265);
    int _1333 = _1319 ? 0 : 1;
    float _1335 = fma(_1183, _1243, _1263);
    bool _1337 = uint(_1321) > 1u;
    float _1339 = as_type<float>(_388) * _1329;
    int _1341 = _292 * _1299;
    int _1343 = _1341 + _991;
    float _1345 = float(uint(_1327));
    float _1347 = fma(_1189, _1243, _1267);
    int _1349 = ~_1333;
    int _1351 = _1349 + 1;
    int _1353 = _1351 + 1;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1357 = !_873;
    int _1359 = _1357 ? _1343 : (-1);
    float _1361 = as_type<float>(_400) * _1345;
    float _1363 = _1331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1365 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1355);
    float _1367 = _1331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1369 = _1353;
    if (!_1337)
    {
        int _1371 = ~_1333;
        int _1373 = _1371 + 1;
        _1369 = _1373;
    }
    int _1375 = _1369;
    float _1377 = trunc(_1339);
    float _1379 = precise::max(_1377, 0.0);
    uint _1381 = uint(_1379);
    int _1383 = _1359 & 3;
    bool _1385 = _1383 != 0;
    float _1387 = fma(_1335, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1363);
    float _1389 = _1331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1391 = fma(_1335, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1367);
    int _1393 = _1385 ? 0 : 1;
    float _1395 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1387);
    bool _1397 = uint(_1383) > 1u;
    float _1399 = trunc(_1361);
    float _1401 = precise::max(_1399, 0.0);
    uint _1403 = uint(_1401);
    float _1405 = fma(_1335, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1389);
    float _1407 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1391);
    float _1409 = _1395 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1411 = _1305 >> 31;
    float _1413 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1405);
    float _1415 = _1407 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1419 = _1409 + _1417;
    int _1421 = ~_1393;
    int _1423 = _1421 + 1;
    int _1425 = _1423 + 1;
    float _1427 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1315);
    int _1429 = int(_1229) + int(_1381);
    float _1431 = _1419 * _1419;
    int _1433 = _1411 & 3;
    float _1435 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1365);
    int _1437 = _1425;
    if (!_1397)
    {
        int _1439 = ~_1393;
        int _1441 = _1439 + 1;
        _1437 = _1441;
    }
    int _1443 = _1437;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1447 = _1415 + _1445;
    int _1449 = int(_1275) + int(_1403);
    float _1451 = _1413 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1453 = _1359 >> 31;
    float _1455 = fma(_1447, _1447, _1431);
    int _1457 = _1305 + _1433;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1461 = _1451 + _1459;
    int _1463 = _1453 & 3;
    float _1465 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1467 = ~_206;
    int _1469 = _1467 + 1;
    float _1471 = fma(_1461, _1461, _1455);
    int _1473 = ~_292;
    int _1475 = _1473 + 1;
    int _1477 = _1359 + _1463;
    int _1479 = _1469 * _1429;
    int _1481 = _1479 + _905;
    float _1483 = rsqrt(_1471);
    int _1485 = _1477 >> 2;
    int _1487 = _1475 * _1449;
    int _1489 = _1487 + _931;
    bool _1491 = uint(_1481) >= uint(_206);
    int _1493 = _1485 << 4;
    int _1495 = _1493 + 512;
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1499 = _1457 >> 2;
    bool _1501 = !_1491;
    int _1503 = _1501 ? 0 : (-1);
    uint _1505 = uint(int(uint(_1495) >> uint(2)));
    uint _1507 = uint(int(uint(int(_1505)) >> uint(2)));
    int _1509 = int(_1505) & 3;
    float _1511 = (*spvDescriptorSet0.vp_c9)._m0[int(_1507)][_1509];
    int _1513 = int(_1505) + 1;
    uint _1515 = uint(int(uint(_1513) >> uint(2)));
    int _1517 = _1513 & 3;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[int(_1515)][_1517];
    bool _1521 = uint(_1489) >= uint(_292);
    float _1523 = -_1497;
    float _1525 = fma(_1465, 2.0, _1523);
    int _1527 = _1499 << 4;
    int _1529 = _1527 + 368;
    float _1531 = _1419 * _1483;
    int _1533 = ~_1429;
    int _1535 = _1533 + _1503;
    int _1537 = _1535 + 1;
    float _1539 = -_148;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1525);
    bool _1543 = !_1521;
    int _1545 = _1543 ? 0 : (-1);
    uint _1547 = uint(int(uint(_1529) >> uint(2)));
    uint _1549 = uint(int(uint(int(_1547)) >> uint(2)));
    int _1551 = int(_1547) & 3;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[int(_1549)][_1551];
    int _1555 = int(_1547) + 1;
    uint _1557 = uint(int(uint(_1555) >> uint(2)));
    int _1559 = _1555 & 3;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[int(_1557)][_1559];
    bool _1563 = uint(_1321) >= 2u;
    int _1565 = _206 * _1537;
    int _1567 = _1565 + _905;
    int _1569 = ~_1449;
    int _1571 = _1569 + _1545;
    int _1573 = _1571 + 1;
    float _1575 = _1447 * _1483;
    int _1577 = _1563 ? 0 : 1;
    float _1579 = -_1531;
    float _1581 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1419);
    bool _1583 = _1321 != 3;
    int _1585 = _292 * _1573;
    int _1587 = _1585 + _931;
    float _1589 = -_1575;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1447);
    int _1593 = _1495 + 8;
    uint _1595 = uint(int(uint(_1593) >> uint(2)));
    uint _1597 = uint(int(uint(int(_1595)) >> uint(2)));
    int _1599 = int(_1595) & 3;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[int(_1597)][_1599];
    int _1603 = int(_1595) + 1;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    int _1607 = _1603 & 3;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[int(_1605)][_1607];
    int _1611 = ~_1577;
    int _1613 = _1611 + 1;
    int _1615 = _1613 + 1;
    float _1617 = _1581 * _1581;
    int _1619 = abs(_1375);
    bool _1621 = uint(_1383) >= 2u;
    float _1623 = fma(_1591, _1591, _1617);
    int _1625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1627 = _1625 != 0;
    int _1629 = _1529 + 8;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    uint _1633 = uint(int(uint(int(_1631)) >> uint(2)));
    int _1635 = int(_1631) & 3;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[int(_1633)][_1635];
    int _1639 = int(_1631) + 1;
    uint _1641 = uint(int(uint(_1639) >> uint(2)));
    int _1643 = _1639 & 3;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[int(_1641)][_1643];
    int _1647 = abs(_1443);
    int _1649 = _1615;
    if (_1583)
    {
        int _1651 = ~_1577;
        int _1653 = _1651 + 1;
        _1649 = _1653;
    }
    int _1655 = _1649;
    int _1657 = _1359 & 3;
    bool _1659 = _1657 != 0;
    float _1661 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1663 = int(_1661);
    bool _1665 = !_1323;
    int _1667 = _1665 ? 0 : 1;
    bool _1669 = !_1659;
    int _1671 = _1669 ? 0 : 1;
    bool _1673 = _1383 != 3;
    int _1675 = ~_1619;
    int _1677 = _1675 + 1;
    int _1679 = _1677 + 1;
    int _1681 = abs(_1671);
    int _1683 = ~_1647;
    int _1685 = _1683 + 1;
    int _1687 = _1685 + 1;
    int _1689 = _1621 ? 0 : 1;
    int _1691 = ~_1681;
    int _1693 = _1691 + 1;
    int _1695 = _1693 + 1;
    int _1697 = _1687 * as_type<int>(_1519);
    bool _1699 = _1321 != 3;
    int _1701 = abs(_1667);
    int _1703 = _1695 * as_type<int>(_1511);
    int _1705 = _1703 + _1697;
    int _1707 = ~_1689;
    int _1709 = _1707 + 1;
    int _1711 = _1709 + 1;
    int _1713 = _1679 * as_type<int>(_1561);
    int _1715 = _1711;
    if (_1673)
    {
        int _1717 = ~_1689;
        int _1719 = _1717 + 1;
        _1715 = _1719;
    }
    int _1721 = _1715;
    float _1723 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1725 = int(_1723);
    int _1727 = ~_1701;
    int _1729 = _1727 + 1;
    int _1731 = _1729 + 1;
    bool _1733 = !_1699;
    int _1735 = _1733 ? 0 : (-1);
    int _1737 = abs(_1655);
    int _1739 = _1731 * as_type<int>(_1553);
    int _1741 = _1739 + _1713;
    int _1743 = abs(_1735);
    float _1745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1747 = ~_1737;
    int _1749 = _1747 + 1;
    int _1751 = _1749 + 1;
    int _1753 = ~_1743;
    int _1755 = _1753 + 1;
    int _1757 = _1755 + 1;
    bool _1759 = _1383 != 3;
    int _1761 = abs(_1721);
    int _1763 = _1751 * as_type<int>(_1637);
    int _1765 = _1763 + _1741;
    float _1767 = float(uint(_1663));
    float _1769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1771 = !_1627;
    int _1773 = _1771 ? 0 : 1;
    int _1775 = _1757 * as_type<int>(_1645);
    int _1777 = _1775 + _1765;
    bool _1779 = !_1759;
    int _1781 = _1779 ? 0 : (-1);
    int _1783 = abs(_1663);
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1787 = _1785 != 0;
    float _1789 = 1.0 / _1767;
    int _1791 = ~_1761;
    int _1793 = _1791 + 1;
    int _1795 = _1793 + 1;
    int _1797 = abs(_1781);
    int _1799 = abs(_1725);
    int _1801 = _1795 * as_type<int>(_1601);
    int _1803 = _1801 + _1705;
    int _1805 = ~_1797;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    float _1811 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1813 = abs(_1773);
    int _1815 = _1809 * as_type<int>(_1609);
    int _1817 = _1815 + _1803;
    bool _1819 = !_1787;
    int _1821 = _1819 ? 0 : 1;
    float _1823 = float(uint(_1725));
    int _1825 = abs(_1821);
    float _1827 = _1461 * _1483;
    float _1829 = float(uint(_1783));
    float _1831 = 1.0 / _1823;
    int _1833 = ~_1813;
    int _1835 = _1833 + 1;
    int _1837 = _1835 + 1;
    bool _1839 = !_793;
    int _1841 = _1839 ? _1567 : (-1);
    bool _1843 = !_873;
    int _1845 = _1843 ? _1587 : (-1);
    int _1847 = _1777 * _1837;
    float _1849 = 1.0 / _1829;
    float _1851 = -_1827;
    float _1853 = fma(_1851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1461);
    int _1855 = ~_1825;
    int _1857 = _1855 + 1;
    int _1859 = _1857 + 1;
    float _1861 = float(uint(_1799));
    float _1863 = fma(_1853, _1853, _1623);
    int _1865 = as_type<int>(_1789) + (-2);
    int _1867 = _1859 * _1817;
    int _1869 = _1841 * _1813;
    int _1871 = _1869 + _1847;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1875 = sqrt(_1863);
    int _1877 = _1845 * _1825;
    int _1879 = _1877 + _1867;
    int _1881 = as_type<int>(_1831) + (-2);
    float _1883 = -_1873;
    float _1885 = fma(_1249, 2.0, _1883);
    float _1887 = float(uint(_1871));
    float _1889 = -_148;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1885);
    float _1893 = 1.0 / _1861;
    int _1895 = abs(_1871);
    float _1897 = as_type<float>(_1865) * _1887;
    float _1899 = float(uint(_1879));
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1903 = as_type<int>(_1849) + (-2);
    float _1905 = fma(_1113, _1169, _1891);
    float _1907 = as_type<float>(_1881) * _1899;
    float _1909 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1911 = abs(_1879);
    float _1913 = trunc(_1897);
    float _1915 = precise::max(_1913, 0.0);
    uint _1917 = uint(_1915);
    float _1919 = float(uint(_1895));
    float _1921 = fma(_1909, -2.0, _1901);
    float _1923 = _1483 * _1875;
    float _1925 = _1261 * (-0.15915493667125701904296875);
    int _1927 = as_type<int>(_1893) + (-2);
    float _1929 = as_type<float>(_1903) * _1919;
    float _1931 = _336 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1933 = float(uint(_1911));
    float _1935 = _715 * _1923;
    float _1937 = trunc(_1907);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    float _1943 = _1931 * _1923;
    float _1945 = _737 * _1923;
    float _1947 = as_type<float>(_1927) * _1933;
    int _1949 = ~_1799;
    int _1951 = _1949 + 1;
    float _1953 = _1935 * _419;
    int _1955 = ~_1663;
    int _1957 = _1955 + 1;
    float _1959 = _1943 * _421;
    float _1961 = trunc(_1947);
    float _1963 = precise::max(_1961, 0.0);
    uint _1965 = uint(_1963);
    int _1967 = ~_1725;
    int _1969 = _1967 + 1;
    float _1971 = _1945 * _408;
    int _1973 = _1957 * int(_1917);
    int _1975 = _1973 + _1871;
    int _1977 = ~_1783;
    int _1979 = _1977 + 1;
    float _1981 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _469);
    int _1983 = _1969 * int(_1941);
    int _1985 = _1983 + _1879;
    float _1987 = _1925 * 6.283185482025146484375;
    float _1989 = sin(_1987);
    float _1991 = _1953 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1993 = float(uint(_1975));
    float _1995 = float(uint(_1985));
    float _1997 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1991);
    int _1999 = _1951 * int(_1965);
    int _2001 = _1999 + _1911;
    float _2003 = _1925 * 6.283185482025146484375;
    float _2005 = cos(_2003);
    float _2007 = as_type<float>(_1881) * _1995;
    float _2009 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1997);
    float _2011 = as_type<float>(_1865) * _1993;
    float _2013 = float(uint(_2001));
    float _2015 = -_148;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[76].x, _449);
    float _2019 = trunc(_1929);
    float _2021 = precise::max(_2019, 0.0);
    uint _2023 = uint(_2021);
    float _2025 = _1953 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2027 = as_type<float>(_1927) * _2013;
    float _2029 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1039);
    float _2031 = _1451 + _2009;
    float _2033 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2025);
    float _2035 = _1953 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2037 = trunc(_2011);
    float _2039 = precise::max(_2037, 0.0);
    uint _2041 = uint(_2039);
    float _2043 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2033);
    float _2045 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1213);
    float _2047 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1921);
    float _2049 = _1745 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2051 = _1415 + _2043;
    float _2053 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2035);
    float _2055 = -_2047;
    float _2057 = fma(_1199, _945, _2055);
    float _2059 = trunc(_2007);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    int _2065 = _1979 * int(_2023);
    int _2067 = _2065 + _1895;
    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2071 = _2051 + _2069;
    float _2073 = fma(_2049, _288, -0.5);
    int _2075 = ~_1799;
    int _2077 = _2075 + 1;
    float _2079 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2053);
    float _2081 = _2071 * _2071;
    float _2083 = float(uint(_2067));
    float _2085 = trunc(_2027);
    float _2087 = precise::max(_2085, 0.0);
    uint _2089 = uint(_2087);
    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2093 = _2031 + _2091;
    int _2095 = int(_1917) + int(_2041);
    float _2097 = as_type<float>(_1903) * _2083;
    float _2099 = _2093 * _2093;
    float _2101 = fma(_368, _1811, -0.5);
    int _2103 = ~_1663;
    int _2105 = _2103 + 1;
    float _2107 = _2081 + _2099;
    float _2109 = trunc(_2097);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    float _2115 = _1989 * _2101;
    float _2117 = _2005 * _2101;
    int _2119 = int(_1941) + int(_2063);
    int _2121 = _2105 * _2095;
    int _2123 = _2121 + _1871;
    int _2125 = ~_1725;
    int _2127 = _2125 + 1;
    float _2129 = -_2115;
    float _2131 = fma(_2005, _2073, _2129);
    float _2133 = fma(_1989, _2073, _2117);
    float _2135 = sqrt(_2107);
    int _2137 = ~_1783;
    int _2139 = _2137 + 1;
    int _2141 = _2127 * _2119;
    int _2143 = _2141 + _1879;
    int _2145 = int(_1965) + int(_2089);
    bool _2147 = uint(_2123) >= uint(_1663);
    bool _2149 = uint(_2143) >= uint(_1725);
    int _2151 = _2077 * _2145;
    int _2153 = _2151 + _1911;
    int _2155 = int(_2023) + int(_2113);
    int _2157 = _2139 * _2155;
    int _2159 = _2157 + _1895;
    float _2161 = _1409 + _2079;
    bool _2163 = _2135 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _2165 = !_2163;
    float _2167 = _2161;
    float _2169 = _2081;
    float _2171 = _2099;
    float _2173 = _2031;
    float _2175 = _2051;
    int _2177 = _1663;
    int _2179 = as_type<int>(_2049);
    if (!_2165)
    {
        float _2181 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2185 = _2135 + _2183;
        float _2187 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2189 = rsqrt(_2107);
        float _2191 = _2185 * _2181;
        float _2193 = _2191 * 0.15915493667125701904296875;
        float _2195 = _2193 * 6.283185482025146484375;
        float _2197 = sin(_2195);
        float _2199 = _2193 * 6.283185482025146484375;
        float _2201 = cos(_2199);
        float _2203 = fma(_2197, _2187, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2205 = _2189 * _2203;
        float _2207 = _2201 + (-1.0);
        float _2209 = fma(_2071, _2205, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2211 = fma(_2093, _2205, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2213 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2215 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2217 = _2209 + _2215;
        float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2221 = _2211 + _2219;
        float _2223 = fma(_2161, _2201, _2213);
        float _2225 = _2217 * _2217;
        float _2227 = _2221 * _2221;
        _2167 = _2223;
        _2169 = _2225;
        _2171 = _2227;
        _2173 = _2211;
        _2175 = _2209;
    }
    float _2229 = _2167;
    float _2231 = _2169;
    float _2233 = _2171;
    float _2235 = _2173;
    float _2237 = _2175;
    bool _2239 = !_2147;
    int _2241 = _2239 ? 0 : (-1);
    float _2243 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[9].z, _981);
    bool _2245 = !_2149;
    int _2247 = _2245 ? 0 : (-1);
    float _2249 = _2057 + 0.5;
    bool _2251 = uint(_2159) >= uint(_1783);
    bool _2253 = uint(_2153) >= uint(_1799);
    int _2255 = _1871 ^ _1663;
    int _2257 = _1879 ^ _1725;
    int _2259 = ~_2095;
    int _2261 = _2259 + _2241;
    int _2263 = _2261 + 1;
    bool _2265 = !_2251;
    int _2267 = _2265 ? 0 : (-1);
    bool _2269 = !_2253;
    int _2271 = _2269 ? 0 : (-1);
    int _2273 = _1663 * _2263;
    int _2275 = _2273 + _1871;
    uint _2277 = uint(int(uint(_2255) >> uint(31)));
    uint _2279 = uint(int(uint(_2257) >> uint(31)));
    int _2281 = ~_2267;
    int _2283 = _2155 + _2281;
    int _2285 = _2283 + 1;
    int _2287 = ~_2271;
    int _2289 = _2145 + _2287;
    int _2291 = _2289 + 1;
    int _2293 = ~int(_2277);
    int _2295 = _2293 + 1;
    float _2297 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2299 = _2229 + _2297;
    int _2301 = ~int(_2279);
    int _2303 = _2301 + 1;
    int _2305 = ~_2119;
    int _2307 = _2305 + _2247;
    int _2309 = _2307 + 1;
    float _2311 = fma(_2299, _2299, _2231);
    int _2313 = _2285 ^ _2295;
    int _2315 = _2291 ^ _2303;
    int _2317 = _1725 * _2309;
    int _2319 = _2317 + _1879;
    bool _2321 = _1663 == 0;
    float _2323 = _2311 + _2233;
    bool _2325 = _1725 == 0;
    float _2327 = _1905 + 0.5;
    int _2329 = ~_2295;
    int _2331 = _2329 + _2313;
    int _2333 = _2331 + 1;
    int _2335 = ~_2303;
    int _2337 = _2335 + _2315;
    int _2339 = _2337 + 1;
    float _2341 = sqrt(_2323);
    bool _2343 = _1663 == 0;
    out.m_75.x = _2327;
    out.m_75.y = _2249;
    bool _2345 = _1725 == 0;
    bool _2347 = !_2321;
    int _2349 = _2347 ? _2333 : (-1);
    bool _2351 = !_2325;
    int _2353 = _2351 ? _2339 : (-1);
    bool _2355 = !_2343;
    int _2357 = _2355 ? _2275 : (-1);
    bool _2359 = !_2345;
    int _2361 = _2359 ? _2319 : (-1);
    float _2363 = float(_2349);
    float _2365 = float(_2353);
    float _2367 = float(_2357);
    float _2369 = -_1981;
    float _2371 = fma(_1057, _2363, _2369);
    float _2373 = float(_2361);
    float _2375 = -_2045;
    float _2377 = fma(_1811, _2365, _2375);
    float _2379 = fma(_1051, _2367, _2017);
    float _2381 = fma(_2049, _2373, _1541);
    float _2383 = fma(_1125, _1171, _2371);
    float _2385 = fma(_2029, _1167, _2379);
    float _2387 = fma(_1427, _2131, _2381);
    float _2389 = fma(_1435, _2133, _2377);
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2393 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2395 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2397 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2399 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2401 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2403 = _2393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2405 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2407 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[8].z, _975);
    float _2409 = _2385 + 0.5;
    float _2411 = _2387 + 0.5;
    float _2413 = _2383 + 0.5;
    float _2415 = _2389 + 0.5;
    float _2417 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[10].z, _983);
    out.m_77.x = _2401;
    out.m_77.y = _2403;
    out.m_77.z = _2405;
    out.m_77.w = _2399;
    bool _2419 = _2341 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2421 = isnan(_2341);
    bool _2423 = _2419 || _2421;
    bool _2425 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2427 = _2423 || _2425;
    out.m_79.w = _2397;
    out.m_81.x = _2409;
    out.m_81.y = _2413;
    out.m_81.z = _2411;
    out.m_81.w = _2415;
    out.m_83.x = _2407;
    out.m_83.y = _2243;
    out.m_83.z = _2417;
    float _2429 = _2385;
    float _2431 = _2413;
    if (!_2427)
    {
        _2429 = 1.0;
    }
    float _2433 = _2429;
    bool _2435 = !_2427;
    float _2437 = _2433;
    if (!_2435)
    {
        bool _2439 = _2341 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2441 = isnan(_2341);
        bool _2443 = _2439 || _2441;
        bool _2445 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2447 = _2443 || _2445;
        if (!_2447)
        {
            float _2449 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2451 = _2341 + _2449;
            float _2453 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2455 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2453;
            float _2457 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2461 = 1.0 / _2455;
            float _2463 = _2451 * _2461;
            float _2465 = fma(_2463, _2459, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2437 = _2465;
            _2467 = true;
        }
        else
        {
            bool _2469 = _2341 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2471 = isnan(_2341);
            bool _2473 = _2469 || _2471;
            bool _2475 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2477 = _2473 || _2475;
            if (!_2477)
            {
                float _2479 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2481 = _2341 + _2479;
                float _2483 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2485 = _2483 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2487 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2489 = _2487 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2491 = 1.0 / _2485;
                float _2493 = _2481 * _2491;
                float _2495 = fma(_2493, _2489, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2437 = _2495;
                _2467 = true;
            }
            else
            {
                _2437 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2467 = false;
    float _2497 = _2437;
    float _2499 = -_1531;
    float _2501 = fma(_2499, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1409);
    float _2503 = -_1575;
    float _2505 = fma(_2503, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1415);
    float _2507 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2509 = _2235 + _2507;
    float _2511 = -_1827;
    float _2513 = fma(_2511, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
    float _2515 = _2501 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2517 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2519 = _2229 + _2517;
    float _2521 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2523 = _2237 + _2521;
    float _2525 = fma(_2509, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2527 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2515);
    float _2529 = fma(_2519, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2531 = fma(_2523, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2533 = -_1827;
    float _2535 = fma(_2533, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2525);
    float _2537 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2527);
    float _2539 = _2501 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2541 = -_1531;
    float _2543 = fma(_2541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2529);
    float _2545 = -_1575;
    float _2547 = fma(_2545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2531);
    float _2549 = _2537 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2551 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2539);
    float _2553 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2555 = _2543 + _2553;
    float _2557 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2559 = _2547 + _2557;
    float _2561 = 1.0 / _2549;
    float _2563 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2551);
    float _2565 = _2555 * _2555;
    float _2567 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2569 = _2535 + _2567;
    float _2571 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2573 = fma(_2559, _2559, _2565);
    float _2575 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2577 = _2571 + _2549;
    float _2579 = fma(_2569, _2569, _2573);
    float _2581 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2583 = rsqrt(_2579);
    float _2585 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2575);
    float _2587 = _2577 * _2561;
    float _2589 = _2587 * 0.5;
    float _2591 = _2501 + _2581;
    float _2593 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2595 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2593);
    float _2597 = sqrt(_2579);
    float _2599 = fma(_2505, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2601 = 1.0 / _2595;
    float _2603 = _2583 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2605 = _2559 * _2603;
    float _2607 = _2569 * _2603;
    float _2609 = floor(_2599);
    float _2611 = _2605 * _2605;
    float _2613 = _2607 * _2607;
    float _2615 = _2611 + _2613;
    float _2617 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2619 = _2601 * _2617;
    float _2621 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2623 = sqrt(_2615);
    bool _2625 = _2619 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2627 = fma(_2505, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2621);
    bool _2629 = _2619 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2631 = -_2609;
    float _2633 = _2599 + _2631;
    float _2635 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2627);
    bool _2637 = !_2625;
    int _2639 = _2637 ? 0 : 1;
    float _2641 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _2643 = 2;
    float _2645 = _2605;
    float _2647 = _2607;
    float _2649 = _2611;
    float _2651 = _2613;
    float _2653 = _2609;
    float _2655 = _2555;
    if (!_2625)
    {
        _2643 = 1;
    }
    int _2657 = _2643;
    float _2659 = trunc(_2641);
    int _2661 = int(_2659);
    int _2663 = _2657;
    if (!_2629)
    {
        _2663 = _2639;
    }
    int _2665 = _2663;
    float _2667 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _2669 = _2623 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2671 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2673 = _2623 + _2671;
    int _2675 = _2665 << 6;
    float _2677 = fma(_2505, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2667);
    int _2679 = _2675 + 96;
    uint _2681 = uint(int(uint(_2679) >> uint(2)));
    uint _2683 = uint(int(uint(int(_2681)) >> uint(2)));
    int _2685 = int(_2681) & 3;
    float _2687 = (*spvDescriptorSet0.vp_c15)._m0[int(_2683)][_2685];
    int _2689 = int(_2681) + 1;
    uint _2691 = uint(int(uint(_2689) >> uint(2)));
    int _2693 = _2689 & 3;
    float _2695 = (*spvDescriptorSet0.vp_c15)._m0[int(_2691)][_2693];
    float _2697 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2677);
    float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2701 = _2327;
    float _2703 = _2673;
    if (_2669)
    {
        float _2705 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2701 = _2705;
    }
    float _2707 = _2701;
    int _2709 = _2675 + 104;
    uint _2711 = uint(int(uint(_2709) >> uint(2)));
    uint _2713 = uint(int(uint(int(_2711)) >> uint(2)));
    int _2715 = int(_2711) & 3;
    float _2717 = (*spvDescriptorSet0.vp_c15)._m0[int(_2713)][_2715];
    int _2719 = int(_2711) + 1;
    uint _2721 = uint(int(uint(_2719) >> uint(2)));
    int _2723 = _2719 & 3;
    float _2725 = (*spvDescriptorSet0.vp_c15)._m0[int(_2721)][_2723];
    int _2727 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2729 = _2661 + _2727;
    int _2731 = _2729 + 1;
    bool _2733 = _2731 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2735 = trunc(_2699);
    int _2737 = int(_2735);
    float _2739 = _2707;
    int _2741 = _2731;
    if (_2669)
    {
        float _2743 = _2673 * _2707;
        _2703 = _2743;
    }
    float _2745 = _2703;
    if (_2669)
    {
        float _2747 = _2745 * 0.15915493667125701904296875;
        _2739 = _2747;
    }
    float _2749 = _2739;
    float _2751 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2753 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2755 = _2737 + _2753;
    int _2757 = _2755 + 1;
    float _2759 = _2749;
    if (_2669)
    {
        float _2761 = _2749 * 6.283185482025146484375;
        float _2763 = sin(_2761);
        _2431 = _2763;
    }
    float _2765 = _2431;
    float _2767 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2751);
    int _2769 = _2731 | _2757;
    float _2771 = fma(_2535, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2767);
    bool _2773 = _2769 < 0;
    bool _2775 = _2773 || _2733;
    float _2777 = as_type<float>(_2737);
    if (_2669)
    {
        float _2779 = _2749 * 6.283185482025146484375;
        float _2781 = cos(_2779);
        _2777 = _2781;
    }
    float _2783 = _2777;
    float _2785 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2787 = _2771 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2789 = _2757 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2791 = _2789 || _2775;
    float _2793 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2795 = precise::max(0.0, _2785);
    float _2797 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2799 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_2669)
    {
        float _2801 = rsqrt(_2615);
        _2799 = _2801;
    }
    float _2803 = _2799;
    float _2805 = -_2603;
    float _2807 = -_2795;
    float _2809 = fma(_2555, _2805, _2807);
    float _2811 = _2591 * _2695;
    float _2813 = -_2797;
    float _2815 = fma(_2813, _2793, 1.0);
    float _2817 = _2695;
    float _2819 = _2809;
    if (_2669)
    {
        float _2821 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2759 = _2821;
    }
    float _2823 = _2759;
    float _2825 = _2823;
    if (_2669)
    {
        float _2827 = _2783 + (-1.0);
        _2817 = _2827;
    }
    float _2829 = _2817;
    float _2831 = fma(_2505, _2687, _2811);
    float _2833 = _2829;
    if (!_2791)
    {
        int _2835 = _2757 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2837 = _2835 + _2731;
        _2741 = _2837;
    }
    int _2839 = _2741;
    if (_2669)
    {
        float _2841 = fma(_2765, _2823, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2825 = _2841;
    }
    float _2843 = _2825;
    if (_2669)
    {
        float _2845 = _2829 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2833 = _2845;
    }
    float _2847 = _2833;
    float _2849 = fma(_2513, _2717, _2831);
    int _2851 = _2675 + 56;
    uint _2853 = uint(int(uint(_2851) >> uint(2)));
    uint _2855 = uint(int(uint(int(_2853)) >> uint(2)));
    int _2857 = int(_2853) & 3;
    float _2859 = (*spvDescriptorSet0.vp_c15)._m0[int(_2855)][_2857];
    int _2861 = int(_2853) + 1;
    uint _2863 = uint(int(uint(_2861) >> uint(2)));
    int _2865 = _2861 & 3;
    float _2867 = (*spvDescriptorSet0.vp_c15)._m0[int(_2863)][_2865];
    float _2869 = _2717;
    if (_2669)
    {
        float _2871 = fma(_2809, _2783, _2847);
        _2819 = _2871;
    }
    float _2873 = _2819;
    if (_2669)
    {
        float _2875 = _2803 * _2843;
        _2869 = _2875;
    }
    float _2877 = _2869;
    float _2879 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (!_2791)
    {
        int _2881 = _2839 << 2;
        _2177 = _2881;
    }
    int _2883 = _2177;
    float _2885 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _2887 = _2883;
    if (_2669)
    {
        float _2889 = _2605 * _2877;
        _2645 = _2889;
    }
    float _2891 = _2645;
    int _2893 = _2675 + 48;
    uint _2895 = uint(int(uint(_2893) >> uint(2)));
    uint _2897 = uint(int(uint(int(_2895)) >> uint(2)));
    int _2899 = int(_2895) & 3;
    float _2901 = (*spvDescriptorSet0.vp_c15)._m0[int(_2897)][_2899];
    int _2903 = int(_2895) + 1;
    uint _2905 = uint(int(uint(_2903) >> uint(2)));
    int _2907 = _2903 & 3;
    float _2909 = (*spvDescriptorSet0.vp_c15)._m0[int(_2905)][_2907];
    if (_2669)
    {
        float _2911 = _2607 * _2877;
        _2647 = _2911;
    }
    float _2913 = _2647;
    if (_2669)
    {
        float _2915 = _2891 * _2891;
        _2649 = _2915;
    }
    float _2917 = _2649;
    if (!_2791)
    {
        uint _2919 = uint(int(uint(_2839) >> uint(2)));
        _2179 = int(_2919);
    }
    int _2921 = _2179;
    if (_2669)
    {
        float _2923 = _2913 * _2913;
        _2651 = _2923;
    }
    float _2925 = _2651;
    if (!_2791)
    {
        int _2927 = 12 & _2883;
        _2887 = _2927;
    }
    int _2929 = _2887;
    float _2931 = fma(_2873, _2873, _2917);
    int _2933 = _2675 + 64;
    uint _2935 = uint(int(uint(_2933) >> uint(2)));
    uint _2937 = uint(int(uint(int(_2935)) >> uint(2)));
    int _2939 = int(_2935) & 3;
    float _2941 = (*spvDescriptorSet0.vp_c15)._m0[int(_2937)][_2939];
    int _2943 = int(_2935) + 1;
    uint _2945 = uint(int(uint(_2943) >> uint(2)));
    int _2947 = _2943 & 3;
    float _2949 = (*spvDescriptorSet0.vp_c15)._m0[int(_2945)][_2947];
    float _2951 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _2953 = _2929;
    if (!_2791)
    {
        int _2955 = _2921 << 4;
        int _2957 = _2955 + _2929;
        _2953 = _2957;
    }
    int _2959 = _2953;
    float _2961 = _2931 + _2925;
    float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2965 = fma(_2597, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2963);
    float _2967 = precise::clamp(_2965, 0.0, 1.0);
    float _2969 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2951);
    float _2971 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2879);
    float _2973 = _2849 + _2725;
    int _2975 = _2675 + 72;
    uint _2977 = uint(int(uint(_2975) >> uint(2)));
    uint _2979 = uint(int(uint(int(_2977)) >> uint(2)));
    int _2981 = int(_2977) & 3;
    float _2983 = (*spvDescriptorSet0.vp_c15)._m0[int(_2979)][_2981];
    int _2985 = int(_2977) + 1;
    uint _2987 = uint(int(uint(_2985) >> uint(2)));
    int _2989 = _2985 & 3;
    float _2991 = (*spvDescriptorSet0.vp_c15)._m0[int(_2987)][_2989];
    float _2993 = fma(_2535, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2969);
    float _2995 = fma(_2535, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2971);
    float _2997 = -_2967;
    float _2999 = _2997 + 1.0;
    float _3001 = fma(_2535, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2585);
    float _3003 = _2993 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3005 = _2995 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3007 = rsqrt(_2961);
    int _3009 = _2675 + 80;
    uint _3011 = uint(int(uint(_3009) >> uint(2)));
    uint _3013 = uint(int(uint(int(_3011)) >> uint(2)));
    int _3015 = int(_3011) & 3;
    float _3017 = (*spvDescriptorSet0.vp_c15)._m0[int(_3013)][_3015];
    int _3019 = int(_3011) + 1;
    uint _3021 = uint(int(uint(_3019) >> uint(2)));
    int _3023 = _3019 & 3;
    float _3025 = (*spvDescriptorSet0.vp_c15)._m0[int(_3021)][_3023];
    float _3027 = _3003 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3029 = _3001 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3031 = fma(_3005, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3027);
    float _3033 = 1.0 / _2973;
    int _3035 = _2675 + 88;
    uint _3037 = uint(int(uint(_3035) >> uint(2)));
    uint _3039 = uint(int(uint(int(_3037)) >> uint(2)));
    int _3041 = int(_3037) & 3;
    float _3043 = (*spvDescriptorSet0.vp_c15)._m0[int(_3039)][_3041];
    int _3045 = int(_3037) + 1;
    uint _3047 = uint(int(uint(_3045) >> uint(2)));
    int _3049 = _3045 & 3;
    float _3051 = (*spvDescriptorSet0.vp_c15)._m0[int(_3047)][_3049];
    float _3053 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3031);
    float _3055 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3053);
    float _3057 = _3007 * _2891;
    float _3059 = _3031;
    if (!_2791)
    {
        int _3061 = _2959 + 400;
        uint _3063 = uint(int(uint(_3061) >> uint(2)));
        uint _3065 = uint(int(uint(int(_3063)) >> uint(2)));
        int _3067 = int(_3063) & 3;
        float _3069 = (*spvDescriptorSet0.vp_c15)._m0[int(_3065)][_3067];
        _3059 = _3069;
    }
    float _3071 = _3059;
    float _3073 = _3007 * _2873;
    float _3075 = floor(_2885);
    float _3077 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3079 = _3007 * _2913;
    float _3081 = _2591 * _2909;
    float _3083 = abs(_2999);
    float _3085 = log2(_3083);
    float _3087 = fma(_2505, _2901, _3081);
    float _3089 = _2591 * _2949;
    float _3091 = fma(_2513, _2859, _3087);
    float _3093 = -_3075;
    float _3095 = _2885 + _3093;
    float _3097 = fma(_2505, _2941, _3089);
    float _3099 = _3091 + _2867;
    float _3101 = -_3077;
    float _3103 = fma(_3073, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3101);
    float _3105 = log2(_2815);
    float _3107 = fma(_2513, _2983, _3097);
    float _3109 = _3099 * _3033;
    float _3111 = -_3079;
    float _3113 = fma(_3111, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3103);
    float _3115 = _3085 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3117 = _3107 + _2991;
    bool _3119 = _3109 >= 0.0;
    float _3121 = _3097;
    if (!_2791)
    {
        float _3123 = floor(_2699);
        _3121 = _3123;
    }
    float _3125 = _3121;
    float _3127 = _3117 * _3033;
    float _3129 = _2591 * _3025;
    bool _3131 = _3109 <= 1.0;
    bool _3133 = _3131 && _3119;
    float _3135 = fma(_3113, -0.5, 0.5);
    float _3137 = fma(_3113, 0.5, 0.5);
    float _3139 = fma(_2505, _3017, _3129);
    bool _3141 = _3127 >= 0.0;
    bool _3143 = _3141 && _3133;
    float _3145 = sqrt(_3135);
    float _3147 = _3003 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3149 = fma(_2513, _3043, _3139);
    bool _3151 = _3127 <= 1.0;
    bool _3153 = _3151 && _3143;
    float _3155 = fma(_3137, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3157 = _3105 * 0.693147182464599609375;
    float _3159 = exp2(_3115);
    float _3161 = _3149 + _3051;
    float _3163 = _3003 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3165 = _3147;
    if (!_2791)
    {
        float _3167 = -_3125;
        float _3169 = _2699 + _3167;
        _2653 = _3169;
    }
    float _3171 = _2653;
    float _3173 = fma(_3005, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3147);
    float _3175 = fma(_3137, _3155, -0.212114393711090087890625);
    float _3177 = fma(_3005, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3163);
    float _3179 = _3073 + 1.0;
    float _3181 = _3129;
    float _3183 = _3179;
    if (!_2791)
    {
        float _3185 = floor(_2641);
        _3181 = _3185;
    }
    float _3187 = _3181;
    if (_3153)
    {
        float _3189 = float(_2665);
        _3165 = _3189;
    }
    float _3191 = _3165;
    float _3193 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3177);
    float _3195 = fma(_3137, _3175, 1.570728778839111328125);
    float _3197 = _3145 * 0.636619746685028076171875;
    float _3199 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3173);
    float _3201 = 1.0 / _3055;
    float _3203 = -_3195;
    float _3205 = fma(_3197, _3203, 1.0);
    float _3207 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3199);
    float _3209 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3193);
    float _3211 = -_3073;
    float _3213 = fma(_3159, _3179, _3211);
    float _3215 = _3157 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3217 = _3043;
    float _3219 = _3209;
    if (!_2791)
    {
        float _3221 = rint(_3071);
        float _3223 = precise::max(_3221, 0.0);
        uint _3225 = uint(_3223);
        uint _3227 = clamp(_3225, 0u, 65535u);
        _3217 = as_type<float>(_3227);
    }
    float _3229 = _3217;
    if (!_2791)
    {
        float _3231 = -_3187;
        float _3233 = _2641 + _3231;
        _3183 = _3233;
    }
    float _3235 = _3183;
    float _3237 = fma(_3213, 0.5, 0.5);
    float _3239 = _3177;
    if (_3153)
    {
        float _3241 = rint(_3191);
        float _3243 = precise::max(_3241, 0.0);
        uint _3245 = uint(_3243);
        uint _3247 = clamp(_3245, 0u, 65535u);
        _3239 = as_type<float>(_3247);
    }
    float _3249 = _3239;
    float _3251 = _3207 * _3201;
    float _3253 = _3209 * _3201;
    float _3255 = _3161 * _3033;
    float2 _8858 = float2(_2633, _3095);
    float _3257 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8858, float2(0.0), isnan(_8858)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8858, float2(0.0), isnan(_8858)), level(0.0)).x;
    float _3259 = fma(_3251, 0.5, 0.5);
    float _3261 = fma(_3253, -0.5, 0.5);
    float _3263 = _3171;
    if (!_2791)
    {
        float3 _8879 = float3(_3235, _3171, float(as_type<int>(_3229)));
        float3 _8883 = select(_8879, float3(0.0), isnan(_8879));
        float _3265 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8883.xy, uint(rint(_8883.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8883.xy, uint(rint(_8883.z)), level(0.0)).x;
        _3263 = _3265;
    }
    float _3267 = _3263;
    float _3269 = _3249;
    if (_3153)
    {
        float3 _8898 = float3(_3109, _3127, float(as_type<int>(_3249)));
        float3 _8900 = select(_8898, float3(0.0), isnan(_8898));
        float _3271 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8900.xy, uint(rint(_8900.z)), _3255, level(0.0));
        _3269 = _3271;
    }
    float _3273 = _3269;
    float3 _8910 = float3(_3259, _3261, _3215);
    float _3275 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8910, float3(0.0), isnan(_8910)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8910, float3(0.0), isnan(_8910)), level(0.0)).x;
    float3 _8919 = float3(_3259, _3261, _3215);
    float4 _3278 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8919, float3(0.0), isnan(_8919)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8919, float3(0.0), isnan(_8919)), level(0.0)).xyzw;
    float _3280 = _3278.x;
    float _3282 = _3278.y;
    float _3284 = _3278.z;
    float _3286 = _3278.w;
    float2 _8935 = float2(_3205, _3237);
    float3 _3290 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8935, float2(0.0), isnan(_8935)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8935, float2(0.0), isnan(_8935)), level(0.0)).xyz;
    float _3292 = _3290.x;
    float _3294 = _3290.y;
    float _3296 = _3290.z;
    float _3298 = abs(_2619);
    float _3300 = log2(_3298);
    float _3302 = _3003 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3304 = _3085 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_85.x = _2559;
    out.m_85.y = _2555;
    out.m_85.z = _2569;
    float _3306 = fma(_3005, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3302);
    float _3308 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3306);
    float _3310 = _3207 + _3055;
    float _3312 = _3055 * 0.5;
    float _3314 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3308);
    float _3316 = _3310 * 0.5;
    float _3318 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3320 = _3314 + _3055;
    float _3322 = exp2(_3304);
    bool _3324 = _2619 <= 8000.0;
    bool _3326 = isnan(_2619);
    bool _3328 = _3324 || _3326;
    bool _3330 = isnan(8000.0);
    bool _3332 = _3328 || _3330;
    float _3334 = float(_3332);
    float _3336 = _3320 * 0.5;
    float _3338 = fma(_3209, -0.5, _3312);
    out.gl_Position.x = _3207;
    out.gl_Position.y = _3209;
    out.gl_Position.z = _3314;
    out.gl_Position.w = _3055;
    float _3340 = exp2(_3318);
    out.m_87.x = _3316;
    out.m_87.y = _3338;
    out.m_87.z = _3336;
    out.m_87.w = _3055;
    bool _3342 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3344 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3346 = _3342 || _3344;
    bool _3348 = isnan(0.5);
    bool _3350 = _3346 || _3348;
    float _3352 = _3334;
    float _3354 = _3314;
    if (_3350)
    {
        _2655 = 1.0;
    }
    float _3356 = _2655;
    float _3358 = fma(_3340, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3360 = precise::clamp(_3358, 0.0, 1.0);
    float _3362 = fma(_3360, -2.0, 3.0);
    float _3364 = _3360 * _3360;
    float _3366 = _3364 * _3362;
    float _3368 = -_3366;
    float _3370 = _3368 + 1.0;
    float _3372 = fma(_3370, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3366);
    float _3374 = _3334 * _3372;
    float _3376 = _3356;
    if (_3350)
    {
        _3352 = 1.0;
    }
    float _3378 = _3352;
    float _3380 = _3378;
    if (!_3350)
    {
        float _3382 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3384 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3386 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3384;
        float _3388 = _3382 * 0.15915493667125701904296875;
        float _3390 = _3388 * 6.283185482025146484375;
        float _3392 = cos(_3390);
        float _3394 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3396 = _3394 * 0.15915493667125701904296875;
        float _3398 = _3388 * 6.283185482025146484375;
        float _3400 = sin(_3398);
        float _3402 = 1.0 / _3392;
        float _3404 = _3396 * 6.283185482025146484375;
        float _3406 = cos(_3404);
        float _3408 = _3400 * _3402;
        float _3410 = _3396 * 6.283185482025146484375;
        float _3412 = sin(_3410);
        float _3414 = _3406 * _3408;
        float _3416 = 1.0 / _3386;
        float _3418 = 1.0 / _3414;
        float _3420 = _3412 * _3418;
        float _3422 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3424 = fma(_2619, _3420, _3422);
        float _3426 = _3424 * _3416;
        float _3428 = precise::clamp(_3426, 0.0, 1.0);
        _3219 = _3414;
        _3376 = _3428;
        _3354 = _3424;
    }
    float _3430 = _3219;
    float _3432 = _3376;
    float _3434 = _3354;
    float _3436 = _3430;
    float _3438 = _3434;
    if (!_3350)
    {
        float _3440 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3442 = _3440 * 0.15915493667125701904296875;
        float _3444 = _3442 * 6.283185482025146484375;
        float _3446 = cos(_3444);
        float _3448 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3450 = _3448 * 0.15915493667125701904296875;
        float _3452 = _3442 * 6.283185482025146484375;
        float _3454 = sin(_3452);
        float _3456 = 1.0 / _3446;
        float _3458 = _3450 * 6.283185482025146484375;
        float _3460 = cos(_3458);
        float _3462 = _3454 * _3456;
        float _3464 = _3450 * 6.283185482025146484375;
        float _3466 = sin(_3464);
        float _3468 = _3460 * _3462;
        float _3470 = 1.0 / _3468;
        float _3472 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3474 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3472;
        float _3476 = 1.0 / _3474;
        float _3478 = _3466 * _3470;
        float _3480 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3482 = fma(_2619, _3478, _3480);
        float _3484 = _3482 * _3476;
        float _3486 = precise::clamp(_3484, 0.0, 1.0);
        float _3488 = -_3486;
        float _3490 = _3488 + 1.0;
        _3436 = _3474;
        _3380 = _3490;
        _3438 = _3450;
    }
    float _3492 = _3436;
    float _3494 = _3380;
    float _3496 = _3438;
    float _3498 = -_3322;
    float _3500 = _3498 + 1.0;
    float _3502 = _3374 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3504 = -_3257;
    float _3506 = _3504 + 1.0;
    float _3508 = _3492;
    float _3510 = _3500;
    float _3512 = _3496;
    if (!_3153)
    {
        _3508 = 1.0;
    }
    float _3514 = _3508;
    float _3516 = _3500 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3518 = _3514;
    float _3520 = _3516;
    if (_3153)
    {
        bool _3522 = _3273 >= _3255;
        bool _3524 = isnan(_3273);
        bool _3526 = _3522 || _3524;
        bool _3528 = isnan(_3255);
        bool _3530 = _3526 || _3528;
        float _3532 = float(_3530);
        _3518 = _3532;
    }
    float _3534 = _3518;
    float _3536 = _3506 * _3502;
    float _3538 = precise::clamp(_3536, 0.0, 1.0);
    float _3540 = _3534;
    if (_2791)
    {
        _3510 = 1.0;
    }
    float _3542 = _3510;
    float _3544 = _3542;
    if (!_2791)
    {
        int _3546 = _2839 << 4;
        int _3548 = _3546 + 2048;
        uint _3550 = uint(int(uint(_3548) >> uint(2)));
        uint _3552 = uint(int(uint(int(_3550)) >> uint(2)));
        int _3554 = int(_3550) & 3;
        float _3556 = (*spvDescriptorSet0.vp_c15)._m0[int(_3552)][_3554];
        int _3558 = int(_3550) + 1;
        uint _3560 = uint(int(uint(_3558) >> uint(2)));
        int _3562 = _3558 & 3;
        float _3564 = (*spvDescriptorSet0.vp_c15)._m0[int(_3560)][_3562];
        int _3566 = _3548 + 8;
        uint _3568 = uint(int(uint(_3566) >> uint(2)));
        uint _3570 = uint(int(uint(int(_3568)) >> uint(2)));
        int _3572 = int(_3568) & 3;
        float _3574 = (*spvDescriptorSet0.vp_c15)._m0[int(_3570)][_3572];
        int _3576 = int(_3568) + 1;
        uint _3578 = uint(int(uint(_3576) >> uint(2)));
        int _3580 = _3576 & 3;
        float _3582 = (*spvDescriptorSet0.vp_c15)._m0[int(_3578)][_3580];
        float _3584 = _2591 * _3564;
        float _3586 = fma(_2505, _3556, _3584);
        float _3588 = fma(_2513, _3574, _3586);
        float _3590 = _3588 + _3582;
        float _3592 = precise::clamp(_3590, 0.0, 1.0);
        float _3594 = -_3592;
        float _3596 = _3594 + _3267;
        float _3598 = fma(_3596, 500.0, 1.5);
        float _3600 = exp2(_3598);
        float _3602 = 0.0 + _3600;
        float _3604 = precise::clamp(_3602, 0.0, 1.0);
        _3544 = _3604;
    }
    float _3606 = _3544;
    float _3608 = _3516 * _3275;
    float _3610 = _3534 * _3606;
    float _3612 = -_3538;
    float _3614 = fma(_3612, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3616 = -_3516;
    float _3618 = _3616 + 1.0;
    float _3620 = _3286 * _3608;
    float _3622 = _3296 * _3608;
    float _3624 = -_3610;
    float _3626 = fma(_3624, _3614, 1.0);
    float _3628 = precise::clamp(_3626, 0.0, 1.0);
    bool _3630 = _2597 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3632 = isnan(_2597);
    bool _3634 = _3630 || _3632;
    bool _3636 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3638 = _3634 || _3636;
    float _3640 = fma(_3292, _3620, _3280);
    float _3642 = fma(_3294, _3620, _3282);
    float _3644 = _3286 * _3618;
    float _3646 = _3628 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3648 = fma(_3286, _3622, _3284);
    float _3650 = _3432 * _3494;
    out.m_89.x = _3646;
    float _3652 = _3650 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_91.x = _3640;
    out.m_91.y = _3642;
    out.m_91.z = _3648;
    out.m_91.w = _3644;
    float _3654 = _3614;
    float _3656 = _3618;
    float _3658 = _3628;
    if (!_3638)
    {
        _3512 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3660 = _3512;
    float _3662 = _3660;
    float _3664 = _3660;
    if (!_3638)
    {
        _3520 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3666 = _3520;
    float _3668 = _3666;
    float _3670 = _3666;
    if (!_3638)
    {
        _3654 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3672 = _3654;
    float _3674 = _3672;
    float _3676 = _3672;
    if (!_3638)
    {
        _3540 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3678 = _3540;
    float _3680 = _3678;
    float _3682 = _3678;
    if (!_3638)
    {
        _3656 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3684 = _3656;
    float _3686 = _3684;
    float _3688 = _3684;
    if (!_3638)
    {
        _3658 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3690 = _3658;
    bool _3692 = !_3638;
    float _3694 = _3690;
    float _3696 = _3690;
    if (!_3692)
    {
        bool _3698 = _2597 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3700 = isnan(_2597);
        bool _3702 = _3698 || _3700;
        bool _3704 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3706 = _3702 || _3704;
        if (!_3706)
        {
            float _3708 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3710 = _2597 + _3708;
            float _3712 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3714 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3712;
            float _3716 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3718 = _3716 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3720 = 1.0 / _3714;
            float _3722 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3724 = _3722 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3726 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3728 = _3726 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3730 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3732 = _3730 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3734 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3736 = _3734 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3738 = _3710 * _3720;
            float _3740 = precise::clamp(_3738, 0.0, 1.0);
            float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3744 = _3742 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3746 = fma(_3740, _3718, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3748 = fma(_3740, _3744, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3750 = fma(_3740, _3724, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3752 = fma(_3740, _3728, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3754 = fma(_3740, _3732, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3756 = fma(_3740, _3736, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3670 = _3746;
            _3688 = _3754;
            _3664 = _3750;
            _3682 = _3752;
            _3676 = _3748;
            _3696 = _3756;
            _3758 = true;
        }
        else
        {
            bool _3760 = _2597 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3762 = isnan(_2597);
            bool _3764 = _3760 || _3762;
            bool _3766 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3768 = _3764 || _3766;
            if (!_3768)
            {
                _3662 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3770 = _3662;
            _3664 = _3770;
            if (!_3768)
            {
                _3668 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3772 = _3668;
            _3670 = _3772;
            if (!_3768)
            {
                _3674 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3774 = _3674;
            _3676 = _3774;
            if (!_3768)
            {
                _3680 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3776 = _3680;
            _3682 = _3776;
            if (!_3768)
            {
                _3686 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3778 = _3686;
            _3688 = _3778;
            if (!_3768)
            {
                _3694 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3780 = _3694;
            bool _3782 = !_3768;
            _3696 = _3780;
            if (!_3782)
            {
                bool _3784 = _2597 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3786 = isnan(_2597);
                bool _3788 = _3784 || _3786;
                bool _3790 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3792 = _3788 || _3790;
                if (!_3792)
                {
                    float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3796 = _2597 + _3794;
                    float _3798 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3800 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3798;
                    float _3802 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3804 = _3802 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3806 = 1.0 / _3800;
                    float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3810 = _3808 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3814 = _3812 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3816 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3818 = _3816 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3820 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3822 = _3820 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3824 = _3796 * _3806;
                    float _3826 = precise::clamp(_3824, 0.0, 1.0);
                    float _3828 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3830 = _3828 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3832 = fma(_3826, _3804, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3834 = fma(_3826, _3830, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3836 = fma(_3826, _3810, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3838 = fma(_3826, _3814, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3840 = fma(_3826, _3818, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3842 = fma(_3826, _3822, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3670 = _3832;
                    _3688 = _3840;
                    _3664 = _3836;
                    _3682 = _3838;
                    _3676 = _3834;
                    _3696 = _3842;
                    _3758 = true;
                }
                else
                {
                    _3670 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3688 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3664 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3682 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3676 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3696 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3758 = false;
    float _3844 = _3670;
    float _3846 = _3688;
    float _3848 = _3664;
    float _3850 = _3682;
    float _3852 = _3676;
    float _3854 = _3696;
    float _3856 = fma(_2243, -0.5, 0.5);
    float _3858 = precise::clamp(_3856, 0.0, 1.0);
    float _3860 = -_3844;
    float _3862 = _3860 + _3846;
    float _3864 = _3652 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3866 = -_3848;
    float _3868 = _3866 + _3850;
    out.m_93.x = 0.0;
    float _3870 = fma(_3858, _3862, _3844);
    float _3872 = fma(_3858, _3868, _3848);
    out.m_61.x = _3864;
    float _3874 = -_3852;
    float _3876 = _3874 + _3854;
    float _3878 = _3870 * 0.586610972881317138671875;
    bool _3880 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3882 = fma(_3858, _3876, _3852);
    float _3884 = fma(_3872, 0.298911988735198974609375, _3878);
    bool _3886 = _3432 > 0.0;
    bool _3888 = isnan(_3432);
    bool _3890 = _3886 || _3888;
    bool _3892 = isnan(0.0);
    bool _3894 = _3890 || _3892;
    float _3896 = fma(_3882, 0.114477999508380889892578125, _3884);
    bool _3898 = _3494 <= 0.0;
    bool _3900 = !_3894;
    bool _3902 = _3898 || _3900;
    float _3904 = -_3896;
    float _3906 = _3872 + _3904;
    float _3908 = -_3896;
    float _3910 = _3870 + _3908;
    float _3912 = -_3896;
    float _3914 = _3882 + _3912;
    float _3916 = fma(_3906, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3896);
    float _3918 = fma(_3910, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3896);
    float _3920 = fma(_3914, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3896);
    bool _3922 = !_3880;
    if (!_3922)
    {
        float _3924 = -_2543;
        float _3926 = _3924 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3928 = -_2547;
        float _3930 = _3928 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3932 = -_2535;
        float _3934 = _3932 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3936 = _3926 * _3926;
        float _3938 = fma(_3930, _3930, _3936);
        float _3940 = fma(_3934, _3934, _3938);
        float _3942 = sqrt(_3940);
        float _3944 = rsqrt(_3940);
        float _3946 = -_3942;
        float _3948 = _3946 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3950 = _3948 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3952 = precise::clamp(_3950, 0.0, 1.0);
        float _3954 = _3930 * _3944;
        float _3956 = _3926 * _3944;
        float _3958 = abs(_3952);
        float _3960 = log2(_3958);
        float _3962 = _3934 * _3944;
        float _3964 = _3954 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3966 = _2243 * _3956;
        float _3968 = -_3956;
        float _3970 = -_3964;
        float _3972 = fma(_3968, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3970);
        float _3974 = fma(_2407, _3954, _3966);
        float _3976 = -_3962;
        float _3978 = fma(_3976, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3972);
        float _3980 = fma(_2417, _3962, _3974);
        float _3982 = precise::clamp(_3980, 0.0, 1.0);
        float _3984 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3986 = _3978 + _3984;
        float _3988 = _3960 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3990 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3992 = precise::clamp(_3990, 0.0, 1.0);
        float _3994 = exp2(_3988);
        float _3996 = _3994 * _3992;
        float _3998 = _3982 * _3996;
        float _4000 = _3998 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4002 = _3998 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4004 = _3998 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _4000;
        out.m_93.y = _4002;
        out.m_93.z = _4004;
    }
    out.m_95.x = _3916;
    out.m_95.y = _3918;
    out.m_95.z = _3920;
    if (!_3902)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _4006 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4006;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3758 = false;
    bool _2467 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _4063 = as_type<float>(_130);
        out.gl_Position.z = _4063;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_63.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_144)
    {
        float _150 = float(_114);
        _124 = _150;
    }
    float _152 = _124;
    bool _154 = _148 >= _152;
    bool _156 = !_144;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_61.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4132 = as_type<float>(_166);
        out.gl_Position.z = _4132;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _170 = int(_168);
    float _172 = in.m_65.x;
    float _174 = in.m_67.x;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _178 = _176 != 0;
    float _180 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _182 = int(_180);
    float _184 = in.m_67.z;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _188 = _186 != 0;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _192 = _190 != 0;
    float _194 = in.m_67.y;
    int _196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _198 = _196 != 0;
    float _200 = float(_170);
    float _202 = in.m_65.y;
    float _204 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _206 = int(_204);
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _210 = _208 != 0;
    float _212 = in.m_69.x;
    float _214 = in.m_69.y;
    float _216 = in.m_69.z;
    float _218 = float(_114);
    float _220 = float(_182);
    float _222 = in.m_67.w;
    float _224 = 1.0 / _200;
    int _226 = _170;
    int _228 = _182;
    float _230 = _172;
    if (_178)
    {
        float _232 = -_172;
        float _234 = _232 + 1.0;
        _226 = as_type<int>(_234);
    }
    int _236 = _226;
    float _238 = 0.0;
    int _240 = _236;
    if (!_178)
    {
        _238 = _172;
    }
    float _242 = _238;
    float _244 = _242;
    if (_192)
    {
        float _246 = -_172;
        float _248 = _246 + 1.0;
        _228 = as_type<int>(_248);
    }
    int _250 = _228;
    bool _252 = false;
    if (_178)
    {
        bool _254 = _174 > 0.5;
        _252 = _254;
    }
    bool _256 = _252;
    float _258 = in.m_71.x;
    float _260 = in.m_71.y;
    float _262 = in.m_71.z;
    float _264 = 0.0;
    if (!_188)
    {
        _264 = _172;
    }
    float _266 = _264;
    float _268 = 1.0 / _220;
    float _270 = _266;
    if (_178)
    {
        float _272 = _256 ? as_type<float>(_236) : _172;
        _244 = _272;
    }
    float _274 = _244;
    if (_188)
    {
        float _276 = -_172;
        float _278 = _276 + 1.0;
        _240 = as_type<int>(_278);
    }
    int _280 = _240;
    bool _282 = _184 > 0.5;
    bool _284 = _194 > 0.5;
    if (_188)
    {
        float _286 = _282 ? as_type<float>(_280) : _172;
        _270 = _286;
    }
    float _288 = _270;
    float _290 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _292 = int(_290);
    float _294 = _148 * _224;
    float _296 = float(uint(_206));
    float _298 = -_202;
    float _300 = _298 + 1.0;
    float _302 = _202;
    if (_192)
    {
        float _304 = _284 ? as_type<float>(_250) : _172;
        _230 = _304;
    }
    float _306 = _230;
    float _308 = in.m_73.x;
    float _310 = in.m_73.y;
    float _312 = in.m_73.z;
    bool _314 = _214 != 0.0;
    bool _316 = isnan(_214);
    bool _318 = _314 || _316;
    bool _320 = isnan(0.0);
    bool _322 = _318 || _320;
    float _324 = 1.0 / _296;
    float _326 = _148 * _268;
    bool _328 = _222 > 0.5;
    bool _330 = _212 == 0.0;
    bool _332 = !_322;
    bool _334 = _330 && _332;
    float _336 = _258 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _338 = _328 ? as_type<int>(_300) : as_type<int>(_202);
    float _340 = _262 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = trunc(_294);
    int _344 = int(_342);
    float _346 = float(uint(_292));
    float _348 = _260 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _350 = _284 ? as_type<int>(_300) : as_type<int>(_202);
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _354 = _352 != 0;
    bool _356 = _216 == 0.0;
    bool _358 = _356 && _334;
    float _360 = 1.0 / _346;
    float _362 = _210 ? as_type<float>(_350) : _202;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _366 = _364 != 0;
    float _368 = _354 ? as_type<float>(_338) : _202;
    int _370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _372 = _370 != 0;
    float _374 = trunc(_326);
    int _376 = int(_374);
    float _378 = _312;
    float _380 = _310;
    float _382 = _308;
    if (!_358)
    {
        float _384 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[17].y, _312);
        _378 = _384;
    }
    float _386 = _378;
    int _388 = as_type<int>(_324) + (-2);
    if (!_358)
    {
        float _390 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[17].y, _310);
        _380 = _390;
    }
    float _392 = _380;
    float _394 = float(uint(_344));
    if (!_358)
    {
        float _396 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[17].y, _308);
        _382 = _396;
    }
    float _398 = _382;
    int _400 = as_type<int>(_360) + (-2);
    float _402 = as_type<float>(_388) * _394;
    int _404 = ~_206;
    int _406 = _404 + 1;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _216);
    float _410 = trunc(_402);
    float _412 = precise::max(_410, 0.0);
    uint _415 = uint(_412);
    float _417 = float(uint(_376));
    float _419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _214);
    float _421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _212);
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _425 = as_type<float>(_400) * _417;
    float _427 = 1.0 / _218;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _431 = _429 != 0;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _435 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _439 = _435;
    if (_198)
    {
        _437 = 1.0;
    }
    float _441 = _437;
    float _443 = _441;
    if (!_198)
    {
        _443 = 7.345489978790283203125;
    }
    float _445 = _443;
    float _447 = -_433;
    float _449 = fma(_435, 2.0, _447);
    float _451 = trunc(_425);
    float _453 = precise::max(_451, 0.0);
    uint _455 = uint(_453);
    float _457 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _459 = _406 * int(_415);
    int _461 = _459 + _344;
    float _463 = as_type<float>(_461);
    if (_198)
    {
        _439 = _174;
    }
    float _465 = _439;
    float _467 = _445 * _174;
    float _469 = fma(_457, -2.0, _423);
    int _471 = ~_292;
    int _473 = _471 + 1;
    float _475 = float(uint(_461));
    float _477 = floor(_467);
    float _479 = _465;
    if (_198)
    {
        _463 = 1.0;
    }
    float _481 = _463;
    float _483 = _481;
    if (!_198)
    {
        _479 = _194;
    }
    float _485 = _479;
    float _487 = as_type<float>(_388) * _475;
    int _489 = as_type<int>(_485);
    if (!_198)
    {
        _483 = 1.2345600128173828125;
    }
    float _491 = _483;
    int _493 = _473 * int(_455);
    int _495 = _493 + _376;
    if (_431)
    {
        float _497 = _282 ? _300 : _202;
        _302 = _497;
    }
    float _499 = _302;
    float _501 = trunc(_487);
    float _503 = precise::max(_501, 0.0);
    uint _505 = uint(_503);
    float _507 = float(_206);
    float _509 = _485 * _491;
    float _511 = float(_292);
    float _513 = float(uint(_495));
    float _515 = _148 * _507;
    float _517 = _148 * _511;
    bool _519 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _523 = _519 || _521;
    bool _525 = isnan(1.0);
    bool _527 = _523 || _525;
    float _529 = floor(_509);
    float _531 = as_type<float>(_400) * _513;
    if (_198)
    {
        _489 = 0;
    }
    int _533 = _489;
    float _535 = _515 * _427;
    int _537 = _533;
    if (!_198)
    {
        _537 = 1;
    }
    int _539 = _537;
    float _541 = _517 * _427;
    float _543 = -_477;
    float _545 = _467 + _543;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _549 = _547 != 0;
    float _551 = trunc(_531);
    float _553 = precise::max(_551, 0.0);
    uint _555 = uint(_553);
    bool _557 = _539 != 1;
    float _559 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _563 = _561 != 0;
    int _565 = int(_563);
    int _567 = _198 ? 2 : 0;
    int _569 = _565 | _567;
    int _571 = _549 ? 4 : 0;
    int _573 = _569 | _571;
    int _575 = _527 ? 8 : 0;
    int _577 = _573 | _575;
    int _579 = _557 ? 16 : 0;
    int _581 = _577 | _579;
    int _583 = _372 ? 32 : 0;
    int _585 = _581 | _583;
    int _587 = _366 ? 64 : 0;
    int _589 = _585 | _587;
    int _591 = _589 & 16;
    float _593 = 0.0;
    float _595 = _559;
    if (!_527)
    {
        float _597 = _559 * _559;
        float _599 = _597 * 0.5;
        _593 = _599;
    }
    float _601 = _593;
    int _603 = ~_206;
    int _605 = _603 + 1;
    int _607 = int(_415) + int(_505);
    float _609 = _601;
    if (!_527)
    {
        float _611 = _601 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _609 = _611;
    }
    float _613 = _609;
    bool _615 = !_527;
    int _617 = 0;
    float _619 = _613;
    if (!_615)
    {
        float _621 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _623 = log2(_621);
        float _625 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _627 = _625 + 1.0;
        float _629 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _631 = _559 * _623;
        float _633 = exp2(_631);
        float _635 = _629 * 0.693147182464599609375;
        float _637 = 1.0 / _635;
        float _639 = 1.0 / _627;
        float _641 = _633 + (-1.0);
        float _643 = -_641;
        float _645 = fma(_643, _637, _559);
        float _647 = _645 * _639;
        float _649 = _647 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _617 = as_type<int>(_647);
        _619 = _649;
    }
    int _651 = _617;
    float _653 = _619;
    bool _655 = !_527;
    int _657 = _651;
    if (!_655)
    {
        float _659 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _661 = log2(_659);
        float _663 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _665 = _663 + 1.0;
        float _667 = 1.0 / _665;
        float _669 = _559 * _661;
        float _671 = exp2(_669);
        float _673 = -_671;
        float _675 = _673 + 1.0;
        float _677 = _675 * _667;
        _595 = _677;
    }
    float _679 = _595;
    bool _681 = !_549;
    int _683 = _681 ? 0 : 1;
    int _685 = _605 * _607;
    int _687 = _685 + _344;
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _691 = _689 != 0;
    float _693 = -_529;
    float _695 = _509 + _693;
    float _697 = float(_344);
    float _699 = trunc(_535);
    int _701 = int(_699);
    bool _703 = !_691;
    int _705 = _703 ? 0 : 1;
    float _707 = _511 * _695;
    bool _709 = uint(_687) >= uint(_206);
    float _711 = _545 * _507;
    int _713 = int(_455) + int(_555);
    float _715 = _348 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _717 = ~_292;
    int _719 = _717 + 1;
    float _721 = trunc(_707);
    int _723 = int(_721);
    bool _725 = _697 >= _507;
    bool _727 = isnan(_697);
    bool _729 = _725 || _727;
    bool _731 = isnan(_507);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _741 = _739 != 0;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _745 = _743 != 0;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _749 = _747 != 0;
    int _751 = _719 * _713;
    int _753 = _751 + _376;
    float _755 = float(_376);
    bool _757 = !_563;
    int _759 = _757 ? 0 : 1;
    float _761 = trunc(_735);
    int _763 = int(_761);
    bool _765 = _755 >= _511;
    bool _767 = isnan(_755);
    bool _769 = _765 || _767;
    bool _771 = isnan(_511);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    bool _777 = !_745;
    int _779 = _777 ? 0 : 1;
    bool _781 = _591 != 0;
    bool _783 = !_741;
    int _785 = _783 ? 0 : 1;
    float _787 = trunc(_775);
    int _789 = int(_787);
    bool _791 = uint(_753) >= uint(_292);
    bool _793 = _206 == 0;
    bool _795 = !_709;
    int _797 = _795 ? 0 : (-1);
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _801 = _799 != 0;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _805 = _803 != 0;
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _809 = ~_607;
    int _811 = _809 + _797;
    int _813 = _811 + 1;
    bool _815 = !_791;
    int _817 = _815 ? 0 : (-1);
    float _819 = _679;
    if (_198)
    {
        _657 = 0;
    }
    int _821 = _657;
    int _823 = _206 * _813;
    int _825 = _823 + _344;
    int _827 = _821;
    if (!_198)
    {
        _827 = 2;
    }
    int _829 = _827;
    float _831 = trunc(_541);
    int _833 = int(_831);
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _837 = _835 != 0;
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _841 = _839 != 0;
    int _843 = ~_713;
    int _845 = _843 + _817;
    int _847 = _845 + 1;
    int _849 = abs(_683);
    bool _851 = !_841;
    int _853 = _851 ? 0 : 1;
    int _855 = _292 * _847;
    int _857 = _855 + _376;
    int _859 = ~_763;
    int _861 = _859 + 1;
    int _863 = _861 + 1;
    float _865 = trunc(_711);
    int _867 = int(_865);
    bool _869 = !_793;
    int _871 = _869 ? _825 : (-1);
    bool _873 = _292 == 0;
    int _875 = ~_789;
    int _877 = _875 + 1;
    int _879 = _877 + 1;
    int _881 = _871 * _863;
    bool _883 = !_873;
    int _885 = _883 ? _857 : (-1);
    int _887 = _206 + (-1);
    bool _889 = !_837;
    int _891 = _889 ? 0 : 1;
    int _893 = _879 * _885;
    int _895 = abs(_759);
    int _897 = _763 * _887;
    int _899 = _897 + _881;
    bool _901 = _829 != 2;
    int _903 = _867 * _849;
    int _905 = _903 + _344;
    int _907 = abs(_779);
    int _909 = _292 + (-1);
    int _911 = abs(_853);
    int _913 = _899 * _907;
    int _915 = abs(_785);
    int _917 = _789 * _909;
    int _919 = _917 + _893;
    bool _921 = !_801;
    int _923 = _921 ? 0 : 1;
    int _925 = _701 * _915;
    int _927 = _925 + _913;
    int _929 = _723 * _895;
    int _931 = _929 + _376;
    int _933 = abs(_891);
    float _935 = _807 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _937 = abs(_923);
    int _939 = _919 * _911;
    bool _941 = !_749;
    int _943 = _941 ? 0 : 1;
    float _945 = fma(_935, _499, -0.5);
    int _947 = _833 * _933;
    int _949 = _947 + _939;
    int _951 = abs(_943);
    float _953 = _392 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _955 = abs(_705);
    int _957 = _931 * _937;
    int _959 = _957 + _949;
    bool _961 = !_805;
    int _963 = _961 ? 0 : 1;
    int _965 = _905 * _951;
    int _967 = _965 + _927;
    float _969 = _392 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _971 = abs(_963);
    float _973 = _392 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _975 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[8].x, _953);
    int _977 = _867 * _955;
    int _979 = _977 + _967;
    float _981 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[9].x, _969);
    float _983 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[10].x, _973);
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _987 = float(uint(_979));
    int _989 = _723 * _971;
    int _991 = _989 + _959;
    float _993 = as_type<float>(_881);
    float _995 = as_type<float>(_895);
    float _997 = as_type<float>(_915);
    if (!_781)
    {
        _993 = _184;
    }
    float _999 = _993;
    float _1001 = as_type<float>(_388) * _987;
    float _1003 = float(uint(_991));
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1009 = as_type<float>(_400) * _1003;
    float _1011 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1005);
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1015 = ~_206;
    int _1017 = _1015 + 1;
    float _1019 = trunc(_1001);
    float _1021 = precise::max(_1019, 0.0);
    uint _1023 = uint(_1021);
    float _1025 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1011);
    float _1027 = _1011;
    float _1029 = _999;
    if (!_781)
    {
        _1027 = _999;
    }
    float _1031 = _1027;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1035 = _1031;
    if (_781)
    {
        _1029 = _184;
    }
    float _1037 = _1029;
    float _1039 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1013);
    if (!_781)
    {
        _995 = _174;
    }
    float _1041 = _995;
    float _1043 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1033);
    float _1045 = trunc(_1009);
    float _1047 = precise::max(_1045, 0.0);
    uint _1049 = uint(_1047);
    float _1051 = _985 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1053 = _1041;
    if (!_781)
    {
        _997 = _1041;
    }
    float _1055 = _997;
    float _1057 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1059 = _1055;
    if (_781)
    {
        _1053 = _174;
    }
    float _1061 = _1053;
    float _1063 = _1025 * (-0.15915493667125701904296875);
    int _1065 = _1017 * int(_1023);
    int _1067 = _1065 + _979;
    int _1069 = ~_292;
    int _1071 = _1069 + 1;
    float _1073 = _1063 * 6.283185482025146484375;
    float _1075 = sin(_1073);
    float _1077 = in.m_63.x;
    float _1079 = in.m_63.y;
    float _1081 = in.m_63.z;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1085 = float(uint(_1067));
    float _1087 = fma(_362, _1057, -0.5);
    int _1089 = _1071 * int(_1049);
    int _1091 = _1089 + _991;
    float _1093 = fma(_1051, _274, -0.5);
    float _1095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1097 = as_type<float>(_388) * _1085;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1101 = float(uint(_1091));
    float _1103 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1083);
    float _1105 = as_type<float>(_1091);
    float _1107 = _1083;
    float _1109 = as_type<float>(_1023);
    if (!_781)
    {
        _1105 = _194;
    }
    float _1111 = _1105;
    float _1113 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1043);
    float _1115 = _1111;
    if (_781)
    {
        _1059 = _1037;
    }
    float _1117 = _1059;
    float _1119 = _1063 * 6.283185482025146484375;
    float _1121 = cos(_1119);
    if (!_781)
    {
        _1107 = _1111;
    }
    float _1123 = _1107;
    float _1125 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1103);
    float _1127 = _1123;
    if (_781)
    {
        _1115 = _194;
    }
    float _1129 = _1115;
    float _1131 = 0.0;
    if (!_781)
    {
        _1131 = _1031;
    }
    float _1133 = _1131;
    float _1135 = _1133;
    if (_781)
    {
        _1135 = _1129;
    }
    float _1137 = _1135;
    float _1139 = trunc(_1097);
    float _1141 = precise::max(_1139, 0.0);
    uint _1143 = uint(_1141);
    float _1145 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1099);
    float _1147 = as_type<float>(_400) * _1101;
    float _1149 = _1075 * _1087;
    float _1151 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_781)
    {
        _1035 = _1129;
    }
    float _1153 = _1035;
    float _1155 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1157 = _1121 * _1087;
    float _1159 = trunc(_1147);
    float _1161 = precise::max(_1159, 0.0);
    uint _1163 = uint(_1161);
    float _1165 = -_1149;
    float _1167 = fma(_1121, _1093, _1165);
    float _1169 = fma(_1151, _306, -0.5);
    float _1171 = fma(_1075, _1093, _1157);
    float _1173 = _653 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1175 = _653 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _1177 = _653 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1179 = _1157;
    if (_901)
    {
        _1179 = _1061;
    }
    float _1181 = _1179;
    float _1183 = fma(_679, _1077, _1173);
    float _1185 = fma(_679, _1079, _1175);
    int _1187 = int(_1023) + int(_1143);
    float _1189 = fma(_679, _1081, _1177);
    int _1191 = ~_206;
    int _1193 = _1191 + 1;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1197 = float(uint(_905));
    float _1199 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1145);
    int _1201 = int(_1049) + int(_1163);
    int _1203 = _1193 * _1187;
    int _1205 = _1203 + _979;
    float _1207 = as_type<float>(_388) * _1197;
    float _1209 = _1181;
    if (_901)
    {
        _1109 = _1129;
    }
    float _1211 = _1109;
    float _1213 = fma(_1155, -2.0, _1195);
    float _1215 = _1211;
    if (!_901)
    {
        _1209 = _1037;
    }
    float _1217 = _1209;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    int _1221 = ~_292;
    int _1223 = _1221 + 1;
    float _1225 = trunc(_1207);
    float _1227 = precise::max(_1225, 0.0);
    uint _1229 = uint(_1227);
    if (!_901)
    {
        _1215 = _1061;
    }
    float _1231 = _1215;
    float _1233 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1219);
    bool _1235 = uint(_1205) >= uint(_206);
    int _1237 = _1223 * _1201;
    int _1239 = _1237 + _991;
    float _1241 = float(uint(_931));
    float _1243 = in.m_71.w;
    bool _1245 = !_1235;
    int _1247 = _1245 ? 0 : (-1);
    float _1249 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1251 = uint(_1239) >= uint(_292);
    float _1253 = as_type<float>(_400) * _1241;
    int _1255 = ~_1187;
    int _1257 = _1255 + _1247;
    int _1259 = _1257 + 1;
    float _1261 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1233);
    float _1263 = in.m_58.x;
    float _1265 = in.m_58.y;
    float _1267 = in.m_58.z;
    if (!_781)
    {
        _819 = _1123;
    }
    float _1269 = _819;
    float _1271 = trunc(_1253);
    float _1273 = precise::max(_1271, 0.0);
    uint _1275 = uint(_1273);
    bool _1277 = !_1251;
    int _1279 = _1277 ? 0 : (-1);
    int _1281 = _206 * _1259;
    int _1283 = _1281 + _979;
    float _1285 = _1269;
    if (_781)
    {
        _1285 = _1061;
    }
    float _1287 = _1285;
    if (_781)
    {
        _1127 = _1061;
    }
    float _1289 = _1127;
    int _1291 = ~_206;
    int _1293 = _1291 + 1;
    int _1295 = ~_1201;
    int _1297 = _1295 + _1279;
    int _1299 = _1297 + 1;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1303 = !_793;
    int _1305 = _1303 ? _1283 : (-1);
    int _1307 = _1293 * int(_1229);
    int _1309 = _1307 + _905;
    int _1311 = ~_292;
    int _1313 = _1311 + 1;
    float _1315 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1301);
    int _1317 = _1305 & 3;
    bool _1319 = _1317 != 0;
    int _1321 = _1305 & 3;
    bool _1323 = _1321 != 0;
    int _1325 = _1313 * int(_1275);
    int _1327 = _1325 + _931;
    float _1329 = float(uint(_1309));
    float _1331 = fma(_1185, _1243, _1265);
    int _1333 = _1319 ? 0 : 1;
    float _1335 = fma(_1183, _1243, _1263);
    bool _1337 = uint(_1321) > 1u;
    float _1339 = as_type<float>(_388) * _1329;
    int _1341 = _292 * _1299;
    int _1343 = _1341 + _991;
    float _1345 = float(uint(_1327));
    float _1347 = fma(_1189, _1243, _1267);
    int _1349 = ~_1333;
    int _1351 = _1349 + 1;
    int _1353 = _1351 + 1;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1357 = !_873;
    int _1359 = _1357 ? _1343 : (-1);
    float _1361 = as_type<float>(_400) * _1345;
    float _1363 = _1331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1365 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1355);
    float _1367 = _1331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1369 = _1353;
    if (!_1337)
    {
        int _1371 = ~_1333;
        int _1373 = _1371 + 1;
        _1369 = _1373;
    }
    int _1375 = _1369;
    float _1377 = trunc(_1339);
    float _1379 = precise::max(_1377, 0.0);
    uint _1381 = uint(_1379);
    int _1383 = _1359 & 3;
    bool _1385 = _1383 != 0;
    float _1387 = fma(_1335, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1363);
    float _1389 = _1331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1391 = fma(_1335, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1367);
    int _1393 = _1385 ? 0 : 1;
    float _1395 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1387);
    bool _1397 = uint(_1383) > 1u;
    float _1399 = trunc(_1361);
    float _1401 = precise::max(_1399, 0.0);
    uint _1403 = uint(_1401);
    float _1405 = fma(_1335, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1389);
    float _1407 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1391);
    float _1409 = _1395 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1411 = _1305 >> 31;
    float _1413 = fma(_1347, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1405);
    float _1415 = _1407 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1419 = _1409 + _1417;
    int _1421 = ~_1393;
    int _1423 = _1421 + 1;
    int _1425 = _1423 + 1;
    float _1427 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1315);
    int _1429 = int(_1229) + int(_1381);
    float _1431 = _1419 * _1419;
    int _1433 = _1411 & 3;
    float _1435 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1365);
    int _1437 = _1425;
    if (!_1397)
    {
        int _1439 = ~_1393;
        int _1441 = _1439 + 1;
        _1437 = _1441;
    }
    int _1443 = _1437;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1447 = _1415 + _1445;
    int _1449 = int(_1275) + int(_1403);
    float _1451 = _1413 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1453 = _1359 >> 31;
    float _1455 = fma(_1447, _1447, _1431);
    int _1457 = _1305 + _1433;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1461 = _1451 + _1459;
    int _1463 = _1453 & 3;
    float _1465 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1467 = ~_206;
    int _1469 = _1467 + 1;
    float _1471 = fma(_1461, _1461, _1455);
    int _1473 = ~_292;
    int _1475 = _1473 + 1;
    int _1477 = _1359 + _1463;
    int _1479 = _1469 * _1429;
    int _1481 = _1479 + _905;
    float _1483 = rsqrt(_1471);
    int _1485 = _1477 >> 2;
    int _1487 = _1475 * _1449;
    int _1489 = _1487 + _931;
    bool _1491 = uint(_1481) >= uint(_206);
    int _1493 = _1485 << 4;
    int _1495 = _1493 + 512;
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1499 = _1457 >> 2;
    bool _1501 = !_1491;
    int _1503 = _1501 ? 0 : (-1);
    uint _1505 = uint(int(uint(_1495) >> uint(2)));
    uint _1507 = uint(int(uint(int(_1505)) >> uint(2)));
    int _1509 = int(_1505) & 3;
    float _1511 = (*spvDescriptorSet0.vp_c9)._m0[int(_1507)][_1509];
    int _1513 = int(_1505) + 1;
    uint _1515 = uint(int(uint(_1513) >> uint(2)));
    int _1517 = _1513 & 3;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[int(_1515)][_1517];
    bool _1521 = uint(_1489) >= uint(_292);
    float _1523 = -_1497;
    float _1525 = fma(_1465, 2.0, _1523);
    int _1527 = _1499 << 4;
    int _1529 = _1527 + 368;
    float _1531 = _1419 * _1483;
    int _1533 = ~_1429;
    int _1535 = _1533 + _1503;
    int _1537 = _1535 + 1;
    float _1539 = -_148;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1525);
    bool _1543 = !_1521;
    int _1545 = _1543 ? 0 : (-1);
    uint _1547 = uint(int(uint(_1529) >> uint(2)));
    uint _1549 = uint(int(uint(int(_1547)) >> uint(2)));
    int _1551 = int(_1547) & 3;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[int(_1549)][_1551];
    int _1555 = int(_1547) + 1;
    uint _1557 = uint(int(uint(_1555) >> uint(2)));
    int _1559 = _1555 & 3;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[int(_1557)][_1559];
    bool _1563 = uint(_1321) >= 2u;
    int _1565 = _206 * _1537;
    int _1567 = _1565 + _905;
    int _1569 = ~_1449;
    int _1571 = _1569 + _1545;
    int _1573 = _1571 + 1;
    float _1575 = _1447 * _1483;
    int _1577 = _1563 ? 0 : 1;
    float _1579 = -_1531;
    float _1581 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1419);
    bool _1583 = _1321 != 3;
    int _1585 = _292 * _1573;
    int _1587 = _1585 + _931;
    float _1589 = -_1575;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1447);
    int _1593 = _1495 + 8;
    uint _1595 = uint(int(uint(_1593) >> uint(2)));
    uint _1597 = uint(int(uint(int(_1595)) >> uint(2)));
    int _1599 = int(_1595) & 3;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[int(_1597)][_1599];
    int _1603 = int(_1595) + 1;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    int _1607 = _1603 & 3;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[int(_1605)][_1607];
    int _1611 = ~_1577;
    int _1613 = _1611 + 1;
    int _1615 = _1613 + 1;
    float _1617 = _1581 * _1581;
    int _1619 = abs(_1375);
    bool _1621 = uint(_1383) >= 2u;
    float _1623 = fma(_1591, _1591, _1617);
    int _1625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1627 = _1625 != 0;
    int _1629 = _1529 + 8;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    uint _1633 = uint(int(uint(int(_1631)) >> uint(2)));
    int _1635 = int(_1631) & 3;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[int(_1633)][_1635];
    int _1639 = int(_1631) + 1;
    uint _1641 = uint(int(uint(_1639) >> uint(2)));
    int _1643 = _1639 & 3;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[int(_1641)][_1643];
    int _1647 = abs(_1443);
    int _1649 = _1615;
    if (_1583)
    {
        int _1651 = ~_1577;
        int _1653 = _1651 + 1;
        _1649 = _1653;
    }
    int _1655 = _1649;
    int _1657 = _1359 & 3;
    bool _1659 = _1657 != 0;
    float _1661 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1663 = int(_1661);
    bool _1665 = !_1323;
    int _1667 = _1665 ? 0 : 1;
    bool _1669 = !_1659;
    int _1671 = _1669 ? 0 : 1;
    bool _1673 = _1383 != 3;
    int _1675 = ~_1619;
    int _1677 = _1675 + 1;
    int _1679 = _1677 + 1;
    int _1681 = abs(_1671);
    int _1683 = ~_1647;
    int _1685 = _1683 + 1;
    int _1687 = _1685 + 1;
    int _1689 = _1621 ? 0 : 1;
    int _1691 = ~_1681;
    int _1693 = _1691 + 1;
    int _1695 = _1693 + 1;
    int _1697 = _1687 * as_type<int>(_1519);
    bool _1699 = _1321 != 3;
    int _1701 = abs(_1667);
    int _1703 = _1695 * as_type<int>(_1511);
    int _1705 = _1703 + _1697;
    int _1707 = ~_1689;
    int _1709 = _1707 + 1;
    int _1711 = _1709 + 1;
    int _1713 = _1679 * as_type<int>(_1561);
    int _1715 = _1711;
    if (_1673)
    {
        int _1717 = ~_1689;
        int _1719 = _1717 + 1;
        _1715 = _1719;
    }
    int _1721 = _1715;
    float _1723 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1725 = int(_1723);
    int _1727 = ~_1701;
    int _1729 = _1727 + 1;
    int _1731 = _1729 + 1;
    bool _1733 = !_1699;
    int _1735 = _1733 ? 0 : (-1);
    int _1737 = abs(_1655);
    int _1739 = _1731 * as_type<int>(_1553);
    int _1741 = _1739 + _1713;
    int _1743 = abs(_1735);
    float _1745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1747 = ~_1737;
    int _1749 = _1747 + 1;
    int _1751 = _1749 + 1;
    int _1753 = ~_1743;
    int _1755 = _1753 + 1;
    int _1757 = _1755 + 1;
    bool _1759 = _1383 != 3;
    int _1761 = abs(_1721);
    int _1763 = _1751 * as_type<int>(_1637);
    int _1765 = _1763 + _1741;
    float _1767 = float(uint(_1663));
    float _1769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1771 = !_1627;
    int _1773 = _1771 ? 0 : 1;
    int _1775 = _1757 * as_type<int>(_1645);
    int _1777 = _1775 + _1765;
    bool _1779 = !_1759;
    int _1781 = _1779 ? 0 : (-1);
    int _1783 = abs(_1663);
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1787 = _1785 != 0;
    float _1789 = 1.0 / _1767;
    int _1791 = ~_1761;
    int _1793 = _1791 + 1;
    int _1795 = _1793 + 1;
    int _1797 = abs(_1781);
    int _1799 = abs(_1725);
    int _1801 = _1795 * as_type<int>(_1601);
    int _1803 = _1801 + _1705;
    int _1805 = ~_1797;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    float _1811 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1813 = abs(_1773);
    int _1815 = _1809 * as_type<int>(_1609);
    int _1817 = _1815 + _1803;
    bool _1819 = !_1787;
    int _1821 = _1819 ? 0 : 1;
    float _1823 = float(uint(_1725));
    int _1825 = abs(_1821);
    float _1827 = _1461 * _1483;
    float _1829 = float(uint(_1783));
    float _1831 = 1.0 / _1823;
    int _1833 = ~_1813;
    int _1835 = _1833 + 1;
    int _1837 = _1835 + 1;
    bool _1839 = !_793;
    int _1841 = _1839 ? _1567 : (-1);
    bool _1843 = !_873;
    int _1845 = _1843 ? _1587 : (-1);
    int _1847 = _1777 * _1837;
    float _1849 = 1.0 / _1829;
    float _1851 = -_1827;
    float _1853 = fma(_1851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1461);
    int _1855 = ~_1825;
    int _1857 = _1855 + 1;
    int _1859 = _1857 + 1;
    float _1861 = float(uint(_1799));
    float _1863 = fma(_1853, _1853, _1623);
    int _1865 = as_type<int>(_1789) + (-2);
    int _1867 = _1859 * _1817;
    int _1869 = _1841 * _1813;
    int _1871 = _1869 + _1847;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1875 = sqrt(_1863);
    int _1877 = _1845 * _1825;
    int _1879 = _1877 + _1867;
    int _1881 = as_type<int>(_1831) + (-2);
    float _1883 = -_1873;
    float _1885 = fma(_1249, 2.0, _1883);
    float _1887 = float(uint(_1871));
    float _1889 = -_148;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1885);
    float _1893 = 1.0 / _1861;
    int _1895 = abs(_1871);
    float _1897 = as_type<float>(_1865) * _1887;
    float _1899 = float(uint(_1879));
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1903 = as_type<int>(_1849) + (-2);
    float _1905 = fma(_1113, _1169, _1891);
    float _1907 = as_type<float>(_1881) * _1899;
    float _1909 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1911 = abs(_1879);
    float _1913 = trunc(_1897);
    float _1915 = precise::max(_1913, 0.0);
    uint _1917 = uint(_1915);
    float _1919 = float(uint(_1895));
    float _1921 = fma(_1909, -2.0, _1901);
    float _1923 = _1483 * _1875;
    float _1925 = _1261 * (-0.15915493667125701904296875);
    int _1927 = as_type<int>(_1893) + (-2);
    float _1929 = as_type<float>(_1903) * _1919;
    float _1931 = _336 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1933 = float(uint(_1911));
    float _1935 = _715 * _1923;
    float _1937 = trunc(_1907);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    float _1943 = _1931 * _1923;
    float _1945 = _737 * _1923;
    float _1947 = as_type<float>(_1927) * _1933;
    int _1949 = ~_1799;
    int _1951 = _1949 + 1;
    float _1953 = _1935 * _419;
    int _1955 = ~_1663;
    int _1957 = _1955 + 1;
    float _1959 = _1943 * _421;
    float _1961 = trunc(_1947);
    float _1963 = precise::max(_1961, 0.0);
    uint _1965 = uint(_1963);
    int _1967 = ~_1725;
    int _1969 = _1967 + 1;
    float _1971 = _1945 * _408;
    int _1973 = _1957 * int(_1917);
    int _1975 = _1973 + _1871;
    int _1977 = ~_1783;
    int _1979 = _1977 + 1;
    float _1981 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _469);
    int _1983 = _1969 * int(_1941);
    int _1985 = _1983 + _1879;
    float _1987 = _1925 * 6.283185482025146484375;
    float _1989 = sin(_1987);
    float _1991 = _1953 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1993 = float(uint(_1975));
    float _1995 = float(uint(_1985));
    float _1997 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1991);
    int _1999 = _1951 * int(_1965);
    int _2001 = _1999 + _1911;
    float _2003 = _1925 * 6.283185482025146484375;
    float _2005 = cos(_2003);
    float _2007 = as_type<float>(_1881) * _1995;
    float _2009 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1997);
    float _2011 = as_type<float>(_1865) * _1993;
    float _2013 = float(uint(_2001));
    float _2015 = -_148;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[76].x, _449);
    float _2019 = trunc(_1929);
    float _2021 = precise::max(_2019, 0.0);
    uint _2023 = uint(_2021);
    float _2025 = _1953 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2027 = as_type<float>(_1927) * _2013;
    float _2029 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1039);
    float _2031 = _1451 + _2009;
    float _2033 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2025);
    float _2035 = _1953 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2037 = trunc(_2011);
    float _2039 = precise::max(_2037, 0.0);
    uint _2041 = uint(_2039);
    float _2043 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2033);
    float _2045 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1213);
    float _2047 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1921);
    float _2049 = _1745 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2051 = _1415 + _2043;
    float _2053 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2035);
    float _2055 = -_2047;
    float _2057 = fma(_1199, _945, _2055);
    float _2059 = trunc(_2007);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    int _2065 = _1979 * int(_2023);
    int _2067 = _2065 + _1895;
    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2071 = _2051 + _2069;
    float _2073 = fma(_2049, _288, -0.5);
    int _2075 = ~_1799;
    int _2077 = _2075 + 1;
    float _2079 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2053);
    float _2081 = _2071 * _2071;
    float _2083 = float(uint(_2067));
    float _2085 = trunc(_2027);
    float _2087 = precise::max(_2085, 0.0);
    uint _2089 = uint(_2087);
    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2093 = _2031 + _2091;
    int _2095 = int(_1917) + int(_2041);
    float _2097 = as_type<float>(_1903) * _2083;
    float _2099 = _2093 * _2093;
    float _2101 = fma(_368, _1811, -0.5);
    int _2103 = ~_1663;
    int _2105 = _2103 + 1;
    float _2107 = _2081 + _2099;
    float _2109 = trunc(_2097);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    float _2115 = _1989 * _2101;
    float _2117 = _2005 * _2101;
    int _2119 = int(_1941) + int(_2063);
    int _2121 = _2105 * _2095;
    int _2123 = _2121 + _1871;
    int _2125 = ~_1725;
    int _2127 = _2125 + 1;
    float _2129 = -_2115;
    float _2131 = fma(_2005, _2073, _2129);
    float _2133 = fma(_1989, _2073, _2117);
    float _2135 = sqrt(_2107);
    int _2137 = ~_1783;
    int _2139 = _2137 + 1;
    int _2141 = _2127 * _2119;
    int _2143 = _2141 + _1879;
    int _2145 = int(_1965) + int(_2089);
    bool _2147 = uint(_2123) >= uint(_1663);
    bool _2149 = uint(_2143) >= uint(_1725);
    int _2151 = _2077 * _2145;
    int _2153 = _2151 + _1911;
    int _2155 = int(_2023) + int(_2113);
    int _2157 = _2139 * _2155;
    int _2159 = _2157 + _1895;
    float _2161 = _1409 + _2079;
    bool _2163 = _2135 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _2165 = !_2163;
    float _2167 = _2161;
    float _2169 = _2081;
    float _2171 = _2099;
    float _2173 = _2031;
    float _2175 = _2051;
    int _2177 = _1663;
    int _2179 = as_type<int>(_2049);
    if (!_2165)
    {
        float _2181 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2185 = _2135 + _2183;
        float _2187 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2189 = rsqrt(_2107);
        float _2191 = _2185 * _2181;
        float _2193 = _2191 * 0.15915493667125701904296875;
        float _2195 = _2193 * 6.283185482025146484375;
        float _2197 = sin(_2195);
        float _2199 = _2193 * 6.283185482025146484375;
        float _2201 = cos(_2199);
        float _2203 = fma(_2197, _2187, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2205 = _2189 * _2203;
        float _2207 = _2201 + (-1.0);
        float _2209 = fma(_2071, _2205, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2211 = fma(_2093, _2205, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2213 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2215 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2217 = _2209 + _2215;
        float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2221 = _2211 + _2219;
        float _2223 = fma(_2161, _2201, _2213);
        float _2225 = _2217 * _2217;
        float _2227 = _2221 * _2221;
        _2167 = _2223;
        _2169 = _2225;
        _2171 = _2227;
        _2173 = _2211;
        _2175 = _2209;
    }
    float _2229 = _2167;
    float _2231 = _2169;
    float _2233 = _2171;
    float _2235 = _2173;
    float _2237 = _2175;
    bool _2239 = !_2147;
    int _2241 = _2239 ? 0 : (-1);
    float _2243 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[9].z, _981);
    bool _2245 = !_2149;
    int _2247 = _2245 ? 0 : (-1);
    float _2249 = _2057 + 0.5;
    bool _2251 = uint(_2159) >= uint(_1783);
    bool _2253 = uint(_2153) >= uint(_1799);
    int _2255 = _1871 ^ _1663;
    int _2257 = _1879 ^ _1725;
    int _2259 = ~_2095;
    int _2261 = _2259 + _2241;
    int _2263 = _2261 + 1;
    bool _2265 = !_2251;
    int _2267 = _2265 ? 0 : (-1);
    bool _2269 = !_2253;
    int _2271 = _2269 ? 0 : (-1);
    int _2273 = _1663 * _2263;
    int _2275 = _2273 + _1871;
    uint _2277 = uint(int(uint(_2255) >> uint(31)));
    uint _2279 = uint(int(uint(_2257) >> uint(31)));
    int _2281 = ~_2267;
    int _2283 = _2155 + _2281;
    int _2285 = _2283 + 1;
    int _2287 = ~_2271;
    int _2289 = _2145 + _2287;
    int _2291 = _2289 + 1;
    int _2293 = ~int(_2277);
    int _2295 = _2293 + 1;
    float _2297 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2299 = _2229 + _2297;
    int _2301 = ~int(_2279);
    int _2303 = _2301 + 1;
    int _2305 = ~_2119;
    int _2307 = _2305 + _2247;
    int _2309 = _2307 + 1;
    float _2311 = fma(_2299, _2299, _2231);
    int _2313 = _2285 ^ _2295;
    int _2315 = _2291 ^ _2303;
    int _2317 = _1725 * _2309;
    int _2319 = _2317 + _1879;
    bool _2321 = _1663 == 0;
    float _2323 = _2311 + _2233;
    bool _2325 = _1725 == 0;
    float _2327 = _1905 + 0.5;
    int _2329 = ~_2295;
    int _2331 = _2329 + _2313;
    int _2333 = _2331 + 1;
    int _2335 = ~_2303;
    int _2337 = _2335 + _2315;
    int _2339 = _2337 + 1;
    float _2341 = sqrt(_2323);
    bool _2343 = _1663 == 0;
    out.m_75.x = _2327;
    out.m_75.y = _2249;
    bool _2345 = _1725 == 0;
    bool _2347 = !_2321;
    int _2349 = _2347 ? _2333 : (-1);
    bool _2351 = !_2325;
    int _2353 = _2351 ? _2339 : (-1);
    bool _2355 = !_2343;
    int _2357 = _2355 ? _2275 : (-1);
    bool _2359 = !_2345;
    int _2361 = _2359 ? _2319 : (-1);
    float _2363 = float(_2349);
    float _2365 = float(_2353);
    float _2367 = float(_2357);
    float _2369 = -_1981;
    float _2371 = fma(_1057, _2363, _2369);
    float _2373 = float(_2361);
    float _2375 = -_2045;
    float _2377 = fma(_1811, _2365, _2375);
    float _2379 = fma(_1051, _2367, _2017);
    float _2381 = fma(_2049, _2373, _1541);
    float _2383 = fma(_1125, _1171, _2371);
    float _2385 = fma(_2029, _1167, _2379);
    float _2387 = fma(_1427, _2131, _2381);
    float _2389 = fma(_1435, _2133, _2377);
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2393 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2395 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2397 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2399 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2401 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2403 = _2393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2405 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2407 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[8].z, _975);
    float _2409 = _2385 + 0.5;
    float _2411 = _2387 + 0.5;
    float _2413 = _2383 + 0.5;
    float _2415 = _2389 + 0.5;
    float _2417 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[10].z, _983);
    out.m_77.x = _2401;
    out.m_77.y = _2403;
    out.m_77.z = _2405;
    out.m_77.w = _2399;
    bool _2419 = _2341 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2421 = isnan(_2341);
    bool _2423 = _2419 || _2421;
    bool _2425 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2427 = _2423 || _2425;
    out.m_79.w = _2397;
    out.m_81.x = _2409;
    out.m_81.y = _2413;
    out.m_81.z = _2411;
    out.m_81.w = _2415;
    out.m_83.x = _2407;
    out.m_83.y = _2243;
    out.m_83.z = _2417;
    float _2429 = _2385;
    float _2431 = _2413;
    if (!_2427)
    {
        _2429 = 1.0;
    }
    float _2433 = _2429;
    bool _2435 = !_2427;
    float _2437 = _2433;
    if (!_2435)
    {
        bool _2439 = _2341 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2441 = isnan(_2341);
        bool _2443 = _2439 || _2441;
        bool _2445 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2447 = _2443 || _2445;
        if (!_2447)
        {
            float _2449 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2451 = _2341 + _2449;
            float _2453 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2455 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2453;
            float _2457 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2461 = 1.0 / _2455;
            float _2463 = _2451 * _2461;
            float _2465 = fma(_2463, _2459, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2437 = _2465;
            _2467 = true;
        }
        else
        {
            bool _2469 = _2341 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2471 = isnan(_2341);
            bool _2473 = _2469 || _2471;
            bool _2475 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2477 = _2473 || _2475;
            if (!_2477)
            {
                float _2479 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2481 = _2341 + _2479;
                float _2483 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2485 = _2483 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2487 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2489 = _2487 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2491 = 1.0 / _2485;
                float _2493 = _2481 * _2491;
                float _2495 = fma(_2493, _2489, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2437 = _2495;
                _2467 = true;
            }
            else
            {
                _2437 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2467 = false;
    float _2497 = _2437;
    float _2499 = -_1531;
    float _2501 = fma(_2499, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1409);
    float _2503 = -_1575;
    float _2505 = fma(_2503, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1415);
    float _2507 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2509 = _2235 + _2507;
    float _2511 = -_1827;
    float _2513 = fma(_2511, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
    float _2515 = _2501 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2517 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2519 = _2229 + _2517;
    float _2521 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2523 = _2237 + _2521;
    float _2525 = fma(_2509, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2527 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2515);
    float _2529 = fma(_2519, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2531 = fma(_2523, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2533 = -_1827;
    float _2535 = fma(_2533, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2525);
    float _2537 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2527);
    float _2539 = _2501 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2541 = -_1531;
    float _2543 = fma(_2541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2529);
    float _2545 = -_1575;
    float _2547 = fma(_2545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2531);
    float _2549 = _2537 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2551 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2539);
    float _2553 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2555 = _2543 + _2553;
    float _2557 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2559 = _2547 + _2557;
    float _2561 = 1.0 / _2549;
    float _2563 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2551);
    float _2565 = _2555 * _2555;
    float _2567 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2569 = _2535 + _2567;
    float _2571 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2573 = fma(_2559, _2559, _2565);
    float _2575 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2577 = _2571 + _2549;
    float _2579 = fma(_2569, _2569, _2573);
    float _2581 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2583 = rsqrt(_2579);
    float _2585 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2575);
    float _2587 = _2577 * _2561;
    float _2589 = _2587 * 0.5;
    float _2591 = _2501 + _2581;
    float _2593 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2595 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2593);
    float _2597 = sqrt(_2579);
    float _2599 = fma(_2505, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2601 = 1.0 / _2595;
    float _2603 = _2583 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2605 = _2559 * _2603;
    float _2607 = _2569 * _2603;
    float _2609 = floor(_2599);
    float _2611 = _2605 * _2605;
    float _2613 = _2607 * _2607;
    float _2615 = _2611 + _2613;
    float _2617 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2619 = _2601 * _2617;
    float _2621 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2623 = sqrt(_2615);
    bool _2625 = _2619 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2627 = fma(_2505, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2621);
    bool _2629 = _2619 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2631 = -_2609;
    float _2633 = _2599 + _2631;
    float _2635 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2627);
    bool _2637 = !_2625;
    int _2639 = _2637 ? 0 : 1;
    float _2641 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _2643 = 2;
    float _2645 = _2605;
    float _2647 = _2607;
    float _2649 = _2611;
    float _2651 = _2613;
    float _2653 = _2609;
    float _2655 = _2555;
    if (!_2625)
    {
        _2643 = 1;
    }
    int _2657 = _2643;
    float _2659 = trunc(_2641);
    int _2661 = int(_2659);
    int _2663 = _2657;
    if (!_2629)
    {
        _2663 = _2639;
    }
    int _2665 = _2663;
    float _2667 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _2669 = _2623 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2671 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2673 = _2623 + _2671;
    int _2675 = _2665 << 6;
    float _2677 = fma(_2505, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2667);
    int _2679 = _2675 + 96;
    uint _2681 = uint(int(uint(_2679) >> uint(2)));
    uint _2683 = uint(int(uint(int(_2681)) >> uint(2)));
    int _2685 = int(_2681) & 3;
    float _2687 = (*spvDescriptorSet0.vp_c15)._m0[int(_2683)][_2685];
    int _2689 = int(_2681) + 1;
    uint _2691 = uint(int(uint(_2689) >> uint(2)));
    int _2693 = _2689 & 3;
    float _2695 = (*spvDescriptorSet0.vp_c15)._m0[int(_2691)][_2693];
    float _2697 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2677);
    float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2701 = _2327;
    float _2703 = _2673;
    if (_2669)
    {
        float _2705 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2701 = _2705;
    }
    float _2707 = _2701;
    int _2709 = _2675 + 104;
    uint _2711 = uint(int(uint(_2709) >> uint(2)));
    uint _2713 = uint(int(uint(int(_2711)) >> uint(2)));
    int _2715 = int(_2711) & 3;
    float _2717 = (*spvDescriptorSet0.vp_c15)._m0[int(_2713)][_2715];
    int _2719 = int(_2711) + 1;
    uint _2721 = uint(int(uint(_2719) >> uint(2)));
    int _2723 = _2719 & 3;
    float _2725 = (*spvDescriptorSet0.vp_c15)._m0[int(_2721)][_2723];
    int _2727 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2729 = _2661 + _2727;
    int _2731 = _2729 + 1;
    bool _2733 = _2731 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2735 = trunc(_2699);
    int _2737 = int(_2735);
    float _2739 = _2707;
    int _2741 = _2731;
    if (_2669)
    {
        float _2743 = _2673 * _2707;
        _2703 = _2743;
    }
    float _2745 = _2703;
    if (_2669)
    {
        float _2747 = _2745 * 0.15915493667125701904296875;
        _2739 = _2747;
    }
    float _2749 = _2739;
    float _2751 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2753 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2755 = _2737 + _2753;
    int _2757 = _2755 + 1;
    float _2759 = _2749;
    if (_2669)
    {
        float _2761 = _2749 * 6.283185482025146484375;
        float _2763 = sin(_2761);
        _2431 = _2763;
    }
    float _2765 = _2431;
    float _2767 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2751);
    int _2769 = _2731 | _2757;
    float _2771 = fma(_2535, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2767);
    bool _2773 = _2769 < 0;
    bool _2775 = _2773 || _2733;
    float _2777 = as_type<float>(_2737);
    if (_2669)
    {
        float _2779 = _2749 * 6.283185482025146484375;
        float _2781 = cos(_2779);
        _2777 = _2781;
    }
    float _2783 = _2777;
    float _2785 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2787 = _2771 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2789 = _2757 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2791 = _2789 || _2775;
    float _2793 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2795 = precise::max(0.0, _2785);
    float _2797 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2799 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_2669)
    {
        float _2801 = rsqrt(_2615);
        _2799 = _2801;
    }
    float _2803 = _2799;
    float _2805 = -_2603;
    float _2807 = -_2795;
    float _2809 = fma(_2555, _2805, _2807);
    float _2811 = _2591 * _2695;
    float _2813 = -_2797;
    float _2815 = fma(_2813, _2793, 1.0);
    float _2817 = _2695;
    float _2819 = _2809;
    if (_2669)
    {
        float _2821 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2759 = _2821;
    }
    float _2823 = _2759;
    float _2825 = _2823;
    if (_2669)
    {
        float _2827 = _2783 + (-1.0);
        _2817 = _2827;
    }
    float _2829 = _2817;
    float _2831 = fma(_2505, _2687, _2811);
    float _2833 = _2829;
    if (!_2791)
    {
        int _2835 = _2757 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2837 = _2835 + _2731;
        _2741 = _2837;
    }
    int _2839 = _2741;
    if (_2669)
    {
        float _2841 = fma(_2765, _2823, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2825 = _2841;
    }
    float _2843 = _2825;
    if (_2669)
    {
        float _2845 = _2829 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2833 = _2845;
    }
    float _2847 = _2833;
    float _2849 = fma(_2513, _2717, _2831);
    int _2851 = _2675 + 56;
    uint _2853 = uint(int(uint(_2851) >> uint(2)));
    uint _2855 = uint(int(uint(int(_2853)) >> uint(2)));
    int _2857 = int(_2853) & 3;
    float _2859 = (*spvDescriptorSet0.vp_c15)._m0[int(_2855)][_2857];
    int _2861 = int(_2853) + 1;
    uint _2863 = uint(int(uint(_2861) >> uint(2)));
    int _2865 = _2861 & 3;
    float _2867 = (*spvDescriptorSet0.vp_c15)._m0[int(_2863)][_2865];
    float _2869 = _2717;
    if (_2669)
    {
        float _2871 = fma(_2809, _2783, _2847);
        _2819 = _2871;
    }
    float _2873 = _2819;
    if (_2669)
    {
        float _2875 = _2803 * _2843;
        _2869 = _2875;
    }
    float _2877 = _2869;
    float _2879 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (!_2791)
    {
        int _2881 = _2839 << 2;
        _2177 = _2881;
    }
    int _2883 = _2177;
    float _2885 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _2887 = _2883;
    if (_2669)
    {
        float _2889 = _2605 * _2877;
        _2645 = _2889;
    }
    float _2891 = _2645;
    int _2893 = _2675 + 48;
    uint _2895 = uint(int(uint(_2893) >> uint(2)));
    uint _2897 = uint(int(uint(int(_2895)) >> uint(2)));
    int _2899 = int(_2895) & 3;
    float _2901 = (*spvDescriptorSet0.vp_c15)._m0[int(_2897)][_2899];
    int _2903 = int(_2895) + 1;
    uint _2905 = uint(int(uint(_2903) >> uint(2)));
    int _2907 = _2903 & 3;
    float _2909 = (*spvDescriptorSet0.vp_c15)._m0[int(_2905)][_2907];
    if (_2669)
    {
        float _2911 = _2607 * _2877;
        _2647 = _2911;
    }
    float _2913 = _2647;
    if (_2669)
    {
        float _2915 = _2891 * _2891;
        _2649 = _2915;
    }
    float _2917 = _2649;
    if (!_2791)
    {
        uint _2919 = uint(int(uint(_2839) >> uint(2)));
        _2179 = int(_2919);
    }
    int _2921 = _2179;
    if (_2669)
    {
        float _2923 = _2913 * _2913;
        _2651 = _2923;
    }
    float _2925 = _2651;
    if (!_2791)
    {
        int _2927 = 12 & _2883;
        _2887 = _2927;
    }
    int _2929 = _2887;
    float _2931 = fma(_2873, _2873, _2917);
    int _2933 = _2675 + 64;
    uint _2935 = uint(int(uint(_2933) >> uint(2)));
    uint _2937 = uint(int(uint(int(_2935)) >> uint(2)));
    int _2939 = int(_2935) & 3;
    float _2941 = (*spvDescriptorSet0.vp_c15)._m0[int(_2937)][_2939];
    int _2943 = int(_2935) + 1;
    uint _2945 = uint(int(uint(_2943) >> uint(2)));
    int _2947 = _2943 & 3;
    float _2949 = (*spvDescriptorSet0.vp_c15)._m0[int(_2945)][_2947];
    float _2951 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _2953 = _2929;
    if (!_2791)
    {
        int _2955 = _2921 << 4;
        int _2957 = _2955 + _2929;
        _2953 = _2957;
    }
    int _2959 = _2953;
    float _2961 = _2931 + _2925;
    float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2965 = fma(_2597, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2963);
    float _2967 = precise::clamp(_2965, 0.0, 1.0);
    float _2969 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2951);
    float _2971 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2879);
    float _2973 = _2849 + _2725;
    int _2975 = _2675 + 72;
    uint _2977 = uint(int(uint(_2975) >> uint(2)));
    uint _2979 = uint(int(uint(int(_2977)) >> uint(2)));
    int _2981 = int(_2977) & 3;
    float _2983 = (*spvDescriptorSet0.vp_c15)._m0[int(_2979)][_2981];
    int _2985 = int(_2977) + 1;
    uint _2987 = uint(int(uint(_2985) >> uint(2)));
    int _2989 = _2985 & 3;
    float _2991 = (*spvDescriptorSet0.vp_c15)._m0[int(_2987)][_2989];
    float _2993 = fma(_2535, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2969);
    float _2995 = fma(_2535, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2971);
    float _2997 = -_2967;
    float _2999 = _2997 + 1.0;
    float _3001 = fma(_2535, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2585);
    float _3003 = _2993 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3005 = _2995 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3007 = rsqrt(_2961);
    int _3009 = _2675 + 80;
    uint _3011 = uint(int(uint(_3009) >> uint(2)));
    uint _3013 = uint(int(uint(int(_3011)) >> uint(2)));
    int _3015 = int(_3011) & 3;
    float _3017 = (*spvDescriptorSet0.vp_c15)._m0[int(_3013)][_3015];
    int _3019 = int(_3011) + 1;
    uint _3021 = uint(int(uint(_3019) >> uint(2)));
    int _3023 = _3019 & 3;
    float _3025 = (*spvDescriptorSet0.vp_c15)._m0[int(_3021)][_3023];
    float _3027 = _3003 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3029 = _3001 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3031 = fma(_3005, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3027);
    float _3033 = 1.0 / _2973;
    int _3035 = _2675 + 88;
    uint _3037 = uint(int(uint(_3035) >> uint(2)));
    uint _3039 = uint(int(uint(int(_3037)) >> uint(2)));
    int _3041 = int(_3037) & 3;
    float _3043 = (*spvDescriptorSet0.vp_c15)._m0[int(_3039)][_3041];
    int _3045 = int(_3037) + 1;
    uint _3047 = uint(int(uint(_3045) >> uint(2)));
    int _3049 = _3045 & 3;
    float _3051 = (*spvDescriptorSet0.vp_c15)._m0[int(_3047)][_3049];
    float _3053 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3031);
    float _3055 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3053);
    float _3057 = _3007 * _2891;
    float _3059 = _3031;
    if (!_2791)
    {
        int _3061 = _2959 + 400;
        uint _3063 = uint(int(uint(_3061) >> uint(2)));
        uint _3065 = uint(int(uint(int(_3063)) >> uint(2)));
        int _3067 = int(_3063) & 3;
        float _3069 = (*spvDescriptorSet0.vp_c15)._m0[int(_3065)][_3067];
        _3059 = _3069;
    }
    float _3071 = _3059;
    float _3073 = _3007 * _2873;
    float _3075 = floor(_2885);
    float _3077 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3079 = _3007 * _2913;
    float _3081 = _2591 * _2909;
    float _3083 = abs(_2999);
    float _3085 = log2(_3083);
    float _3087 = fma(_2505, _2901, _3081);
    float _3089 = _2591 * _2949;
    float _3091 = fma(_2513, _2859, _3087);
    float _3093 = -_3075;
    float _3095 = _2885 + _3093;
    float _3097 = fma(_2505, _2941, _3089);
    float _3099 = _3091 + _2867;
    float _3101 = -_3077;
    float _3103 = fma(_3073, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3101);
    float _3105 = log2(_2815);
    float _3107 = fma(_2513, _2983, _3097);
    float _3109 = _3099 * _3033;
    float _3111 = -_3079;
    float _3113 = fma(_3111, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3103);
    float _3115 = _3085 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3117 = _3107 + _2991;
    bool _3119 = _3109 >= 0.0;
    float _3121 = _3097;
    if (!_2791)
    {
        float _3123 = floor(_2699);
        _3121 = _3123;
    }
    float _3125 = _3121;
    float _3127 = _3117 * _3033;
    float _3129 = _2591 * _3025;
    bool _3131 = _3109 <= 1.0;
    bool _3133 = _3131 && _3119;
    float _3135 = fma(_3113, -0.5, 0.5);
    float _3137 = fma(_3113, 0.5, 0.5);
    float _3139 = fma(_2505, _3017, _3129);
    bool _3141 = _3127 >= 0.0;
    bool _3143 = _3141 && _3133;
    float _3145 = sqrt(_3135);
    float _3147 = _3003 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3149 = fma(_2513, _3043, _3139);
    bool _3151 = _3127 <= 1.0;
    bool _3153 = _3151 && _3143;
    float _3155 = fma(_3137, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3157 = _3105 * 0.693147182464599609375;
    float _3159 = exp2(_3115);
    float _3161 = _3149 + _3051;
    float _3163 = _3003 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3165 = _3147;
    if (!_2791)
    {
        float _3167 = -_3125;
        float _3169 = _2699 + _3167;
        _2653 = _3169;
    }
    float _3171 = _2653;
    float _3173 = fma(_3005, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3147);
    float _3175 = fma(_3137, _3155, -0.212114393711090087890625);
    float _3177 = fma(_3005, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3163);
    float _3179 = _3073 + 1.0;
    float _3181 = _3129;
    float _3183 = _3179;
    if (!_2791)
    {
        float _3185 = floor(_2641);
        _3181 = _3185;
    }
    float _3187 = _3181;
    if (_3153)
    {
        float _3189 = float(_2665);
        _3165 = _3189;
    }
    float _3191 = _3165;
    float _3193 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3177);
    float _3195 = fma(_3137, _3175, 1.570728778839111328125);
    float _3197 = _3145 * 0.636619746685028076171875;
    float _3199 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3173);
    float _3201 = 1.0 / _3055;
    float _3203 = -_3195;
    float _3205 = fma(_3197, _3203, 1.0);
    float _3207 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3199);
    float _3209 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3193);
    float _3211 = -_3073;
    float _3213 = fma(_3159, _3179, _3211);
    float _3215 = _3157 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3217 = _3043;
    float _3219 = _3209;
    if (!_2791)
    {
        float _3221 = rint(_3071);
        float _3223 = precise::max(_3221, 0.0);
        uint _3225 = uint(_3223);
        uint _3227 = clamp(_3225, 0u, 65535u);
        _3217 = as_type<float>(_3227);
    }
    float _3229 = _3217;
    if (!_2791)
    {
        float _3231 = -_3187;
        float _3233 = _2641 + _3231;
        _3183 = _3233;
    }
    float _3235 = _3183;
    float _3237 = fma(_3213, 0.5, 0.5);
    float _3239 = _3177;
    if (_3153)
    {
        float _3241 = rint(_3191);
        float _3243 = precise::max(_3241, 0.0);
        uint _3245 = uint(_3243);
        uint _3247 = clamp(_3245, 0u, 65535u);
        _3239 = as_type<float>(_3247);
    }
    float _3249 = _3239;
    float _3251 = _3207 * _3201;
    float _3253 = _3209 * _3201;
    float _3255 = _3161 * _3033;
    float2 _8858 = float2(_2633, _3095);
    float _3257 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8858, float2(0.0), isnan(_8858)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8858, float2(0.0), isnan(_8858)), level(0.0)).x;
    float _3259 = fma(_3251, 0.5, 0.5);
    float _3261 = fma(_3253, -0.5, 0.5);
    float _3263 = _3171;
    if (!_2791)
    {
        float3 _8879 = float3(_3235, _3171, float(as_type<int>(_3229)));
        float3 _8883 = select(_8879, float3(0.0), isnan(_8879));
        float _3265 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8883.xy, uint(rint(_8883.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8883.xy, uint(rint(_8883.z)), level(0.0)).x;
        _3263 = _3265;
    }
    float _3267 = _3263;
    float _3269 = _3249;
    if (_3153)
    {
        float3 _8898 = float3(_3109, _3127, float(as_type<int>(_3249)));
        float3 _8900 = select(_8898, float3(0.0), isnan(_8898));
        float _3271 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8900.xy, uint(rint(_8900.z)), _3255, level(0.0));
        _3269 = _3271;
    }
    float _3273 = _3269;
    float3 _8910 = float3(_3259, _3261, _3215);
    float _3275 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8910, float3(0.0), isnan(_8910)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8910, float3(0.0), isnan(_8910)), level(0.0)).x;
    float3 _8919 = float3(_3259, _3261, _3215);
    float4 _3278 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8919, float3(0.0), isnan(_8919)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8919, float3(0.0), isnan(_8919)), level(0.0)).xyzw;
    float _3280 = _3278.x;
    float _3282 = _3278.y;
    float _3284 = _3278.z;
    float _3286 = _3278.w;
    float2 _8935 = float2(_3205, _3237);
    float3 _3290 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8935, float2(0.0), isnan(_8935)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8935, float2(0.0), isnan(_8935)), level(0.0)).xyz;
    float _3292 = _3290.x;
    float _3294 = _3290.y;
    float _3296 = _3290.z;
    float _3298 = abs(_2619);
    float _3300 = log2(_3298);
    float _3302 = _3003 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3304 = _3085 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_85.x = _2559;
    out.m_85.y = _2555;
    out.m_85.z = _2569;
    float _3306 = fma(_3005, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3302);
    float _3308 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3306);
    float _3310 = _3207 + _3055;
    float _3312 = _3055 * 0.5;
    float _3314 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3308);
    float _3316 = _3310 * 0.5;
    float _3318 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3320 = _3314 + _3055;
    float _3322 = exp2(_3304);
    bool _3324 = _2619 <= 8000.0;
    bool _3326 = isnan(_2619);
    bool _3328 = _3324 || _3326;
    bool _3330 = isnan(8000.0);
    bool _3332 = _3328 || _3330;
    float _3334 = float(_3332);
    float _3336 = _3320 * 0.5;
    float _3338 = fma(_3209, -0.5, _3312);
    out.gl_Position.x = _3207;
    out.gl_Position.y = _3209;
    out.gl_Position.z = _3314;
    out.gl_Position.w = _3055;
    float _3340 = exp2(_3318);
    out.m_87.x = _3316;
    out.m_87.y = _3338;
    out.m_87.z = _3336;
    out.m_87.w = _3055;
    bool _3342 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3344 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3346 = _3342 || _3344;
    bool _3348 = isnan(0.5);
    bool _3350 = _3346 || _3348;
    float _3352 = _3334;
    float _3354 = _3314;
    if (_3350)
    {
        _2655 = 1.0;
    }
    float _3356 = _2655;
    float _3358 = fma(_3340, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3360 = precise::clamp(_3358, 0.0, 1.0);
    float _3362 = fma(_3360, -2.0, 3.0);
    float _3364 = _3360 * _3360;
    float _3366 = _3364 * _3362;
    float _3368 = -_3366;
    float _3370 = _3368 + 1.0;
    float _3372 = fma(_3370, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3366);
    float _3374 = _3334 * _3372;
    float _3376 = _3356;
    if (_3350)
    {
        _3352 = 1.0;
    }
    float _3378 = _3352;
    float _3380 = _3378;
    if (!_3350)
    {
        float _3382 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3384 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3386 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3384;
        float _3388 = _3382 * 0.15915493667125701904296875;
        float _3390 = _3388 * 6.283185482025146484375;
        float _3392 = cos(_3390);
        float _3394 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3396 = _3394 * 0.15915493667125701904296875;
        float _3398 = _3388 * 6.283185482025146484375;
        float _3400 = sin(_3398);
        float _3402 = 1.0 / _3392;
        float _3404 = _3396 * 6.283185482025146484375;
        float _3406 = cos(_3404);
        float _3408 = _3400 * _3402;
        float _3410 = _3396 * 6.283185482025146484375;
        float _3412 = sin(_3410);
        float _3414 = _3406 * _3408;
        float _3416 = 1.0 / _3386;
        float _3418 = 1.0 / _3414;
        float _3420 = _3412 * _3418;
        float _3422 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3424 = fma(_2619, _3420, _3422);
        float _3426 = _3424 * _3416;
        float _3428 = precise::clamp(_3426, 0.0, 1.0);
        _3219 = _3414;
        _3376 = _3428;
        _3354 = _3424;
    }
    float _3430 = _3219;
    float _3432 = _3376;
    float _3434 = _3354;
    float _3436 = _3430;
    float _3438 = _3434;
    if (!_3350)
    {
        float _3440 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3442 = _3440 * 0.15915493667125701904296875;
        float _3444 = _3442 * 6.283185482025146484375;
        float _3446 = cos(_3444);
        float _3448 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3450 = _3448 * 0.15915493667125701904296875;
        float _3452 = _3442 * 6.283185482025146484375;
        float _3454 = sin(_3452);
        float _3456 = 1.0 / _3446;
        float _3458 = _3450 * 6.283185482025146484375;
        float _3460 = cos(_3458);
        float _3462 = _3454 * _3456;
        float _3464 = _3450 * 6.283185482025146484375;
        float _3466 = sin(_3464);
        float _3468 = _3460 * _3462;
        float _3470 = 1.0 / _3468;
        float _3472 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3474 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3472;
        float _3476 = 1.0 / _3474;
        float _3478 = _3466 * _3470;
        float _3480 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3482 = fma(_2619, _3478, _3480);
        float _3484 = _3482 * _3476;
        float _3486 = precise::clamp(_3484, 0.0, 1.0);
        float _3488 = -_3486;
        float _3490 = _3488 + 1.0;
        _3436 = _3474;
        _3380 = _3490;
        _3438 = _3450;
    }
    float _3492 = _3436;
    float _3494 = _3380;
    float _3496 = _3438;
    float _3498 = -_3322;
    float _3500 = _3498 + 1.0;
    float _3502 = _3374 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3504 = -_3257;
    float _3506 = _3504 + 1.0;
    float _3508 = _3492;
    float _3510 = _3500;
    float _3512 = _3496;
    if (!_3153)
    {
        _3508 = 1.0;
    }
    float _3514 = _3508;
    float _3516 = _3500 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3518 = _3514;
    float _3520 = _3516;
    if (_3153)
    {
        bool _3522 = _3273 >= _3255;
        bool _3524 = isnan(_3273);
        bool _3526 = _3522 || _3524;
        bool _3528 = isnan(_3255);
        bool _3530 = _3526 || _3528;
        float _3532 = float(_3530);
        _3518 = _3532;
    }
    float _3534 = _3518;
    float _3536 = _3506 * _3502;
    float _3538 = precise::clamp(_3536, 0.0, 1.0);
    float _3540 = _3534;
    if (_2791)
    {
        _3510 = 1.0;
    }
    float _3542 = _3510;
    float _3544 = _3542;
    if (!_2791)
    {
        int _3546 = _2839 << 4;
        int _3548 = _3546 + 2048;
        uint _3550 = uint(int(uint(_3548) >> uint(2)));
        uint _3552 = uint(int(uint(int(_3550)) >> uint(2)));
        int _3554 = int(_3550) & 3;
        float _3556 = (*spvDescriptorSet0.vp_c15)._m0[int(_3552)][_3554];
        int _3558 = int(_3550) + 1;
        uint _3560 = uint(int(uint(_3558) >> uint(2)));
        int _3562 = _3558 & 3;
        float _3564 = (*spvDescriptorSet0.vp_c15)._m0[int(_3560)][_3562];
        int _3566 = _3548 + 8;
        uint _3568 = uint(int(uint(_3566) >> uint(2)));
        uint _3570 = uint(int(uint(int(_3568)) >> uint(2)));
        int _3572 = int(_3568) & 3;
        float _3574 = (*spvDescriptorSet0.vp_c15)._m0[int(_3570)][_3572];
        int _3576 = int(_3568) + 1;
        uint _3578 = uint(int(uint(_3576) >> uint(2)));
        int _3580 = _3576 & 3;
        float _3582 = (*spvDescriptorSet0.vp_c15)._m0[int(_3578)][_3580];
        float _3584 = _2591 * _3564;
        float _3586 = fma(_2505, _3556, _3584);
        float _3588 = fma(_2513, _3574, _3586);
        float _3590 = _3588 + _3582;
        float _3592 = precise::clamp(_3590, 0.0, 1.0);
        float _3594 = -_3592;
        float _3596 = _3594 + _3267;
        float _3598 = fma(_3596, 500.0, 1.5);
        float _3600 = exp2(_3598);
        float _3602 = 0.0 + _3600;
        float _3604 = precise::clamp(_3602, 0.0, 1.0);
        _3544 = _3604;
    }
    float _3606 = _3544;
    float _3608 = _3516 * _3275;
    float _3610 = _3534 * _3606;
    float _3612 = -_3538;
    float _3614 = fma(_3612, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3616 = -_3516;
    float _3618 = _3616 + 1.0;
    float _3620 = _3286 * _3608;
    float _3622 = _3296 * _3608;
    float _3624 = -_3610;
    float _3626 = fma(_3624, _3614, 1.0);
    float _3628 = precise::clamp(_3626, 0.0, 1.0);
    bool _3630 = _2597 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3632 = isnan(_2597);
    bool _3634 = _3630 || _3632;
    bool _3636 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3638 = _3634 || _3636;
    float _3640 = fma(_3292, _3620, _3280);
    float _3642 = fma(_3294, _3620, _3282);
    float _3644 = _3286 * _3618;
    float _3646 = _3628 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3648 = fma(_3286, _3622, _3284);
    float _3650 = _3432 * _3494;
    out.m_89.x = _3646;
    float _3652 = _3650 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_91.x = _3640;
    out.m_91.y = _3642;
    out.m_91.z = _3648;
    out.m_91.w = _3644;
    float _3654 = _3614;
    float _3656 = _3618;
    float _3658 = _3628;
    if (!_3638)
    {
        _3512 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3660 = _3512;
    float _3662 = _3660;
    float _3664 = _3660;
    if (!_3638)
    {
        _3520 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3666 = _3520;
    float _3668 = _3666;
    float _3670 = _3666;
    if (!_3638)
    {
        _3654 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3672 = _3654;
    float _3674 = _3672;
    float _3676 = _3672;
    if (!_3638)
    {
        _3540 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3678 = _3540;
    float _3680 = _3678;
    float _3682 = _3678;
    if (!_3638)
    {
        _3656 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3684 = _3656;
    float _3686 = _3684;
    float _3688 = _3684;
    if (!_3638)
    {
        _3658 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3690 = _3658;
    bool _3692 = !_3638;
    float _3694 = _3690;
    float _3696 = _3690;
    if (!_3692)
    {
        bool _3698 = _2597 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3700 = isnan(_2597);
        bool _3702 = _3698 || _3700;
        bool _3704 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3706 = _3702 || _3704;
        if (!_3706)
        {
            float _3708 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3710 = _2597 + _3708;
            float _3712 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3714 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3712;
            float _3716 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3718 = _3716 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3720 = 1.0 / _3714;
            float _3722 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3724 = _3722 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3726 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3728 = _3726 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3730 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3732 = _3730 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3734 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3736 = _3734 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3738 = _3710 * _3720;
            float _3740 = precise::clamp(_3738, 0.0, 1.0);
            float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3744 = _3742 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3746 = fma(_3740, _3718, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3748 = fma(_3740, _3744, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3750 = fma(_3740, _3724, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3752 = fma(_3740, _3728, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3754 = fma(_3740, _3732, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3756 = fma(_3740, _3736, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3670 = _3746;
            _3688 = _3754;
            _3664 = _3750;
            _3682 = _3752;
            _3676 = _3748;
            _3696 = _3756;
            _3758 = true;
        }
        else
        {
            bool _3760 = _2597 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3762 = isnan(_2597);
            bool _3764 = _3760 || _3762;
            bool _3766 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3768 = _3764 || _3766;
            if (!_3768)
            {
                _3662 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3770 = _3662;
            _3664 = _3770;
            if (!_3768)
            {
                _3668 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3772 = _3668;
            _3670 = _3772;
            if (!_3768)
            {
                _3674 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3774 = _3674;
            _3676 = _3774;
            if (!_3768)
            {
                _3680 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3776 = _3680;
            _3682 = _3776;
            if (!_3768)
            {
                _3686 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3778 = _3686;
            _3688 = _3778;
            if (!_3768)
            {
                _3694 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3780 = _3694;
            bool _3782 = !_3768;
            _3696 = _3780;
            if (!_3782)
            {
                bool _3784 = _2597 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3786 = isnan(_2597);
                bool _3788 = _3784 || _3786;
                bool _3790 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3792 = _3788 || _3790;
                if (!_3792)
                {
                    float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3796 = _2597 + _3794;
                    float _3798 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3800 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3798;
                    float _3802 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3804 = _3802 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3806 = 1.0 / _3800;
                    float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3810 = _3808 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3814 = _3812 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3816 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3818 = _3816 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3820 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3822 = _3820 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3824 = _3796 * _3806;
                    float _3826 = precise::clamp(_3824, 0.0, 1.0);
                    float _3828 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3830 = _3828 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3832 = fma(_3826, _3804, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3834 = fma(_3826, _3830, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3836 = fma(_3826, _3810, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3838 = fma(_3826, _3814, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3840 = fma(_3826, _3818, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3842 = fma(_3826, _3822, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3670 = _3832;
                    _3688 = _3840;
                    _3664 = _3836;
                    _3682 = _3838;
                    _3676 = _3834;
                    _3696 = _3842;
                    _3758 = true;
                }
                else
                {
                    _3670 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3688 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3664 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3682 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3676 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3696 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3758 = false;
    float _3844 = _3670;
    float _3846 = _3688;
    float _3848 = _3664;
    float _3850 = _3682;
    float _3852 = _3676;
    float _3854 = _3696;
    float _3856 = fma(_2243, -0.5, 0.5);
    float _3858 = precise::clamp(_3856, 0.0, 1.0);
    float _3860 = -_3844;
    float _3862 = _3860 + _3846;
    float _3864 = _3652 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3866 = -_3848;
    float _3868 = _3866 + _3850;
    out.m_93.x = 0.0;
    float _3870 = fma(_3858, _3862, _3844);
    float _3872 = fma(_3858, _3868, _3848);
    out.m_61.x = _3864;
    float _3874 = -_3852;
    float _3876 = _3874 + _3854;
    float _3878 = _3870 * 0.586610972881317138671875;
    bool _3880 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3882 = fma(_3858, _3876, _3852);
    float _3884 = fma(_3872, 0.298911988735198974609375, _3878);
    bool _3886 = _3432 > 0.0;
    bool _3888 = isnan(_3432);
    bool _3890 = _3886 || _3888;
    bool _3892 = isnan(0.0);
    bool _3894 = _3890 || _3892;
    float _3896 = fma(_3882, 0.114477999508380889892578125, _3884);
    bool _3898 = _3494 <= 0.0;
    bool _3900 = !_3894;
    bool _3902 = _3898 || _3900;
    float _3904 = -_3896;
    float _3906 = _3872 + _3904;
    float _3908 = -_3896;
    float _3910 = _3870 + _3908;
    float _3912 = -_3896;
    float _3914 = _3882 + _3912;
    float _3916 = fma(_3906, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3896);
    float _3918 = fma(_3910, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3896);
    float _3920 = fma(_3914, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3896);
    bool _3922 = !_3880;
    if (!_3922)
    {
        float _3924 = -_2543;
        float _3926 = _3924 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3928 = -_2547;
        float _3930 = _3928 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3932 = -_2535;
        float _3934 = _3932 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3936 = _3926 * _3926;
        float _3938 = fma(_3930, _3930, _3936);
        float _3940 = fma(_3934, _3934, _3938);
        float _3942 = sqrt(_3940);
        float _3944 = rsqrt(_3940);
        float _3946 = -_3942;
        float _3948 = _3946 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3950 = _3948 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3952 = precise::clamp(_3950, 0.0, 1.0);
        float _3954 = _3930 * _3944;
        float _3956 = _3926 * _3944;
        float _3958 = abs(_3952);
        float _3960 = log2(_3958);
        float _3962 = _3934 * _3944;
        float _3964 = _3954 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3966 = _2243 * _3956;
        float _3968 = -_3956;
        float _3970 = -_3964;
        float _3972 = fma(_3968, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3970);
        float _3974 = fma(_2407, _3954, _3966);
        float _3976 = -_3962;
        float _3978 = fma(_3976, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3972);
        float _3980 = fma(_2417, _3962, _3974);
        float _3982 = precise::clamp(_3980, 0.0, 1.0);
        float _3984 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3986 = _3978 + _3984;
        float _3988 = _3960 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3990 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3992 = precise::clamp(_3990, 0.0, 1.0);
        float _3994 = exp2(_3988);
        float _3996 = _3994 * _3992;
        float _3998 = _3982 * _3996;
        float _4000 = _3998 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4002 = _3998 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4004 = _3998 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _4000;
        out.m_93.y = _4002;
        out.m_93.z = _4004;
    }
    out.m_95.x = _3916;
    out.m_95.y = _3918;
    out.m_95.z = _3920;
    if (!_3902)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _4006 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4006;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

