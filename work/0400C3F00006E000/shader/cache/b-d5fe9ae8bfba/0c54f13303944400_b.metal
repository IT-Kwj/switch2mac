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

struct _33
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c11 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    const device _33* vp_s0 [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_14 [[id(10)]];
    sampler vp_t_tcb_14Smplr [[id(11)]];
    texture2d_array<float> vp_t_tcb_16 [[id(12)]];
    sampler vp_t_tcb_16Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_32 [[id(14)]];
    sampler vp_t_tcb_32Smplr [[id(15)]];
    texture3d<float> vp_t_tcb_30 [[id(16)]];
    sampler vp_t_tcb_30Smplr [[id(17)]];
    texture2d<float> vp_t_tcb_1C [[id(18)]];
    sampler vp_t_tcb_1CSmplr [[id(19)]];
    sampler vp_t_tcb_24Smplr_w [[id(20)]];
    sampler vp_t_tcb_14Smplr_w [[id(21)]];
    sampler vp_t_tcb_32Smplr_w [[id(22)]];
    sampler vp_t_tcb_30Smplr_w [[id(23)]];
    sampler vp_t_tcb_1CSmplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

struct main0_out
{
    float4 m_91 [[user(locn0)]];
    float4 m_87 [[user(locn1)]];
    float4 m_85 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_105 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_95 [[user(locn7)]];
    float4 m_97 [[user(locn8)]];
    float4 m_103 [[user(locn9)]];
    float4 m_101 [[user(locn10)]];
    float4 m_99 [[user(locn11)]];
    float4 m_107 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_70 [[attribute(2)]];
    float4 m_74 [[attribute(3)]];
    float4 m_78 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_68 [[attribute(6)]];
    float4 m_76 [[attribute(7)]];
    float4 m_83 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2416 = false;
    bool _472 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_63.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_66.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2781 = as_type<float>(_142);
        out.gl_Position.z = _2781;
    }
    if (!_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_68.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_156)
    {
        float _162 = float(_126);
        _136 = _162;
    }
    float _164 = _136;
    bool _166 = _160 >= _164;
    bool _168 = !_156;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_66.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _144 = as_type<int>(_176);
    }
    int _178 = _144;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2850 = as_type<float>(_178);
        out.gl_Position.z = _2850;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _180 = in.m_70.x;
    float _182 = in.m_70.y;
    float _184 = in.m_70.z;
    float _186 = in.m_72.x;
    float _188 = in.m_72.y;
    float _190 = in.m_72.z;
    float _192 = in.m_74.x;
    float _194 = in.m_74.y;
    float _196 = in.m_74.z;
    float _198 = _180 * _180;
    float _200 = _182 * _182;
    float _202 = _184 * _184;
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    bool _222 = _216 > 0.0;
    bool _224 = _218 > 0.0;
    float _226 = _218;
    float _228 = _216;
    float _230 = _210;
    float _232 = _212;
    if (_222)
    {
        float _234 = rsqrt(_210);
        _226 = _234;
    }
    float _236 = _226;
    float _238 = 0.0;
    if (!_222)
    {
        _238 = 0.0;
    }
    float _240 = _238;
    bool _242 = _220 > 0.0;
    float _244 = 0.0;
    float _246 = _220;
    float _248 = _240;
    if (!_222)
    {
        _244 = 0.0;
    }
    float _250 = _244;
    float _252 = 0.0;
    float _254 = _250;
    if (!_222)
    {
        _252 = 0.0;
    }
    float _256 = _252;
    float _258 = 0.0;
    float _260 = _256;
    if (_224)
    {
        float _262 = rsqrt(_212);
        _258 = _262;
    }
    float _264 = _258;
    if (!_224)
    {
        _246 = 0.0;
    }
    float _266 = _246;
    float _268 = 0.0;
    float _270 = _266;
    if (!_224)
    {
        _268 = 0.0;
    }
    float _272 = _268;
    float _274 = _272;
    if (!_224)
    {
        _228 = 0.0;
    }
    float _276 = _228;
    float _278 = 0.0;
    float _280 = _276;
    if (_242)
    {
        float _282 = rsqrt(_214);
        _278 = _282;
    }
    float _284 = _278;
    if (_222)
    {
        float _286 = _236 * _186;
        _248 = _286;
    }
    float _288 = _248;
    if (_222)
    {
        float _290 = _236 * _180;
        _254 = _290;
    }
    float _292 = _254;
    if (_222)
    {
        float _294 = _236 * _192;
        _260 = _294;
    }
    float _296 = _260;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _300 = 0.0;
    if (!_242)
    {
        _300 = 0.0;
    }
    float _302 = _300;
    float _304 = _302;
    if (!_242)
    {
        _230 = 0.0;
    }
    float _306 = _230;
    float _308 = _306;
    if (_224)
    {
        float _310 = _264 * _188;
        _270 = _310;
    }
    float _312 = _270;
    if (!_242)
    {
        _232 = 0.0;
    }
    float _314 = _232;
    float _316 = _314;
    if (_224)
    {
        float _318 = _264 * _182;
        _274 = _318;
    }
    float _320 = _274;
    if (_224)
    {
        float _322 = _264 * _194;
        _280 = _322;
    }
    float _324 = _280;
    if (_242)
    {
        float _326 = _284 * _190;
        _304 = _326;
    }
    float _328 = _304;
    if (_242)
    {
        float _330 = _284 * _184;
        _308 = _330;
    }
    float _332 = _308;
    if (_242)
    {
        float _334 = _284 * _196;
        _316 = _334;
    }
    float _336 = _316;
    bool _338 = !_298;
    float _356;
    if (!_338)
    {
        float _340 = in.m_76.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_126);
        float _362 = 1.0 / _360;
        float _364 = _160 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = in.m_76.x;
    float _370 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _374 = _366 + _372;
    bool _376 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _378 = isnan(_366);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _388;
    bool _392 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _394 = 1.0 / _390;
    float _396 = _370 * _368;
    float _398 = -_386;
    float _400 = _398 + 1.0;
    float _402 = _374 * _394;
    bool _404 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _406 = isnan(_366);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _420;
    float _424 = trunc(_396);
    int _426 = int(_424);
    float _428 = _414 * _400;
    float _430 = fma(_418, _402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _432 = fma(_422, _402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _434 = -_414;
    float _436 = _434 + 1.0;
    float _438 = _430 * _428;
    float _440 = _432 * _428;
    float _442 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[143].x, _438);
    float _444 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[143].y, _440);
    float _446 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[144].x, _442);
    float _448 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[144].y, _444);
    int _450 = _426 << 4;
    int _452 = _450 + 1712;
    bool _454 = !_392;
    float _470;
    if (!_454)
    {
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _368 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_126);
        float _476 = 1.0 / _474;
        float _478 = _160 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = in.m_78.w;
    float _484 = as_type<float>(int(gl_VertexIndex));
    float _486 = in.m_83.x;
    float _488 = in.m_83.y;
    float _490 = in.m_63.x;
    float _492 = in.m_63.y;
    float _494 = in.m_63.z;
    float _496 = in.m_74.w;
    float _498 = trunc(_482);
    int _500 = int(_498);
    int _502 = _500 << 5;
    uint _505 = uint(int(uint(_502) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_505)];
    float _507 = as_type<float>(_dmw0.x);
    int _509 = _502 + 4;
    uint _511 = uint(int(uint(_509) >> uint(2)));
    float _513 = as_type<float>(_dmw0.y);
    int _515 = _502 + 8;
    uint _517 = uint(int(uint(_515) >> uint(2)));
    float _519 = as_type<float>(_dmw0.z);
    int _521 = _502 + 12;
    uint _523 = uint(int(uint(_521) >> uint(2)));
    float _525 = as_type<float>(_dmw0.w);
    int _527 = as_type<int>(_484) & 1;
    bool _529 = _527 != 0;
    int _531 = as_type<int>(_484) & 2;
    bool _533 = _531 != 0;
    float _535 = _446 * _486;
    float _537 = in.m_72.w;
    float _539 = _194 * _492;
    float _541 = _188 * _492;
    bool _543 = !_529;
    float _545 = _543 ? (-0.5) : 0.5;
    float _547 = _448 * _488;
    float _549 = fma(_192, _490, _539);
    bool _551 = !_533;
    float _553 = _551 ? (-0.5) : 0.5;
    float _555 = _535 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _545);
    float _559 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _561 = fma(_186, _490, _541);
    float _563 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _565 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _553);
    float _567 = _555 * _557;
    float _569 = _559 * _324;
    float _571 = fma(_196, _494, _549);
    float _573 = _563 * _565;
    float _575 = _559 * _312;
    float _577 = fma(_567, _296, _569);
    float _579 = fma(_190, _494, _561);
    float _581 = _571 + _496;
    float _583 = fma(_567, _288, _575);
    float _585 = -_573;
    float _587 = fma(_585, _336, _577);
    float _589 = _182 * _492;
    float _591 = _579 + _537;
    float _593 = -_573;
    float _595 = fma(_593, _328, _583);
    float _597 = _581 + _587;
    float _599 = in.m_70.w;
    float _601 = fma(_180, _490, _589);
    float _603 = _591 + _595;
    float _605 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _607 = _597 + _605;
    float _609 = _559 * _320;
    float _611 = fma(_184, _494, _601);
    float _613 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _615 = _603 + _613;
    float _617 = _607 * _607;
    float _619 = fma(_567, _292, _609);
    float _621 = fma(_615, _615, _617);
    float _623 = -_573;
    float _625 = fma(_623, _332, _619);
    bool _627 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _629 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _631 = _627 || _629;
    bool _633 = isnan(0.5);
    bool _635 = _631 || _633;
    float _637 = sqrt(_621);
    float _639 = _611 + _599;
    float _641 = _639 + _625;
    bool _643 = _637 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _645 = _525 * 2.0;
    float _647 = _507 * 2.0;
    float _649 = _513 * 2.0;
    float _651 = _507 * _507;
    float _653 = _519 * _645;
    float _655 = _513 * _645;
    float _657 = _507 * _645;
    float _659 = _519 * _519;
    float _661 = -_653;
    float _663 = fma(_513, _647, _661);
    float _665 = fma(_519, _647, _655);
    float _667 = -_657;
    float _669 = fma(_519, _649, _667);
    float _671 = fma(_513, _647, _653);
    float _673 = -_655;
    float _675 = fma(_519, _647, _673);
    float _677 = fma(_519, _649, _657);
    float _679 = _513 * _513;
    float _681 = _507;
    float _683 = _647;
    float _685 = _657;
    float _687 = _591;
    if (!_643)
    {
        _681 = _603;
    }
    float _689 = _681;
    float _691 = _689;
    if (!_643)
    {
        _683 = _597;
    }
    float _693 = _683;
    float _695 = _693;
    if (!_643)
    {
        _685 = _641;
    }
    float _697 = _685;
    bool _699 = !_643;
    float _701 = _697;
    if (!_699)
    {
        float _703 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _705 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _707 = _637 + _705;
        float _709 = _641 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _711 = rsqrt(_621);
        float _713 = _707 * _703;
        float _715 = _713 * 0.15915493667125701904296875;
        float _717 = _715 * 6.283185482025146484375;
        float _719 = cos(_717);
        float _721 = _715 * 6.283185482025146484375;
        float _723 = sin(_721);
        float _725 = _719 + (-1.0);
        float _727 = _725 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _729 = fma(_723, _709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _731 = fma(_641, _719, _727);
        float _733 = _711 * _729;
        float _735 = fma(_615, _733, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _737 = fma(_607, _733, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _701 = _731;
        _691 = _735;
        _695 = _737;
    }
    float _739 = _701;
    float _741 = _691;
    float _743 = _695;
    float _745 = -_639;
    float _747 = _745 + _739;
    float _749 = -_591;
    float _751 = _749 + _741;
    float _753 = fma(_679, -2.0, 1.0);
    float _755 = -_581;
    float _757 = _755 + _743;
    float _759 = _747 * _320;
    float _761 = fma(_651, -2.0, 1.0);
    float _763 = _747 * _292;
    float _765 = fma(_659, -2.0, _753);
    float _767 = fma(_751, _312, _759);
    float _769 = fma(_659, -2.0, _761);
    float _771 = _747 * _332;
    float _773 = fma(_751, _288, _763);
    float _775 = fma(_757, _324, _767);
    float _777 = fma(_679, -2.0, _761);
    float _779 = fma(_751, _328, _771);
    float _781 = fma(_757, _296, _773);
    float _783 = _775 * _663;
    float _785 = _775 * _769;
    float _787 = _775 * _677;
    float _789 = fma(_757, _336, _779);
    float _791 = fma(_781, _765, _783);
    float _793 = fma(_781, _671, _785);
    float _795 = fma(_781, _675, _787);
    float _797 = fma(_789, _665, _791);
    float _799 = fma(_789, _669, _793);
    float _801 = fma(_789, _777, _795);
    float _803 = _591 + _797;
    float _805 = _639 + _799;
    float _807 = _581 + _801;
    float _809 = _805;
    float _811 = _803;
    float _813 = _807;
    if (!_635)
    {
        float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _817 = _639 + _815;
        float _819 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _821 = _591 + _819;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _825 = _817 * _817;
        float _827 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _829 = _581 + _827;
        float _831 = fma(_821, _821, _825);
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _835 = fma(_829, _829, _831);
        float _837 = sqrt(_835);
        float _839 = _823 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _841 = precise::min(_837, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _843 = _841 * _833;
        float _845 = _839 * _843;
        float _847 = fma(_797, _845, _591);
        float _849 = fma(_799, _845, _639);
        float _851 = fma(_801, _845, _581);
        _809 = _849;
        _811 = _847;
        _813 = _851;
    }
    float _853 = _809;
    float _855 = _811;
    float _857 = _813;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _861 = _853 + _859;
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _865 = _855 + _863;
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _869 = _857 + _867;
    float _871 = _639 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _873 = _861 * _861;
    float _875 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[11].x, _871);
    float _877 = fma(_865, _865, _873);
    float _879 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[11].z, _875);
    float _881 = fma(_869, _869, _877);
    float _883 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _885 = _879 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _887 = rsqrt(_881);
    float _889 = _639 + _883;
    float _891 = _639 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _893 = _889 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _895 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[10].x, _891);
    float _897 = 1.0 / _885;
    float _899 = fma(_591, (*spvDescriptorSet0.vp_c15)._m0[126].x, _893);
    float _901 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[10].z, _895);
    float _903 = fma(_591, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _905 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[126].z, _899);
    float _907 = _901 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _909 = _865 * _887;
    float _911 = _869 * _887;
    float _913 = _905 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _915 = _889 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _917 = _909 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _919 = _911 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _921 = _907 + _885;
    float _923 = _917 * _917;
    float _925 = _919 * _919;
    float _927 = fma(_591, (*spvDescriptorSet0.vp_c15)._m0[127].x, _915);
    float _929 = _921 * _897;
    float _931 = _929 * 0.5;
    float _933 = trunc(_913);
    int _935 = int(_933);
    float _937 = _923 + _925;
    float _939 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[127].z, _927);
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[30].w, _941);
    float _945 = _861 * _887;
    float _947 = _939 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _949 = sqrt(_937);
    float _951 = 1.0 / _943;
    int _953 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _955 = _935 + _953;
    int _957 = _955 + 1;
    bool _959 = _957 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _961 = trunc(_947);
    int _963 = int(_961);
    bool _965 = _949 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _967 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = _949 + _967;
    float _971 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _973 = _951 * _971;
    float _975 = sqrt(_881);
    bool _977 = _973 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _979 = _973 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    int _981 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _983 = _963 + _981;
    int _985 = _983 + 1;
    float _987 = 0.0;
    float _989 = _951;
    int _991 = 2;
    float _993 = _969;
    int _995 = _985;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[652].y);
    float _999 = _917;
    float _1001 = _919;
    float _1003 = _947;
    if (_965)
    {
        float _1005 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _987 = _1005;
    }
    float _1007 = _987;
    int _1009 = _957 | _985;
    bool _1011 = _1009 < 0;
    bool _1013 = _1011 || _959;
    if (_965)
    {
        float _1015 = rsqrt(_937);
        _989 = _1015;
    }
    float _1017 = _989;
    bool _1019 = !_977;
    int _1021 = _1019 ? 0 : 1;
    bool _1023 = _985 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1025 = _1023 || _1013;
    float _1027 = _1017;
    if (!_977)
    {
        _991 = 1;
    }
    int _1029 = _991;
    int _1031 = _1029;
    if (!_979)
    {
        _1031 = _1021;
    }
    int _1033 = _1031;
    if (_965)
    {
        float _1035 = _969 * _1007;
        _993 = _1035;
    }
    float _1037 = _993;
    float _1039 = floor(_903);
    int _1041 = _1033 << 6;
    float _1043 = 0.0;
    if (_965)
    {
        float _1045 = _1037 * 0.15915493667125701904296875;
        _1043 = _1045;
    }
    float _1047 = _1043;
    float _1049 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1051 = _1041 + 48;
    uint _1053 = uint(int(uint(_1051) >> uint(2)));
    uint _1055 = uint(int(uint(int(_1053)) >> uint(2)));
    int _1057 = int(_1053) & 3;
    float _1059 = (*spvDescriptorSet0.vp_c15)._m0[int(_1055)][_1057];
    int _1061 = int(_1053) + 1;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    int _1065 = _1061 & 3;
    float _1067 = (*spvDescriptorSet0.vp_c15)._m0[int(_1063)][_1065];
    if (!_1025)
    {
        int _1069 = _985 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1071 = _1069 + _957;
        _995 = _1071;
    }
    int _1073 = _995;
    int _1075 = 0;
    if (_965)
    {
        float _1077 = _1047 * 6.283185482025146484375;
        float _1079 = sin(_1077);
        _1075 = as_type<int>(_1079);
    }
    int _1081 = _1075;
    float _1083 = precise::max(0.0, _1049);
    int _1085 = _1041 + 96;
    uint _1087 = uint(int(uint(_1085) >> uint(2)));
    uint _1089 = uint(int(uint(int(_1087)) >> uint(2)));
    int _1091 = int(_1087) & 3;
    float _1093 = (*spvDescriptorSet0.vp_c15)._m0[int(_1089)][_1091];
    int _1095 = int(_1087) + 1;
    uint _1097 = uint(int(uint(_1095) >> uint(2)));
    int _1099 = _1095 & 3;
    float _1101 = (*spvDescriptorSet0.vp_c15)._m0[int(_1097)][_1099];
    float _1103 = -_945;
    float _1105 = -_1083;
    float _1107 = fma(_1103, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1105);
    float _1109 = 0.0;
    float _1111 = _1107;
    if (_965)
    {
        float _1113 = _1047 * 6.283185482025146484375;
        float _1115 = cos(_1113);
        _1109 = _1115;
    }
    float _1117 = _1109;
    float _1119 = -_1039;
    float _1121 = _903 + _1119;
    float _1123 = 0.0;
    if (_965)
    {
        float _1125 = _1107 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1123 = _1125;
    }
    float _1127 = _1123;
    int _1129 = _1041 + 64;
    uint _1131 = uint(int(uint(_1129) >> uint(2)));
    uint _1133 = uint(int(uint(int(_1131)) >> uint(2)));
    int _1135 = int(_1131) & 3;
    float _1137 = (*spvDescriptorSet0.vp_c15)._m0[int(_1133)][_1135];
    int _1139 = int(_1131) + 1;
    uint _1141 = uint(int(uint(_1139) >> uint(2)));
    int _1143 = _1139 & 3;
    float _1145 = (*spvDescriptorSet0.vp_c15)._m0[int(_1141)][_1143];
    float _1147 = 0.0;
    int _1149 = _1081;
    if (_965)
    {
        float _1151 = fma(as_type<float>(_1081), _1127, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1147 = _1151;
    }
    float _1153 = _1147;
    float _1155 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_1025)
    {
        int _1157 = _1073 << 2;
        _997 = _1157;
    }
    int _1159 = _997;
    int _1161 = _1159;
    if (!_1025)
    {
        uint _1163 = uint(int(uint(_1073) >> uint(2)));
        _1149 = int(_1163);
    }
    int _1165 = _1149;
    int _1167 = _1041 + 104;
    uint _1169 = uint(int(uint(_1167) >> uint(2)));
    uint _1171 = uint(int(uint(int(_1169)) >> uint(2)));
    int _1173 = int(_1169) & 3;
    float _1175 = (*spvDescriptorSet0.vp_c15)._m0[int(_1171)][_1173];
    int _1177 = int(_1169) + 1;
    uint _1179 = uint(int(uint(_1177) >> uint(2)));
    int _1181 = _1177 & 3;
    float _1183 = (*spvDescriptorSet0.vp_c15)._m0[int(_1179)][_1181];
    float _1185 = as_type<float>(_1165);
    if (!_1025)
    {
        int _1187 = 12 & _1159;
        _1161 = _1187;
    }
    int _1189 = _1161;
    float _1191 = as_type<float>(_1189);
    if (_965)
    {
        float _1193 = _1017 * _1153;
        _1027 = _1193;
    }
    float _1195 = _1027;
    float _1197 = 0.0;
    if (_965)
    {
        float _1199 = _1117 + (-1.0);
        _1197 = _1199;
    }
    float _1201 = _1197;
    float _1203 = floor(_1155);
    int _1205 = as_type<int>(_1201);
    if (_965)
    {
        float _1207 = _917 * _1195;
        _999 = _1207;
    }
    float _1209 = _999;
    float _1211 = 0.0;
    if (_965)
    {
        float _1213 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1211 = _1213;
    }
    float _1215 = _1211;
    int _1217 = _1041 + 56;
    uint _1219 = uint(int(uint(_1217) >> uint(2)));
    uint _1221 = uint(int(uint(int(_1219)) >> uint(2)));
    int _1223 = int(_1219) & 3;
    float _1225 = (*spvDescriptorSet0.vp_c15)._m0[int(_1221)][_1223];
    int _1227 = int(_1219) + 1;
    uint _1229 = uint(int(uint(_1227) >> uint(2)));
    int _1231 = _1227 & 3;
    float _1233 = (*spvDescriptorSet0.vp_c15)._m0[int(_1229)][_1231];
    if (!_1025)
    {
        int _1235 = _1165 << 4;
        int _1237 = _1235 + _1189;
        _1205 = _1237;
    }
    int _1239 = _1205;
    if (_965)
    {
        float _1241 = _919 * _1195;
        _1001 = _1241;
    }
    float _1243 = _1001;
    if (!_965)
    {
        _1191 = _923;
    }
    float _1245 = _1191;
    float _1247 = _1245;
    if (_965)
    {
        float _1249 = fma(_1107, _1117, _1215);
        _1111 = _1249;
    }
    float _1251 = _1111;
    if (_965)
    {
        float _1253 = _1209 * _1209;
        _1247 = _1253;
    }
    float _1255 = _1247;
    if (!_965)
    {
        _1185 = _925;
    }
    float _1257 = _1185;
    float _1259 = _1257;
    if (_965)
    {
        float _1261 = _1243 * _1243;
        _1259 = _1261;
    }
    float _1263 = _1259;
    int _1265 = _1041 + 72;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    uint _1269 = uint(int(uint(int(_1267)) >> uint(2)));
    int _1271 = int(_1267) & 3;
    float _1273 = (*spvDescriptorSet0.vp_c15)._m0[int(_1269)][_1271];
    int _1275 = int(_1267) + 1;
    uint _1277 = uint(int(uint(_1275) >> uint(2)));
    int _1279 = _1275 & 3;
    float _1281 = (*spvDescriptorSet0.vp_c15)._m0[int(_1277)][_1279];
    float _1283 = fma(_1251, _1251, _1255);
    float _1285 = _1117;
    if (!_1025)
    {
        float _1287 = floor(_913);
        _1285 = _1287;
    }
    float _1289 = _1285;
    float _1291 = -_1203;
    float _1293 = _1155 + _1291;
    float _1295 = _1283 + _1263;
    int _1297 = _1041 + 80;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    uint _1301 = uint(int(uint(int(_1299)) >> uint(2)));
    int _1303 = int(_1299) & 3;
    float _1305 = (*spvDescriptorSet0.vp_c15)._m0[int(_1301)][_1303];
    int _1307 = int(_1299) + 1;
    uint _1309 = uint(int(uint(_1307) >> uint(2)));
    int _1311 = _1307 & 3;
    float _1313 = (*spvDescriptorSet0.vp_c15)._m0[int(_1309)][_1311];
    float _1315 = _889 * _1067;
    float _1317 = rsqrt(_1295);
    float _1319 = _889 * _1101;
    float _1321 = fma(_591, _1059, _1315);
    float _1323 = _925;
    float _1325 = _1315;
    if (!_1025)
    {
        int _1327 = _1239 + 400;
        uint _1329 = uint(int(uint(_1327) >> uint(2)));
        uint _1331 = uint(int(uint(int(_1329)) >> uint(2)));
        int _1333 = int(_1329) & 3;
        float _1335 = (*spvDescriptorSet0.vp_c15)._m0[int(_1331)][_1333];
        _1323 = _1335;
    }
    float _1337 = _1323;
    float _1339 = fma(_591, _1093, _1319);
    if (!_1025)
    {
        float _1341 = floor(_947);
        _1325 = _1341;
    }
    float _1343 = _1325;
    float _1345 = _1289;
    if (!_1025)
    {
        float _1347 = -_1289;
        float _1349 = _913 + _1347;
        _1345 = _1349;
    }
    float _1351 = _1345;
    float _1353 = _889 * _1145;
    float _1355 = _1317 * _1209;
    float _1357 = fma(_591, _1137, _1353);
    float _1359 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1361 = fma(_581, _1175, _1339);
    float _1363 = _1361 + _1183;
    float _1365 = fma(_581, _1225, _1321);
    float _1367 = _853 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1369 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1371 = _1365 + _1233;
    float _1373 = 1.0 / _1363;
    float _1375 = fma(_581, _1273, _1357);
    float _1377 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1367);
    int _1379 = _1041 + 88;
    uint _1381 = uint(int(uint(_1379) >> uint(2)));
    uint _1383 = uint(int(uint(int(_1381)) >> uint(2)));
    int _1385 = int(_1381) & 3;
    float _1387 = (*spvDescriptorSet0.vp_c15)._m0[int(_1383)][_1385];
    int _1389 = int(_1381) + 1;
    uint _1391 = uint(int(uint(_1389) >> uint(2)));
    int _1393 = _1389 & 3;
    float _1395 = (*spvDescriptorSet0.vp_c15)._m0[int(_1391)][_1393];
    float _1397 = _1375 + _1281;
    float _1399 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1377);
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1403 = fma(_975, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1401);
    float _1405 = precise::clamp(_1403, 0.0, 1.0);
    float _1407 = _1317 * _1251;
    float _1409 = _1317 * _1243;
    float _1411 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1413 = -_1405;
    float _1415 = _1413 + 1.0;
    float _1417 = -_1359;
    float _1419 = fma(_1407, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1417);
    float _1421 = _853 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1423 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1425 = _1371 * _1373;
    float _1427 = _889 * _1313;
    float _1429 = _853 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1431 = -_1423;
    float _1433 = fma(_1431, _1369, 1.0);
    float _1435 = _853 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1437 = abs(_1415);
    float _1439 = log2(_1437);
    bool _1441 = _1425 >= 0.0;
    float _1443 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1429);
    float _1445 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1435);
    float _1447 = _1397 * _1373;
    bool _1449 = _1425 <= 1.0;
    bool _1451 = _1449 && _1441;
    float _1453 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1443);
    float _1455 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1445);
    float _1457 = -_1409;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1419);
    float _1461 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1421);
    bool _1463 = _1447 >= 0.0;
    bool _1465 = _1463 && _1451;
    float _1467 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1469 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1471 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1461);
    bool _1473 = _1447 <= 1.0;
    bool _1475 = _1473 && _1465;
    float _1477 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1479 = fma(_1459, -0.5, 0.5);
    float _1481 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1483 = fma(_591, _1305, _1427);
    float _1485 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1477);
    float _1487 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1489 = log2(_1433);
    float _1491 = fma(_1459, 0.5, 0.5);
    float _1493 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1485);
    float _1495 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1493);
    float _1497 = sqrt(_1479);
    float _1499 = fma(_581, _1387, _1483);
    float _1501 = fma(_1491, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1503 = 0.0187292993068695068359375;
    if (!_1025)
    {
        float _1505 = -_1343;
        float _1507 = _947 + _1505;
        _1503 = _1507;
    }
    float _1509 = _1503;
    float _1511 = exp2(_1481);
    float _1513 = _1499 + _1395;
    if (_1475)
    {
        float _1515 = float(_1033);
        _1003 = _1515;
    }
    float _1517 = _1003;
    float _1519 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1521 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1523 = fma(_1491, _1501, -0.212114393711090087890625);
    float _1525 = _1489 * 0.693147182464599609375;
    float _1527 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1519);
    float _1529 = 1.0 / _1495;
    float _1531 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1521);
    float _1533 = fma(_1491, _1523, 1.570728778839111328125);
    float _1535 = _1407 + 1.0;
    float _1537 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1527);
    float _1539 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1531);
    float _1541 = _1497 * 0.636619746685028076171875;
    float _1543 = _1513 * _1373;
    float _1545 = _1337;
    if (!_1025)
    {
        float _1547 = rint(_1337);
        float _1549 = precise::max(_1547, 0.0);
        uint _1551 = uint(_1549);
        uint _1553 = clamp(_1551, 0u, 65535u);
        _1545 = as_type<float>(_1553);
    }
    float _1555 = _1545;
    float _1557 = -_1407;
    float _1559 = fma(_1511, _1535, _1557);
    float _1561 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1537);
    float _1563 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1539);
    float _1565 = -_1533;
    float _1567 = fma(_1541, _1565, 1.0);
    float _1569 = _1525 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1571 = fma(_1559, 0.5, 0.5);
    float _1573 = _1517;
    if (_1475)
    {
        float _1575 = rint(_1517);
        float _1577 = precise::max(_1575, 0.0);
        uint _1579 = uint(_1577);
        uint _1581 = clamp(_1579, 0u, 65535u);
        _1573 = as_type<float>(_1581);
    }
    float _1583 = _1573;
    float _1585 = _1561 * _1529;
    float _1587 = _1563 * _1529;
    float2 _5093 = float2(_1121, _1293);
    float _1589 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5093, float2(0.0), isnan(_5093)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5093, float2(0.0), isnan(_5093)), level(0.0)).x;
    float _1591 = fma(_1585, 0.5, 0.5);
    float _1593 = fma(_1587, -0.5, 0.5);
    float _1595 = _1555;
    if (!_1025)
    {
        float3 _5114 = float3(_1351, _1509, float(as_type<int>(_1555)));
        float3 _5118 = select(_5114, float3(0.0), isnan(_5114));
        float _1597 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5118.xy, uint(rint(_5118.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5118.xy, uint(rint(_5118.z)), level(0.0)).x;
        _1595 = _1597;
    }
    float _1599 = _1595;
    float _1601 = _1583;
    if (_1475)
    {
        float3 _5133 = float3(_1425, _1447, float(as_type<int>(_1583)));
        float3 _5135 = select(_5133, float3(0.0), isnan(_5133));
        float _1603 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5135.xy, uint(rint(_5135.z)), _1543, level(0.0));
        _1601 = _1603;
    }
    float _1605 = _1601;
    float3 _5145 = float3(_1591, _1593, _1569);
    float _1607 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5145, float3(0.0), isnan(_5145)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5145, float3(0.0), isnan(_5145)), level(0.0)).x;
    float3 _5154 = float3(_1591, _1593, _1569);
    float4 _1610 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5154, float3(0.0), isnan(_5154)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5154, float3(0.0), isnan(_5154)), level(0.0)).xyzw;
    float _1612 = _1610.x;
    float _1614 = _1610.y;
    float _1616 = _1610.z;
    float _1618 = _1610.w;
    float2 _5170 = float2(_1567, _1571);
    float3 _1622 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5170, float2(0.0), isnan(_5170)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5170, float2(0.0), isnan(_5170)), level(0.0)).xyz;
    float _1624 = _1622.x;
    float _1626 = _1622.y;
    float _1628 = _1622.z;
    float _1630 = in.m_76.y;
    float _1632 = _545 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1634 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1636 = _368 > 0.5;
    float _1638 = fma(_1632, _296, _324);
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1646 = _1644 != 0;
    float _1648 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1634);
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1652 = _1650 != 0;
    out.m_85.x = _865;
    out.m_85.y = _861;
    out.m_85.z = _869;
    float _1654 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1656 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan(0.5);
    bool _1664 = _1660 || _1662;
    bool _1666 = _1630 > 0.5;
    float _1668 = 1.0 / _1642;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1672 = _1670 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1674 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1648);
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1678 = _1676 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1680 = 1.0 / _1672;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1684 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1686 = _1682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1690 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1688);
    float _1692 = 1.0 / _1678;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1696 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1694);
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1704 = _1702 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1710;
    bool _1714 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1716 = isnan(_480);
    bool _1718 = _1714 || _1716;
    bool _1720 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1722 = _1718 || _1720;
    float _1724 = float(_1722);
    float _1726 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1728 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1730 = _1700 * _1668;
    float _1732 = fma(_1632, _288, _312);
    float _1734 = fma(_1632, _292, _320);
    bool _1736 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1738 = isnan(_480);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1744 = _1740 || _1742;
    float _1746 = float(_1744);
    out.m_87.x = _1726;
    out.m_87.y = _1728;
    out.m_87.z = _1686;
    float _1748 = -_1724;
    float _1750 = _1748 + 1.0;
    float _1752 = _1712 * _1692;
    bool _1754 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1756 = isnan(_480);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    float _1766 = _1704 * _1680;
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1770 = _480 + _1768;
    int _1772 = _452 + 8;
    uint _1774 = uint(int(uint(_1772) >> uint(2)));
    uint _1776 = uint(int(uint(int(_1774)) >> uint(2)));
    int _1778 = int(_1774) & 3;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[int(_1776)][_1778];
    float _1782 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1696);
    float _1784 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1674);
    float _1786 = _581 + _1782;
    float _1788 = -_1764;
    float _1790 = _1788 + 1.0;
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1794 = _480 + _1792;
    uint _1796 = uint(int(uint(_452) >> uint(2)));
    uint _1798 = uint(int(uint(int(_1796)) >> uint(2)));
    int _1800 = int(_1796) & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    int _1804 = int(_1796) + 1;
    uint _1806 = uint(int(uint(_1804) >> uint(2)));
    int _1808 = _1804 & 3;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[int(_1806)][_1808];
    out.gl_Position.x = _1561;
    out.gl_Position.y = _1563;
    out.gl_Position.z = _1784;
    out.gl_Position.w = _1495;
    float _1812 = _1724 * _1790;
    bool _1814 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1816 = isnan(_480);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1822 = _1818 || _1820;
    float _1824 = float(_1822);
    float _1826 = _1746 * _1750;
    float _1828 = -_1746;
    float _1830 = _1828 + 1.0;
    float _1832 = fma(_1730, _1794, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1834 = fma(_1766, _1770, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1836 = -_545;
    int _1838 = _1636 ? as_type<int>(_1836) : as_type<int>(_545);
    float _1840 = _1824 * _1830;
    float _1842 = -_553;
    int _1844 = _1666 ? as_type<int>(_1842) : as_type<int>(_553);
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1848 = _480 + _1846;
    bool _1850 = !_1646;
    float _1852 = _1850 ? _545 : as_type<float>(_1838);
    float _1854 = _553 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1856 = !_1652;
    float _1858 = _1856 ? _553 : as_type<float>(_1844);
    float _1860 = fma(_1752, _1848, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1862 = abs(_973);
    float _1864 = log2(_1862);
    float _1866 = _1832 * _1840;
    float _1868 = -_1824;
    float _1870 = _1868 + 1.0;
    bool _1872 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1874 = isnan(0.0);
    bool _1876 = _1872 || _1874;
    bool _1878 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1880 = _1876 || _1878;
    float _1882 = _1852 + 0.5;
    float _1884 = -_1858;
    float _1886 = _1884 + 0.5;
    float _1888 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1866);
    float _1890 = -_1854;
    float _1892 = fma(_1890, _328, _1732);
    float _1894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1896 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1898 = fma(_1834, _1826, _1888);
    float _1900 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1690);
    float _1902 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1904 = -_1786;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1908 = fma(_1860, _1812, _1898);
    float _1910 = _591 + _1900;
    float _1912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1914 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1916 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_1880)
    {
        float _1918 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1916 = _1918;
    }
    float _1920 = _1916;
    float _1922 = -_1910;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1926 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1908);
    float _1928 = precise::min(_1786, _1906);
    float _1930 = _1920;
    if (_1880)
    {
        float _1932 = precise::min(_1920, 20.0);
        _1930 = _1932;
    }
    float _1934 = _1930;
    float _1936 = exp2(_1914);
    float _1938 = _1896 * _1894;
    float _1940 = _1780 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1942 = precise::min(_1910, _1924);
    float _1944 = -_1854;
    float _1946 = fma(_1944, _332, _1734);
    float _1948 = _1926 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1950 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = -_1854;
    float _1954 = fma(_1952, _336, _1638);
    float _1956 = _1902 * _1912;
    float _1958 = _1902;
    float _1960 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    if (_1880)
    {
        float _1962 = 1.0 / _1934;
        _1958 = _1962;
    }
    float _1964 = _1958;
    float _1966 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1968 = _1810 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_89.x = _1938;
    out.m_89.y = _1956;
    float _1970 = precise::min(_1942, _1928);
    float _1972 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1974 = fma(_1936, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1976 = precise::clamp(_1974, 0.0, 1.0);
    float _1978 = _1968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _1946 * _769;
    float _1982 = _1946 * _663;
    float _1984 = fma(_1976, -2.0, 3.0);
    float _1986 = _1976 * _1976;
    out.m_91.x = _1972;
    out.m_91.y = _1978;
    out.m_91.z = _1950;
    out.m_91.w = _1948;
    float _1988 = _1784 + _1495;
    float _1990 = _1986 * _1984;
    float _1992 = _1980;
    if (!_1880)
    {
        _1960 = 1.0;
    }
    float _1994 = _1960;
    float _1996 = _1988 * 0.5;
    float _1998 = fma(_1892, _671, _1980);
    float _2000 = -_1990;
    float _2002 = _2000 + 1.0;
    float _2004 = _1994;
    if (_1880)
    {
        float _2006 = _1970 * _1964;
        float _2008 = precise::clamp(_2006, 0.0, 1.0);
        _2004 = _2008;
    }
    float _2010 = _2004;
    float _2012 = fma(_1892, _765, _1982);
    out.m_93.z = _1996;
    out.m_93.w = _1495;
    float _2014 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1990);
    float _2016 = _2014;
    float _2018 = _2010;
    if (_1664)
    {
        _1992 = 1.0;
    }
    float _2020 = _1992;
    float _2022 = _1946 * _677;
    float _2024 = fma(_1892, _675, _2022);
    float _2026 = exp2(_1654);
    bool _2028 = _973 <= 8000.0;
    bool _2030 = isnan(_973);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan(8000.0);
    bool _2036 = _2032 || _2034;
    float _2038 = float(_2036);
    float _2040 = _2038 * _2014;
    float _2042 = _2020;
    float _2044 = _2040;
    if (_1664)
    {
        _2016 = 1.0;
    }
    float _2046 = _2016;
    float _2048 = _2046;
    if (!_1664)
    {
        float _2050 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2052 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2054 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2052;
        float _2056 = _2050 * 0.15915493667125701904296875;
        float _2058 = _2056 * 6.283185482025146484375;
        float _2060 = cos(_2058);
        float _2062 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2064 = _2062 * 0.15915493667125701904296875;
        float _2066 = _2056 * 6.283185482025146484375;
        float _2068 = sin(_2066);
        float _2070 = 1.0 / _2060;
        float _2072 = _2064 * 6.283185482025146484375;
        float _2074 = cos(_2072);
        float _2076 = _2068 * _2070;
        float _2078 = _2064 * 6.283185482025146484375;
        float _2080 = sin(_2078);
        float _2082 = _2074 * _2076;
        float _2084 = 1.0 / _2054;
        float _2086 = 1.0 / _2082;
        float _2088 = _2080 * _2086;
        float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2092 = fma(_973, _2088, _2090);
        float _2094 = _2092 * _2084;
        float _2096 = precise::clamp(_2094, 0.0, 1.0);
        _2048 = _2096;
    }
    float _2098 = _2048;
    if (!_1664)
    {
        float _2100 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2102 = _2100 * 0.15915493667125701904296875;
        float _2104 = _2102 * 6.283185482025146484375;
        float _2106 = cos(_2104);
        float _2108 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2110 = _2108 * 0.15915493667125701904296875;
        float _2112 = _2102 * 6.283185482025146484375;
        float _2114 = sin(_2112);
        float _2116 = 1.0 / _2106;
        float _2118 = _2110 * 6.283185482025146484375;
        float _2120 = cos(_2118);
        float _2122 = _2114 * _2116;
        float _2124 = _2110 * 6.283185482025146484375;
        float _2126 = sin(_2124);
        float _2128 = _2120 * _2122;
        float _2130 = 1.0 / _2128;
        float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2134 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2132;
        float _2136 = 1.0 / _2134;
        float _2138 = _2126 * _2130;
        float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2142 = fma(_973, _2138, _2140);
        float _2144 = _2142 * _2136;
        float _2146 = precise::clamp(_2144, 0.0, 1.0);
        float _2148 = -_2146;
        float _2150 = _2148 + 1.0;
        _2042 = _2150;
    }
    float _2152 = _2042;
    float _2154 = fma(_1954, _665, _2012);
    float _2156 = fma(_1954, _669, _1998);
    float _2158 = fma(_1954, _777, _2024);
    float _2160 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2162 = -_1589;
    float _2164 = _2162 + 1.0;
    float _2166 = -_2026;
    float _2168 = _2166 + 1.0;
    float _2170 = _2160;
    if (!_1475)
    {
        _2044 = 1.0;
    }
    float _2172 = _2044;
    float _2174 = _2164 * _2160;
    float _2176 = precise::clamp(_2174, 0.0, 1.0);
    float _2178 = _2172;
    if (_1475)
    {
        bool _2180 = _1605 >= _1543;
        bool _2182 = isnan(_1605);
        bool _2184 = _2180 || _2182;
        bool _2186 = isnan(_1543);
        bool _2188 = _2184 || _2186;
        float _2190 = float(_2188);
        _2178 = _2190;
    }
    float _2192 = _2178;
    float _2194 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2196 = _2192;
    if (_1025)
    {
        _2170 = 1.0;
    }
    float _2198 = _2170;
    float _2200 = _2198;
    if (!_1025)
    {
        int _2202 = _1073 << 4;
        int _2204 = _2202 + 2048;
        uint _2206 = uint(int(uint(_2204) >> uint(2)));
        uint _2208 = uint(int(uint(int(_2206)) >> uint(2)));
        int _2210 = int(_2206) & 3;
        float _2212 = (*spvDescriptorSet0.vp_c15)._m0[int(_2208)][_2210];
        int _2214 = int(_2206) + 1;
        uint _2216 = uint(int(uint(_2214) >> uint(2)));
        int _2218 = _2214 & 3;
        float _2220 = (*spvDescriptorSet0.vp_c15)._m0[int(_2216)][_2218];
        int _2222 = _2204 + 8;
        uint _2224 = uint(int(uint(_2222) >> uint(2)));
        uint _2226 = uint(int(uint(int(_2224)) >> uint(2)));
        int _2228 = int(_2224) & 3;
        float _2230 = (*spvDescriptorSet0.vp_c15)._m0[int(_2226)][_2228];
        int _2232 = int(_2224) + 1;
        uint _2234 = uint(int(uint(_2232) >> uint(2)));
        int _2236 = _2232 & 3;
        float _2238 = (*spvDescriptorSet0.vp_c15)._m0[int(_2234)][_2236];
        float _2240 = _889 * _2220;
        float _2242 = fma(_591, _2212, _2240);
        float _2244 = fma(_581, _2230, _2242);
        float _2246 = _2244 + _2238;
        float _2248 = precise::clamp(_2246, 0.0, 1.0);
        float _2250 = -_2248;
        float _2252 = _2250 + _1599;
        float _2254 = fma(_2252, 500.0, 1.5);
        float _2256 = exp2(_2254);
        float _2258 = 0.0 + _2256;
        float _2260 = precise::clamp(_2258, 0.0, 1.0);
        _2200 = _2260;
    }
    float _2262 = _2200;
    float _2264 = _2194 * _1607;
    float _2266 = -_2176;
    float _2268 = fma(_2266, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2270 = -_2194;
    float _2272 = _2270 + 1.0;
    out.m_95.x = _2154;
    out.m_95.y = _2156;
    out.m_95.z = _2158;
    float _2274 = _1618 * _2264;
    float _2276 = _1628 * _2264;
    float _2278 = _1618 * _2272;
    out.m_97.x = _855;
    out.m_97.y = _853;
    out.m_97.z = _857;
    float _2280 = fma(_1624, _2274, _1612);
    float _2282 = fma(_1626, _2274, _1614);
    float _2284 = fma(_1618, _2276, _1616);
    bool _2286 = _975 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2288 = isnan(_975);
    bool _2290 = _2286 || _2288;
    bool _2292 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2294 = _2290 || _2292;
    float _2296 = _2192 * _2262;
    float _2298 = _2098 * _2152;
    out.m_99.x = _2280;
    out.m_99.y = _2282;
    out.m_99.z = _2284;
    out.m_99.w = _2278;
    float _2300 = -_2296;
    float _2302 = fma(_2300, _2268, 1.0);
    float _2304 = precise::clamp(_2302, 0.0, 1.0);
    float _2306 = _2298 * _2010;
    float _2308 = _2304 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2310 = _2306 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2312 = _2272;
    float _2314 = _2306;
    float _2316 = _2308;
    if (!_2294)
    {
        _2018 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2318 = _2018;
    out.m_101.x = _2308;
    float _2320 = _2318;
    float _2322 = _2318;
    if (!_2294)
    {
        _2196 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2324 = _2196;
    float _2326 = _2324;
    float _2328 = _2324;
    if (!_2294)
    {
        _2312 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2330 = _2312;
    float _2332 = _2330;
    float _2334 = _2330;
    if (!_2294)
    {
        _687 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2336 = _687;
    float _2338 = _2336;
    float _2340 = _2336;
    if (!_2294)
    {
        _2314 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2342 = _2314;
    float _2344 = _2342;
    float _2346 = _2342;
    if (!_2294)
    {
        _2316 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2348 = _2316;
    bool _2350 = !_2294;
    float _2352 = _2348;
    float _2354 = _2348;
    if (!_2350)
    {
        bool _2356 = _975 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2358 = isnan(_975);
        bool _2360 = _2356 || _2358;
        bool _2362 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2364 = _2360 || _2362;
        if (!_2364)
        {
            float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2368 = _975 + _2366;
            float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2372 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2370;
            float _2374 = 1.0 / _2372;
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2390 = _2388 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2396 = _2368 * _2374;
            float _2398 = precise::clamp(_2396, 0.0, 1.0);
            float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2404 = fma(_2398, _2378, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2406 = fma(_2398, _2402, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2408 = fma(_2398, _2382, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2410 = fma(_2398, _2386, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2412 = fma(_2398, _2390, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2414 = fma(_2398, _2394, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2328 = _2406;
            _2354 = _2412;
            _2322 = _2404;
            _2340 = _2410;
            _2334 = _2408;
            _2346 = _2414;
            _2416 = true;
        }
        else
        {
            bool _2418 = _975 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2420 = isnan(_975);
            bool _2422 = _2418 || _2420;
            bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2426 = _2422 || _2424;
            if (!_2426)
            {
                _2320 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2428 = _2320;
            _2322 = _2428;
            if (!_2426)
            {
                _2326 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2430 = _2326;
            _2328 = _2430;
            if (!_2426)
            {
                _2332 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2432 = _2332;
            _2334 = _2432;
            if (!_2426)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2434 = _2338;
            _2340 = _2434;
            if (!_2426)
            {
                _2352 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2436 = _2352;
            _2354 = _2436;
            if (!_2426)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2438 = _2344;
            bool _2440 = !_2426;
            _2346 = _2438;
            if (!_2440)
            {
                bool _2442 = _975 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2444 = isnan(_975);
                bool _2446 = _2442 || _2444;
                bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2450 = _2446 || _2448;
                if (!_2450)
                {
                    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2454 = _975 + _2452;
                    float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2458 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2456;
                    float _2460 = 1.0 / _2458;
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2476 = _2474 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2482 = _2454 * _2460;
                    float _2484 = precise::clamp(_2482, 0.0, 1.0);
                    float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2490 = fma(_2484, _2464, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2492 = fma(_2484, _2488, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2494 = fma(_2484, _2468, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2496 = fma(_2484, _2472, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2498 = fma(_2484, _2476, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2500 = fma(_2484, _2480, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2328 = _2492;
                    _2354 = _2498;
                    _2322 = _2490;
                    _2340 = _2496;
                    _2334 = _2494;
                    _2346 = _2500;
                    _2416 = true;
                }
                else
                {
                    _2328 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2354 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2322 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2334 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2416 = false;
    float _2502 = _2328;
    float _2504 = _2354;
    float _2506 = _2322;
    float _2508 = _2340;
    float _2510 = _2334;
    float _2512 = _2346;
    float _2514 = fma(_2156, -0.5, 0.5);
    float _2516 = precise::clamp(_2514, 0.0, 1.0);
    float _2518 = -_2502;
    float _2520 = _2518 + _2504;
    float _2522 = _2310 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2524 = -_2506;
    float _2526 = _2524 + _2508;
    out.m_103.x = 0.0;
    float _2528 = fma(_2516, _2520, _2502);
    float _2530 = fma(_2516, _2526, _2506);
    out.m_66.x = _2522;
    float _2532 = -_2510;
    float _2534 = _2532 + _2512;
    float _2536 = _2528 * 0.586610972881317138671875;
    bool _2538 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2540 = fma(_2516, _2534, _2510);
    float _2542 = fma(_2530, 0.298911988735198974609375, _2536);
    bool _2544 = _2098 > 0.0;
    bool _2546 = isnan(_2098);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan(0.0);
    bool _2552 = _2548 || _2550;
    out.m_105.x = 0.0;
    float _2554 = fma(_2540, 0.114477999508380889892578125, _2542);
    bool _2556 = _2152 <= 0.0;
    bool _2558 = !_2552;
    bool _2560 = _2556 || _2558;
    float _2562 = -_2554;
    float _2564 = _2530 + _2562;
    float _2566 = -_2554;
    float _2568 = _2528 + _2566;
    float _2570 = -_2554;
    float _2572 = _2540 + _2570;
    float _2574 = fma(_2564, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2554);
    float _2576 = fma(_2568, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2554);
    float _2578 = fma(_2572, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2554);
    bool _2580 = !_2538;
    if (!_2580)
    {
        float _2582 = -_853;
        float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2586 = -_855;
        float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2590 = -_857;
        float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2594 = _2584 * _2584;
        float _2596 = fma(_2588, _2588, _2594);
        float _2598 = fma(_2592, _2592, _2596);
        float _2600 = rsqrt(_2598);
        float _2602 = sqrt(_2598);
        float _2604 = _2584 * _2600;
        float _2606 = _2588 * _2600;
        float _2608 = _2592 * _2600;
        float _2610 = -_945;
        float _2612 = _2610 + _2604;
        float _2614 = -_909;
        float _2616 = _2614 + _2606;
        float _2618 = -_911;
        float _2620 = _2618 + _2608;
        float _2622 = _2612 * _2612;
        float _2624 = -_2602;
        float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2628 = fma(_2616, _2616, _2622);
        float _2630 = _2626 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2632 = precise::clamp(_2630, 0.0, 1.0);
        float _2634 = fma(_2620, _2620, _2628);
        float _2636 = abs(_2632);
        float _2638 = log2(_2636);
        float _2640 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2642 = precise::clamp(_2640, 0.0, 1.0);
        float _2644 = rsqrt(_2634);
        float _2646 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2648 = exp2(_2646);
        float _2650 = _2612 * _2644;
        float _2652 = _2616 * _2644;
        float _2654 = _2620 * _2644;
        float _2656 = _2642 * _2642;
        float _2658 = _2156 * _2650;
        float _2660 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2662 = _2156 * _2604;
        float _2664 = _2656 + (-1.0);
        float _2666 = fma(_2154, _2652, _2658);
        float _2668 = -_2604;
        float _2670 = -_2660;
        float _2672 = fma(_2668, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2670);
        float _2674 = fma(_2154, _2606, _2662);
        float _2676 = fma(_2158, _2654, _2666);
        float _2678 = precise::clamp(_2676, 0.0, 1.0);
        float _2680 = -_2608;
        float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2672);
        float _2684 = fma(_2158, _2608, _2674);
        float _2686 = precise::clamp(_2684, 0.0, 1.0);
        float _2688 = _2678 * _2678;
        float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2692 = _2682 + _2690;
        float _2694 = fma(_2688, _2664, 1.0);
        float _2696 = _2694 * _2694;
        float _2698 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2700 = precise::clamp(_2698, 0.0, 1.0);
        float _2702 = 1.0 / _2696;
        float _2704 = _2648 * _2700;
        float _2706 = _2686 * _2704;
        float _2708 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2710 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2712 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2714 = _2656 * _2702;
        out.m_103.x = _2708;
        out.m_103.y = _2710;
        out.m_103.z = _2712;
        float _2716 = _2706 * _2714;
        float _2718 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2720 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2722 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _2718;
        out.m_105.y = _2720;
        out.m_105.z = _2722;
    }
    out.m_107.x = _2574;
    out.m_107.y = _2576;
    out.m_107.z = _2578;
    if (!_2560)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_66.x = 0.0;
    float _2724 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2724;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2416 = false;
    bool _472 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_63.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_66.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2781 = as_type<float>(_142);
        out.gl_Position.z = _2781;
    }
    if (!_130)
    {
        return out;
    }
    float _146 = in.m_68.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_156)
    {
        float _162 = float(_126);
        _136 = _162;
    }
    float _164 = _136;
    bool _166 = _160 >= _164;
    bool _168 = !_156;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_66.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _144 = as_type<int>(_176);
    }
    int _178 = _144;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2850 = as_type<float>(_178);
        out.gl_Position.z = _2850;
    }
    if (_170)
    {
        return out;
    }
    float _180 = in.m_70.x;
    float _182 = in.m_70.y;
    float _184 = in.m_70.z;
    float _186 = in.m_72.x;
    float _188 = in.m_72.y;
    float _190 = in.m_72.z;
    float _192 = in.m_74.x;
    float _194 = in.m_74.y;
    float _196 = in.m_74.z;
    float _198 = _180 * _180;
    float _200 = _182 * _182;
    float _202 = _184 * _184;
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    bool _222 = _216 > 0.0;
    bool _224 = _218 > 0.0;
    float _226 = _218;
    float _228 = _216;
    float _230 = _210;
    float _232 = _212;
    if (_222)
    {
        float _234 = rsqrt(_210);
        _226 = _234;
    }
    float _236 = _226;
    float _238 = 0.0;
    if (!_222)
    {
        _238 = 0.0;
    }
    float _240 = _238;
    bool _242 = _220 > 0.0;
    float _244 = 0.0;
    float _246 = _220;
    float _248 = _240;
    if (!_222)
    {
        _244 = 0.0;
    }
    float _250 = _244;
    float _252 = 0.0;
    float _254 = _250;
    if (!_222)
    {
        _252 = 0.0;
    }
    float _256 = _252;
    float _258 = 0.0;
    float _260 = _256;
    if (_224)
    {
        float _262 = rsqrt(_212);
        _258 = _262;
    }
    float _264 = _258;
    if (!_224)
    {
        _246 = 0.0;
    }
    float _266 = _246;
    float _268 = 0.0;
    float _270 = _266;
    if (!_224)
    {
        _268 = 0.0;
    }
    float _272 = _268;
    float _274 = _272;
    if (!_224)
    {
        _228 = 0.0;
    }
    float _276 = _228;
    float _278 = 0.0;
    float _280 = _276;
    if (_242)
    {
        float _282 = rsqrt(_214);
        _278 = _282;
    }
    float _284 = _278;
    if (_222)
    {
        float _286 = _236 * _186;
        _248 = _286;
    }
    float _288 = _248;
    if (_222)
    {
        float _290 = _236 * _180;
        _254 = _290;
    }
    float _292 = _254;
    if (_222)
    {
        float _294 = _236 * _192;
        _260 = _294;
    }
    float _296 = _260;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _300 = 0.0;
    if (!_242)
    {
        _300 = 0.0;
    }
    float _302 = _300;
    float _304 = _302;
    if (!_242)
    {
        _230 = 0.0;
    }
    float _306 = _230;
    float _308 = _306;
    if (_224)
    {
        float _310 = _264 * _188;
        _270 = _310;
    }
    float _312 = _270;
    if (!_242)
    {
        _232 = 0.0;
    }
    float _314 = _232;
    float _316 = _314;
    if (_224)
    {
        float _318 = _264 * _182;
        _274 = _318;
    }
    float _320 = _274;
    if (_224)
    {
        float _322 = _264 * _194;
        _280 = _322;
    }
    float _324 = _280;
    if (_242)
    {
        float _326 = _284 * _190;
        _304 = _326;
    }
    float _328 = _304;
    if (_242)
    {
        float _330 = _284 * _184;
        _308 = _330;
    }
    float _332 = _308;
    if (_242)
    {
        float _334 = _284 * _196;
        _316 = _334;
    }
    float _336 = _316;
    bool _338 = !_298;
    float _356;
    if (!_338)
    {
        float _340 = in.m_76.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_126);
        float _362 = 1.0 / _360;
        float _364 = _160 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = in.m_76.x;
    float _370 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _374 = _366 + _372;
    bool _376 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _378 = isnan(_366);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _388;
    bool _392 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _394 = 1.0 / _390;
    float _396 = _370 * _368;
    float _398 = -_386;
    float _400 = _398 + 1.0;
    float _402 = _374 * _394;
    bool _404 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _406 = isnan(_366);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _420;
    float _424 = trunc(_396);
    int _426 = int(_424);
    float _428 = _414 * _400;
    float _430 = fma(_418, _402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _432 = fma(_422, _402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _434 = -_414;
    float _436 = _434 + 1.0;
    float _438 = _430 * _428;
    float _440 = _432 * _428;
    float _442 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[143].x, _438);
    float _444 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[143].y, _440);
    float _446 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[144].x, _442);
    float _448 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[144].y, _444);
    int _450 = _426 << 4;
    int _452 = _450 + 1712;
    bool _454 = !_392;
    float _470;
    if (!_454)
    {
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _368 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_126);
        float _476 = 1.0 / _474;
        float _478 = _160 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = in.m_78.w;
    float _484 = as_type<float>(int(gl_VertexIndex));
    float _486 = in.m_83.x;
    float _488 = in.m_83.y;
    float _490 = in.m_63.x;
    float _492 = in.m_63.y;
    float _494 = in.m_63.z;
    float _496 = in.m_74.w;
    float _498 = trunc(_482);
    int _500 = int(_498);
    int _502 = _500 << 5;
    uint _505 = uint(int(uint(_502) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_505)];
    float _507 = as_type<float>(_dmw0.x);
    int _509 = _502 + 4;
    uint _511 = uint(int(uint(_509) >> uint(2)));
    float _513 = as_type<float>(_dmw0.y);
    int _515 = _502 + 8;
    uint _517 = uint(int(uint(_515) >> uint(2)));
    float _519 = as_type<float>(_dmw0.z);
    int _521 = _502 + 12;
    uint _523 = uint(int(uint(_521) >> uint(2)));
    float _525 = as_type<float>(_dmw0.w);
    int _527 = as_type<int>(_484) & 1;
    bool _529 = _527 != 0;
    int _531 = as_type<int>(_484) & 2;
    bool _533 = _531 != 0;
    float _535 = _446 * _486;
    float _537 = in.m_72.w;
    float _539 = _194 * _492;
    float _541 = _188 * _492;
    bool _543 = !_529;
    float _545 = _543 ? (-0.5) : 0.5;
    float _547 = _448 * _488;
    float _549 = fma(_192, _490, _539);
    bool _551 = !_533;
    float _553 = _551 ? (-0.5) : 0.5;
    float _555 = _535 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _545);
    float _559 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _561 = fma(_186, _490, _541);
    float _563 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _565 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _553);
    float _567 = _555 * _557;
    float _569 = _559 * _324;
    float _571 = fma(_196, _494, _549);
    float _573 = _563 * _565;
    float _575 = _559 * _312;
    float _577 = fma(_567, _296, _569);
    float _579 = fma(_190, _494, _561);
    float _581 = _571 + _496;
    float _583 = fma(_567, _288, _575);
    float _585 = -_573;
    float _587 = fma(_585, _336, _577);
    float _589 = _182 * _492;
    float _591 = _579 + _537;
    float _593 = -_573;
    float _595 = fma(_593, _328, _583);
    float _597 = _581 + _587;
    float _599 = in.m_70.w;
    float _601 = fma(_180, _490, _589);
    float _603 = _591 + _595;
    float _605 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _607 = _597 + _605;
    float _609 = _559 * _320;
    float _611 = fma(_184, _494, _601);
    float _613 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _615 = _603 + _613;
    float _617 = _607 * _607;
    float _619 = fma(_567, _292, _609);
    float _621 = fma(_615, _615, _617);
    float _623 = -_573;
    float _625 = fma(_623, _332, _619);
    bool _627 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _629 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _631 = _627 || _629;
    bool _633 = isnan(0.5);
    bool _635 = _631 || _633;
    float _637 = sqrt(_621);
    float _639 = _611 + _599;
    float _641 = _639 + _625;
    bool _643 = _637 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _645 = _525 * 2.0;
    float _647 = _507 * 2.0;
    float _649 = _513 * 2.0;
    float _651 = _507 * _507;
    float _653 = _519 * _645;
    float _655 = _513 * _645;
    float _657 = _507 * _645;
    float _659 = _519 * _519;
    float _661 = -_653;
    float _663 = fma(_513, _647, _661);
    float _665 = fma(_519, _647, _655);
    float _667 = -_657;
    float _669 = fma(_519, _649, _667);
    float _671 = fma(_513, _647, _653);
    float _673 = -_655;
    float _675 = fma(_519, _647, _673);
    float _677 = fma(_519, _649, _657);
    float _679 = _513 * _513;
    float _681 = _507;
    float _683 = _647;
    float _685 = _657;
    float _687 = _591;
    if (!_643)
    {
        _681 = _603;
    }
    float _689 = _681;
    float _691 = _689;
    if (!_643)
    {
        _683 = _597;
    }
    float _693 = _683;
    float _695 = _693;
    if (!_643)
    {
        _685 = _641;
    }
    float _697 = _685;
    bool _699 = !_643;
    float _701 = _697;
    if (!_699)
    {
        float _703 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _705 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _707 = _637 + _705;
        float _709 = _641 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _711 = rsqrt(_621);
        float _713 = _707 * _703;
        float _715 = _713 * 0.15915493667125701904296875;
        float _717 = _715 * 6.283185482025146484375;
        float _719 = cos(_717);
        float _721 = _715 * 6.283185482025146484375;
        float _723 = sin(_721);
        float _725 = _719 + (-1.0);
        float _727 = _725 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _729 = fma(_723, _709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _731 = fma(_641, _719, _727);
        float _733 = _711 * _729;
        float _735 = fma(_615, _733, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _737 = fma(_607, _733, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _701 = _731;
        _691 = _735;
        _695 = _737;
    }
    float _739 = _701;
    float _741 = _691;
    float _743 = _695;
    float _745 = -_639;
    float _747 = _745 + _739;
    float _749 = -_591;
    float _751 = _749 + _741;
    float _753 = fma(_679, -2.0, 1.0);
    float _755 = -_581;
    float _757 = _755 + _743;
    float _759 = _747 * _320;
    float _761 = fma(_651, -2.0, 1.0);
    float _763 = _747 * _292;
    float _765 = fma(_659, -2.0, _753);
    float _767 = fma(_751, _312, _759);
    float _769 = fma(_659, -2.0, _761);
    float _771 = _747 * _332;
    float _773 = fma(_751, _288, _763);
    float _775 = fma(_757, _324, _767);
    float _777 = fma(_679, -2.0, _761);
    float _779 = fma(_751, _328, _771);
    float _781 = fma(_757, _296, _773);
    float _783 = _775 * _663;
    float _785 = _775 * _769;
    float _787 = _775 * _677;
    float _789 = fma(_757, _336, _779);
    float _791 = fma(_781, _765, _783);
    float _793 = fma(_781, _671, _785);
    float _795 = fma(_781, _675, _787);
    float _797 = fma(_789, _665, _791);
    float _799 = fma(_789, _669, _793);
    float _801 = fma(_789, _777, _795);
    float _803 = _591 + _797;
    float _805 = _639 + _799;
    float _807 = _581 + _801;
    float _809 = _805;
    float _811 = _803;
    float _813 = _807;
    if (!_635)
    {
        float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _817 = _639 + _815;
        float _819 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _821 = _591 + _819;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _825 = _817 * _817;
        float _827 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _829 = _581 + _827;
        float _831 = fma(_821, _821, _825);
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _835 = fma(_829, _829, _831);
        float _837 = sqrt(_835);
        float _839 = _823 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _841 = precise::min(_837, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _843 = _841 * _833;
        float _845 = _839 * _843;
        float _847 = fma(_797, _845, _591);
        float _849 = fma(_799, _845, _639);
        float _851 = fma(_801, _845, _581);
        _809 = _849;
        _811 = _847;
        _813 = _851;
    }
    float _853 = _809;
    float _855 = _811;
    float _857 = _813;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _861 = _853 + _859;
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _865 = _855 + _863;
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _869 = _857 + _867;
    float _871 = _639 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _873 = _861 * _861;
    float _875 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[11].x, _871);
    float _877 = fma(_865, _865, _873);
    float _879 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[11].z, _875);
    float _881 = fma(_869, _869, _877);
    float _883 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _885 = _879 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _887 = rsqrt(_881);
    float _889 = _639 + _883;
    float _891 = _639 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _893 = _889 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _895 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[10].x, _891);
    float _897 = 1.0 / _885;
    float _899 = fma(_591, (*spvDescriptorSet0.vp_c15)._m0[126].x, _893);
    float _901 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[10].z, _895);
    float _903 = fma(_591, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _905 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[126].z, _899);
    float _907 = _901 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _909 = _865 * _887;
    float _911 = _869 * _887;
    float _913 = _905 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _915 = _889 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _917 = _909 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _919 = _911 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _921 = _907 + _885;
    float _923 = _917 * _917;
    float _925 = _919 * _919;
    float _927 = fma(_591, (*spvDescriptorSet0.vp_c15)._m0[127].x, _915);
    float _929 = _921 * _897;
    float _931 = _929 * 0.5;
    float _933 = trunc(_913);
    int _935 = int(_933);
    float _937 = _923 + _925;
    float _939 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[127].z, _927);
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[30].w, _941);
    float _945 = _861 * _887;
    float _947 = _939 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _949 = sqrt(_937);
    float _951 = 1.0 / _943;
    int _953 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _955 = _935 + _953;
    int _957 = _955 + 1;
    bool _959 = _957 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _961 = trunc(_947);
    int _963 = int(_961);
    bool _965 = _949 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _967 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = _949 + _967;
    float _971 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _973 = _951 * _971;
    float _975 = sqrt(_881);
    bool _977 = _973 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _979 = _973 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    int _981 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _983 = _963 + _981;
    int _985 = _983 + 1;
    float _987 = 0.0;
    float _989 = _951;
    int _991 = 2;
    float _993 = _969;
    int _995 = _985;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[652].y);
    float _999 = _917;
    float _1001 = _919;
    float _1003 = _947;
    if (_965)
    {
        float _1005 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _987 = _1005;
    }
    float _1007 = _987;
    int _1009 = _957 | _985;
    bool _1011 = _1009 < 0;
    bool _1013 = _1011 || _959;
    if (_965)
    {
        float _1015 = rsqrt(_937);
        _989 = _1015;
    }
    float _1017 = _989;
    bool _1019 = !_977;
    int _1021 = _1019 ? 0 : 1;
    bool _1023 = _985 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1025 = _1023 || _1013;
    float _1027 = _1017;
    if (!_977)
    {
        _991 = 1;
    }
    int _1029 = _991;
    int _1031 = _1029;
    if (!_979)
    {
        _1031 = _1021;
    }
    int _1033 = _1031;
    if (_965)
    {
        float _1035 = _969 * _1007;
        _993 = _1035;
    }
    float _1037 = _993;
    float _1039 = floor(_903);
    int _1041 = _1033 << 6;
    float _1043 = 0.0;
    if (_965)
    {
        float _1045 = _1037 * 0.15915493667125701904296875;
        _1043 = _1045;
    }
    float _1047 = _1043;
    float _1049 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1051 = _1041 + 48;
    uint _1053 = uint(int(uint(_1051) >> uint(2)));
    uint _1055 = uint(int(uint(int(_1053)) >> uint(2)));
    int _1057 = int(_1053) & 3;
    float _1059 = (*spvDescriptorSet0.vp_c15)._m0[int(_1055)][_1057];
    int _1061 = int(_1053) + 1;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    int _1065 = _1061 & 3;
    float _1067 = (*spvDescriptorSet0.vp_c15)._m0[int(_1063)][_1065];
    if (!_1025)
    {
        int _1069 = _985 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1071 = _1069 + _957;
        _995 = _1071;
    }
    int _1073 = _995;
    int _1075 = 0;
    if (_965)
    {
        float _1077 = _1047 * 6.283185482025146484375;
        float _1079 = sin(_1077);
        _1075 = as_type<int>(_1079);
    }
    int _1081 = _1075;
    float _1083 = precise::max(0.0, _1049);
    int _1085 = _1041 + 96;
    uint _1087 = uint(int(uint(_1085) >> uint(2)));
    uint _1089 = uint(int(uint(int(_1087)) >> uint(2)));
    int _1091 = int(_1087) & 3;
    float _1093 = (*spvDescriptorSet0.vp_c15)._m0[int(_1089)][_1091];
    int _1095 = int(_1087) + 1;
    uint _1097 = uint(int(uint(_1095) >> uint(2)));
    int _1099 = _1095 & 3;
    float _1101 = (*spvDescriptorSet0.vp_c15)._m0[int(_1097)][_1099];
    float _1103 = -_945;
    float _1105 = -_1083;
    float _1107 = fma(_1103, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1105);
    float _1109 = 0.0;
    float _1111 = _1107;
    if (_965)
    {
        float _1113 = _1047 * 6.283185482025146484375;
        float _1115 = cos(_1113);
        _1109 = _1115;
    }
    float _1117 = _1109;
    float _1119 = -_1039;
    float _1121 = _903 + _1119;
    float _1123 = 0.0;
    if (_965)
    {
        float _1125 = _1107 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1123 = _1125;
    }
    float _1127 = _1123;
    int _1129 = _1041 + 64;
    uint _1131 = uint(int(uint(_1129) >> uint(2)));
    uint _1133 = uint(int(uint(int(_1131)) >> uint(2)));
    int _1135 = int(_1131) & 3;
    float _1137 = (*spvDescriptorSet0.vp_c15)._m0[int(_1133)][_1135];
    int _1139 = int(_1131) + 1;
    uint _1141 = uint(int(uint(_1139) >> uint(2)));
    int _1143 = _1139 & 3;
    float _1145 = (*spvDescriptorSet0.vp_c15)._m0[int(_1141)][_1143];
    float _1147 = 0.0;
    int _1149 = _1081;
    if (_965)
    {
        float _1151 = fma(as_type<float>(_1081), _1127, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1147 = _1151;
    }
    float _1153 = _1147;
    float _1155 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_1025)
    {
        int _1157 = _1073 << 2;
        _997 = _1157;
    }
    int _1159 = _997;
    int _1161 = _1159;
    if (!_1025)
    {
        uint _1163 = uint(int(uint(_1073) >> uint(2)));
        _1149 = int(_1163);
    }
    int _1165 = _1149;
    int _1167 = _1041 + 104;
    uint _1169 = uint(int(uint(_1167) >> uint(2)));
    uint _1171 = uint(int(uint(int(_1169)) >> uint(2)));
    int _1173 = int(_1169) & 3;
    float _1175 = (*spvDescriptorSet0.vp_c15)._m0[int(_1171)][_1173];
    int _1177 = int(_1169) + 1;
    uint _1179 = uint(int(uint(_1177) >> uint(2)));
    int _1181 = _1177 & 3;
    float _1183 = (*spvDescriptorSet0.vp_c15)._m0[int(_1179)][_1181];
    float _1185 = as_type<float>(_1165);
    if (!_1025)
    {
        int _1187 = 12 & _1159;
        _1161 = _1187;
    }
    int _1189 = _1161;
    float _1191 = as_type<float>(_1189);
    if (_965)
    {
        float _1193 = _1017 * _1153;
        _1027 = _1193;
    }
    float _1195 = _1027;
    float _1197 = 0.0;
    if (_965)
    {
        float _1199 = _1117 + (-1.0);
        _1197 = _1199;
    }
    float _1201 = _1197;
    float _1203 = floor(_1155);
    int _1205 = as_type<int>(_1201);
    if (_965)
    {
        float _1207 = _917 * _1195;
        _999 = _1207;
    }
    float _1209 = _999;
    float _1211 = 0.0;
    if (_965)
    {
        float _1213 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1211 = _1213;
    }
    float _1215 = _1211;
    int _1217 = _1041 + 56;
    uint _1219 = uint(int(uint(_1217) >> uint(2)));
    uint _1221 = uint(int(uint(int(_1219)) >> uint(2)));
    int _1223 = int(_1219) & 3;
    float _1225 = (*spvDescriptorSet0.vp_c15)._m0[int(_1221)][_1223];
    int _1227 = int(_1219) + 1;
    uint _1229 = uint(int(uint(_1227) >> uint(2)));
    int _1231 = _1227 & 3;
    float _1233 = (*spvDescriptorSet0.vp_c15)._m0[int(_1229)][_1231];
    if (!_1025)
    {
        int _1235 = _1165 << 4;
        int _1237 = _1235 + _1189;
        _1205 = _1237;
    }
    int _1239 = _1205;
    if (_965)
    {
        float _1241 = _919 * _1195;
        _1001 = _1241;
    }
    float _1243 = _1001;
    if (!_965)
    {
        _1191 = _923;
    }
    float _1245 = _1191;
    float _1247 = _1245;
    if (_965)
    {
        float _1249 = fma(_1107, _1117, _1215);
        _1111 = _1249;
    }
    float _1251 = _1111;
    if (_965)
    {
        float _1253 = _1209 * _1209;
        _1247 = _1253;
    }
    float _1255 = _1247;
    if (!_965)
    {
        _1185 = _925;
    }
    float _1257 = _1185;
    float _1259 = _1257;
    if (_965)
    {
        float _1261 = _1243 * _1243;
        _1259 = _1261;
    }
    float _1263 = _1259;
    int _1265 = _1041 + 72;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    uint _1269 = uint(int(uint(int(_1267)) >> uint(2)));
    int _1271 = int(_1267) & 3;
    float _1273 = (*spvDescriptorSet0.vp_c15)._m0[int(_1269)][_1271];
    int _1275 = int(_1267) + 1;
    uint _1277 = uint(int(uint(_1275) >> uint(2)));
    int _1279 = _1275 & 3;
    float _1281 = (*spvDescriptorSet0.vp_c15)._m0[int(_1277)][_1279];
    float _1283 = fma(_1251, _1251, _1255);
    float _1285 = _1117;
    if (!_1025)
    {
        float _1287 = floor(_913);
        _1285 = _1287;
    }
    float _1289 = _1285;
    float _1291 = -_1203;
    float _1293 = _1155 + _1291;
    float _1295 = _1283 + _1263;
    int _1297 = _1041 + 80;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    uint _1301 = uint(int(uint(int(_1299)) >> uint(2)));
    int _1303 = int(_1299) & 3;
    float _1305 = (*spvDescriptorSet0.vp_c15)._m0[int(_1301)][_1303];
    int _1307 = int(_1299) + 1;
    uint _1309 = uint(int(uint(_1307) >> uint(2)));
    int _1311 = _1307 & 3;
    float _1313 = (*spvDescriptorSet0.vp_c15)._m0[int(_1309)][_1311];
    float _1315 = _889 * _1067;
    float _1317 = rsqrt(_1295);
    float _1319 = _889 * _1101;
    float _1321 = fma(_591, _1059, _1315);
    float _1323 = _925;
    float _1325 = _1315;
    if (!_1025)
    {
        int _1327 = _1239 + 400;
        uint _1329 = uint(int(uint(_1327) >> uint(2)));
        uint _1331 = uint(int(uint(int(_1329)) >> uint(2)));
        int _1333 = int(_1329) & 3;
        float _1335 = (*spvDescriptorSet0.vp_c15)._m0[int(_1331)][_1333];
        _1323 = _1335;
    }
    float _1337 = _1323;
    float _1339 = fma(_591, _1093, _1319);
    if (!_1025)
    {
        float _1341 = floor(_947);
        _1325 = _1341;
    }
    float _1343 = _1325;
    float _1345 = _1289;
    if (!_1025)
    {
        float _1347 = -_1289;
        float _1349 = _913 + _1347;
        _1345 = _1349;
    }
    float _1351 = _1345;
    float _1353 = _889 * _1145;
    float _1355 = _1317 * _1209;
    float _1357 = fma(_591, _1137, _1353);
    float _1359 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1361 = fma(_581, _1175, _1339);
    float _1363 = _1361 + _1183;
    float _1365 = fma(_581, _1225, _1321);
    float _1367 = _853 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1369 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1371 = _1365 + _1233;
    float _1373 = 1.0 / _1363;
    float _1375 = fma(_581, _1273, _1357);
    float _1377 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1367);
    int _1379 = _1041 + 88;
    uint _1381 = uint(int(uint(_1379) >> uint(2)));
    uint _1383 = uint(int(uint(int(_1381)) >> uint(2)));
    int _1385 = int(_1381) & 3;
    float _1387 = (*spvDescriptorSet0.vp_c15)._m0[int(_1383)][_1385];
    int _1389 = int(_1381) + 1;
    uint _1391 = uint(int(uint(_1389) >> uint(2)));
    int _1393 = _1389 & 3;
    float _1395 = (*spvDescriptorSet0.vp_c15)._m0[int(_1391)][_1393];
    float _1397 = _1375 + _1281;
    float _1399 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1377);
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1403 = fma(_975, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1401);
    float _1405 = precise::clamp(_1403, 0.0, 1.0);
    float _1407 = _1317 * _1251;
    float _1409 = _1317 * _1243;
    float _1411 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1413 = -_1405;
    float _1415 = _1413 + 1.0;
    float _1417 = -_1359;
    float _1419 = fma(_1407, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1417);
    float _1421 = _853 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1423 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1425 = _1371 * _1373;
    float _1427 = _889 * _1313;
    float _1429 = _853 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1431 = -_1423;
    float _1433 = fma(_1431, _1369, 1.0);
    float _1435 = _853 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1437 = abs(_1415);
    float _1439 = log2(_1437);
    bool _1441 = _1425 >= 0.0;
    float _1443 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1429);
    float _1445 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1435);
    float _1447 = _1397 * _1373;
    bool _1449 = _1425 <= 1.0;
    bool _1451 = _1449 && _1441;
    float _1453 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1443);
    float _1455 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1445);
    float _1457 = -_1409;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1419);
    float _1461 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1421);
    bool _1463 = _1447 >= 0.0;
    bool _1465 = _1463 && _1451;
    float _1467 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1469 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1471 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1461);
    bool _1473 = _1447 <= 1.0;
    bool _1475 = _1473 && _1465;
    float _1477 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1479 = fma(_1459, -0.5, 0.5);
    float _1481 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1483 = fma(_591, _1305, _1427);
    float _1485 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1477);
    float _1487 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1489 = log2(_1433);
    float _1491 = fma(_1459, 0.5, 0.5);
    float _1493 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1485);
    float _1495 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1493);
    float _1497 = sqrt(_1479);
    float _1499 = fma(_581, _1387, _1483);
    float _1501 = fma(_1491, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1503 = 0.0187292993068695068359375;
    if (!_1025)
    {
        float _1505 = -_1343;
        float _1507 = _947 + _1505;
        _1503 = _1507;
    }
    float _1509 = _1503;
    float _1511 = exp2(_1481);
    float _1513 = _1499 + _1395;
    if (_1475)
    {
        float _1515 = float(_1033);
        _1003 = _1515;
    }
    float _1517 = _1003;
    float _1519 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1521 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1523 = fma(_1491, _1501, -0.212114393711090087890625);
    float _1525 = _1489 * 0.693147182464599609375;
    float _1527 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1519);
    float _1529 = 1.0 / _1495;
    float _1531 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1521);
    float _1533 = fma(_1491, _1523, 1.570728778839111328125);
    float _1535 = _1407 + 1.0;
    float _1537 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1527);
    float _1539 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1531);
    float _1541 = _1497 * 0.636619746685028076171875;
    float _1543 = _1513 * _1373;
    float _1545 = _1337;
    if (!_1025)
    {
        float _1547 = rint(_1337);
        float _1549 = precise::max(_1547, 0.0);
        uint _1551 = uint(_1549);
        uint _1553 = clamp(_1551, 0u, 65535u);
        _1545 = as_type<float>(_1553);
    }
    float _1555 = _1545;
    float _1557 = -_1407;
    float _1559 = fma(_1511, _1535, _1557);
    float _1561 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1537);
    float _1563 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1539);
    float _1565 = -_1533;
    float _1567 = fma(_1541, _1565, 1.0);
    float _1569 = _1525 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1571 = fma(_1559, 0.5, 0.5);
    float _1573 = _1517;
    if (_1475)
    {
        float _1575 = rint(_1517);
        float _1577 = precise::max(_1575, 0.0);
        uint _1579 = uint(_1577);
        uint _1581 = clamp(_1579, 0u, 65535u);
        _1573 = as_type<float>(_1581);
    }
    float _1583 = _1573;
    float _1585 = _1561 * _1529;
    float _1587 = _1563 * _1529;
    float2 _5093 = float2(_1121, _1293);
    float _1589 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5093, float2(0.0), isnan(_5093)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5093, float2(0.0), isnan(_5093)), level(0.0)).x;
    float _1591 = fma(_1585, 0.5, 0.5);
    float _1593 = fma(_1587, -0.5, 0.5);
    float _1595 = _1555;
    if (!_1025)
    {
        float3 _5114 = float3(_1351, _1509, float(as_type<int>(_1555)));
        float3 _5118 = select(_5114, float3(0.0), isnan(_5114));
        float _1597 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5118.xy, uint(rint(_5118.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5118.xy, uint(rint(_5118.z)), level(0.0)).x;
        _1595 = _1597;
    }
    float _1599 = _1595;
    float _1601 = _1583;
    if (_1475)
    {
        float3 _5133 = float3(_1425, _1447, float(as_type<int>(_1583)));
        float3 _5135 = select(_5133, float3(0.0), isnan(_5133));
        float _1603 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5135.xy, uint(rint(_5135.z)), _1543, level(0.0));
        _1601 = _1603;
    }
    float _1605 = _1601;
    float3 _5145 = float3(_1591, _1593, _1569);
    float _1607 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5145, float3(0.0), isnan(_5145)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5145, float3(0.0), isnan(_5145)), level(0.0)).x;
    float3 _5154 = float3(_1591, _1593, _1569);
    float4 _1610 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5154, float3(0.0), isnan(_5154)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5154, float3(0.0), isnan(_5154)), level(0.0)).xyzw;
    float _1612 = _1610.x;
    float _1614 = _1610.y;
    float _1616 = _1610.z;
    float _1618 = _1610.w;
    float2 _5170 = float2(_1567, _1571);
    float3 _1622 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5170, float2(0.0), isnan(_5170)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5170, float2(0.0), isnan(_5170)), level(0.0)).xyz;
    float _1624 = _1622.x;
    float _1626 = _1622.y;
    float _1628 = _1622.z;
    float _1630 = in.m_76.y;
    float _1632 = _545 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1634 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1636 = _368 > 0.5;
    float _1638 = fma(_1632, _296, _324);
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1646 = _1644 != 0;
    float _1648 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1634);
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1652 = _1650 != 0;
    out.m_85.x = _865;
    out.m_85.y = _861;
    out.m_85.z = _869;
    float _1654 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1656 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan(0.5);
    bool _1664 = _1660 || _1662;
    bool _1666 = _1630 > 0.5;
    float _1668 = 1.0 / _1642;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1672 = _1670 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1674 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1648);
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1678 = _1676 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1680 = 1.0 / _1672;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1684 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1686 = _1682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1690 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1688);
    float _1692 = 1.0 / _1678;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1696 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1694);
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1704 = _1702 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1710;
    bool _1714 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1716 = isnan(_480);
    bool _1718 = _1714 || _1716;
    bool _1720 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1722 = _1718 || _1720;
    float _1724 = float(_1722);
    float _1726 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1728 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1730 = _1700 * _1668;
    float _1732 = fma(_1632, _288, _312);
    float _1734 = fma(_1632, _292, _320);
    bool _1736 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1738 = isnan(_480);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1744 = _1740 || _1742;
    float _1746 = float(_1744);
    out.m_87.x = _1726;
    out.m_87.y = _1728;
    out.m_87.z = _1686;
    float _1748 = -_1724;
    float _1750 = _1748 + 1.0;
    float _1752 = _1712 * _1692;
    bool _1754 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1756 = isnan(_480);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    float _1766 = _1704 * _1680;
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1770 = _480 + _1768;
    int _1772 = _452 + 8;
    uint _1774 = uint(int(uint(_1772) >> uint(2)));
    uint _1776 = uint(int(uint(int(_1774)) >> uint(2)));
    int _1778 = int(_1774) & 3;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[int(_1776)][_1778];
    float _1782 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1696);
    float _1784 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1674);
    float _1786 = _581 + _1782;
    float _1788 = -_1764;
    float _1790 = _1788 + 1.0;
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1794 = _480 + _1792;
    uint _1796 = uint(int(uint(_452) >> uint(2)));
    uint _1798 = uint(int(uint(int(_1796)) >> uint(2)));
    int _1800 = int(_1796) & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    int _1804 = int(_1796) + 1;
    uint _1806 = uint(int(uint(_1804) >> uint(2)));
    int _1808 = _1804 & 3;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[int(_1806)][_1808];
    out.gl_Position.x = _1561;
    out.gl_Position.y = _1563;
    out.gl_Position.z = _1784;
    out.gl_Position.w = _1495;
    float _1812 = _1724 * _1790;
    bool _1814 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1816 = isnan(_480);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1822 = _1818 || _1820;
    float _1824 = float(_1822);
    float _1826 = _1746 * _1750;
    float _1828 = -_1746;
    float _1830 = _1828 + 1.0;
    float _1832 = fma(_1730, _1794, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1834 = fma(_1766, _1770, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1836 = -_545;
    int _1838 = _1636 ? as_type<int>(_1836) : as_type<int>(_545);
    float _1840 = _1824 * _1830;
    float _1842 = -_553;
    int _1844 = _1666 ? as_type<int>(_1842) : as_type<int>(_553);
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1848 = _480 + _1846;
    bool _1850 = !_1646;
    float _1852 = _1850 ? _545 : as_type<float>(_1838);
    float _1854 = _553 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1856 = !_1652;
    float _1858 = _1856 ? _553 : as_type<float>(_1844);
    float _1860 = fma(_1752, _1848, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1862 = abs(_973);
    float _1864 = log2(_1862);
    float _1866 = _1832 * _1840;
    float _1868 = -_1824;
    float _1870 = _1868 + 1.0;
    bool _1872 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1874 = isnan(0.0);
    bool _1876 = _1872 || _1874;
    bool _1878 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1880 = _1876 || _1878;
    float _1882 = _1852 + 0.5;
    float _1884 = -_1858;
    float _1886 = _1884 + 0.5;
    float _1888 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1866);
    float _1890 = -_1854;
    float _1892 = fma(_1890, _328, _1732);
    float _1894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1896 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1898 = fma(_1834, _1826, _1888);
    float _1900 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1690);
    float _1902 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1904 = -_1786;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1908 = fma(_1860, _1812, _1898);
    float _1910 = _591 + _1900;
    float _1912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1914 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1916 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_1880)
    {
        float _1918 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1916 = _1918;
    }
    float _1920 = _1916;
    float _1922 = -_1910;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1926 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1908);
    float _1928 = precise::min(_1786, _1906);
    float _1930 = _1920;
    if (_1880)
    {
        float _1932 = precise::min(_1920, 20.0);
        _1930 = _1932;
    }
    float _1934 = _1930;
    float _1936 = exp2(_1914);
    float _1938 = _1896 * _1894;
    float _1940 = _1780 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1942 = precise::min(_1910, _1924);
    float _1944 = -_1854;
    float _1946 = fma(_1944, _332, _1734);
    float _1948 = _1926 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1950 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = -_1854;
    float _1954 = fma(_1952, _336, _1638);
    float _1956 = _1902 * _1912;
    float _1958 = _1902;
    float _1960 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    if (_1880)
    {
        float _1962 = 1.0 / _1934;
        _1958 = _1962;
    }
    float _1964 = _1958;
    float _1966 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1968 = _1810 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_89.x = _1938;
    out.m_89.y = _1956;
    float _1970 = precise::min(_1942, _1928);
    float _1972 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1974 = fma(_1936, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1976 = precise::clamp(_1974, 0.0, 1.0);
    float _1978 = _1968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _1946 * _769;
    float _1982 = _1946 * _663;
    float _1984 = fma(_1976, -2.0, 3.0);
    float _1986 = _1976 * _1976;
    out.m_91.x = _1972;
    out.m_91.y = _1978;
    out.m_91.z = _1950;
    out.m_91.w = _1948;
    float _1988 = _1784 + _1495;
    float _1990 = _1986 * _1984;
    float _1992 = _1980;
    if (!_1880)
    {
        _1960 = 1.0;
    }
    float _1994 = _1960;
    float _1996 = _1988 * 0.5;
    float _1998 = fma(_1892, _671, _1980);
    float _2000 = -_1990;
    float _2002 = _2000 + 1.0;
    float _2004 = _1994;
    if (_1880)
    {
        float _2006 = _1970 * _1964;
        float _2008 = precise::clamp(_2006, 0.0, 1.0);
        _2004 = _2008;
    }
    float _2010 = _2004;
    float _2012 = fma(_1892, _765, _1982);
    out.m_93.z = _1996;
    out.m_93.w = _1495;
    float _2014 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1990);
    float _2016 = _2014;
    float _2018 = _2010;
    if (_1664)
    {
        _1992 = 1.0;
    }
    float _2020 = _1992;
    float _2022 = _1946 * _677;
    float _2024 = fma(_1892, _675, _2022);
    float _2026 = exp2(_1654);
    bool _2028 = _973 <= 8000.0;
    bool _2030 = isnan(_973);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan(8000.0);
    bool _2036 = _2032 || _2034;
    float _2038 = float(_2036);
    float _2040 = _2038 * _2014;
    float _2042 = _2020;
    float _2044 = _2040;
    if (_1664)
    {
        _2016 = 1.0;
    }
    float _2046 = _2016;
    float _2048 = _2046;
    if (!_1664)
    {
        float _2050 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2052 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2054 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2052;
        float _2056 = _2050 * 0.15915493667125701904296875;
        float _2058 = _2056 * 6.283185482025146484375;
        float _2060 = cos(_2058);
        float _2062 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2064 = _2062 * 0.15915493667125701904296875;
        float _2066 = _2056 * 6.283185482025146484375;
        float _2068 = sin(_2066);
        float _2070 = 1.0 / _2060;
        float _2072 = _2064 * 6.283185482025146484375;
        float _2074 = cos(_2072);
        float _2076 = _2068 * _2070;
        float _2078 = _2064 * 6.283185482025146484375;
        float _2080 = sin(_2078);
        float _2082 = _2074 * _2076;
        float _2084 = 1.0 / _2054;
        float _2086 = 1.0 / _2082;
        float _2088 = _2080 * _2086;
        float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2092 = fma(_973, _2088, _2090);
        float _2094 = _2092 * _2084;
        float _2096 = precise::clamp(_2094, 0.0, 1.0);
        _2048 = _2096;
    }
    float _2098 = _2048;
    if (!_1664)
    {
        float _2100 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2102 = _2100 * 0.15915493667125701904296875;
        float _2104 = _2102 * 6.283185482025146484375;
        float _2106 = cos(_2104);
        float _2108 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2110 = _2108 * 0.15915493667125701904296875;
        float _2112 = _2102 * 6.283185482025146484375;
        float _2114 = sin(_2112);
        float _2116 = 1.0 / _2106;
        float _2118 = _2110 * 6.283185482025146484375;
        float _2120 = cos(_2118);
        float _2122 = _2114 * _2116;
        float _2124 = _2110 * 6.283185482025146484375;
        float _2126 = sin(_2124);
        float _2128 = _2120 * _2122;
        float _2130 = 1.0 / _2128;
        float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2134 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2132;
        float _2136 = 1.0 / _2134;
        float _2138 = _2126 * _2130;
        float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2142 = fma(_973, _2138, _2140);
        float _2144 = _2142 * _2136;
        float _2146 = precise::clamp(_2144, 0.0, 1.0);
        float _2148 = -_2146;
        float _2150 = _2148 + 1.0;
        _2042 = _2150;
    }
    float _2152 = _2042;
    float _2154 = fma(_1954, _665, _2012);
    float _2156 = fma(_1954, _669, _1998);
    float _2158 = fma(_1954, _777, _2024);
    float _2160 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2162 = -_1589;
    float _2164 = _2162 + 1.0;
    float _2166 = -_2026;
    float _2168 = _2166 + 1.0;
    float _2170 = _2160;
    if (!_1475)
    {
        _2044 = 1.0;
    }
    float _2172 = _2044;
    float _2174 = _2164 * _2160;
    float _2176 = precise::clamp(_2174, 0.0, 1.0);
    float _2178 = _2172;
    if (_1475)
    {
        bool _2180 = _1605 >= _1543;
        bool _2182 = isnan(_1605);
        bool _2184 = _2180 || _2182;
        bool _2186 = isnan(_1543);
        bool _2188 = _2184 || _2186;
        float _2190 = float(_2188);
        _2178 = _2190;
    }
    float _2192 = _2178;
    float _2194 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2196 = _2192;
    if (_1025)
    {
        _2170 = 1.0;
    }
    float _2198 = _2170;
    float _2200 = _2198;
    if (!_1025)
    {
        int _2202 = _1073 << 4;
        int _2204 = _2202 + 2048;
        uint _2206 = uint(int(uint(_2204) >> uint(2)));
        uint _2208 = uint(int(uint(int(_2206)) >> uint(2)));
        int _2210 = int(_2206) & 3;
        float _2212 = (*spvDescriptorSet0.vp_c15)._m0[int(_2208)][_2210];
        int _2214 = int(_2206) + 1;
        uint _2216 = uint(int(uint(_2214) >> uint(2)));
        int _2218 = _2214 & 3;
        float _2220 = (*spvDescriptorSet0.vp_c15)._m0[int(_2216)][_2218];
        int _2222 = _2204 + 8;
        uint _2224 = uint(int(uint(_2222) >> uint(2)));
        uint _2226 = uint(int(uint(int(_2224)) >> uint(2)));
        int _2228 = int(_2224) & 3;
        float _2230 = (*spvDescriptorSet0.vp_c15)._m0[int(_2226)][_2228];
        int _2232 = int(_2224) + 1;
        uint _2234 = uint(int(uint(_2232) >> uint(2)));
        int _2236 = _2232 & 3;
        float _2238 = (*spvDescriptorSet0.vp_c15)._m0[int(_2234)][_2236];
        float _2240 = _889 * _2220;
        float _2242 = fma(_591, _2212, _2240);
        float _2244 = fma(_581, _2230, _2242);
        float _2246 = _2244 + _2238;
        float _2248 = precise::clamp(_2246, 0.0, 1.0);
        float _2250 = -_2248;
        float _2252 = _2250 + _1599;
        float _2254 = fma(_2252, 500.0, 1.5);
        float _2256 = exp2(_2254);
        float _2258 = 0.0 + _2256;
        float _2260 = precise::clamp(_2258, 0.0, 1.0);
        _2200 = _2260;
    }
    float _2262 = _2200;
    float _2264 = _2194 * _1607;
    float _2266 = -_2176;
    float _2268 = fma(_2266, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2270 = -_2194;
    float _2272 = _2270 + 1.0;
    out.m_95.x = _2154;
    out.m_95.y = _2156;
    out.m_95.z = _2158;
    float _2274 = _1618 * _2264;
    float _2276 = _1628 * _2264;
    float _2278 = _1618 * _2272;
    out.m_97.x = _855;
    out.m_97.y = _853;
    out.m_97.z = _857;
    float _2280 = fma(_1624, _2274, _1612);
    float _2282 = fma(_1626, _2274, _1614);
    float _2284 = fma(_1618, _2276, _1616);
    bool _2286 = _975 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2288 = isnan(_975);
    bool _2290 = _2286 || _2288;
    bool _2292 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2294 = _2290 || _2292;
    float _2296 = _2192 * _2262;
    float _2298 = _2098 * _2152;
    out.m_99.x = _2280;
    out.m_99.y = _2282;
    out.m_99.z = _2284;
    out.m_99.w = _2278;
    float _2300 = -_2296;
    float _2302 = fma(_2300, _2268, 1.0);
    float _2304 = precise::clamp(_2302, 0.0, 1.0);
    float _2306 = _2298 * _2010;
    float _2308 = _2304 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2310 = _2306 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2312 = _2272;
    float _2314 = _2306;
    float _2316 = _2308;
    if (!_2294)
    {
        _2018 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2318 = _2018;
    out.m_101.x = _2308;
    float _2320 = _2318;
    float _2322 = _2318;
    if (!_2294)
    {
        _2196 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2324 = _2196;
    float _2326 = _2324;
    float _2328 = _2324;
    if (!_2294)
    {
        _2312 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2330 = _2312;
    float _2332 = _2330;
    float _2334 = _2330;
    if (!_2294)
    {
        _687 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2336 = _687;
    float _2338 = _2336;
    float _2340 = _2336;
    if (!_2294)
    {
        _2314 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2342 = _2314;
    float _2344 = _2342;
    float _2346 = _2342;
    if (!_2294)
    {
        _2316 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2348 = _2316;
    bool _2350 = !_2294;
    float _2352 = _2348;
    float _2354 = _2348;
    if (!_2350)
    {
        bool _2356 = _975 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2358 = isnan(_975);
        bool _2360 = _2356 || _2358;
        bool _2362 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2364 = _2360 || _2362;
        if (!_2364)
        {
            float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2368 = _975 + _2366;
            float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2372 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2370;
            float _2374 = 1.0 / _2372;
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2390 = _2388 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2396 = _2368 * _2374;
            float _2398 = precise::clamp(_2396, 0.0, 1.0);
            float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2404 = fma(_2398, _2378, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2406 = fma(_2398, _2402, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2408 = fma(_2398, _2382, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2410 = fma(_2398, _2386, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2412 = fma(_2398, _2390, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2414 = fma(_2398, _2394, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2328 = _2406;
            _2354 = _2412;
            _2322 = _2404;
            _2340 = _2410;
            _2334 = _2408;
            _2346 = _2414;
            _2416 = true;
        }
        else
        {
            bool _2418 = _975 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2420 = isnan(_975);
            bool _2422 = _2418 || _2420;
            bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2426 = _2422 || _2424;
            if (!_2426)
            {
                _2320 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2428 = _2320;
            _2322 = _2428;
            if (!_2426)
            {
                _2326 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2430 = _2326;
            _2328 = _2430;
            if (!_2426)
            {
                _2332 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2432 = _2332;
            _2334 = _2432;
            if (!_2426)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2434 = _2338;
            _2340 = _2434;
            if (!_2426)
            {
                _2352 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2436 = _2352;
            _2354 = _2436;
            if (!_2426)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2438 = _2344;
            bool _2440 = !_2426;
            _2346 = _2438;
            if (!_2440)
            {
                bool _2442 = _975 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2444 = isnan(_975);
                bool _2446 = _2442 || _2444;
                bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2450 = _2446 || _2448;
                if (!_2450)
                {
                    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2454 = _975 + _2452;
                    float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2458 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2456;
                    float _2460 = 1.0 / _2458;
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2476 = _2474 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2482 = _2454 * _2460;
                    float _2484 = precise::clamp(_2482, 0.0, 1.0);
                    float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2490 = fma(_2484, _2464, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2492 = fma(_2484, _2488, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2494 = fma(_2484, _2468, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2496 = fma(_2484, _2472, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2498 = fma(_2484, _2476, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2500 = fma(_2484, _2480, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2328 = _2492;
                    _2354 = _2498;
                    _2322 = _2490;
                    _2340 = _2496;
                    _2334 = _2494;
                    _2346 = _2500;
                    _2416 = true;
                }
                else
                {
                    _2328 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2354 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2322 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2334 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2416 = false;
    float _2502 = _2328;
    float _2504 = _2354;
    float _2506 = _2322;
    float _2508 = _2340;
    float _2510 = _2334;
    float _2512 = _2346;
    float _2514 = fma(_2156, -0.5, 0.5);
    float _2516 = precise::clamp(_2514, 0.0, 1.0);
    float _2518 = -_2502;
    float _2520 = _2518 + _2504;
    float _2522 = _2310 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2524 = -_2506;
    float _2526 = _2524 + _2508;
    out.m_103.x = 0.0;
    float _2528 = fma(_2516, _2520, _2502);
    float _2530 = fma(_2516, _2526, _2506);
    out.m_66.x = _2522;
    float _2532 = -_2510;
    float _2534 = _2532 + _2512;
    float _2536 = _2528 * 0.586610972881317138671875;
    bool _2538 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2540 = fma(_2516, _2534, _2510);
    float _2542 = fma(_2530, 0.298911988735198974609375, _2536);
    bool _2544 = _2098 > 0.0;
    bool _2546 = isnan(_2098);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan(0.0);
    bool _2552 = _2548 || _2550;
    out.m_105.x = 0.0;
    float _2554 = fma(_2540, 0.114477999508380889892578125, _2542);
    bool _2556 = _2152 <= 0.0;
    bool _2558 = !_2552;
    bool _2560 = _2556 || _2558;
    float _2562 = -_2554;
    float _2564 = _2530 + _2562;
    float _2566 = -_2554;
    float _2568 = _2528 + _2566;
    float _2570 = -_2554;
    float _2572 = _2540 + _2570;
    float _2574 = fma(_2564, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2554);
    float _2576 = fma(_2568, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2554);
    float _2578 = fma(_2572, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2554);
    bool _2580 = !_2538;
    if (!_2580)
    {
        float _2582 = -_853;
        float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2586 = -_855;
        float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2590 = -_857;
        float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2594 = _2584 * _2584;
        float _2596 = fma(_2588, _2588, _2594);
        float _2598 = fma(_2592, _2592, _2596);
        float _2600 = rsqrt(_2598);
        float _2602 = sqrt(_2598);
        float _2604 = _2584 * _2600;
        float _2606 = _2588 * _2600;
        float _2608 = _2592 * _2600;
        float _2610 = -_945;
        float _2612 = _2610 + _2604;
        float _2614 = -_909;
        float _2616 = _2614 + _2606;
        float _2618 = -_911;
        float _2620 = _2618 + _2608;
        float _2622 = _2612 * _2612;
        float _2624 = -_2602;
        float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2628 = fma(_2616, _2616, _2622);
        float _2630 = _2626 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2632 = precise::clamp(_2630, 0.0, 1.0);
        float _2634 = fma(_2620, _2620, _2628);
        float _2636 = abs(_2632);
        float _2638 = log2(_2636);
        float _2640 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2642 = precise::clamp(_2640, 0.0, 1.0);
        float _2644 = rsqrt(_2634);
        float _2646 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2648 = exp2(_2646);
        float _2650 = _2612 * _2644;
        float _2652 = _2616 * _2644;
        float _2654 = _2620 * _2644;
        float _2656 = _2642 * _2642;
        float _2658 = _2156 * _2650;
        float _2660 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2662 = _2156 * _2604;
        float _2664 = _2656 + (-1.0);
        float _2666 = fma(_2154, _2652, _2658);
        float _2668 = -_2604;
        float _2670 = -_2660;
        float _2672 = fma(_2668, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2670);
        float _2674 = fma(_2154, _2606, _2662);
        float _2676 = fma(_2158, _2654, _2666);
        float _2678 = precise::clamp(_2676, 0.0, 1.0);
        float _2680 = -_2608;
        float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2672);
        float _2684 = fma(_2158, _2608, _2674);
        float _2686 = precise::clamp(_2684, 0.0, 1.0);
        float _2688 = _2678 * _2678;
        float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2692 = _2682 + _2690;
        float _2694 = fma(_2688, _2664, 1.0);
        float _2696 = _2694 * _2694;
        float _2698 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2700 = precise::clamp(_2698, 0.0, 1.0);
        float _2702 = 1.0 / _2696;
        float _2704 = _2648 * _2700;
        float _2706 = _2686 * _2704;
        float _2708 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2710 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2712 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2714 = _2656 * _2702;
        out.m_103.x = _2708;
        out.m_103.y = _2710;
        out.m_103.z = _2712;
        float _2716 = _2706 * _2714;
        float _2718 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2720 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2722 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _2718;
        out.m_105.y = _2720;
        out.m_105.z = _2722;
    }
    out.m_107.x = _2574;
    out.m_107.y = _2576;
    out.m_107.z = _2578;
    if (!_2560)
    {
        return out;
    }
    out.m_66.x = 0.0;
    float _2724 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2724;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2416 = false;
    bool _472 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_63.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_66.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2781 = as_type<float>(_142);
        out.gl_Position.z = _2781;
    }
    if (!_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_68.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_156)
    {
        float _162 = float(_126);
        _136 = _162;
    }
    float _164 = _136;
    bool _166 = _160 >= _164;
    bool _168 = !_156;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_66.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _144 = as_type<int>(_176);
    }
    int _178 = _144;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2850 = as_type<float>(_178);
        out.gl_Position.z = _2850;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _180 = in.m_70.x;
    float _182 = in.m_70.y;
    float _184 = in.m_70.z;
    float _186 = in.m_72.x;
    float _188 = in.m_72.y;
    float _190 = in.m_72.z;
    float _192 = in.m_74.x;
    float _194 = in.m_74.y;
    float _196 = in.m_74.z;
    float _198 = _180 * _180;
    float _200 = _182 * _182;
    float _202 = _184 * _184;
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    bool _222 = _216 > 0.0;
    bool _224 = _218 > 0.0;
    float _226 = _218;
    float _228 = _216;
    float _230 = _210;
    float _232 = _212;
    if (_222)
    {
        float _234 = rsqrt(_210);
        _226 = _234;
    }
    float _236 = _226;
    float _238 = 0.0;
    if (!_222)
    {
        _238 = 0.0;
    }
    float _240 = _238;
    bool _242 = _220 > 0.0;
    float _244 = 0.0;
    float _246 = _220;
    float _248 = _240;
    if (!_222)
    {
        _244 = 0.0;
    }
    float _250 = _244;
    float _252 = 0.0;
    float _254 = _250;
    if (!_222)
    {
        _252 = 0.0;
    }
    float _256 = _252;
    float _258 = 0.0;
    float _260 = _256;
    if (_224)
    {
        float _262 = rsqrt(_212);
        _258 = _262;
    }
    float _264 = _258;
    if (!_224)
    {
        _246 = 0.0;
    }
    float _266 = _246;
    float _268 = 0.0;
    float _270 = _266;
    if (!_224)
    {
        _268 = 0.0;
    }
    float _272 = _268;
    float _274 = _272;
    if (!_224)
    {
        _228 = 0.0;
    }
    float _276 = _228;
    float _278 = 0.0;
    float _280 = _276;
    if (_242)
    {
        float _282 = rsqrt(_214);
        _278 = _282;
    }
    float _284 = _278;
    if (_222)
    {
        float _286 = _236 * _186;
        _248 = _286;
    }
    float _288 = _248;
    if (_222)
    {
        float _290 = _236 * _180;
        _254 = _290;
    }
    float _292 = _254;
    if (_222)
    {
        float _294 = _236 * _192;
        _260 = _294;
    }
    float _296 = _260;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _300 = 0.0;
    if (!_242)
    {
        _300 = 0.0;
    }
    float _302 = _300;
    float _304 = _302;
    if (!_242)
    {
        _230 = 0.0;
    }
    float _306 = _230;
    float _308 = _306;
    if (_224)
    {
        float _310 = _264 * _188;
        _270 = _310;
    }
    float _312 = _270;
    if (!_242)
    {
        _232 = 0.0;
    }
    float _314 = _232;
    float _316 = _314;
    if (_224)
    {
        float _318 = _264 * _182;
        _274 = _318;
    }
    float _320 = _274;
    if (_224)
    {
        float _322 = _264 * _194;
        _280 = _322;
    }
    float _324 = _280;
    if (_242)
    {
        float _326 = _284 * _190;
        _304 = _326;
    }
    float _328 = _304;
    if (_242)
    {
        float _330 = _284 * _184;
        _308 = _330;
    }
    float _332 = _308;
    if (_242)
    {
        float _334 = _284 * _196;
        _316 = _334;
    }
    float _336 = _316;
    bool _338 = !_298;
    float _356;
    if (!_338)
    {
        float _340 = in.m_76.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_126);
        float _362 = 1.0 / _360;
        float _364 = _160 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = in.m_76.x;
    float _370 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _374 = _366 + _372;
    bool _376 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _378 = isnan(_366);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _388;
    bool _392 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _394 = 1.0 / _390;
    float _396 = _370 * _368;
    float _398 = -_386;
    float _400 = _398 + 1.0;
    float _402 = _374 * _394;
    bool _404 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _406 = isnan(_366);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _420;
    float _424 = trunc(_396);
    int _426 = int(_424);
    float _428 = _414 * _400;
    float _430 = fma(_418, _402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _432 = fma(_422, _402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _434 = -_414;
    float _436 = _434 + 1.0;
    float _438 = _430 * _428;
    float _440 = _432 * _428;
    float _442 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[143].x, _438);
    float _444 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[143].y, _440);
    float _446 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[144].x, _442);
    float _448 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[144].y, _444);
    int _450 = _426 << 4;
    int _452 = _450 + 1712;
    bool _454 = !_392;
    float _470;
    if (!_454)
    {
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _368 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_126);
        float _476 = 1.0 / _474;
        float _478 = _160 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = in.m_78.w;
    float _484 = as_type<float>(int(gl_VertexIndex));
    float _486 = in.m_83.x;
    float _488 = in.m_83.y;
    float _490 = in.m_63.x;
    float _492 = in.m_63.y;
    float _494 = in.m_63.z;
    float _496 = in.m_74.w;
    float _498 = trunc(_482);
    int _500 = int(_498);
    int _502 = _500 << 5;
    uint _505 = uint(int(uint(_502) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_505)];
    float _507 = as_type<float>(_dmw0.x);
    int _509 = _502 + 4;
    uint _511 = uint(int(uint(_509) >> uint(2)));
    float _513 = as_type<float>(_dmw0.y);
    int _515 = _502 + 8;
    uint _517 = uint(int(uint(_515) >> uint(2)));
    float _519 = as_type<float>(_dmw0.z);
    int _521 = _502 + 12;
    uint _523 = uint(int(uint(_521) >> uint(2)));
    float _525 = as_type<float>(_dmw0.w);
    int _527 = as_type<int>(_484) & 1;
    bool _529 = _527 != 0;
    int _531 = as_type<int>(_484) & 2;
    bool _533 = _531 != 0;
    float _535 = _446 * _486;
    float _537 = in.m_72.w;
    float _539 = _194 * _492;
    float _541 = _188 * _492;
    bool _543 = !_529;
    float _545 = _543 ? (-0.5) : 0.5;
    float _547 = _448 * _488;
    float _549 = fma(_192, _490, _539);
    bool _551 = !_533;
    float _553 = _551 ? (-0.5) : 0.5;
    float _555 = _535 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _545);
    float _559 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _561 = fma(_186, _490, _541);
    float _563 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _565 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _553);
    float _567 = _555 * _557;
    float _569 = _559 * _324;
    float _571 = fma(_196, _494, _549);
    float _573 = _563 * _565;
    float _575 = _559 * _312;
    float _577 = fma(_567, _296, _569);
    float _579 = fma(_190, _494, _561);
    float _581 = _571 + _496;
    float _583 = fma(_567, _288, _575);
    float _585 = -_573;
    float _587 = fma(_585, _336, _577);
    float _589 = _182 * _492;
    float _591 = _579 + _537;
    float _593 = -_573;
    float _595 = fma(_593, _328, _583);
    float _597 = _581 + _587;
    float _599 = in.m_70.w;
    float _601 = fma(_180, _490, _589);
    float _603 = _591 + _595;
    float _605 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _607 = _597 + _605;
    float _609 = _559 * _320;
    float _611 = fma(_184, _494, _601);
    float _613 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _615 = _603 + _613;
    float _617 = _607 * _607;
    float _619 = fma(_567, _292, _609);
    float _621 = fma(_615, _615, _617);
    float _623 = -_573;
    float _625 = fma(_623, _332, _619);
    bool _627 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _629 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _631 = _627 || _629;
    bool _633 = isnan(0.5);
    bool _635 = _631 || _633;
    float _637 = sqrt(_621);
    float _639 = _611 + _599;
    float _641 = _639 + _625;
    bool _643 = _637 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _645 = _525 * 2.0;
    float _647 = _507 * 2.0;
    float _649 = _513 * 2.0;
    float _651 = _507 * _507;
    float _653 = _519 * _645;
    float _655 = _513 * _645;
    float _657 = _507 * _645;
    float _659 = _519 * _519;
    float _661 = -_653;
    float _663 = fma(_513, _647, _661);
    float _665 = fma(_519, _647, _655);
    float _667 = -_657;
    float _669 = fma(_519, _649, _667);
    float _671 = fma(_513, _647, _653);
    float _673 = -_655;
    float _675 = fma(_519, _647, _673);
    float _677 = fma(_519, _649, _657);
    float _679 = _513 * _513;
    float _681 = _507;
    float _683 = _647;
    float _685 = _657;
    float _687 = _591;
    if (!_643)
    {
        _681 = _603;
    }
    float _689 = _681;
    float _691 = _689;
    if (!_643)
    {
        _683 = _597;
    }
    float _693 = _683;
    float _695 = _693;
    if (!_643)
    {
        _685 = _641;
    }
    float _697 = _685;
    bool _699 = !_643;
    float _701 = _697;
    if (!_699)
    {
        float _703 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _705 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _707 = _637 + _705;
        float _709 = _641 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _711 = rsqrt(_621);
        float _713 = _707 * _703;
        float _715 = _713 * 0.15915493667125701904296875;
        float _717 = _715 * 6.283185482025146484375;
        float _719 = cos(_717);
        float _721 = _715 * 6.283185482025146484375;
        float _723 = sin(_721);
        float _725 = _719 + (-1.0);
        float _727 = _725 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _729 = fma(_723, _709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _731 = fma(_641, _719, _727);
        float _733 = _711 * _729;
        float _735 = fma(_615, _733, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _737 = fma(_607, _733, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _701 = _731;
        _691 = _735;
        _695 = _737;
    }
    float _739 = _701;
    float _741 = _691;
    float _743 = _695;
    float _745 = -_639;
    float _747 = _745 + _739;
    float _749 = -_591;
    float _751 = _749 + _741;
    float _753 = fma(_679, -2.0, 1.0);
    float _755 = -_581;
    float _757 = _755 + _743;
    float _759 = _747 * _320;
    float _761 = fma(_651, -2.0, 1.0);
    float _763 = _747 * _292;
    float _765 = fma(_659, -2.0, _753);
    float _767 = fma(_751, _312, _759);
    float _769 = fma(_659, -2.0, _761);
    float _771 = _747 * _332;
    float _773 = fma(_751, _288, _763);
    float _775 = fma(_757, _324, _767);
    float _777 = fma(_679, -2.0, _761);
    float _779 = fma(_751, _328, _771);
    float _781 = fma(_757, _296, _773);
    float _783 = _775 * _663;
    float _785 = _775 * _769;
    float _787 = _775 * _677;
    float _789 = fma(_757, _336, _779);
    float _791 = fma(_781, _765, _783);
    float _793 = fma(_781, _671, _785);
    float _795 = fma(_781, _675, _787);
    float _797 = fma(_789, _665, _791);
    float _799 = fma(_789, _669, _793);
    float _801 = fma(_789, _777, _795);
    float _803 = _591 + _797;
    float _805 = _639 + _799;
    float _807 = _581 + _801;
    float _809 = _805;
    float _811 = _803;
    float _813 = _807;
    if (!_635)
    {
        float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _817 = _639 + _815;
        float _819 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _821 = _591 + _819;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _825 = _817 * _817;
        float _827 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _829 = _581 + _827;
        float _831 = fma(_821, _821, _825);
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _835 = fma(_829, _829, _831);
        float _837 = sqrt(_835);
        float _839 = _823 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _841 = precise::min(_837, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _843 = _841 * _833;
        float _845 = _839 * _843;
        float _847 = fma(_797, _845, _591);
        float _849 = fma(_799, _845, _639);
        float _851 = fma(_801, _845, _581);
        _809 = _849;
        _811 = _847;
        _813 = _851;
    }
    float _853 = _809;
    float _855 = _811;
    float _857 = _813;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _861 = _853 + _859;
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _865 = _855 + _863;
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _869 = _857 + _867;
    float _871 = _639 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _873 = _861 * _861;
    float _875 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[11].x, _871);
    float _877 = fma(_865, _865, _873);
    float _879 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[11].z, _875);
    float _881 = fma(_869, _869, _877);
    float _883 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _885 = _879 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _887 = rsqrt(_881);
    float _889 = _639 + _883;
    float _891 = _639 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _893 = _889 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _895 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[10].x, _891);
    float _897 = 1.0 / _885;
    float _899 = fma(_591, (*spvDescriptorSet0.vp_c15)._m0[126].x, _893);
    float _901 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[10].z, _895);
    float _903 = fma(_591, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _905 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[126].z, _899);
    float _907 = _901 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _909 = _865 * _887;
    float _911 = _869 * _887;
    float _913 = _905 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _915 = _889 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _917 = _909 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _919 = _911 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _921 = _907 + _885;
    float _923 = _917 * _917;
    float _925 = _919 * _919;
    float _927 = fma(_591, (*spvDescriptorSet0.vp_c15)._m0[127].x, _915);
    float _929 = _921 * _897;
    float _931 = _929 * 0.5;
    float _933 = trunc(_913);
    int _935 = int(_933);
    float _937 = _923 + _925;
    float _939 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[127].z, _927);
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[30].w, _941);
    float _945 = _861 * _887;
    float _947 = _939 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _949 = sqrt(_937);
    float _951 = 1.0 / _943;
    int _953 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _955 = _935 + _953;
    int _957 = _955 + 1;
    bool _959 = _957 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _961 = trunc(_947);
    int _963 = int(_961);
    bool _965 = _949 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _967 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = _949 + _967;
    float _971 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _973 = _951 * _971;
    float _975 = sqrt(_881);
    bool _977 = _973 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _979 = _973 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    int _981 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _983 = _963 + _981;
    int _985 = _983 + 1;
    float _987 = 0.0;
    float _989 = _951;
    int _991 = 2;
    float _993 = _969;
    int _995 = _985;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[652].y);
    float _999 = _917;
    float _1001 = _919;
    float _1003 = _947;
    if (_965)
    {
        float _1005 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _987 = _1005;
    }
    float _1007 = _987;
    int _1009 = _957 | _985;
    bool _1011 = _1009 < 0;
    bool _1013 = _1011 || _959;
    if (_965)
    {
        float _1015 = rsqrt(_937);
        _989 = _1015;
    }
    float _1017 = _989;
    bool _1019 = !_977;
    int _1021 = _1019 ? 0 : 1;
    bool _1023 = _985 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1025 = _1023 || _1013;
    float _1027 = _1017;
    if (!_977)
    {
        _991 = 1;
    }
    int _1029 = _991;
    int _1031 = _1029;
    if (!_979)
    {
        _1031 = _1021;
    }
    int _1033 = _1031;
    if (_965)
    {
        float _1035 = _969 * _1007;
        _993 = _1035;
    }
    float _1037 = _993;
    float _1039 = floor(_903);
    int _1041 = _1033 << 6;
    float _1043 = 0.0;
    if (_965)
    {
        float _1045 = _1037 * 0.15915493667125701904296875;
        _1043 = _1045;
    }
    float _1047 = _1043;
    float _1049 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1051 = _1041 + 48;
    uint _1053 = uint(int(uint(_1051) >> uint(2)));
    uint _1055 = uint(int(uint(int(_1053)) >> uint(2)));
    int _1057 = int(_1053) & 3;
    float _1059 = (*spvDescriptorSet0.vp_c15)._m0[int(_1055)][_1057];
    int _1061 = int(_1053) + 1;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    int _1065 = _1061 & 3;
    float _1067 = (*spvDescriptorSet0.vp_c15)._m0[int(_1063)][_1065];
    if (!_1025)
    {
        int _1069 = _985 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1071 = _1069 + _957;
        _995 = _1071;
    }
    int _1073 = _995;
    int _1075 = 0;
    if (_965)
    {
        float _1077 = _1047 * 6.283185482025146484375;
        float _1079 = sin(_1077);
        _1075 = as_type<int>(_1079);
    }
    int _1081 = _1075;
    float _1083 = precise::max(0.0, _1049);
    int _1085 = _1041 + 96;
    uint _1087 = uint(int(uint(_1085) >> uint(2)));
    uint _1089 = uint(int(uint(int(_1087)) >> uint(2)));
    int _1091 = int(_1087) & 3;
    float _1093 = (*spvDescriptorSet0.vp_c15)._m0[int(_1089)][_1091];
    int _1095 = int(_1087) + 1;
    uint _1097 = uint(int(uint(_1095) >> uint(2)));
    int _1099 = _1095 & 3;
    float _1101 = (*spvDescriptorSet0.vp_c15)._m0[int(_1097)][_1099];
    float _1103 = -_945;
    float _1105 = -_1083;
    float _1107 = fma(_1103, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1105);
    float _1109 = 0.0;
    float _1111 = _1107;
    if (_965)
    {
        float _1113 = _1047 * 6.283185482025146484375;
        float _1115 = cos(_1113);
        _1109 = _1115;
    }
    float _1117 = _1109;
    float _1119 = -_1039;
    float _1121 = _903 + _1119;
    float _1123 = 0.0;
    if (_965)
    {
        float _1125 = _1107 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1123 = _1125;
    }
    float _1127 = _1123;
    int _1129 = _1041 + 64;
    uint _1131 = uint(int(uint(_1129) >> uint(2)));
    uint _1133 = uint(int(uint(int(_1131)) >> uint(2)));
    int _1135 = int(_1131) & 3;
    float _1137 = (*spvDescriptorSet0.vp_c15)._m0[int(_1133)][_1135];
    int _1139 = int(_1131) + 1;
    uint _1141 = uint(int(uint(_1139) >> uint(2)));
    int _1143 = _1139 & 3;
    float _1145 = (*spvDescriptorSet0.vp_c15)._m0[int(_1141)][_1143];
    float _1147 = 0.0;
    int _1149 = _1081;
    if (_965)
    {
        float _1151 = fma(as_type<float>(_1081), _1127, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1147 = _1151;
    }
    float _1153 = _1147;
    float _1155 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_1025)
    {
        int _1157 = _1073 << 2;
        _997 = _1157;
    }
    int _1159 = _997;
    int _1161 = _1159;
    if (!_1025)
    {
        uint _1163 = uint(int(uint(_1073) >> uint(2)));
        _1149 = int(_1163);
    }
    int _1165 = _1149;
    int _1167 = _1041 + 104;
    uint _1169 = uint(int(uint(_1167) >> uint(2)));
    uint _1171 = uint(int(uint(int(_1169)) >> uint(2)));
    int _1173 = int(_1169) & 3;
    float _1175 = (*spvDescriptorSet0.vp_c15)._m0[int(_1171)][_1173];
    int _1177 = int(_1169) + 1;
    uint _1179 = uint(int(uint(_1177) >> uint(2)));
    int _1181 = _1177 & 3;
    float _1183 = (*spvDescriptorSet0.vp_c15)._m0[int(_1179)][_1181];
    float _1185 = as_type<float>(_1165);
    if (!_1025)
    {
        int _1187 = 12 & _1159;
        _1161 = _1187;
    }
    int _1189 = _1161;
    float _1191 = as_type<float>(_1189);
    if (_965)
    {
        float _1193 = _1017 * _1153;
        _1027 = _1193;
    }
    float _1195 = _1027;
    float _1197 = 0.0;
    if (_965)
    {
        float _1199 = _1117 + (-1.0);
        _1197 = _1199;
    }
    float _1201 = _1197;
    float _1203 = floor(_1155);
    int _1205 = as_type<int>(_1201);
    if (_965)
    {
        float _1207 = _917 * _1195;
        _999 = _1207;
    }
    float _1209 = _999;
    float _1211 = 0.0;
    if (_965)
    {
        float _1213 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1211 = _1213;
    }
    float _1215 = _1211;
    int _1217 = _1041 + 56;
    uint _1219 = uint(int(uint(_1217) >> uint(2)));
    uint _1221 = uint(int(uint(int(_1219)) >> uint(2)));
    int _1223 = int(_1219) & 3;
    float _1225 = (*spvDescriptorSet0.vp_c15)._m0[int(_1221)][_1223];
    int _1227 = int(_1219) + 1;
    uint _1229 = uint(int(uint(_1227) >> uint(2)));
    int _1231 = _1227 & 3;
    float _1233 = (*spvDescriptorSet0.vp_c15)._m0[int(_1229)][_1231];
    if (!_1025)
    {
        int _1235 = _1165 << 4;
        int _1237 = _1235 + _1189;
        _1205 = _1237;
    }
    int _1239 = _1205;
    if (_965)
    {
        float _1241 = _919 * _1195;
        _1001 = _1241;
    }
    float _1243 = _1001;
    if (!_965)
    {
        _1191 = _923;
    }
    float _1245 = _1191;
    float _1247 = _1245;
    if (_965)
    {
        float _1249 = fma(_1107, _1117, _1215);
        _1111 = _1249;
    }
    float _1251 = _1111;
    if (_965)
    {
        float _1253 = _1209 * _1209;
        _1247 = _1253;
    }
    float _1255 = _1247;
    if (!_965)
    {
        _1185 = _925;
    }
    float _1257 = _1185;
    float _1259 = _1257;
    if (_965)
    {
        float _1261 = _1243 * _1243;
        _1259 = _1261;
    }
    float _1263 = _1259;
    int _1265 = _1041 + 72;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    uint _1269 = uint(int(uint(int(_1267)) >> uint(2)));
    int _1271 = int(_1267) & 3;
    float _1273 = (*spvDescriptorSet0.vp_c15)._m0[int(_1269)][_1271];
    int _1275 = int(_1267) + 1;
    uint _1277 = uint(int(uint(_1275) >> uint(2)));
    int _1279 = _1275 & 3;
    float _1281 = (*spvDescriptorSet0.vp_c15)._m0[int(_1277)][_1279];
    float _1283 = fma(_1251, _1251, _1255);
    float _1285 = _1117;
    if (!_1025)
    {
        float _1287 = floor(_913);
        _1285 = _1287;
    }
    float _1289 = _1285;
    float _1291 = -_1203;
    float _1293 = _1155 + _1291;
    float _1295 = _1283 + _1263;
    int _1297 = _1041 + 80;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    uint _1301 = uint(int(uint(int(_1299)) >> uint(2)));
    int _1303 = int(_1299) & 3;
    float _1305 = (*spvDescriptorSet0.vp_c15)._m0[int(_1301)][_1303];
    int _1307 = int(_1299) + 1;
    uint _1309 = uint(int(uint(_1307) >> uint(2)));
    int _1311 = _1307 & 3;
    float _1313 = (*spvDescriptorSet0.vp_c15)._m0[int(_1309)][_1311];
    float _1315 = _889 * _1067;
    float _1317 = rsqrt(_1295);
    float _1319 = _889 * _1101;
    float _1321 = fma(_591, _1059, _1315);
    float _1323 = _925;
    float _1325 = _1315;
    if (!_1025)
    {
        int _1327 = _1239 + 400;
        uint _1329 = uint(int(uint(_1327) >> uint(2)));
        uint _1331 = uint(int(uint(int(_1329)) >> uint(2)));
        int _1333 = int(_1329) & 3;
        float _1335 = (*spvDescriptorSet0.vp_c15)._m0[int(_1331)][_1333];
        _1323 = _1335;
    }
    float _1337 = _1323;
    float _1339 = fma(_591, _1093, _1319);
    if (!_1025)
    {
        float _1341 = floor(_947);
        _1325 = _1341;
    }
    float _1343 = _1325;
    float _1345 = _1289;
    if (!_1025)
    {
        float _1347 = -_1289;
        float _1349 = _913 + _1347;
        _1345 = _1349;
    }
    float _1351 = _1345;
    float _1353 = _889 * _1145;
    float _1355 = _1317 * _1209;
    float _1357 = fma(_591, _1137, _1353);
    float _1359 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1361 = fma(_581, _1175, _1339);
    float _1363 = _1361 + _1183;
    float _1365 = fma(_581, _1225, _1321);
    float _1367 = _853 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1369 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1371 = _1365 + _1233;
    float _1373 = 1.0 / _1363;
    float _1375 = fma(_581, _1273, _1357);
    float _1377 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1367);
    int _1379 = _1041 + 88;
    uint _1381 = uint(int(uint(_1379) >> uint(2)));
    uint _1383 = uint(int(uint(int(_1381)) >> uint(2)));
    int _1385 = int(_1381) & 3;
    float _1387 = (*spvDescriptorSet0.vp_c15)._m0[int(_1383)][_1385];
    int _1389 = int(_1381) + 1;
    uint _1391 = uint(int(uint(_1389) >> uint(2)));
    int _1393 = _1389 & 3;
    float _1395 = (*spvDescriptorSet0.vp_c15)._m0[int(_1391)][_1393];
    float _1397 = _1375 + _1281;
    float _1399 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1377);
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1403 = fma(_975, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1401);
    float _1405 = precise::clamp(_1403, 0.0, 1.0);
    float _1407 = _1317 * _1251;
    float _1409 = _1317 * _1243;
    float _1411 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1413 = -_1405;
    float _1415 = _1413 + 1.0;
    float _1417 = -_1359;
    float _1419 = fma(_1407, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1417);
    float _1421 = _853 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1423 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1425 = _1371 * _1373;
    float _1427 = _889 * _1313;
    float _1429 = _853 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1431 = -_1423;
    float _1433 = fma(_1431, _1369, 1.0);
    float _1435 = _853 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1437 = abs(_1415);
    float _1439 = log2(_1437);
    bool _1441 = _1425 >= 0.0;
    float _1443 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1429);
    float _1445 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1435);
    float _1447 = _1397 * _1373;
    bool _1449 = _1425 <= 1.0;
    bool _1451 = _1449 && _1441;
    float _1453 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1443);
    float _1455 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1445);
    float _1457 = -_1409;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1419);
    float _1461 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1421);
    bool _1463 = _1447 >= 0.0;
    bool _1465 = _1463 && _1451;
    float _1467 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1469 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1471 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1461);
    bool _1473 = _1447 <= 1.0;
    bool _1475 = _1473 && _1465;
    float _1477 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1479 = fma(_1459, -0.5, 0.5);
    float _1481 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1483 = fma(_591, _1305, _1427);
    float _1485 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1477);
    float _1487 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1489 = log2(_1433);
    float _1491 = fma(_1459, 0.5, 0.5);
    float _1493 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1485);
    float _1495 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1493);
    float _1497 = sqrt(_1479);
    float _1499 = fma(_581, _1387, _1483);
    float _1501 = fma(_1491, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1503 = 0.0187292993068695068359375;
    if (!_1025)
    {
        float _1505 = -_1343;
        float _1507 = _947 + _1505;
        _1503 = _1507;
    }
    float _1509 = _1503;
    float _1511 = exp2(_1481);
    float _1513 = _1499 + _1395;
    if (_1475)
    {
        float _1515 = float(_1033);
        _1003 = _1515;
    }
    float _1517 = _1003;
    float _1519 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1521 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1523 = fma(_1491, _1501, -0.212114393711090087890625);
    float _1525 = _1489 * 0.693147182464599609375;
    float _1527 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1519);
    float _1529 = 1.0 / _1495;
    float _1531 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1521);
    float _1533 = fma(_1491, _1523, 1.570728778839111328125);
    float _1535 = _1407 + 1.0;
    float _1537 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1527);
    float _1539 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1531);
    float _1541 = _1497 * 0.636619746685028076171875;
    float _1543 = _1513 * _1373;
    float _1545 = _1337;
    if (!_1025)
    {
        float _1547 = rint(_1337);
        float _1549 = precise::max(_1547, 0.0);
        uint _1551 = uint(_1549);
        uint _1553 = clamp(_1551, 0u, 65535u);
        _1545 = as_type<float>(_1553);
    }
    float _1555 = _1545;
    float _1557 = -_1407;
    float _1559 = fma(_1511, _1535, _1557);
    float _1561 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1537);
    float _1563 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1539);
    float _1565 = -_1533;
    float _1567 = fma(_1541, _1565, 1.0);
    float _1569 = _1525 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1571 = fma(_1559, 0.5, 0.5);
    float _1573 = _1517;
    if (_1475)
    {
        float _1575 = rint(_1517);
        float _1577 = precise::max(_1575, 0.0);
        uint _1579 = uint(_1577);
        uint _1581 = clamp(_1579, 0u, 65535u);
        _1573 = as_type<float>(_1581);
    }
    float _1583 = _1573;
    float _1585 = _1561 * _1529;
    float _1587 = _1563 * _1529;
    float2 _5093 = float2(_1121, _1293);
    float _1589 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5093, float2(0.0), isnan(_5093)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5093, float2(0.0), isnan(_5093)), level(0.0)).x;
    float _1591 = fma(_1585, 0.5, 0.5);
    float _1593 = fma(_1587, -0.5, 0.5);
    float _1595 = _1555;
    if (!_1025)
    {
        float3 _5114 = float3(_1351, _1509, float(as_type<int>(_1555)));
        float3 _5118 = select(_5114, float3(0.0), isnan(_5114));
        float _1597 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5118.xy, uint(rint(_5118.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5118.xy, uint(rint(_5118.z)), level(0.0)).x;
        _1595 = _1597;
    }
    float _1599 = _1595;
    float _1601 = _1583;
    if (_1475)
    {
        float3 _5133 = float3(_1425, _1447, float(as_type<int>(_1583)));
        float3 _5135 = select(_5133, float3(0.0), isnan(_5133));
        float _1603 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5135.xy, uint(rint(_5135.z)), _1543, level(0.0));
        _1601 = _1603;
    }
    float _1605 = _1601;
    float3 _5145 = float3(_1591, _1593, _1569);
    float _1607 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5145, float3(0.0), isnan(_5145)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5145, float3(0.0), isnan(_5145)), level(0.0)).x;
    float3 _5154 = float3(_1591, _1593, _1569);
    float4 _1610 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5154, float3(0.0), isnan(_5154)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5154, float3(0.0), isnan(_5154)), level(0.0)).xyzw;
    float _1612 = _1610.x;
    float _1614 = _1610.y;
    float _1616 = _1610.z;
    float _1618 = _1610.w;
    float2 _5170 = float2(_1567, _1571);
    float3 _1622 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5170, float2(0.0), isnan(_5170)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5170, float2(0.0), isnan(_5170)), level(0.0)).xyz;
    float _1624 = _1622.x;
    float _1626 = _1622.y;
    float _1628 = _1622.z;
    float _1630 = in.m_76.y;
    float _1632 = _545 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1634 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1636 = _368 > 0.5;
    float _1638 = fma(_1632, _296, _324);
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1646 = _1644 != 0;
    float _1648 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1634);
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1652 = _1650 != 0;
    out.m_85.x = _865;
    out.m_85.y = _861;
    out.m_85.z = _869;
    float _1654 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1656 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan(0.5);
    bool _1664 = _1660 || _1662;
    bool _1666 = _1630 > 0.5;
    float _1668 = 1.0 / _1642;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1672 = _1670 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1674 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1648);
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1678 = _1676 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1680 = 1.0 / _1672;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1684 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1686 = _1682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1690 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1688);
    float _1692 = 1.0 / _1678;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1696 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1694);
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1704 = _1702 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1710;
    bool _1714 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1716 = isnan(_480);
    bool _1718 = _1714 || _1716;
    bool _1720 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1722 = _1718 || _1720;
    float _1724 = float(_1722);
    float _1726 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1728 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1730 = _1700 * _1668;
    float _1732 = fma(_1632, _288, _312);
    float _1734 = fma(_1632, _292, _320);
    bool _1736 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1738 = isnan(_480);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1744 = _1740 || _1742;
    float _1746 = float(_1744);
    out.m_87.x = _1726;
    out.m_87.y = _1728;
    out.m_87.z = _1686;
    float _1748 = -_1724;
    float _1750 = _1748 + 1.0;
    float _1752 = _1712 * _1692;
    bool _1754 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1756 = isnan(_480);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    float _1766 = _1704 * _1680;
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1770 = _480 + _1768;
    int _1772 = _452 + 8;
    uint _1774 = uint(int(uint(_1772) >> uint(2)));
    uint _1776 = uint(int(uint(int(_1774)) >> uint(2)));
    int _1778 = int(_1774) & 3;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[int(_1776)][_1778];
    float _1782 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1696);
    float _1784 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1674);
    float _1786 = _581 + _1782;
    float _1788 = -_1764;
    float _1790 = _1788 + 1.0;
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1794 = _480 + _1792;
    uint _1796 = uint(int(uint(_452) >> uint(2)));
    uint _1798 = uint(int(uint(int(_1796)) >> uint(2)));
    int _1800 = int(_1796) & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    int _1804 = int(_1796) + 1;
    uint _1806 = uint(int(uint(_1804) >> uint(2)));
    int _1808 = _1804 & 3;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[int(_1806)][_1808];
    out.gl_Position.x = _1561;
    out.gl_Position.y = _1563;
    out.gl_Position.z = _1784;
    out.gl_Position.w = _1495;
    float _1812 = _1724 * _1790;
    bool _1814 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1816 = isnan(_480);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1822 = _1818 || _1820;
    float _1824 = float(_1822);
    float _1826 = _1746 * _1750;
    float _1828 = -_1746;
    float _1830 = _1828 + 1.0;
    float _1832 = fma(_1730, _1794, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1834 = fma(_1766, _1770, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1836 = -_545;
    int _1838 = _1636 ? as_type<int>(_1836) : as_type<int>(_545);
    float _1840 = _1824 * _1830;
    float _1842 = -_553;
    int _1844 = _1666 ? as_type<int>(_1842) : as_type<int>(_553);
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1848 = _480 + _1846;
    bool _1850 = !_1646;
    float _1852 = _1850 ? _545 : as_type<float>(_1838);
    float _1854 = _553 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1856 = !_1652;
    float _1858 = _1856 ? _553 : as_type<float>(_1844);
    float _1860 = fma(_1752, _1848, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1862 = abs(_973);
    float _1864 = log2(_1862);
    float _1866 = _1832 * _1840;
    float _1868 = -_1824;
    float _1870 = _1868 + 1.0;
    bool _1872 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1874 = isnan(0.0);
    bool _1876 = _1872 || _1874;
    bool _1878 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1880 = _1876 || _1878;
    float _1882 = _1852 + 0.5;
    float _1884 = -_1858;
    float _1886 = _1884 + 0.5;
    float _1888 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1866);
    float _1890 = -_1854;
    float _1892 = fma(_1890, _328, _1732);
    float _1894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1896 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1898 = fma(_1834, _1826, _1888);
    float _1900 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1690);
    float _1902 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1904 = -_1786;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1908 = fma(_1860, _1812, _1898);
    float _1910 = _591 + _1900;
    float _1912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1914 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1916 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_1880)
    {
        float _1918 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1916 = _1918;
    }
    float _1920 = _1916;
    float _1922 = -_1910;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1926 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1908);
    float _1928 = precise::min(_1786, _1906);
    float _1930 = _1920;
    if (_1880)
    {
        float _1932 = precise::min(_1920, 20.0);
        _1930 = _1932;
    }
    float _1934 = _1930;
    float _1936 = exp2(_1914);
    float _1938 = _1896 * _1894;
    float _1940 = _1780 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1942 = precise::min(_1910, _1924);
    float _1944 = -_1854;
    float _1946 = fma(_1944, _332, _1734);
    float _1948 = _1926 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1950 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = -_1854;
    float _1954 = fma(_1952, _336, _1638);
    float _1956 = _1902 * _1912;
    float _1958 = _1902;
    float _1960 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    if (_1880)
    {
        float _1962 = 1.0 / _1934;
        _1958 = _1962;
    }
    float _1964 = _1958;
    float _1966 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1968 = _1810 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_89.x = _1938;
    out.m_89.y = _1956;
    float _1970 = precise::min(_1942, _1928);
    float _1972 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1974 = fma(_1936, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1976 = precise::clamp(_1974, 0.0, 1.0);
    float _1978 = _1968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _1946 * _769;
    float _1982 = _1946 * _663;
    float _1984 = fma(_1976, -2.0, 3.0);
    float _1986 = _1976 * _1976;
    out.m_91.x = _1972;
    out.m_91.y = _1978;
    out.m_91.z = _1950;
    out.m_91.w = _1948;
    float _1988 = _1784 + _1495;
    float _1990 = _1986 * _1984;
    float _1992 = _1980;
    if (!_1880)
    {
        _1960 = 1.0;
    }
    float _1994 = _1960;
    float _1996 = _1988 * 0.5;
    float _1998 = fma(_1892, _671, _1980);
    float _2000 = -_1990;
    float _2002 = _2000 + 1.0;
    float _2004 = _1994;
    if (_1880)
    {
        float _2006 = _1970 * _1964;
        float _2008 = precise::clamp(_2006, 0.0, 1.0);
        _2004 = _2008;
    }
    float _2010 = _2004;
    float _2012 = fma(_1892, _765, _1982);
    out.m_93.z = _1996;
    out.m_93.w = _1495;
    float _2014 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1990);
    float _2016 = _2014;
    float _2018 = _2010;
    if (_1664)
    {
        _1992 = 1.0;
    }
    float _2020 = _1992;
    float _2022 = _1946 * _677;
    float _2024 = fma(_1892, _675, _2022);
    float _2026 = exp2(_1654);
    bool _2028 = _973 <= 8000.0;
    bool _2030 = isnan(_973);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan(8000.0);
    bool _2036 = _2032 || _2034;
    float _2038 = float(_2036);
    float _2040 = _2038 * _2014;
    float _2042 = _2020;
    float _2044 = _2040;
    if (_1664)
    {
        _2016 = 1.0;
    }
    float _2046 = _2016;
    float _2048 = _2046;
    if (!_1664)
    {
        float _2050 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2052 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2054 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2052;
        float _2056 = _2050 * 0.15915493667125701904296875;
        float _2058 = _2056 * 6.283185482025146484375;
        float _2060 = cos(_2058);
        float _2062 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2064 = _2062 * 0.15915493667125701904296875;
        float _2066 = _2056 * 6.283185482025146484375;
        float _2068 = sin(_2066);
        float _2070 = 1.0 / _2060;
        float _2072 = _2064 * 6.283185482025146484375;
        float _2074 = cos(_2072);
        float _2076 = _2068 * _2070;
        float _2078 = _2064 * 6.283185482025146484375;
        float _2080 = sin(_2078);
        float _2082 = _2074 * _2076;
        float _2084 = 1.0 / _2054;
        float _2086 = 1.0 / _2082;
        float _2088 = _2080 * _2086;
        float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2092 = fma(_973, _2088, _2090);
        float _2094 = _2092 * _2084;
        float _2096 = precise::clamp(_2094, 0.0, 1.0);
        _2048 = _2096;
    }
    float _2098 = _2048;
    if (!_1664)
    {
        float _2100 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2102 = _2100 * 0.15915493667125701904296875;
        float _2104 = _2102 * 6.283185482025146484375;
        float _2106 = cos(_2104);
        float _2108 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2110 = _2108 * 0.15915493667125701904296875;
        float _2112 = _2102 * 6.283185482025146484375;
        float _2114 = sin(_2112);
        float _2116 = 1.0 / _2106;
        float _2118 = _2110 * 6.283185482025146484375;
        float _2120 = cos(_2118);
        float _2122 = _2114 * _2116;
        float _2124 = _2110 * 6.283185482025146484375;
        float _2126 = sin(_2124);
        float _2128 = _2120 * _2122;
        float _2130 = 1.0 / _2128;
        float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2134 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2132;
        float _2136 = 1.0 / _2134;
        float _2138 = _2126 * _2130;
        float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2142 = fma(_973, _2138, _2140);
        float _2144 = _2142 * _2136;
        float _2146 = precise::clamp(_2144, 0.0, 1.0);
        float _2148 = -_2146;
        float _2150 = _2148 + 1.0;
        _2042 = _2150;
    }
    float _2152 = _2042;
    float _2154 = fma(_1954, _665, _2012);
    float _2156 = fma(_1954, _669, _1998);
    float _2158 = fma(_1954, _777, _2024);
    float _2160 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2162 = -_1589;
    float _2164 = _2162 + 1.0;
    float _2166 = -_2026;
    float _2168 = _2166 + 1.0;
    float _2170 = _2160;
    if (!_1475)
    {
        _2044 = 1.0;
    }
    float _2172 = _2044;
    float _2174 = _2164 * _2160;
    float _2176 = precise::clamp(_2174, 0.0, 1.0);
    float _2178 = _2172;
    if (_1475)
    {
        bool _2180 = _1605 >= _1543;
        bool _2182 = isnan(_1605);
        bool _2184 = _2180 || _2182;
        bool _2186 = isnan(_1543);
        bool _2188 = _2184 || _2186;
        float _2190 = float(_2188);
        _2178 = _2190;
    }
    float _2192 = _2178;
    float _2194 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2196 = _2192;
    if (_1025)
    {
        _2170 = 1.0;
    }
    float _2198 = _2170;
    float _2200 = _2198;
    if (!_1025)
    {
        int _2202 = _1073 << 4;
        int _2204 = _2202 + 2048;
        uint _2206 = uint(int(uint(_2204) >> uint(2)));
        uint _2208 = uint(int(uint(int(_2206)) >> uint(2)));
        int _2210 = int(_2206) & 3;
        float _2212 = (*spvDescriptorSet0.vp_c15)._m0[int(_2208)][_2210];
        int _2214 = int(_2206) + 1;
        uint _2216 = uint(int(uint(_2214) >> uint(2)));
        int _2218 = _2214 & 3;
        float _2220 = (*spvDescriptorSet0.vp_c15)._m0[int(_2216)][_2218];
        int _2222 = _2204 + 8;
        uint _2224 = uint(int(uint(_2222) >> uint(2)));
        uint _2226 = uint(int(uint(int(_2224)) >> uint(2)));
        int _2228 = int(_2224) & 3;
        float _2230 = (*spvDescriptorSet0.vp_c15)._m0[int(_2226)][_2228];
        int _2232 = int(_2224) + 1;
        uint _2234 = uint(int(uint(_2232) >> uint(2)));
        int _2236 = _2232 & 3;
        float _2238 = (*spvDescriptorSet0.vp_c15)._m0[int(_2234)][_2236];
        float _2240 = _889 * _2220;
        float _2242 = fma(_591, _2212, _2240);
        float _2244 = fma(_581, _2230, _2242);
        float _2246 = _2244 + _2238;
        float _2248 = precise::clamp(_2246, 0.0, 1.0);
        float _2250 = -_2248;
        float _2252 = _2250 + _1599;
        float _2254 = fma(_2252, 500.0, 1.5);
        float _2256 = exp2(_2254);
        float _2258 = 0.0 + _2256;
        float _2260 = precise::clamp(_2258, 0.0, 1.0);
        _2200 = _2260;
    }
    float _2262 = _2200;
    float _2264 = _2194 * _1607;
    float _2266 = -_2176;
    float _2268 = fma(_2266, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2270 = -_2194;
    float _2272 = _2270 + 1.0;
    out.m_95.x = _2154;
    out.m_95.y = _2156;
    out.m_95.z = _2158;
    float _2274 = _1618 * _2264;
    float _2276 = _1628 * _2264;
    float _2278 = _1618 * _2272;
    out.m_97.x = _855;
    out.m_97.y = _853;
    out.m_97.z = _857;
    float _2280 = fma(_1624, _2274, _1612);
    float _2282 = fma(_1626, _2274, _1614);
    float _2284 = fma(_1618, _2276, _1616);
    bool _2286 = _975 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2288 = isnan(_975);
    bool _2290 = _2286 || _2288;
    bool _2292 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2294 = _2290 || _2292;
    float _2296 = _2192 * _2262;
    float _2298 = _2098 * _2152;
    out.m_99.x = _2280;
    out.m_99.y = _2282;
    out.m_99.z = _2284;
    out.m_99.w = _2278;
    float _2300 = -_2296;
    float _2302 = fma(_2300, _2268, 1.0);
    float _2304 = precise::clamp(_2302, 0.0, 1.0);
    float _2306 = _2298 * _2010;
    float _2308 = _2304 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2310 = _2306 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2312 = _2272;
    float _2314 = _2306;
    float _2316 = _2308;
    if (!_2294)
    {
        _2018 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2318 = _2018;
    out.m_101.x = _2308;
    float _2320 = _2318;
    float _2322 = _2318;
    if (!_2294)
    {
        _2196 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2324 = _2196;
    float _2326 = _2324;
    float _2328 = _2324;
    if (!_2294)
    {
        _2312 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2330 = _2312;
    float _2332 = _2330;
    float _2334 = _2330;
    if (!_2294)
    {
        _687 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2336 = _687;
    float _2338 = _2336;
    float _2340 = _2336;
    if (!_2294)
    {
        _2314 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2342 = _2314;
    float _2344 = _2342;
    float _2346 = _2342;
    if (!_2294)
    {
        _2316 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2348 = _2316;
    bool _2350 = !_2294;
    float _2352 = _2348;
    float _2354 = _2348;
    if (!_2350)
    {
        bool _2356 = _975 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2358 = isnan(_975);
        bool _2360 = _2356 || _2358;
        bool _2362 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2364 = _2360 || _2362;
        if (!_2364)
        {
            float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2368 = _975 + _2366;
            float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2372 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2370;
            float _2374 = 1.0 / _2372;
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2390 = _2388 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2396 = _2368 * _2374;
            float _2398 = precise::clamp(_2396, 0.0, 1.0);
            float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2404 = fma(_2398, _2378, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2406 = fma(_2398, _2402, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2408 = fma(_2398, _2382, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2410 = fma(_2398, _2386, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2412 = fma(_2398, _2390, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2414 = fma(_2398, _2394, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2328 = _2406;
            _2354 = _2412;
            _2322 = _2404;
            _2340 = _2410;
            _2334 = _2408;
            _2346 = _2414;
            _2416 = true;
        }
        else
        {
            bool _2418 = _975 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2420 = isnan(_975);
            bool _2422 = _2418 || _2420;
            bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2426 = _2422 || _2424;
            if (!_2426)
            {
                _2320 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2428 = _2320;
            _2322 = _2428;
            if (!_2426)
            {
                _2326 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2430 = _2326;
            _2328 = _2430;
            if (!_2426)
            {
                _2332 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2432 = _2332;
            _2334 = _2432;
            if (!_2426)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2434 = _2338;
            _2340 = _2434;
            if (!_2426)
            {
                _2352 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2436 = _2352;
            _2354 = _2436;
            if (!_2426)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2438 = _2344;
            bool _2440 = !_2426;
            _2346 = _2438;
            if (!_2440)
            {
                bool _2442 = _975 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2444 = isnan(_975);
                bool _2446 = _2442 || _2444;
                bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2450 = _2446 || _2448;
                if (!_2450)
                {
                    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2454 = _975 + _2452;
                    float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2458 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2456;
                    float _2460 = 1.0 / _2458;
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2476 = _2474 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2482 = _2454 * _2460;
                    float _2484 = precise::clamp(_2482, 0.0, 1.0);
                    float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2490 = fma(_2484, _2464, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2492 = fma(_2484, _2488, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2494 = fma(_2484, _2468, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2496 = fma(_2484, _2472, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2498 = fma(_2484, _2476, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2500 = fma(_2484, _2480, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2328 = _2492;
                    _2354 = _2498;
                    _2322 = _2490;
                    _2340 = _2496;
                    _2334 = _2494;
                    _2346 = _2500;
                    _2416 = true;
                }
                else
                {
                    _2328 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2354 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2322 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2334 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2416 = false;
    float _2502 = _2328;
    float _2504 = _2354;
    float _2506 = _2322;
    float _2508 = _2340;
    float _2510 = _2334;
    float _2512 = _2346;
    float _2514 = fma(_2156, -0.5, 0.5);
    float _2516 = precise::clamp(_2514, 0.0, 1.0);
    float _2518 = -_2502;
    float _2520 = _2518 + _2504;
    float _2522 = _2310 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2524 = -_2506;
    float _2526 = _2524 + _2508;
    out.m_103.x = 0.0;
    float _2528 = fma(_2516, _2520, _2502);
    float _2530 = fma(_2516, _2526, _2506);
    out.m_66.x = _2522;
    float _2532 = -_2510;
    float _2534 = _2532 + _2512;
    float _2536 = _2528 * 0.586610972881317138671875;
    bool _2538 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2540 = fma(_2516, _2534, _2510);
    float _2542 = fma(_2530, 0.298911988735198974609375, _2536);
    bool _2544 = _2098 > 0.0;
    bool _2546 = isnan(_2098);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan(0.0);
    bool _2552 = _2548 || _2550;
    out.m_105.x = 0.0;
    float _2554 = fma(_2540, 0.114477999508380889892578125, _2542);
    bool _2556 = _2152 <= 0.0;
    bool _2558 = !_2552;
    bool _2560 = _2556 || _2558;
    float _2562 = -_2554;
    float _2564 = _2530 + _2562;
    float _2566 = -_2554;
    float _2568 = _2528 + _2566;
    float _2570 = -_2554;
    float _2572 = _2540 + _2570;
    float _2574 = fma(_2564, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2554);
    float _2576 = fma(_2568, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2554);
    float _2578 = fma(_2572, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2554);
    bool _2580 = !_2538;
    if (!_2580)
    {
        float _2582 = -_853;
        float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2586 = -_855;
        float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2590 = -_857;
        float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2594 = _2584 * _2584;
        float _2596 = fma(_2588, _2588, _2594);
        float _2598 = fma(_2592, _2592, _2596);
        float _2600 = rsqrt(_2598);
        float _2602 = sqrt(_2598);
        float _2604 = _2584 * _2600;
        float _2606 = _2588 * _2600;
        float _2608 = _2592 * _2600;
        float _2610 = -_945;
        float _2612 = _2610 + _2604;
        float _2614 = -_909;
        float _2616 = _2614 + _2606;
        float _2618 = -_911;
        float _2620 = _2618 + _2608;
        float _2622 = _2612 * _2612;
        float _2624 = -_2602;
        float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2628 = fma(_2616, _2616, _2622);
        float _2630 = _2626 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2632 = precise::clamp(_2630, 0.0, 1.0);
        float _2634 = fma(_2620, _2620, _2628);
        float _2636 = abs(_2632);
        float _2638 = log2(_2636);
        float _2640 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2642 = precise::clamp(_2640, 0.0, 1.0);
        float _2644 = rsqrt(_2634);
        float _2646 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2648 = exp2(_2646);
        float _2650 = _2612 * _2644;
        float _2652 = _2616 * _2644;
        float _2654 = _2620 * _2644;
        float _2656 = _2642 * _2642;
        float _2658 = _2156 * _2650;
        float _2660 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2662 = _2156 * _2604;
        float _2664 = _2656 + (-1.0);
        float _2666 = fma(_2154, _2652, _2658);
        float _2668 = -_2604;
        float _2670 = -_2660;
        float _2672 = fma(_2668, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2670);
        float _2674 = fma(_2154, _2606, _2662);
        float _2676 = fma(_2158, _2654, _2666);
        float _2678 = precise::clamp(_2676, 0.0, 1.0);
        float _2680 = -_2608;
        float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2672);
        float _2684 = fma(_2158, _2608, _2674);
        float _2686 = precise::clamp(_2684, 0.0, 1.0);
        float _2688 = _2678 * _2678;
        float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2692 = _2682 + _2690;
        float _2694 = fma(_2688, _2664, 1.0);
        float _2696 = _2694 * _2694;
        float _2698 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2700 = precise::clamp(_2698, 0.0, 1.0);
        float _2702 = 1.0 / _2696;
        float _2704 = _2648 * _2700;
        float _2706 = _2686 * _2704;
        float _2708 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2710 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2712 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2714 = _2656 * _2702;
        out.m_103.x = _2708;
        out.m_103.y = _2710;
        out.m_103.z = _2712;
        float _2716 = _2706 * _2714;
        float _2718 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2720 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2722 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _2718;
        out.m_105.y = _2720;
        out.m_105.z = _2722;
    }
    out.m_107.x = _2574;
    out.m_107.y = _2576;
    out.m_107.z = _2578;
    if (!_2560)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_66.x = 0.0;
    float _2724 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2724;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

